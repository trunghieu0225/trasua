const { pool } = require('../config/db');

const orderController = {
  // POST /api/orders -> Create Order into DON_HANG, CHI_TIET_DON_HANG, THANH_TOAN
  async create(req, res) {
    const connection = await pool.getConnection();
    try {
      await connection.beginTransaction();

      const { customerName, phone, address, notes, items, paymentMethod, voucherCode, discountAmount, shippingFee } = req.body;

      if (!customerName || !phone || !address || !items || items.length === 0) {
        connection.release();
        return res.status(400).json({ success: false, message: 'Vui lòng cung cấp đầy đủ thông tin nhận hàng và danh sách món!' });
      }

      const orderCode = `TS-${Math.floor(1000 + Math.random() * 9000)}`;

      // Calculate totals
      let itemsTotal = 0;
      items.forEach(item => {
        itemsTotal += (item.unitPrice * item.quantity);
      });

      const finalShipping = shippingFee !== undefined ? shippingFee : 15000;
      const finalDiscount = discountAmount || 0;
      const totalAmount = Math.max(0, itemsTotal + finalShipping - finalDiscount);

      // 1. Insert into DON_HANG
      const [orderResult] = await connection.query(
        `INSERT INTO DON_HANG (ma_don_hang, ten_nguoi_nhan, sdt_nguoi_nhan, dia_chi_giao_hang, ghi_chu, tong_tien_mon, phi_van_chuyen, so_tien_giam_gia, tong_thanh_toan, trang_thai_don_hang, ngay_dat)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 'pending', NOW())`,
        [orderCode, customerName.trim(), phone.trim(), address.trim(), notes || '', itemsTotal, finalShipping, finalDiscount, totalAmount]
      );

      const orderId = orderResult.insertId;

      // 2. Insert into CHI_TIET_DON_HANG for each item
      for (const item of items) {
        const itemTotal = item.unitPrice * item.quantity;
        const toppingsJson = item.toppings ? JSON.stringify(item.toppings.map(t => ({ name: t }))) : '[]';

        // Get product ID or default to 1
        const [pRows] = await connection.query('SELECT id FROM SAN_PHAM WHERE ma_sku = ? LIMIT 1', [item.productId || 'TS-01']);
        const productId = pRows.length > 0 ? pRows[0].id : 1;

        await connection.query(
          `INSERT INTO CHI_TIET_DON_HANG (don_hang_id, san_pham_id, ten_san_pham, kich_thuoc, muc_duong, muc_da, danh_sach_topping, don_gia, so_luong, thanh_tien)
           VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
          [orderId, productId, item.name, item.size || 'M', item.sugar || '100%', item.ice || '100%', toppingsJson, item.unitPrice, item.quantity, itemTotal]
        );
      }

      // 3. Insert into THANH_TOAN
      const payMethodMap = { 'vietqr': 'vietqr', 'cod': 'cod' };
      const method = payMethodMap[paymentMethod] || 'cod';
      const initialStatus = method === 'vietqr' ? 'cho_thanh_toan' : 'cho_thanh_toan';

      await connection.query(
        `INSERT INTO THANH_TOAN (don_hang_id, phuong_thuc, so_tien, trang_thai, ngay_tao)
         VALUES (?, ?, ?, ?, NOW())`,
        [orderId, method, totalAmount, initialStatus]
      );

      await connection.commit();
      connection.release();

      console.log(`✨ [MySQL DB] Created Order ${orderCode} (DB ID: ${orderId}) for ${customerName}`);

      return res.status(201).json({
        success: true,
        orderId: orderCode,
        dbId: orderId,
        totalAmount,
        message: 'Tạo đơn hàng thành công!'
      });

    } catch (error) {
      await connection.rollback();
      connection.release();
      console.error('Error creating order:', error);
      return res.status(500).json({ success: false, message: 'Lỗi khi tạo đơn hàng: ' + error.message });
    }
  },

  // GET /api/orders -> Get all orders
  async getAll(req, res) {
    try {
      const [orders] = await pool.query(
        `SELECT dh.*, tt.phuong_thuc, tt.trang_thai as trang_thai_tt
         FROM DON_HANG dh
         LEFT JOIN THANH_TOAN tt ON dh.id = tt.don_hang_id
         ORDER BY dh.ngay_dat DESC`
      );

      const formattedOrders = [];
      for (const dh of orders) {
        const [items] = await pool.query(
          `SELECT * FROM CHI_TIET_DON_HANG WHERE don_hang_id = ?`,
          [dh.id]
        );

        formattedOrders.push({
          id: dh.ma_don_hang,
          dbId: dh.id,
          customerName: dh.ten_nguoi_nhan,
          phone: dh.sdt_nguoi_nhan,
          address: dh.dia_chi_giao_hang,
          notes: dh.ghi_chu,
          itemsTotal: parseFloat(dh.tong_tien_mon),
          shippingFee: parseFloat(dh.phi_van_chuyen),
          discountAmount: parseFloat(dh.so_tien_giam_gia),
          totalAmount: parseFloat(dh.tong_thanh_toan),
          status: dh.trang_thai_don_hang,
          paymentMethod: dh.phuong_thuc || 'cod',
          createdAt: dh.ngay_dat,
          items: items.map(it => ({
            name: it.ten_san_pham,
            size: it.kich_thuoc,
            sugar: it.muc_duong,
            ice: it.muc_da,
            toppings: typeof it.danh_sach_topping === 'string' ? JSON.parse(it.danh_sach_topping) : (it.danh_sach_topping || []),
            unitPrice: parseFloat(it.don_gia),
            quantity: it.so_luong,
            totalPrice: parseFloat(it.thanh_tien)
          }))
        });
      }

      return res.json({ success: true, count: formattedOrders.length, data: formattedOrders });

    } catch (error) {
      console.error('Error fetching orders:', error);
      return res.status(500).json({ success: false, message: error.message });
    }
  },

  // PUT /api/orders/:id/status -> Update status
  async updateStatus(req, res) {
    try {
      const orderId = req.params.id;
      const { status } = req.body;

      if (!status) return res.status(400).json({ success: false, message: 'Trạng thái là bắt buộc!' });

      await pool.query(
        `UPDATE DON_HANG SET trang_thai_don_hang = ? WHERE ma_don_hang = ? OR id = ?`,
        [status, orderId, orderId]
      );

      return res.json({ success: true, message: `Cập nhật trạng thái đơn hàng sang ${status} thành công!` });

    } catch (error) {
      return res.status(500).json({ success: false, message: error.message });
    }
  }
};

module.exports = orderController;

const { pool } = require('../config/db');

const toppingController = {
  // GET /api/toppings
  async getAll(req, res) {
    try {
      const [rows] = await pool.query(
        `SELECT id, ma_topping, ten_topping, gia_them, trang_thai FROM TOPPING ORDER BY id ASC`
      );

      const toppings = rows.map(r => ({
        id: r.ma_topping || `top-${r.id}`,
        dbId: r.id,
        name: r.ten_topping,
        price: parseFloat(r.gia_them),
        status: r.trang_thai ? 'available' : 'disabled'
      }));

      return res.json({ success: true, count: toppings.length, data: toppings });
    } catch (error) {
      console.error('Error fetching toppings:', error);
      return res.status(500).json({ success: false, message: error.message });
    }
  },

  // POST /api/toppings
  async create(req, res) {
    try {
      const { name, price, status } = req.body;
      if (!name || price === undefined) {
        return res.status(400).json({ success: false, message: 'Tên topping và giá tiền là bắt buộc!' });
      }

      const topCode = `top-${Date.now().toString().slice(-4)}`;
      const isAvailable = status !== 'disabled';

      const [result] = await pool.query(
        `INSERT INTO TOPPING (ma_topping, ten_topping, gia_them, trang_thai) VALUES (?, ?, ?, ?)`,
        [topCode, name.trim(), price, isAvailable]
      );

      return res.status(201).json({
        success: true,
        id: topCode,
        dbId: result.insertId,
        message: 'Thêm topping mới thành công!'
      });
    } catch (error) {
      return res.status(500).json({ success: false, message: error.message });
    }
  },

  // DELETE /api/toppings/:id
  async delete(req, res) {
    try {
      const topId = req.params.id;
      await pool.query('DELETE FROM TOPPING WHERE ma_topping = ? OR id = ?', [topId, topId]);
      return res.json({ success: true, message: 'Đã xóa topping thành công!' });
    } catch (error) {
      return res.status(500).json({ success: false, message: error.message });
    }
  }
};

module.exports = toppingController;

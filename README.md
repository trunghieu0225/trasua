# 🧋 TRÀ SỮA ĐÔ ĐÔ - WEB BÁN HÀNG & QUẢN LÝ CHUỖI TRÀ SỮA

Ứng dụng web bán hàng trực tuyến và trang quản lý cho chuỗi cửa hàng trà sữa **ĐÔ ĐÔ**. Giao diện hiện đại, tối ưu trải nghiệm đặt món, tự động tạo VietQR thanh toán và phân quyền quản lý mượt mà.

---

## ✨ CHỨC NĂNG CHÍNH

- **🛒 Đặt Món & Tùy Biến Realtime**: Tùy chọn Size (M/L/XL), % Đường, % Đá, chọn Topping kèm hiệu ứng đồ họa trực quan.
- **💳 Thanh Toán VietQR Tự Động**: Tạo mã QR chuyển khoản chuẩn ngân hàng (VietQR / NAPAS 247).
- **🚚 Tra Cứu Tiến Độ Đơn Hàng**: Theo dõi trạng thái pha chế và giao hàng thời gian thực.
- **🎁 Vòng Quay May Mắn & Tích Điểm**: Minigame tặng voucher thưởng 1 lần/ngày.
---

## 🛠️ CÔNG NGHỆ

- **Frontend**: HTML5, Vanilla CSS, JavaScript ES6+.
- **Database Engine**: LocalStorage Dự Phòng & MySQL 8.0 DDL (`database/teajoy.sql`).

---

## 📁 CẤU TRÚC THƯ MỤC

```text
trasua/
├── admin/                     # Trang Quản lý & Pha chế (index.html, staff.html)
├── css/                       # CSS Stylesheets (variables.css, base.css, client.css)
├── js/                        # Mã nguồn JavaScript (auth.js, cart.js, client.js, tracking.js)
├── database/                  # CSDL MySQL 8.0 duy nhất (teajoy.sql)
├── index.html                 # Trang chủ Cửa hàng
├── menu.html                  # Trang Thực đơn & Lọc món
├── product-detail.html        # Trang Tùy biến ly trà sữa
├── cart.html                  # Trang Giỏ hàng
├── checkout.html              # Trang Thanh toán VietQR
├── order-tracking.html        # Trang Tra cứu đơn hàng
├── auth.html                  # Trang Đăng nhập / Đăng ký
├── profile.html               # Trang Cá nhân & Tích điểm
└── README.md                  # Tài liệu hướng dẫn
```

---

## ⚡ KHỞI CHẠY NHANH

1. Mở file `index.html` bằng trình duyệt web bất kỳ.
2. CSDL MySQL (Tùy chọn): Import duy nhất file `database/teajoy.sql` vào MySQL 8.0.
3. Tài khoản demo:
   - **👑 Quản Lý**: `admin` / `123456`
   - **🧋 Pha Chế**: `phache` / `123456`

---

© 2026 **TeaJoy Store**. All rights reserved.

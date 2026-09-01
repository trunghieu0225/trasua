# 🧋 TRÀ SỮA ĐÔ ĐÔ - WEB BÁN HÀNG & QUẢN LÝ CHUỖI TRÀ SỮA HIỆN ĐẠI

![Version](https://img.shields.io/badge/version-2.2.0-red.svg)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-ES6+-F7DF1E?style=flat&logo=javascript&logoColor=black)
![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?style=flat&logo=mysql&logoColor=white)

> **Trà Sữa ĐÔ ĐÔ** là ứng dụng web bán hàng trực tuyến và trang quản trị POS đầy đủ chức năng dành cho chuỗi cửa hàng trà sữa thương hiệu **ĐÔ ĐÔ**.

---

## ✨ CHỨC NĂNG NỔI BẬT

### 🛍️ 1. Giao Diện Cửa Hàng (Client Storefront)
- **Đặt Món & Visual Cup Customizer**: Chọn Size (M/L/XL), % Đường, % Đá, Topping kèm đồ họa cốc đổi màu realtime.
- **Thanh Toán VietQR**: Tạo mã QR chuyển khoản ngân hàng tự động (VietQR / NAPAS 247).
- **Tra Cứu Đơn Hàng**: Theo dõi tiến độ pha chế và giao hàng thời gian thực.
- **Vòng Quay May Mắn & Tích Điểm**: Minigame quay voucher và nâng hạng thành viên.

### ⚙️ 2. Trung Tâm Quản Lý & Pha Chế (Admin POS Portal)
- **📊 Dashboard Báo Cáo**: Thống kê KPI doanh thu, số đơn, khách mới & biểu đồ Chart.js.
- **📦 Xử Lý Đơn Hàng & In Hóa Đơn**: Đổi trạng thái đơn & **In hóa đơn POS 80mm** 1-Click.
- **🧋 Quản Lý Thực Đơn & Topping**: Thêm/Sửa/Xóa sản phẩm, tồn kho và trạng thái topping.
- **💼 Quản Lý Nhân Viên & Pha Chế**: Quản lý tài khoản, phân quyền và nút **`🚪 Đăng Xuất`**.
- **👥 Quản Lý Khách Hàng & Điểm**: Tra cứu điểm tích lũy và quản lý thành viên.
- **🚚 Quản Lý Kho & Nhà Cung Cấp**: Quản lý thông tin đối tác nguyên liệu.
- **🎟️ Khuyến Mãi & Báo Cáo CSV**: Quản lý Voucher và xuất báo cáo doanh thu ra Excel/CSV.
- **🔒 Phân Quyền Nút "Xem Cửa Hàng"**:
  - Tài khoản **Quản Lý (Admin)**: Có nút **`🛍️ Xem Cửa Hàng`**.
  - Tài khoản **Pha Chế / Thu Ngân (Staff)**: **Ẩn hoàn toàn** nút "Xem Cửa Hàng" (chỉ làm việc trong giao diện quản lý / pha chế).

---

## 📁 CẤU TRÚC THƯ MỤC DỰ ÁN

```text
trasua/
├── admin/                     # Trung Tâm Quản Trị & POS
├── css/                       # Hệ thống CSS (variables, base, components, client, admin)
├── js/                        # Mã nguồn JavaScript (auth, cart, checkout, client, tracking, admin/)
├── database/                  # CSDL MySQL 8.0 duy nhất (teajoy.sql)
├── index.html                 # Trang chủ Cửa hàng
└── README.md                  # Tài liệu hướng dẫn
```

---

## ⚡ KHỞI CHẠY NHANH

1. Mở tệp `index.html` bằng trình duyệt web bất kỳ.
2. Nạp CSDL MySQL (Tùy chọn): Import duy nhất file `database/teajoy.sql` vào MySQL 8.0.
3. Tài khoản demo mặc định:
   - **👑 Quản Lý**: `admin` / `123456`
   - **💼 Thu Ngân**: `thungan` / `123456`
   - **🧋 Pha Chế**: `phache` / `123456`

---

© 2026 **TeaJoy Store**. All rights reserved.

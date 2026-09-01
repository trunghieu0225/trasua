# 🧋 TRÀ SỮA ĐÔ ĐÔ - WEB BÁN HÀNG & QUẢN LÝ CHUỖI TRÀ SỮA HIỆN ĐẠI

![Version](https://img.shields.io/badge/version-2.0.0-red.svg)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-ES6+-F7DF1E?style=flat&logo=javascript&logoColor=black)
![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?style=flat&logo=mysql&logoColor=white)
![VietQR](https://img.shields.io/badge/Payment-VietQR%20NAPAS247-0052CC.svg)

> **Trà Sữa ĐÔ ĐÔ** là hệ thống ứng dụng web bán hàng trực tuyến và trang quản trị POS đa năng dành cho chuỗi cửa hàng trà sữa thương hiệu **ĐÔ ĐÔ**. Ứng dụng được thiết kế theo phong cách hiện đại với tông màu **Đỏ Thương Hiệu ĐÔ ĐÔ (Crimson Red)**, hỗ trợ tùy biến ly trà sữa realtime, tích hợp thanh toán VietQR tự động và quản lý đơn hàng chuyên nghiệp.

---

## ✨ CHỨC NĂNG NỔI BẬT

### 🛍️ 1. Khách Hàng (Client Storefront)
- **Trang chủ sống động**: Biểu banner khuyến mãi, danh mục món nổi bật và top sản phẩm bán chạy nhất.
- **Bộ tùy biến ly trà sữa Visual Cup Builder**: 
  - Chọn Size cốc (M, L, XL), mức đường (0% - 100%), lượng đá (0% - 100%).
  - Chọn thêm topping phong phú (Trân châu hoàng kim, thạch phô mai, pudding trứng, kem cheese...).
  - Mô phỏng cốc trà sữa đổi màu nước và thêm topping theo thời gian thực (Live Graphics).
- **Giỏ hàng Slide-Over & Trang chi tiết**: Cập nhật số lượng, tính tạm tính và áp dụng voucher giảm giá.
- **Thanh toán VietQR Tự Động**: Tạo mã QR thanh toán chuẩn ngân hàng (VietQR / NAPAS 247) tự động điền số tiền và nội dung đơn.
- **Tra cứu đơn hàng Realtime**: Theo dõi từng giai đoạn pha chế, đóng gói và shipper giao hàng.
- **Minigame Vòng quay may mắn**: Trải nghiệm quay trúng voucher thưởng 1 lần/ngày.
- **Trang thành viên & Tích điểm**: Quản lý thông tin cá nhân, ví voucher và lịch sử tích điểm nâng hạng VIP.

### ⚙️ 2. Trợ Lý Quản Trị & Thu Ngân (Admin POS Portal)
- **Bảng điều khiển KPI Dashboard**: Thống kê doanh thu theo ngày, số đơn hàng, khách mới và biểu đồ tỷ trọng bằng Chart.js.
- **Trung tâm xử lý đơn hàng**:
  - Đổi trạng thái đơn (*Chờ duyệt ➔ Đã duyệt ➔ Đang pha chế ➔ Đang giao ➔ Hoàn thành*).
  - Tự động tạo và **In hóa đơn POS 80mm** (Thermal Printer Receipt) 1-Click.
- **Quản lý thực đơn & Topping (CRUD)**: Thêm/Sửa/Xóa sản phẩm, cập nhật tồn kho, thay đổi trạng thái phục vụ của từng topping.
- **Quản lý CRM Khách hàng**: Tra cứu thông tin khách hàng, số điểm tích lũy và tính năng khóa/mở tài khoản.
- **Phân quyền nhân viên**: Quản lý tài khoản thu ngân, pha chế và admin chi nhánh.
- **Quản lý Nhà cung cấp & Kho**: Theo dõi danh sách đối tác cung ứng trà Bảo Lộc, sữa tươi DalatMilk...
- **Báo cáo doanh thu & Export CSV**: Xuất báo cáo chi tiết ra file Excel/CSV nhanh chóng.

---

## 🛠️ CÔNG NGHỆ SỬ DỤNG

- **Frontend**: HTML5 Semantic, Custom Vanilla CSS (Design System Tokens, CSS Grid/Flexbox, Glassmorphism, Animations), JavaScript ES6+.
- **Database Engine**: LocalStorage Engine (Client-side DB Engine `storage.js`) & Chuẩn CSDL Relational MySQL 8.0 DDL (`schema.sql`, `seed.sql`).
- **Thư viện & API**:
  - Chart.js (Biểu đồ doanh thu & tỷ trọng).
  - VietQR QuickLink API (Tạo QR chuyển khoản ngân hàng chuẩn EMVCo).
  - Toast & Modal Controller thuần không phụ thuộc thư viện ngoài.

---

## 📁 CẤU TRÚC THƯ MỤC DỰ ÁN

```text
trasua/
├── admin/                     # Trang Quản Trị Admin & POS
│   ├── index.html             # Dashboard Báo cáo KPI & Biểu đồ
│   ├── orders.html            # Xử lý đơn hàng & In hóa đơn 80mm
│   ├── products.html          # Quản lý Sản phẩm & Topping
│   ├── customers.html         # Quản lý Khách hàng & Điểm
│   ├── staff.html             # Quản lý Nhân viên & Quyền
│   ├── suppliers.html         # Quản lý Nhà cung cấp
│   ├── reports.html           # Thống kê & Xuất báo cáo CSV
│   └── marketing.html         # Quản lý Voucher & Banner
├── css/                       # Hệ thống CSS Stylesheet
│   ├── variables.css          # Design Tokens (Color Palette, Radius, Shadows)
│   ├── base.css               # Base Reset & Typography
│   ├── components.css         # UI Components (Buttons, Cards, Modals, Badges)
│   ├── client.css             # Style giao diện Bán hàng
│   └── admin.css              # Style giao diện Admin & In hóa đơn POS 80mm
├── js/                        # Mã nguồn Logic JavaScript
│   ├── db/
│   │   ├── mock-data.js       # Dữ liệu khởi tạo ban đầu (Demo Data)
│   │   └── storage.js         # LocalStorage Database Engine
│   ├── utils/
│   │   ├── formatters.js      # Định dạng tiền tệ VNĐ, ngày tháng, mã đơn
│   │   ├── modal.js           # Điều khiển Modal Backdrop
│   │   └── toast.js           # Hệ thống Toast Notification
│   ├── admin/                 # Controller giao diện Admin
│   │   ├── dashboard.js
│   │   ├── order-mgmt.js
│   │   └── product-mgmt.js
│   ├── auth.js                # Đăng nhập, Đăng ký & Chuyển đổi Vai trò
│   ├── cart.js                # Quản lý Giỏ hàng & Slide-over Drawer
│   ├── checkout.js            # Thanh toán & Tạo mã VietQR
│   ├── client.js              # Visual Customizer Ly Trà Sữa & Vòng Quay
│   └── tracking.js            # Tra cứu đơn hàng Realtime
├── database/                  # Cơ sở dữ liệu SQL
│   ├── schema.sql             # Cấu trúc bảng CSDL MySQL 8.0
│   ├── seed.sql               # Dữ liệu mẫu khởi tạo MySQL
│   └── README.md              # Hướng dẫn thiết lập MySQL
├── index.html                 # Trang chủ Cửa hàng
├── menu.html                  # Trang Thực đơn & Lọc món
├── product-detail.html        # Trang Chi tiết & Tùy biến ly trà sữa
├── cart.html                  # Trang Giỏ hàng
├── checkout.html              # Trang Thanh toán đơn hàng
├── order-tracking.html        # Trang Tra cứu tiến độ đơn
├── auth.html                  # Trang Đăng nhập / Đăng ký
├── profile.html               # Trang Cá nhân & Ví Voucher
├── BAO_CAO_LOI_TON_DONG.md    # Báo cáo các lỗi đã kiểm tra và xử lý
└── README.md                  # Tài liệu hướng dẫn dự án
```

---

## ⚡ HƯỚNG DẪN KHỞI CHẠY (QUICK START)

Dự án được xây dựng chuẩn Web tiêu chuẩn, **không cần cài đặt Node.js hay Build tool cầu kỳ**.

1. **Chạy trực tiếp trên Trình duyệt**:
   - Mở tệp `index.html` bằng trình duyệt web bất kỳ (Chrome, Edge, Firefox, Safari...).
   - Hoặc sử dụng extension **Live Server** trong VS Code / Antigravity IDE.

2. **Đăng nhập & Trải nghiệm**:
   - Khách mua hàng bấm nút **`🔑 Đăng Nhập`** trên Header để Đăng Nhập hoặc Đăng Ký tài khoản mới.
   - Nhân viên / Quản lý nhập tài khoản nội bộ trên Pop-up Đăng Nhập để vào Bảng điều khiển Quản trị.

---


## 📝 GIẤY PHÉP (LICENSE)

Dự án phát triển mã nguồn mở phục vụ học tập, giảng dạy và phát triển ứng dụng kinh doanh trà sữa.

© 2026 **TeaJoy Store**. All rights reserved.

# 🧋 TRÀ SỮA ĐÔ ĐÔ - WEB BÁN HÀNG & QUẢN LÝ CHUỖI TRÀ SỮA HIỆN ĐẠI

![Version](https://img.shields.io/badge/version-2.1.0-red.svg)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-ES6+-F7DF1E?style=flat&logo=javascript&logoColor=black)
![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?style=flat&logo=mysql&logoColor=white)
![VietQR](https://img.shields.io/badge/Payment-VietQR%20NAPAS247-0052CC.svg)

> **Trà Sữa ĐÔ ĐÔ** là hệ thống ứng dụng web bán hàng trực tuyến dành cho chuỗi cửa hàng trà sữa thương hiệu **ĐÔ ĐÔ**. Ứng dụng được thiết kế theo phong cách hiện đại với tông màu **Đỏ Thương Hiệu ĐÔ ĐÔ (Crimson Red)**, hỗ trợ tùy biến ly trà sữa realtime, tích hợp thanh toán VietQR tự động và tra cứu đơn hàng chuyên nghiệp.

---

## ✨ CHỨC NĂNG NỔI BẬT

### 🛍️ 1. Giao Diện Khách Hàng (Client Storefront)
- **Trang chủ sống động**: Banner khuyến mãi, danh mục món nổi bật và top sản phẩm bán chạy nhất.
- **Bộ tùy biến ly trà sữa Visual Cup Builder**: 
  - Chọn Size cốc (M, L, XL), mức đường (0% - 100%), lượng đá (0% - 100%).
  - Chọn thêm topping phong phú (Trân châu hoàng kim, thạch phô mai, pudding trứng, kem cheese...).
  - Mô phỏng cốc trà sữa đổi màu nước và thêm topping theo thời gian thực (Live Graphics).
- **Giỏ hàng Slide-Over & Trang chi tiết**: Cập nhật số lượng, tính tạm tính và áp dụng voucher giảm giá.
- **Thanh toán VietQR Tự Động**: Tạo mã QR thanh toán chuẩn ngân hàng (VietQR / NAPAS 247) tự động điền số tiền và nội dung đơn.
- **Tra cứu đơn hàng Realtime**: Theo dõi từng giai đoạn pha chế, đóng gói và shipper giao hàng.
- **Minigame Vòng quay may mắn**: Trải nghiệm quay trúng voucher thưởng 1 lần/ngày.
- **Trang thành viên & Tích điểm**: Quản lý thông tin cá nhân, ví voucher và lịch sử tích điểm nâng hạng VIP.

---

## 🛠️ CÔNG NGHỆ SỬ DỤNG

- **Frontend**: HTML5 Semantic, Custom Vanilla CSS (Design System Tokens, CSS Grid/Flexbox, Glassmorphism, Animations), JavaScript ES6+.
- **Database Engine**: LocalStorage Engine (Client-side DB Engine `storage.js`) & Chuẩn CSDL Relational MySQL 8.0 (`database/teajoy.sql`).
- **Thư viện & API**:
  - VietQR QuickLink API (Tạo QR chuyển khoản ngân hàng chuẩn EMVCo).
  - Toast & Modal Controller thuần không phụ thuộc thư viện ngoài.

---

## 📁 CẤU TRÚC THƯ MỤC DỰ ÁN

```text
trasua/
├── css/                       # Hệ thống CSS Stylesheet
│   ├── variables.css          # Design Tokens (Color Palette, Radius, Shadows)
│   ├── base.css               # Base Reset & Typography
│   ├── components.css         # UI Components (Buttons, Cards, Modals, Badges)
│   └── client.css             # Style giao diện Bán hàng
├── js/                        # Mã nguồn Logic JavaScript
│   ├── db/
│   │   ├── mock-data.js       # Dữ liệu khởi tạo ban đầu (Demo Data)
│   │   └── storage.js         # LocalStorage Database Engine
│   ├── utils/
│   │   ├── formatters.js      # Định dạng tiền tệ VNĐ, ngày tháng, mã đơn
│   │   ├── modal.js           # Điều khiển Modal Backdrop
│   │   └── toast.js           # Hệ thống Toast Notification
│   ├── auth.js                # Đăng nhập, Đăng ký & Quản lý Tài khoản
│   ├── cart.js                # Quản lý Giỏ hàng & Slide-over Drawer
│   ├── checkout.js            # Thanh toán & Tạo mã VietQR
│   ├── client.js              # Visual Customizer Ly Trà Sữa & Vòng Quay
│   └── tracking.js            # Tra cứu đơn hàng Realtime
├── database/                  # Cơ sở dữ liệu SQL
│   ├── teajoy.sql             # File SQL duy nhất chứa DDL 11 bảng và dữ liệu Seed
│   └── README.md              # Hướng dẫn nạp CSDL MySQL
├── index.html                 # Trang chủ Cửa hàng
├── menu.html                  # Trang Thực đơn & Lọc món
├── product-detail.html        # Trang Chi tiết & Tùy biến ly trà sữa
├── cart.html                  # Trang Giỏ hàng
├── checkout.html              # Trang Thanh toán đơn hàng
├── order-tracking.html        # Trang Tra cứu tiến độ đơn
├── auth.html                  # Trang Đăng nhập / Đăng ký
├── profile.html               # Trang Cá nhân & Ví Voucher
├── run-backend.bat            # Script khởi chạy Backend Node.js API Server
└── README.md                  # Tài liệu hướng dẫn dự án
```

---

## ⚡ HƯỚNG DẪN KHỞI CHẠY (QUICK START)

1. **Chạy trực tiếp trên Trình duyệt**:
   - Mở tệp `index.html` bằng trình duyệt web bất kỳ (Chrome, Edge, Firefox, Safari...).
   - Hoặc sử dụng extension **Live Server** trong VS Code / Antigravity IDE.

2. **Nạp Cơ Sở Dữ Liệu MySQL (Tùy chọn)**:
   - Import duy nhất file `database/teajoy.sql` vào MySQL Server 8.0.

---

## 📝 GIẤY PHÉP (LICENSE)

Dự án phát triển mã nguồn mở phục vụ học tập, giảng dạy và phát triển ứng dụng kinh doanh trà sữa.

© 2026 **TeaJoy Store**. All rights reserved.

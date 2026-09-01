# Hướng Dẫn Cài Đặt Cơ Sở Dữ Liệu MySQL 8.0 & Kiến Trúc NestJS Backend

Tài liệu này hướng dẫn cách khởi tạo database MySQL 8.0 cho 11 thực thể của hệ thống **TeaJoy Store** và cấu trúc dự án **NestJS Backend** chuẩn Enterprise.

---

## 1. Cấu Trúc File Cơ Sở Dữ Liệu

- [schema.sql](schema.sql): Script DDL tạo Database `teajoy_store` và các bảng quan hệ chuẩn hóa 3NF, hỗ trợ UTF8MB4 (tiếng Việt có dấu, icon emoji), khóa chính, khóa ngoại (`FOREIGN KEY`) và các chỉ mục đánh số (`INDEXES`) tối ưu tốc độ tìm kiếm.
- [seed.sql](seed.sql): Script nạp dữ liệu mẫu ban đầu (tài khoản quản lý & nhân viên, sản phẩm trà sữa, nhà cung cấp, đơn hàng, hóa đơn thanh toán, voucher, bài viết và đánh giá).

---

## 2. Cách Import Database Vào MySQL

### Cách 1: Sử dụng MySQL Command Line (Terminal / CMD)
```bash
# Đăng nhập vào MySQL và thực thi schema DDL
mysql -u root -p teajoy_store < database/schema.sql

# Nạp dữ liệu mẫu seed data
mysql -u root -p teajoy_store < database/seed.sql
```

### Cách 2: Sử dụng DBeaver / MySQL Workbench / Navicat / phpMyAdmin
1. Mở công cụ quản lý cơ sở dữ liệu (DBeaver / Workbench).
2. Tạo kết nối tới MySQL Server của bạn (Port `3306`).
3. Mở file [schema.sql](file:///d:/Study/Vibe%20code/Trasua/database/schema.sql) và nhấn nút **Execute (Run SQL)**.
4. Mở file [seed.sql](file:///d:/Study/Vibe%20code/Trasua/database/seed.sql) và nhấn nút **Execute (Run SQL)**.

---

## 3. Cấu Trúc Dự Án Đề Xuất Cho NestJS Backend (TypeScript + TypeORM/Prisma)

Khi phát triển Backend NestJS cho hệ thống, đề xuất cấu trúc thư mục module hóa sạch sẽ (Clean Architecture / Modular Structure):

```text
teajoy-backend/
├── src/
│   ├── app.module.ts                   # Root Module
│   ├── main.ts                         # Bootstrap entry point (Port 3000, Swagger, CORS, ValidationPipe)
│   │
│   ├── config/                         # Configuration (MySQL, Redis, JWT, Mailer, VietQR)
│   │   ├── database.config.ts
│   │   └── redis.config.ts
│   │
│   ├── common/                         # Shared utilities, filters, guards & interceptors
│   │   ├── guards/ (JwtAuthGuard, RolesGuard)
│   │   ├── decorators/ (CurrentUser, Roles)
│   │   ├── filters/ (HttpExceptionFilter)
│   │   └── interceptors/ (TransformResponseInterceptor, LoggingInterceptor)
│   │
│   ├── modules/                        # Business Feature Modules
│   │   ├── auth/                       # Đăng nhập, Đăng ký, Refresh Token, Phân quyền
│   │   ├── users/                      # Quản lý TAI_KHOAN, NHAN_VIEN, KHACH_HANG
│   │   ├── products/                   # Quản lý SAN_PHAM, Danh mục, Topping (+ Redis Cache)
│   │   ├── orders/                     # Xử lý DON_HANG & CHI_TIET_DON_HANG (+ BullMQ Worker)
│   │   ├── payments/                   # THANH_TOAN, Xử lý Webhook VietQR / MoMo / VNPay
│   │   ├── vouchers/                   # VOUCHERS, Kiểm tra mã giảm giá, Vòng quay may mắn
│   │   ├── reviews/                    # Đánh giá REVIEWS sao và bình luận
│   │   ├── suppliers/                  # Quản lý NHA_CUNG_CAP & Nhập kho
│   │   ├── posts/                      # Quản lý BAI_VIET & Banners
│   │   └── reports/                    # Báo cáo thống kê doanh thu nâng cao
│   │
│   ├── gateways/                       # Real-time WebSockets Gateway
│   │   └── order.gateway.ts            # Bắn thông báo đơn mới tức thì về máy POS quầy thu ngân
│   │
│   └── database/                       # TypeORM Entities / Migrations
│       └── entities/
│           ├── tai-khoan.entity.ts
│           ├── nhan-vien.entity.ts
│           ├── khach-hang.entity.ts
│           ├── san-pham.entity.ts
│           ├── nha-cung-cap.entity.ts
│           ├── don-hang.entity.ts
│           ├── chi-tiet-don-hang.entity.ts
│           ├── thanh-toan.entity.ts
│           ├── bai-viet.entity.ts
│           ├── review.entity.ts
│           └── voucher.entity.ts
│
├── .env.example
├── docker-compose.yml                  # Khởi chạy nhanh MySQL 8.0 + Redis + App
└── package.json
```

---

## 4. Tài Khoản Demo Mặc Định Nội Bộ Sau Khi Seed

| Vai Trò | Tên Đăng Nhập | Mật Khẩu | Họ Tên | Chức Vụ |
| :--- | :--- | :--- | :--- | :--- |
| **👑 Quản Lý (Admin)** | `admin` | `123` / `123456` | Nguyễn Văn Quản Lý | Quản Lý Cửa Hàng |
| **💼 Thu Ngân (Staff)** | `nhanvien` | `123` / `123456` | Trần Thị Thu Ngân | Thu Ngân & Bán Hàng |
| **🧋 Pha Chế (Staff)** | `phache` | `123` / `123456` | Lê Văn Pha Chế | Nhân Viên Pha Chế |

*Lưu ý: Dữ liệu tài khoản khách hàng hoàn toàn rỗng để giữ CSDL sạch. Khách mua hàng sẽ tạo tài khoản mới qua Pop-up Đăng Ký trên trang web.*

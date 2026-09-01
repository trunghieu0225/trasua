# Hướng Dẫn Cài Đặt Cơ Sở Dữ Liệu MySQL 8.0 & Cấu Trúc Backend

Tài liệu này hướng dẫn cách khởi tạo database MySQL 8.0 cho 11 thực thể của hệ thống **TeaJoy Store (Trà Sữa ĐÔ ĐÔ)**.

---

## 1. File Cơ Sở Dữ Liệu Duy Nhất

- [teajoy.sql](teajoy.sql): Script SQL duy nhất kết hợp cả DDL (tạo Database `teajoy_store` và 11 bảng quan hệ chuẩn hóa 3NF) và DML Seed (nạp sẵn tài khoản quản lý & nhân viên, sản phẩm trà sữa, nhà cung cấp, voucher, bài viết...).

---

## 2. Cách Import Database Vào MySQL

### Cách 1: Sử dụng MySQL Command Line (Terminal / CMD)
```bash
# Đăng nhập vào MySQL và thực thi script teajoy.sql duy nhất
mysql -u root -p teajoy_store < database/teajoy.sql
```

### Cách 2: Sử dụng DBeaver / MySQL Workbench / Navicat / phpMyAdmin
1. Mở công cụ quản lý cơ sở dữ liệu (DBeaver / Workbench / Navicat).
2. Tạo kết nối tới MySQL Server của bạn (Port `3306`).
3. Mở duy nhất file [teajoy.sql](teajoy.sql) và nhấn nút **Execute (Run SQL)**.

---

## 3. Tài Khoản Demo Mặc Định Sau Khi Import `teajoy.sql`

| Vai Trò | Tên Đăng Nhập | Mật Khẩu | Họ Tên | Chức Vụ |
| :--- | :--- | :--- | :--- | :--- |
| **👑 Quản Lý (Admin)** | `admin` | `123456` | Đỗ Trung Hiếu | Quản Lý Cửa Hàng |
| **💼 Thu Ngân (Staff)** | `thungan` | `123456` | Nguyễn Văn Thu Ngân | Thu Ngân & Bán Hàng |
| **🧋 Pha Chế (Staff)** | `phache` | `123456` | Trần Thị Pha Chế | Nhân Viên Pha Chế |

*Lưu ý: Dữ liệu tài khoản khách hàng hoàn toàn rỗng để giữ CSDL sạch. Khách mua hàng sẽ tự đăng ký tài khoản mới qua Pop-up Đăng Ký trên trang web.*

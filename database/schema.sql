-- ============================================================================
-- TEAJOY STORE - COMPLETE MYSQL 8.0 DATABASE SCHEMA DDL
-- HỆ THỐNG CƠ SỞ DỮ LIỆU BÁN TRÀ SỮA & QUẢN TRỊ CHUỖI CỬA HÀNG
-- ============================================================================

CREATE DATABASE IF NOT EXISTS `teajoy_store` 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE `teajoy_store`;

-- Disable Foreign Key checks during recreation
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `REVIEWS`;
DROP TABLE IF EXISTS `THANH_TOAN`;
DROP TABLE IF EXISTS `CHI_TIET_DON_HANG`;
DROP TABLE IF EXISTS `DON_HANG`;
DROP TABLE IF EXISTS `VOUCHERS`;
DROP TABLE IF EXISTS `BAI_VIET`;
DROP TABLE IF EXISTS `TOPPING`;
DROP TABLE IF EXISTS `SAN_PHAM`;
DROP TABLE IF EXISTS `NHA_CUNG_CAP`;
DROP TABLE IF EXISTS `KHACH_HANG`;
DROP TABLE IF EXISTS `NHAN_VIEN`;
DROP TABLE IF EXISTS `TAI_KHOAN`;

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------------------------------------------------------
-- 1. BẢNG TAI_KHOAN (Accounts & Authentication)
-- ----------------------------------------------------------------------------
CREATE TABLE `TAI_KHOAN` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `ten_dang_nhap` VARCHAR(50) NOT NULL UNIQUE,
    `mat_khau_hash` VARCHAR(255) NOT NULL COMMENT 'Bcrypt/Argon2id Hash',
    `email` VARCHAR(100) UNIQUE NULL,
    `so_dien_thoai` VARCHAR(15) NOT NULL UNIQUE,
    `vai_tro` ENUM('admin', 'nhan_vien', 'khach_hang') NOT NULL DEFAULT 'khach_hang',
    `trang_thai` ENUM('hoat_dong', 'tam_khoa', 'cho_kich_hoat') NOT NULL DEFAULT 'hoat_dong',
    `refresh_token` TEXT NULL,
    `lan_dang_nhap_cuoi` DATETIME NULL,
    `ngay_tao` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ngay_cap_nhat` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX `idx_taikhoan_sdt` (`so_dien_thoai`),
    INDEX `idx_taikhoan_vaitro` (`vai_tro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 2. BẢNG NHAN_VIEN (Employees)
-- ----------------------------------------------------------------------------
CREATE TABLE `NHAN_VIEN` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `tai_khoan_id` BIGINT UNSIGNED NOT NULL UNIQUE,
    `ma_nhan_vien` VARCHAR(20) NOT NULL UNIQUE,
    `ho_ten` VARCHAR(100) NOT NULL,
    `chuc_vu` VARCHAR(50) NOT NULL COMMENT 'Quan ly, Thu ngan, Pha che, Giao hang',
    `cccd` VARCHAR(20) UNIQUE NULL,
    `ngay_sinh` DATE NULL,
    `gioi_tinh` ENUM('nam', 'nu', 'khac') DEFAULT 'nam',
    `dia_chi` VARCHAR(255) NULL,
    `luong_co_ban` DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
    `ngay_vao_lam` DATE NOT NULL,
    `trang_thai_lam_viec` ENUM('dang_lam', 'nghi_phep', 'da_thoi_viec') NOT NULL DEFAULT 'dang_lam',
    `ngay_tao` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ngay_cap_nhat` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT `fk_nhanvien_taikhoan` FOREIGN KEY (`tai_khoan_id`) REFERENCES `TAI_KHOAN` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 3. BẢNG KHACH_HANG (Customers & Loyalty CRM)
-- ----------------------------------------------------------------------------
CREATE TABLE `KHACH_HANG` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `tai_khoan_id` BIGINT UNSIGNED NOT NULL UNIQUE,
    `ho_ten` VARCHAR(100) NOT NULL,
    `dia_chi_mac_dinh` VARCHAR(255) NULL,
    `diem_tich_luy` INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '10k = 1 diem',
    `hang_thanh_vien` ENUM('dong', 'bac', 'vang', 'kim_cuong') NOT NULL DEFAULT 'dong',
    `tong_chi_tieu` DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    `so_don_da_mua` INT UNSIGNED NOT NULL DEFAULT 0,
    `ngay_tao` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ngay_cap_nhat` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX `idx_khachhang_hang` (`hang_thanh_vien`),
    CONSTRAINT `fk_khachhang_taikhoan` FOREIGN KEY (`tai_khoan_id`) REFERENCES `TAI_KHOAN` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 4. BẢNG NHA_CUNG_CAP (Suppliers)
-- ----------------------------------------------------------------------------
CREATE TABLE `NHA_CUNG_CAP` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `ma_ncc` VARCHAR(20) NOT NULL UNIQUE,
    `ten_nha_cung_cap` VARCHAR(150) NOT NULL,
    `nguoi_dai_dien` VARCHAR(100) NULL,
    `so_dien_thoai` VARCHAR(15) NOT NULL,
    `email` VARCHAR(100) NULL,
    `dia_chi` VARCHAR(255) NULL,
    `danh_muc_nguyen_lieu` TEXT NULL COMMENT 'La tra, sua tuoi, tran chau, ly coc',
    `trang_thai` ENUM('dang_hop_tac', 'tam_dung') NOT NULL DEFAULT 'dang_hop_tac',
    `ngay_tao` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ngay_cap_nhat` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 5. BẢNG SAN_PHAM (Products & Menu)
-- ----------------------------------------------------------------------------
CREATE TABLE `SAN_PHAM` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `ma_sku` VARCHAR(30) NOT NULL UNIQUE,
    `nha_cung_cap_id` BIGINT UNSIGNED NULL,
    `danh_muc` ENUM('tra-sua', 'tra-trai-cay', 'da-xay', 'ca-phe', 'combo') NOT NULL,
    `ten_san_pham` VARCHAR(150) NOT NULL,
    `mo_ta` TEXT NULL,
    `gia_goc` DECIMAL(12, 2) NOT NULL COMMENT 'Gia size M chuan',
    `gia_khuyen_mai` DECIMAL(12, 2) NULL,
    `hinh_anh_url` VARCHAR(500) NOT NULL,
    `so_luong_ton` INT NOT NULL DEFAULT 100,
    `da_ban` INT UNSIGNED NOT NULL DEFAULT 0,
    `danh_gia_tb` DECIMAL(2, 1) NOT NULL DEFAULT 5.0,
    `trang_thai` BOOLEAN NOT NULL DEFAULT TRUE,
    `ngay_tao` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ngay_cap_nhat` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX `idx_sanpham_danhmuc` (`danh_muc`),
    INDEX `idx_sanpham_daban` (`da_ban`),
    CONSTRAINT `fk_sanpham_nhacungcap` FOREIGN KEY (`nha_cung_cap_id`) REFERENCES `NHA_CUNG_CAP` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 5.1. BẢNG TOPPING (Milk Tea Toppings)
-- ----------------------------------------------------------------------------
CREATE TABLE `TOPPING` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `ma_topping` VARCHAR(30) NOT NULL UNIQUE,
    `ten_topping` VARCHAR(100) NOT NULL,
    `gia_them` DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
    `trang_thai` BOOLEAN NOT NULL DEFAULT TRUE,
    `ngay_tao` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 6. BẢNG VOUCHERS (Promotions & Coupons)
-- ----------------------------------------------------------------------------
CREATE TABLE `VOUCHERS` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `ma_voucher` VARCHAR(30) NOT NULL UNIQUE,
    `loai_giam` ENUM('phan_tram', 'tien_mat') NOT NULL,
    `gia_tri_giam` DECIMAL(12, 2) NOT NULL,
    `giam_toi_da` DECIMAL(12, 2) NULL,
    `don_hang_toi_thieu` DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
    `so_luong_phat_hanh` INT UNSIGNED NOT NULL DEFAULT 1000,
    `so_luong_da_dung` INT UNSIGNED NOT NULL DEFAULT 0,
    `ngay_bat_dau` DATETIME NOT NULL,
    `ngay_ket_thuc` DATETIME NOT NULL,
    `mo_ta` VARCHAR(255) NULL,
    `trang_thai` BOOLEAN NOT NULL DEFAULT TRUE,
    `ngay_tao` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX `idx_voucher_code` (`ma_voucher`),
    INDEX `idx_voucher_hsd` (`ngay_bat_dau`, `ngay_ket_thuc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 7. BẢNG DON_HANG (Orders)
-- ----------------------------------------------------------------------------
CREATE TABLE `DON_HANG` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `ma_don_hang` VARCHAR(30) NOT NULL UNIQUE,
    `khach_hang_id` BIGINT UNSIGNED NULL,
    `ten_nguoi_nhan` VARCHAR(100) NOT NULL,
    `sdt_nguoi_nhan` VARCHAR(15) NOT NULL,
    `dia_chi_giao_hang` VARCHAR(255) NOT NULL,
    `ghi_chu` TEXT NULL,
    `voucher_id` BIGINT UNSIGNED NULL,
    `tong_tien_mon` DECIMAL(12, 2) NOT NULL,
    `phi_van_chuyen` DECIMAL(12, 2) NOT NULL DEFAULT 15000.00,
    `so_tien_giam_gia` DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
    `tong_thanh_toan` DECIMAL(12, 2) NOT NULL,
    `trang_thai_don_hang` ENUM('pending', 'confirmed', 'preparing', 'shipping', 'completed', 'cancelled') NOT NULL DEFAULT 'pending',
    `ngay_dat` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ngay_cap_nhat` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX `idx_donhang_madon` (`ma_don_hang`),
    INDEX `idx_donhang_sdt` (`sdt_nguoi_nhan`),
    INDEX `idx_donhang_trangthai` (`trang_thai_don_hang`),
    INDEX `idx_donhang_ngaydat` (`ngay_dat`),
    CONSTRAINT `fk_donhang_khachhang` FOREIGN KEY (`khach_hang_id`) REFERENCES `KHACH_HANG` (`id`) ON DELETE SET NULL,
    CONSTRAINT `fk_donhang_voucher` FOREIGN KEY (`voucher_id`) REFERENCES `VOUCHERS` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 8. BẢNG CHI_TIET_DON_HANG (Order Items & Topping Details)
-- ----------------------------------------------------------------------------
CREATE TABLE `CHI_TIET_DON_HANG` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `don_hang_id` BIGINT UNSIGNED NOT NULL,
    `san_pham_id` BIGINT UNSIGNED NOT NULL,
    `ten_san_pham` VARCHAR(150) NOT NULL,
    `kich_thuoc` ENUM('M', 'L', 'XL') NOT NULL DEFAULT 'M',
    `muc_duong` VARCHAR(10) NOT NULL DEFAULT '100%',
    `muc_da` VARCHAR(10) NOT NULL DEFAULT '100%',
    `danh_sach_topping` JSON NULL COMMENT 'Luu mang JSON cac topping va gia',
    `don_gia` DECIMAL(12, 2) NOT NULL,
    `so_luong` INT UNSIGNED NOT NULL DEFAULT 1,
    `thanh_tien` DECIMAL(12, 2) NOT NULL,
    CONSTRAINT `fk_chitiet_donhang` FOREIGN KEY (`don_hang_id`) REFERENCES `DON_HANG` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_chitiet_sanpham` FOREIGN KEY (`san_pham_id`) REFERENCES `SAN_PHAM` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 9. BẢNG THANH_TOAN (Payments & Transactions)
-- ----------------------------------------------------------------------------
CREATE TABLE `THANH_TOAN` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `don_hang_id` BIGINT UNSIGNED NOT NULL UNIQUE,
    `phuong_thuc` ENUM('vietqr', 'momo', 'zalopay', 'vnpay', 'cod') NOT NULL,
    `ma_giao_dich_cong` VARCHAR(100) NULL,
    `so_tien` DECIMAL(12, 2) NOT NULL,
    `trang_thai` ENUM('cho_thanh_toan', 'thanh_cong', 'that_bai', 'da_hoan_tien') NOT NULL DEFAULT 'cho_thanh_toan',
    `thoi_gian_thanh_toan` DATETIME NULL,
    `du_lieu_webhook` JSON NULL COMMENT 'Luu raw webhook tu ngan hang',
    `ngay_tao` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX `idx_thanhtoan_trangthai` (`trang_thai`),
    CONSTRAINT `fk_thanhtoan_donhang` FOREIGN KEY (`don_hang_id`) REFERENCES `DON_HANG` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 10. BẢNG BAI_VIET (Posts, News & Banners)
-- ----------------------------------------------------------------------------
CREATE TABLE `BAI_VIET` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `tac_gia_id` BIGINT UNSIGNED NOT NULL,
    `tieu_de` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL UNIQUE,
    `loai_bai_viet` ENUM('tin_tuc', 'khuyen_mai', 'banner_hero', 'thong_bao') NOT NULL DEFAULT 'tin_tuc',
    `anh_dai_dien` VARCHAR(500) NULL,
    `tom_tat` TEXT NULL,
    `noi_dung` LONGTEXT NULL,
    `luot_xem` INT UNSIGNED NOT NULL DEFAULT 0,
    `trang_thai` ENUM('nhap', 'xuat_ban', 'an') NOT NULL DEFAULT 'xuat_ban',
    `ngay_dang` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `ngay_cap_nhat` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX `idx_baiviet_slug` (`slug`),
    INDEX `idx_baiviet_loai` (`loai_bai_viet`),
    CONSTRAINT `fk_baiviet_nhanvien` FOREIGN KEY (`tac_gia_id`) REFERENCES `NHAN_VIEN` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- 11. BẢNG REVIEWS (Product Ratings & Feedback)
-- ----------------------------------------------------------------------------
CREATE TABLE `REVIEWS` (
    `id` BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `khach_hang_id` BIGINT UNSIGNED NOT NULL,
    `san_pham_id` BIGINT UNSIGNED NOT NULL,
    `don_hang_id` BIGINT UNSIGNED NULL,
    `so_sao` TINYINT UNSIGNED NOT NULL CHECK (`so_sao` BETWEEN 1 AND 5),
    `noi_dung` TEXT NULL,
    `hinh_anh_kem_theo` JSON NULL,
    `phan_hoi_admin` TEXT NULL,
    `trang_thai_hien_thi` BOOLEAN NOT NULL DEFAULT TRUE,
    `ngay_tao` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    INDEX `idx_reviews_sanpham` (`san_pham_id`),
    CONSTRAINT `fk_reviews_khachhang` FOREIGN KEY (`khach_hang_id`) REFERENCES `KHACH_HANG` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_reviews_sanpham` FOREIGN KEY (`san_pham_id`) REFERENCES `SAN_PHAM` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_reviews_donhang` FOREIGN KEY (`don_hang_id`) REFERENCES `DON_HANG` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: teajoy_store
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bai_viet`
--

DROP TABLE IF EXISTS `bai_viet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bai_viet` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tac_gia_id` bigint unsigned NOT NULL,
  `tieu_de` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loai_bai_viet` enum('tin_tuc','khuyen_mai','banner_hero','thong_bao') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'tin_tuc',
  `anh_dai_dien` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tom_tat` text COLLATE utf8mb4_unicode_ci,
  `noi_dung` longtext COLLATE utf8mb4_unicode_ci,
  `luot_xem` int unsigned NOT NULL DEFAULT '0',
  `trang_thai` enum('nhap','xuat_ban','an') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xuat_ban',
  `ngay_dang` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ngay_cap_nhat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `idx_baiviet_slug` (`slug`),
  KEY `idx_baiviet_loai` (`loai_bai_viet`),
  KEY `fk_baiviet_nhanvien` (`tac_gia_id`),
  CONSTRAINT `fk_baiviet_nhanvien` FOREIGN KEY (`tac_gia_id`) REFERENCES `nhan_vien` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bai_viet`
--

LOCK TABLES `bai_viet` WRITE;
/*!40000 ALTER TABLE `bai_viet` DISABLE KEYS */;
INSERT INTO `bai_viet` VALUES (1,1,'Bí Quyết Chọn Lá Trà Ô Long Chuẩn Vị Tại Bảo Lộc','bi-quyet-chon-la-tra-o-long','tin_tuc','https://images.unsplash.com/photo-1558857563-b37fcdd72460?auto=format&fit=crop&w=1200&q=80','Khám phá quy trình thu hái búp trà 1 tôm 2 lá...','<p>Chi tiết bài viết giới thiệu về nguồn gốc lá trà tự nhiên...</p>',0,'xuat_ban','2026-09-07 23:32:57','2026-09-07 23:32:57'),(2,1,'Ưu đãi Giáng sinh rinh Trà sữa Đô Đô Test','uu-dai-giang-sinh-rinh-tra-sua-do-do-test-1790430669436','tin_tuc','https://images.unsplash.com/photo-1558857563-b37fcdd72460?auto=format&fit=crop&w=1200&q=80','Tặng voucher 20k cho đơn từ 2 ly','Nội dung chi tiết chương trình khuyến mại',0,'xuat_ban','2026-09-26 20:51:09','2026-09-26 20:51:09');
/*!40000 ALTER TABLE `bai_viet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `chi_tiet_don_hang`
--

DROP TABLE IF EXISTS `chi_tiet_don_hang`;
/*!50001 DROP VIEW IF EXISTS `chi_tiet_don_hang`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `chi_tiet_don_hang` AS SELECT 
 1 AS `id`,
 1 AS `hoa_don_id`,
 1 AS `san_pham_id`,
 1 AS `ten_san_pham`,
 1 AS `kich_thuoc`,
 1 AS `muc_duong`,
 1 AS `muc_da`,
 1 AS `danh_sach_topping`,
 1 AS `don_gia`,
 1 AS `so_luong`,
 1 AS `thanh_tien`,
 1 AS `don_hang_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `chi_tiet_hoa_don`
--

DROP TABLE IF EXISTS `chi_tiet_hoa_don`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chi_tiet_hoa_don` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `hoa_don_id` bigint unsigned NOT NULL,
  `san_pham_id` bigint unsigned DEFAULT NULL,
  `ten_san_pham` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kich_thuoc` enum('M','L','XL') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'M',
  `muc_duong` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '100%',
  `muc_da` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '100%',
  `danh_sach_topping` json DEFAULT NULL COMMENT 'Luu mang JSON cac topping va gia',
  `don_gia` decimal(12,2) NOT NULL,
  `so_luong` int unsigned NOT NULL DEFAULT '1',
  `thanh_tien` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chitiet_sanpham` (`san_pham_id`),
  KEY `fk_chitiethoadon_hoadon` (`hoa_don_id`),
  CONSTRAINT `fk_chitiet_sanpham` FOREIGN KEY (`san_pham_id`) REFERENCES `san_pham` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_chitiethoadon_hoadon` FOREIGN KEY (`hoa_don_id`) REFERENCES `hoa_don` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_hoa_don`
--

LOCK TABLES `chi_tiet_hoa_don` WRITE;
/*!40000 ALTER TABLE `chi_tiet_hoa_don` DISABLE KEYS */;
INSERT INTO `chi_tiet_hoa_don` VALUES (5,5,11,'Olong Nhài Sữa Đô Đô','L','70%','50%','[{\"name\": \"Mochi Kéo Dài (Signature Đô Đô)\"}]',41000.00,1,41000.00),(6,6,2,'Matcha Mochi Kéo Dài','M','70%','100%','[{\"name\": \"Kem Tiramisu Phô Mai\"}]',33000.00,1,33000.00),(9,7,3,'Sữa Tươi Đường Đen Mochi Kéo Dài','M','100%','100%','[]',25000.00,1,25000.00),(10,7,11,'Olong Nhài Sữa Đô Đô','M','100%','100%','[]',25000.00,3,75000.00),(21,14,3,'Sữa Tươi Đường Đen Mochi Kéo Dài','M','100%','100%','[]',25000.00,1,25000.00),(40,27,1,'Trà Sữa Tiramisu Mochi','L','100%','100%','[]',30000.00,1,30000.00),(41,27,1,'Hồng Trà Sữa Nướng','M','100%','100%','[]',25000.00,1,25000.00),(43,29,1,'Trà Sữa Tiramisu Mochi','L','100%','100%','[]',30000.00,1,30000.00),(44,29,1,'Hồng Trà Sữa Nướng','M','100%','100%','[]',25000.00,1,25000.00),(49,33,9,'Hồng Trà Sữa Cookies','M','100%','100%','[]',25000.00,1,25000.00),(50,34,1,'Hồng Trà Mochi Kéo Dài','M','100%','100%','[{\"name\": \"Mochi Kéo Dài (Signature Đô Đô)\"}]',31000.00,1,31000.00),(51,34,3,'Sữa Tươi Đường Đen Mochi Kéo Dài','M','100%','100%','[{\"name\": \"Mochi Kéo Dài (Signature Đô Đô)\"}]',31000.00,1,31000.00),(52,34,11,'Olong Nhài Sữa Đô Đô','M','100%','100%','[]',25000.00,1,25000.00),(53,35,2,'Matcha Mochi Kéo Dài','M','100%','100%','[]',25000.00,1,25000.00),(54,36,11,'Olong Nhài Sữa Đô Đô','L','100%','100%','[{\"name\": \"Mochi Nếp Lạnh Dẻo\"}]',41000.00,1,41000.00);
/*!40000 ALTER TABLE `chi_tiet_hoa_don` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `don_hang`
--

DROP TABLE IF EXISTS `don_hang`;
/*!50001 DROP VIEW IF EXISTS `don_hang`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `don_hang` AS SELECT 
 1 AS `id`,
 1 AS `ma_don_hang`,
 1 AS `khach_hang_id`,
 1 AS `ten_nguoi_nhan`,
 1 AS `sdt_nguoi_nhan`,
 1 AS `dia_chi_giao_hang`,
 1 AS `ghi_chu`,
 1 AS `voucher_id`,
 1 AS `nhan_vien_id`,
 1 AS `tong_tien_mon`,
 1 AS `phi_van_chuyen`,
 1 AS `so_tien_giam_gia`,
 1 AS `tong_thanh_toan`,
 1 AS `trang_thai_don_hang`,
 1 AS `ngay_dat`,
 1 AS `ngay_cap_nhat`,
 1 AS `ma_hoa_don`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `hoa_don`
--

DROP TABLE IF EXISTS `hoa_don`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoa_don` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ma_don_hang` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `khach_hang_id` bigint unsigned DEFAULT NULL,
  `ten_nguoi_nhan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sdt_nguoi_nhan` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dia_chi_giao_hang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ghi_chu` text COLLATE utf8mb4_unicode_ci,
  `voucher_id` bigint unsigned DEFAULT NULL,
  `nhan_vien_id` bigint unsigned DEFAULT NULL COMMENT 'Nhan vien thu ngan / pha che xu ly don',
  `tong_tien_mon` decimal(12,2) NOT NULL,
  `phi_van_chuyen` decimal(12,2) NOT NULL DEFAULT '15000.00',
  `so_tien_giam_gia` decimal(12,2) NOT NULL DEFAULT '0.00',
  `tong_thanh_toan` decimal(12,2) NOT NULL,
  `trang_thai_don_hang` enum('pending','confirmed','preparing','shipping','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `ngay_dat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ngay_cap_nhat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ma_hoa_don` varchar(30) COLLATE utf8mb4_unicode_ci GENERATED ALWAYS AS (`ma_don_hang`) STORED,
  `trang_thai_hoa_don` varchar(20) COLLATE utf8mb4_unicode_ci GENERATED ALWAYS AS (`trang_thai_don_hang`) STORED,
  `ngay_lap` datetime GENERATED ALWAYS AS (`ngay_dat`) STORED,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ma_don_hang` (`ma_don_hang`),
  KEY `idx_donhang_madon` (`ma_don_hang`),
  KEY `idx_donhang_sdt` (`sdt_nguoi_nhan`),
  KEY `idx_donhang_trangthai` (`trang_thai_don_hang`),
  KEY `idx_donhang_ngaydat` (`ngay_dat`),
  KEY `fk_donhang_khachhang` (`khach_hang_id`),
  KEY `fk_donhang_nhanvien` (`nhan_vien_id`),
  KEY `fk_donhang_voucher` (`voucher_id`),
  CONSTRAINT `fk_donhang_khachhang` FOREIGN KEY (`khach_hang_id`) REFERENCES `khach_hang` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_donhang_nhanvien` FOREIGN KEY (`nhan_vien_id`) REFERENCES `nhan_vien` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_donhang_voucher` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoa_don`
--

LOCK TABLES `hoa_don` WRITE;
/*!40000 ALTER TABLE `hoa_don` DISABLE KEYS */;
INSERT INTO `hoa_don` (`id`, `ma_don_hang`, `khach_hang_id`, `ten_nguoi_nhan`, `sdt_nguoi_nhan`, `dia_chi_giao_hang`, `ghi_chu`, `voucher_id`, `nhan_vien_id`, `tong_tien_mon`, `phi_van_chuyen`, `so_tien_giam_gia`, `tong_thanh_toan`, `trang_thai_don_hang`, `ngay_dat`, `ngay_cap_nhat`) VALUES (5,'TS-7031',NULL,'Ngô Mạnh Hiếu','0868870869','bắc ninh','',NULL,NULL,41000.00,15000.00,0.00,56000.00,'completed','2026-09-14 06:41:39','2026-09-14 06:42:56'),(6,'TS-5500',NULL,'Bình An','0868870869','quảng ninh','',NULL,NULL,33000.00,15000.00,0.00,48000.00,'completed','2026-09-14 06:53:33','2026-09-14 06:57:47'),(7,'TS-5109',NULL,'Ngô Mạnh Hiếu','0868870869','bn','',NULL,NULL,100000.00,15000.00,0.00,115000.00,'completed','2026-09-14 10:31:24','2026-09-14 10:33:14'),(14,'TS-4613',NULL,'Ngô Mạnh Hiếu','0868870898','bắc ninh','',NULL,NULL,25000.00,15000.00,0.00,40000.00,'completed','2026-09-18 11:26:51','2026-10-01 18:34:58'),(27,'POS-4486',NULL,'Khách Tại Quầy POS','0901234567','Tại quầy cửa hàng','',NULL,NULL,55000.00,0.00,0.00,55000.00,'cancelled','2026-10-01 18:45:37','2026-10-01 18:45:37'),(29,'POS-1590',NULL,'Khách Tại Quầy POS','0901234567','Tại quầy cửa hàng','',NULL,NULL,55000.00,0.00,0.00,55000.00,'cancelled','2026-10-01 18:45:49','2026-10-01 18:45:49'),(33,'TS-7698',NULL,'Đào Vũ','0986878986','Tiên Du','lấy nhiều giấy',NULL,NULL,25000.00,15000.00,0.00,40000.00,'shipping','2026-10-01 21:11:38','2026-10-01 21:14:57'),(34,'TS-8596',NULL,'Đào Vũ','0986878986','Tiên Du','nhiều ống hút',NULL,NULL,87000.00,15000.00,0.00,102000.00,'shipping','2026-10-01 21:12:31','2026-10-01 21:14:53'),(35,'TS-8769',NULL,'Đào Vũ','0986878986','Tiên Du','',NULL,NULL,25000.00,15000.00,0.00,40000.00,'shipping','2026-10-01 21:12:56','2026-10-01 21:14:50'),(36,'TS-2460',NULL,'Ngô Mạnh Hiếu','0868870869','bắc ninh','noooo',NULL,NULL,41000.00,15000.00,0.00,56000.00,'completed','2026-10-01 21:25:14','2026-10-01 21:30:02');
/*!40000 ALTER TABLE `hoa_don` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khach_hang`
--

DROP TABLE IF EXISTS `khach_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khach_hang` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tai_khoan_id` bigint unsigned NOT NULL,
  `ho_ten` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dia_chi_mac_dinh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diem_tich_luy` int unsigned NOT NULL DEFAULT '0' COMMENT '10k = 1 diem',
  `hang_thanh_vien` enum('dong','bac','vang','kim_cuong') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dong',
  `tong_chi_tieu` decimal(15,2) NOT NULL DEFAULT '0.00',
  `so_don_da_mua` int unsigned NOT NULL DEFAULT '0',
  `ngay_tao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ngay_cap_nhat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tai_khoan_id` (`tai_khoan_id`),
  KEY `idx_khachhang_hang` (`hang_thanh_vien`),
  CONSTRAINT `fk_khachhang_taikhoan` FOREIGN KEY (`tai_khoan_id`) REFERENCES `tai_khoan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khach_hang`
--

LOCK TABLES `khach_hang` WRITE;
/*!40000 ALTER TABLE `khach_hang` DISABLE KEYS */;
INSERT INTO `khach_hang` VALUES (1,4,'Ngô Mạnh Hiếu',NULL,50,'dong',0.00,0,'2026-09-11 22:41:44','2026-09-11 22:41:44'),(2,9,'Bình An',NULL,50,'dong',0.00,0,'2026-09-14 06:51:24','2026-09-14 06:51:24'),(25,43,'Khách Hàng Thử Nghiệm',NULL,50,'dong',0.00,0,'2026-10-01 18:45:37','2026-10-01 18:45:37'),(27,46,'Khách Hàng Thử Nghiệm',NULL,50,'dong',0.00,0,'2026-10-01 18:45:49','2026-10-01 18:45:49'),(28,47,'D�o Vu',NULL,50,'dong',0.00,0,'2026-10-01 19:16:59','2026-10-01 21:15:50'),(30,50,'Khách Hàng Thử Nghiệm',NULL,50,'dong',0.00,0,'2026-10-01 19:20:35','2026-10-01 19:20:35');
/*!40000 ALTER TABLE `khach_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nha_cung_cap`
--

DROP TABLE IF EXISTS `nha_cung_cap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nha_cung_cap` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ma_ncc` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ten_nha_cung_cap` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nguoi_dai_dien` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `so_dien_thoai` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dia_chi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `danh_muc_nguyen_lieu` text COLLATE utf8mb4_unicode_ci COMMENT 'La tra, sua tuoi, tran chau, ly coc',
  `trang_thai` enum('dang_hop_tac','tam_dung') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dang_hop_tac',
  `ngay_tao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ngay_cap_nhat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ma_ncc` (`ma_ncc`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nha_cung_cap`
--

LOCK TABLES `nha_cung_cap` WRITE;
/*!40000 ALTER TABLE `nha_cung_cap` DISABLE KEYS */;
INSERT INTO `nha_cung_cap` VALUES (1,'SUP-01','Công ty Trà Cao Cương Lâm Đồng','Anh Cương','0908889900','cuongtra@lamdong.vn','Bảo Lộc, Lâm Đồng','Lá trà Ô long nướng, Trà đen Assam, Lục trà nhài','dang_hop_tac','2026-09-07 23:32:56','2026-09-07 23:32:56'),(2,'SUP-02','Sữa Tươi Thanh Trùng DalatMilk','Chị Hạnh','0903332211','hanh@dalatmilk.vn','Đà Lạt, Lâm Đồng','Sữa tươi thanh trùng, Kem béo, Bơ phô mai','dang_hop_tac','2026-09-07 23:32:56','2026-09-07 23:32:56'),(3,'SUP-03','Nhà cung cấp Topping & Bao bì Tân Phú','Anh Thắng','0977112233','thang@tanphupack.vn','Tân Phú, TP.HCM','Trân châu hoàng kim, Cốc giấy, Ống hút sinh học','dang_hop_tac','2026-09-07 23:32:56','2026-09-07 23:32:56'),(4,'NCC-4761','Công ty Milk ông thọ','Phan Thế','09723432113','','','sữa đặc','dang_hop_tac','2026-09-14 06:45:44','2026-09-14 06:45:44');
/*!40000 ALTER TABLE `nha_cung_cap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhan_vien`
--

DROP TABLE IF EXISTS `nhan_vien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhan_vien` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tai_khoan_id` bigint unsigned NOT NULL,
  `ma_nhan_vien` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ho_ten` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chuc_vu` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Quan ly, Thu ngan, Pha che, Giao hang',
  `cccd` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `gioi_tinh` enum('nam','nu','khac') COLLATE utf8mb4_unicode_ci DEFAULT 'nam',
  `dia_chi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `luong_co_ban` decimal(12,2) NOT NULL DEFAULT '0.00',
  `ngay_vao_lam` date NOT NULL,
  `trang_thai_lam_viec` enum('dang_lam','nghi_phep','da_thoi_viec') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dang_lam',
  `ngay_tao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ngay_cap_nhat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tai_khoan_id` (`tai_khoan_id`),
  UNIQUE KEY `ma_nhan_vien` (`ma_nhan_vien`),
  UNIQUE KEY `cccd` (`cccd`),
  CONSTRAINT `fk_nhanvien_taikhoan` FOREIGN KEY (`tai_khoan_id`) REFERENCES `tai_khoan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhan_vien`
--

LOCK TABLES `nhan_vien` WRITE;
/*!40000 ALTER TABLE `nhan_vien` DISABLE KEYS */;
INSERT INTO `nhan_vien` VALUES (1,1,'NV-001','Đỗ Trung Hiếu (Quản Lý)','Quản Lý Cửa Hàng','079090001122','1992-05-15','nam','Số 25 Hoàng Cầu, Đống Đa, Hà Nội',15000000.00,'2026-01-01','dang_lam','2026-09-07 23:32:56','2026-10-01 18:45:28'),(3,3,'NV-003','An 7','Nhân Viên Pha Chế','079195005566','2000-01-10','nu',NULL,8000000.00,'2026-03-01','dang_lam','2026-09-07 23:32:56','2026-09-18 11:00:51'),(5,11,'NV-002','phương','Thu Ngân & Bán Hàng',NULL,NULL,'nam',NULL,7500000.00,'2026-02-15','nghi_phep','2026-09-18 11:00:51','2026-10-01 18:40:47'),(11,31,'NV-0112','Thế Phan','Nhân Viên Pha Chế',NULL,NULL,'nam',NULL,6000000.00,'2026-09-26','dang_lam','2026-09-26 21:05:30','2026-09-26 21:05:30'),(15,40,'NV-6077','vũ đào lê','Thu Ngân & Bán Hàng',NULL,NULL,'nam','123 P123 Pho Hue, Hai Ba Trung, Ha Noi',6000000.00,'2026-10-01','dang_lam','2026-10-01 18:40:06','2026-10-01 20:52:48'),(19,51,'NV-2552','trun hieu','Nh�n Vi�n Pha Ch?',NULL,NULL,'nam','Phùng Khoang , Hà Đông',6000000.00,'2026-10-01','dang_lam','2026-10-01 20:54:12','2026-10-01 21:00:39'),(20,52,'NV-7071','An Vũ Bình','Nhân Viên Pha Chế',NULL,NULL,'khac','quảng ninh',6000000.00,'2026-10-01','dang_lam','2026-10-01 21:27:37','2026-10-01 21:27:54');
/*!40000 ALTER TABLE `nhan_vien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `khach_hang_id` bigint unsigned NOT NULL,
  `san_pham_id` bigint unsigned NOT NULL,
  `hoa_don_id` bigint unsigned DEFAULT NULL,
  `so_sao` tinyint unsigned NOT NULL,
  `noi_dung` text COLLATE utf8mb4_unicode_ci,
  `hinh_anh_kem_theo` json DEFAULT NULL,
  `phan_hoi_admin` text COLLATE utf8mb4_unicode_ci,
  `trang_thai_hien_thi` tinyint(1) NOT NULL DEFAULT '1',
  `ngay_tao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_reviews_sanpham` (`san_pham_id`),
  KEY `fk_reviews_khachhang` (`khach_hang_id`),
  KEY `fk_reviews_hoadon` (`hoa_don_id`),
  CONSTRAINT `fk_reviews_hoadon` FOREIGN KEY (`hoa_don_id`) REFERENCES `hoa_don` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_reviews_khachhang` FOREIGN KEY (`khach_hang_id`) REFERENCES `khach_hang` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_reviews_sanpham` FOREIGN KEY (`san_pham_id`) REFERENCES `san_pham` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_chk_1` CHECK ((`so_sao` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,1,NULL,5,'Trà sữa rất ngon, đậm đà chuẩn vị Đô Đô!',NULL,'Cảm ơn quý khách đã ủng hộ cửa hàng!',1,'2026-03-10 14:20:00'),(2,2,1,NULL,4,'Trà sữa thơm béo, mochi ngon nhưng hôm nay giao hàng hơi lâu tầm 35 phút đá bị tan bớt chút.',NULL,'Đô Đô chân thành xin lỗi bạn về sự chậm trễ trong khâu giao hàng giờ cao điểm ạ! Quán đã nhắc nhở đội ngũ shipper tối ưu lộ trình để trà luôn mát lạnh đến tay bạn nhanh nhất.',1,'2026-03-12 11:15:00'),(6,1,1,NULL,5,'Trà sữa Tiramisu rất ngon, mochi dai dẻo chuẩn vị Đô Đô!',NULL,'Cảm ơn Ngô Mạnh Hiếu nhiều nha! Trà Sữa ĐÔ ĐÔ rất hạnh phúc khi nhận được sự ủng hộ và yêu mến của bạn ❤️ Chúc bạn có những phút giây ngọt ngào cùng Đô Đô!',1,'2026-09-26 20:51:09'),(17,1,10,NULL,5,'ngon',NULL,'Cảm ơn Ngô Mạnh Hiếu nhiều nha! Trà Sữa ĐÔ ĐÔ rất hạnh phúc khi nhận được sự ủng hộ và yêu mến của bạn ❤️ Chúc bạn có những phút giây ngọt ngào cùng Đô Đô!',1,'2026-10-01 21:18:10'),(18,1,11,NULL,5,'ngonn quá//////',NULL,'Cảm ơn Ngô Mạnh Hiếu nhiều nha! Trà Sữa ĐÔ ĐÔ rất hạnh phúc khi nhận được sự ủng hộ và yêu mến của bạn ❤️ Chúc bạn có những phút giây ngọt ngào cùng Đô Đô!',1,'2026-10-01 21:24:49');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `san_pham`
--

DROP TABLE IF EXISTS `san_pham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `san_pham` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ma_sku` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nha_cung_cap_id` bigint unsigned DEFAULT NULL,
  `danh_muc` enum('mochi','tiramisu','tra-sua','tra-trai-cay','da-xay','ca-phe','combo') COLLATE utf8mb4_unicode_ci NOT NULL,
  `ten_san_pham` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mo_ta` text COLLATE utf8mb4_unicode_ci,
  `gia_goc` decimal(12,2) NOT NULL COMMENT 'Gia size M chuan',
  `gia_khuyen_mai` decimal(12,2) DEFAULT NULL,
  `hinh_anh_url` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `so_luong_ton` int NOT NULL DEFAULT '100',
  `da_ban` int unsigned NOT NULL DEFAULT '0',
  `danh_gia_tb` decimal(2,1) NOT NULL DEFAULT '5.0',
  `trang_thai` tinyint(1) NOT NULL DEFAULT '1',
  `ngay_tao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ngay_cap_nhat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ma_sku` (`ma_sku`),
  KEY `idx_sanpham_danhmuc` (`danh_muc`),
  KEY `idx_sanpham_daban` (`da_ban`),
  KEY `fk_sanpham_nhacungcap` (`nha_cung_cap_id`),
  CONSTRAINT `fk_sanpham_nhacungcap` FOREIGN KEY (`nha_cung_cap_id`) REFERENCES `nha_cung_cap` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `san_pham`
--

LOCK TABLES `san_pham` WRITE;
/*!40000 ALTER TABLE `san_pham` DISABLE KEYS */;
INSERT INTO `san_pham` VALUES (1,'TS-01',1,'mochi','Hồng Trà Mochi Kéo Dài','Món Signature trứ danh của Đô Đô với lớp topping Mochi dẻo quánh kéo dài độc quyền kết hợp nền hồng trà sữa thơm bùi chuẩn vị.',25000.00,30000.00,'images/products/hong-tra-mochi-keo-dai.jpg',100,3420,4.8,1,'2026-09-07 23:32:56','2026-10-01 18:24:12'),(2,'TS-02',1,'mochi','Matcha Mochi Kéo Dài','Matcha thanh mát nguyên chất nhập khẩu quyện cùng sữa béo và lớp mochi dẻo mềm kéo sợi dai ngọt thơm lừng.',25000.00,30000.00,'images/products/matcha-mochi-keo-dai.jpg',85,2280,4.9,1,'2026-09-07 23:32:56','2026-09-07 23:32:56'),(3,'TS-03',1,'mochi','Sữa Tươi Đường Đen Mochi Kéo Dài','Sữa tươi thanh trùng béo ngậy sốt đường đen đậm vị cùng lớp mochi dẻo dai béo ngậy gây nghiện ngay ngụm đầu tiên.',25000.00,32000.00,'images/products/sua-tuoi-duong-den-mochi.jpg',90,2750,4.9,1,'2026-09-07 23:32:56','2026-09-07 23:32:56'),(4,'TS-04',1,'mochi','Matcha Mochi Nếp Lạnh','Vị matcha thanh mát kết hợp cùng mochi nếp lạnh dẻo quánh nhai mát lạnh cực cuốn.',25000.00,30000.00,'images/products/matcha-mochi-nep-lanh.jpg',70,1650,4.8,1,'2026-09-07 23:32:56','2026-09-07 23:32:56'),(5,'TS-05',1,'mochi','Socola Mochi Nếp Lạnh','Vị cacao socola đậm đà hòa quyện cùng mochi nếp lạnh dẻo quánh mềm tan trong miệng.',25000.00,30000.00,'images/products/socola-mochi-nep-lanh.jpg',65,1420,4.8,1,'2026-09-07 23:32:56','2026-09-07 23:32:56'),(6,'TS-06',1,'tiramisu','Hồng Trà Tiramisu Ovaltine','Hồng trà sữa thơm phức phủ lớp kem Tiramisu phô mai béo mặn chuẩn Ý và rắc bột Ovaltine giòn rụm trên bề mặt.',25000.00,32000.00,'images/products/hong-tra-tiramisu-ovaltine.jpg',95,1980,4.9,1,'2026-09-07 23:32:56','2026-09-07 23:32:56'),(7,'TS-07',1,'tiramisu','Matcha Tiramisu Ovaltine','Vị chát dịu của matcha phối cùng kem Tiramisu béo mặn và vụn Ovaltine thơm lừng đánh thức vị giác.',25000.00,32000.00,'images/products/matcha-tiramisu-ovaltine.jpg',60,1420,4.8,1,'2026-09-07 23:32:56','2026-09-07 23:32:56'),(8,'TS-08',1,'tiramisu','Socola Tiramisu Ovaltine','Socola béo đậm kết hợp kem Tiramisu mặn ngọt và lớp bột Ovaltine giòn thơm nức mũi.',25000.00,30000.00,'images/products/socola-tiramisu-ovaltine.jpg',85,2150,4.9,1,'2026-09-07 23:32:56','2026-09-07 23:32:56'),(9,'TS-09',1,'tiramisu','Hồng Trà Sữa Cookies','Hồng trà sữa đậm đà rắc vụn bánh cookies giòn rụm tạo cảm giác nhai vui miệng thích thú.',25000.00,30000.00,'images/products/hong-tra-sua-cookies.jpg',75,1780,4.8,1,'2026-09-07 23:32:56','2026-09-07 23:32:56'),(10,'TS-10',1,'tra-sua','Trà Sữa Đô Đô Truyền Thống','Vị trà sữa nguyên bản Đô Đô thơm nồng đượm vị lá trà, béo ngậy vừa vặn với mức giá sinh viên chỉ 21K.',21000.00,25000.00,'images/products/tra-sua-dodo-truyen-thong.jpg',150,4120,5.0,1,'2026-09-07 23:32:56','2026-10-01 21:09:12'),(11,'TS-11',1,'tra-sua','Olong Nhài Sữa Đô Đô','Trà Olong thanh khiết quyện cùng hương hoa nhài thơm thoang thoảng và sữa béo thanh tao.',25000.00,30000.00,'images/products/olong-nhai-sua-dodo.jpg',80,2310,5.0,1,'2026-09-07 23:32:56','2026-10-01 21:24:49'),(12,'TS-12',1,'tra-sua','Trà Sữa Socola Đậm Đà','Cacao nguyên chất hòa cùng sữa thơm nồng đậm đà, vị ngọt đắng quyến rũ.',23000.00,28000.00,'images/products/tra-sua-socola-dam-da.jpg',70,1350,4.7,1,'2026-09-07 23:32:56','2026-09-07 23:32:56'),(13,'TC-01',1,'tra-trai-cay','Trà Khế Thạch Đào','Vị chua thanh dịu ngọt từ trái khế mọng nước hòa quyện cùng thạch đào giòn sần sật đã khát ngày hè.',23000.00,28000.00,'images/products/tra-khe-thach-dao.png',90,1560,4.9,1,'2026-09-07 23:32:56','2026-09-07 23:32:56'),(14,'TC-02',1,'tra-trai-cay','Trà Chanh Thơm Thạch Đào','Vị chanh vàng thơm mát kết hợp vị dứa nhiệt đới và thạch đào giòn thơm sảng khoái.',23000.00,28000.00,'images/products/tra-chanh-thom-thach-dao.png',80,1220,4.8,1,'2026-09-07 23:32:56','2026-09-07 23:32:56'),(15,'TC-03',1,'tra-trai-cay','Trà Xoài Đào Thanh Mát','Hương vị trà xoài nhiệt đới kết hợp cốt đào thơm lừng mang đến cảm giác sảng khoái mát lạnh.',23000.00,28000.00,'images/products/tra-xoai-dao-thanh-mat.jpg',75,1340,4.8,1,'2026-09-07 23:32:56','2026-09-07 23:32:56'),(16,'TC-04',1,'tra-trai-cay','Trà Mơ Xanh Muối','Trà xanh hương lài kết hợp cốt mơ ngâm muối mằn mặn chua ngọt độc đáo thanh lọc cơ thể.',23000.00,28000.00,'images/products/tra-mo-xanh-muoi.jpg',70,1180,4.7,1,'2026-09-07 23:32:56','2026-09-07 23:32:56'),(23,'TS-017',NULL,'tra-trai-cay','Sinh tố lọc đá','',15000.00,NULL,'https://images.unsplash.com/photo-1558857563-b37fcdd72460?auto=format&fit=crop&w=600&q=80',100,0,5.0,1,'2026-09-14 07:17:01','2026-09-14 07:17:01'),(26,'TS-TEST-356',NULL,'tra-sua','Trà Sữa Oolong Bơ Nướng Test','Trà sữa đậm đà béo ngậy',38000.00,45000.00,'https://images.unsplash.com/photo-1558857563-b37fcdd72460?auto=format&fit=crop&w=600&q=80',80,0,5.0,1,'2026-10-01 07:19:39','2026-10-01 07:19:39');
/*!40000 ALTER TABLE `san_pham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tai_khoan`
--

DROP TABLE IF EXISTS `tai_khoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tai_khoan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ten_dang_nhap` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mat_khau_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Bcrypt/Argon2id Hash',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `so_dien_thoai` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vai_tro` enum('admin','nhan_vien','khach_hang') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'khach_hang',
  `trang_thai` enum('hoat_dong','tam_khoa','cho_kich_hoat') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'hoat_dong',
  `refresh_token` text COLLATE utf8mb4_unicode_ci,
  `lan_dang_nhap_cuoi` datetime DEFAULT NULL,
  `ngay_tao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ngay_cap_nhat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ten_dang_nhap` (`ten_dang_nhap`),
  UNIQUE KEY `so_dien_thoai` (`so_dien_thoai`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_taikhoan_sdt` (`so_dien_thoai`),
  KEY `idx_taikhoan_vaitro` (`vai_tro`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tai_khoan`
--

LOCK TABLES `tai_khoan` WRITE;
/*!40000 ALTER TABLE `tai_khoan` DISABLE KEYS */;
INSERT INTO `tai_khoan` VALUES (1,'admin','$2a$10$l4YJDRsJdsAb6hPUZYT9GOSFhqUtWha7oaz0AjrphMsn9RS3Jb7aK','admin@dodo.vn','0901234567','admin','hoat_dong',NULL,'2026-10-01 21:19:07','2026-09-07 23:32:56','2026-10-01 21:19:07'),(3,'phache','$2a$10$l4YJDRsJdsAb6hPUZYT9GOSFhqUtWha7oaz0AjrphMsn9RS3Jb7aK','phache@dodo.vn','0933445566','nhan_vien','hoat_dong',NULL,'2026-10-01 21:29:51','2026-09-07 23:32:56','2026-10-01 21:29:51'),(4,'hieuu','$2a$10$1UcWLU./t8BlT6ACgoVdaOcEA1vjYhQ3yDmic565GhnCTtpSS4d22',NULL,'0868870869','khach_hang','hoat_dong',NULL,'2026-10-01 21:24:14','2026-09-11 22:41:44','2026-10-01 21:24:14'),(9,'An1','$2a$10$9w/4oTPjFiBuK.bdBGeFYeFGcJT3pCAZUcMM8T9TuF4A3tUKb4C1G',NULL,'0291491324','khach_hang','hoat_dong',NULL,'2026-09-14 09:41:26','2026-09-14 06:51:24','2026-09-14 09:41:26'),(11,'thungan','$2a$10$f54KsXN53p6h27d/Oo2S.OyTY8HiJw99knFO9aVl3U5MSyTDKiuwy','thungan@dodo.vn','0912345678','nhan_vien','hoat_dong',NULL,'2026-10-01 19:20:34','2026-09-18 11:00:51','2026-10-01 19:20:34'),(31,'pthe','$2a$10$Qu7Kf0xlSI9aRNxqmwlCDOrMnhiOawWWVm7MLrHPIbVxKSUZp1qAe',NULL,'0989535389','nhan_vien','hoat_dong',NULL,'2026-09-26 21:05:46','2026-09-26 21:05:30','2026-09-26 21:05:46'),(40,'vu1','$2a$10$JuYbtG7.2klrhujZ06KebOM0AHw/596nhvMTU0C7JpBnnQoRf7ut6',NULL,'0986567893','nhan_vien','hoat_dong',NULL,NULL,'2026-10-01 18:40:06','2026-10-01 18:58:50'),(43,'cust_1790855137862','$2a$10$NpHb8ZC0HbPSXcbG5MiGoeyjtXeRI6D5jhsafAZr4UgMXslwFWS7a','cust_1790855137862@example.com','0927367909','khach_hang','hoat_dong',NULL,'2026-10-01 18:45:38','2026-10-01 18:45:37','2026-10-01 18:45:38'),(46,'cust_1790855149435','$2a$10$6iWVwBrAAi2p2B6XxHpEqO9Q78e1jsgW9evG/p54z8FwNMzsiQfRy','cust_1790855149435@example.com','0950568481','khach_hang','hoat_dong',NULL,'2026-10-01 18:45:49','2026-10-01 18:45:49','2026-10-01 18:45:49'),(47,'DaoVu','$2a$10$E1DxAX7uAvPWrfoUqN0AKebtSYMdqbhcd8GRt8LfnxBfztPOdzSDW',NULL,'0986878986','khach_hang','hoat_dong',NULL,'2026-10-01 21:15:43','2026-10-01 19:16:59','2026-10-01 21:15:43'),(50,'cust_1790857235119','$2a$10$J96mk8QZY75Vtz0nxHposuiEedkHbFj2cyqBj.yOtujIBfITkLT9W','cust_1790857235119@example.com','0987260931','khach_hang','hoat_dong',NULL,'2026-10-01 19:20:35','2026-10-01 19:20:35','2026-10-01 19:20:35'),(51,'hieu2','$2a$10$4W.knBqEcDGWr/AMOM.HOOdqSE8vDOlKESe6UigKeT3jN0UwKwhfW',NULL,'0878898699','nhan_vien','hoat_dong',NULL,NULL,'2026-10-01 20:54:12','2026-10-01 21:00:52'),(52,'anngoo1','$2a$10$c8YvZCr15vSR7T.dgx29UOBFXaJZvks99HxhjeSeCgVCx3VzV7toi',NULL,'0899765890','nhan_vien','hoat_dong',NULL,NULL,'2026-10-01 21:27:37','2026-10-01 21:27:54');
/*!40000 ALTER TABLE `tai_khoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thanh_toan`
--

DROP TABLE IF EXISTS `thanh_toan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thanh_toan` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `hoa_don_id` bigint unsigned NOT NULL,
  `phuong_thuc` enum('vietqr','momo','zalopay','vnpay','cod') COLLATE utf8mb4_unicode_ci NOT NULL,
  `ma_giao_dich_cong` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `so_tien` decimal(12,2) NOT NULL,
  `trang_thai` enum('cho_thanh_toan','da_thanh_toan','thanh_cong','that_bai','da_hoan_tien') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cho_thanh_toan',
  `thoi_gian_thanh_toan` datetime DEFAULT NULL,
  `du_lieu_webhook` json DEFAULT NULL COMMENT 'Luu raw webhook tu ngan hang',
  `ngay_tao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `don_hang_id` (`hoa_don_id`),
  UNIQUE KEY `hoa_don_id` (`hoa_don_id`),
  KEY `idx_thanhtoan_trangthai` (`trang_thai`),
  CONSTRAINT `fk_thanhtoan_hoadon` FOREIGN KEY (`hoa_don_id`) REFERENCES `hoa_don` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thanh_toan`
--

LOCK TABLES `thanh_toan` WRITE;
/*!40000 ALTER TABLE `thanh_toan` DISABLE KEYS */;
INSERT INTO `thanh_toan` VALUES (5,5,'vietqr',NULL,56000.00,'da_thanh_toan',NULL,NULL,'2026-09-14 06:41:39'),(6,6,'cod',NULL,48000.00,'da_thanh_toan',NULL,NULL,'2026-09-14 06:53:33'),(7,7,'cod',NULL,115000.00,'da_thanh_toan',NULL,NULL,'2026-09-14 10:31:24'),(13,14,'cod',NULL,40000.00,'da_thanh_toan',NULL,NULL,'2026-09-18 11:26:51'),(26,27,'cod',NULL,55000.00,'cho_thanh_toan',NULL,NULL,'2026-10-01 18:45:37'),(28,29,'cod',NULL,55000.00,'cho_thanh_toan',NULL,NULL,'2026-10-01 18:45:49'),(32,33,'cod',NULL,40000.00,'cho_thanh_toan',NULL,NULL,'2026-10-01 21:11:38'),(33,34,'cod',NULL,102000.00,'cho_thanh_toan',NULL,NULL,'2026-10-01 21:12:31'),(34,35,'cod',NULL,40000.00,'cho_thanh_toan',NULL,NULL,'2026-10-01 21:12:56'),(35,36,'cod',NULL,56000.00,'da_thanh_toan',NULL,NULL,'2026-10-01 21:25:14');
/*!40000 ALTER TABLE `thanh_toan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topping`
--

DROP TABLE IF EXISTS `topping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topping` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ma_topping` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ten_topping` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gia_them` decimal(12,2) NOT NULL DEFAULT '0.00',
  `trang_thai` tinyint(1) NOT NULL DEFAULT '1',
  `ngay_tao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ma_topping` (`ma_topping`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topping`
--

LOCK TABLES `topping` WRITE;
/*!40000 ALTER TABLE `topping` DISABLE KEYS */;
INSERT INTO `topping` VALUES (1,'top-1','Mochi Kéo Dài (Signature Đô Đô)',6000.00,1,'2026-09-07 23:32:57'),(2,'top-2','Mochi Nếp Lạnh Dẻo',6000.00,1,'2026-09-07 23:32:57'),(3,'top-3','Kem Tiramisu Phô Mai',8000.00,1,'2026-09-07 23:32:57'),(4,'top-4','Vụn Bánh Cookies Ovaltine',5000.00,1,'2026-09-07 23:32:57'),(5,'top-5','Trân Châu Hoàng Kim',5000.00,1,'2026-09-07 23:32:57'),(6,'top-6','Pudding Trứng Mịn Dẻo',6000.00,1,'2026-09-07 23:32:57'),(7,'top-7','Thạch Đào Giòn',5000.00,1,'2026-09-07 23:32:57'),(8,'top-8','Kem Cheese Macchiato',8000.00,1,'2026-09-07 23:32:57');
/*!40000 ALTER TABLE `topping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vouchers`
--

DROP TABLE IF EXISTS `vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vouchers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ma_voucher` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loai_giam` enum('phan_tram','tien_mat') COLLATE utf8mb4_unicode_ci NOT NULL,
  `gia_tri_giam` decimal(12,2) NOT NULL,
  `giam_toi_da` decimal(12,2) DEFAULT NULL,
  `don_hang_toi_thieu` decimal(12,2) NOT NULL DEFAULT '0.00',
  `so_luong_phat_hanh` int unsigned NOT NULL DEFAULT '1000',
  `so_luong_da_dung` int unsigned NOT NULL DEFAULT '0',
  `ngay_bat_dau` datetime NOT NULL,
  `ngay_ket_thuc` datetime NOT NULL,
  `mo_ta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trang_thai` tinyint(1) NOT NULL DEFAULT '1',
  `ngay_tao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ma_voucher` (`ma_voucher`),
  KEY `idx_voucher_code` (`ma_voucher`),
  KEY `idx_voucher_hsd` (`ngay_bat_dau`,`ngay_ket_thuc`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vouchers`
--

LOCK TABLES `vouchers` WRITE;
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
INSERT INTO `vouchers` VALUES (1,'BANMOI10','phan_tram',10.00,20000.00,50000.00,1000,142,'2026-01-01 00:00:00','2026-12-31 23:59:59','Giảm 10% cho bạn mới',1,'2026-09-07 23:32:57'),(2,'FREESHIP','tien_mat',15000.00,NULL,80000.00,2000,560,'2026-01-01 00:00:00','2026-12-31 23:59:59','Miễn phí vận chuyển 15k',1,'2026-09-07 23:32:57'),(3,'TRAXANH20','tien_mat',20000.00,NULL,100000.00,500,89,'2026-01-01 00:00:00','2026-12-31 23:59:59','Giảm ngay 20.000đ cho đơn từ 100k',1,'2026-09-07 23:32:57');
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `chi_tiet_don_hang`
--

/*!50001 DROP VIEW IF EXISTS `chi_tiet_don_hang`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `chi_tiet_don_hang` AS select `chi_tiet_hoa_don`.`id` AS `id`,`chi_tiet_hoa_don`.`hoa_don_id` AS `hoa_don_id`,`chi_tiet_hoa_don`.`san_pham_id` AS `san_pham_id`,`chi_tiet_hoa_don`.`ten_san_pham` AS `ten_san_pham`,`chi_tiet_hoa_don`.`kich_thuoc` AS `kich_thuoc`,`chi_tiet_hoa_don`.`muc_duong` AS `muc_duong`,`chi_tiet_hoa_don`.`muc_da` AS `muc_da`,`chi_tiet_hoa_don`.`danh_sach_topping` AS `danh_sach_topping`,`chi_tiet_hoa_don`.`don_gia` AS `don_gia`,`chi_tiet_hoa_don`.`so_luong` AS `so_luong`,`chi_tiet_hoa_don`.`thanh_tien` AS `thanh_tien`,`chi_tiet_hoa_don`.`hoa_don_id` AS `don_hang_id` from `chi_tiet_hoa_don` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `don_hang`
--

/*!50001 DROP VIEW IF EXISTS `don_hang`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `don_hang` AS select `hoa_don`.`id` AS `id`,`hoa_don`.`ma_don_hang` AS `ma_don_hang`,`hoa_don`.`khach_hang_id` AS `khach_hang_id`,`hoa_don`.`ten_nguoi_nhan` AS `ten_nguoi_nhan`,`hoa_don`.`sdt_nguoi_nhan` AS `sdt_nguoi_nhan`,`hoa_don`.`dia_chi_giao_hang` AS `dia_chi_giao_hang`,`hoa_don`.`ghi_chu` AS `ghi_chu`,`hoa_don`.`voucher_id` AS `voucher_id`,`hoa_don`.`nhan_vien_id` AS `nhan_vien_id`,`hoa_don`.`tong_tien_mon` AS `tong_tien_mon`,`hoa_don`.`phi_van_chuyen` AS `phi_van_chuyen`,`hoa_don`.`so_tien_giam_gia` AS `so_tien_giam_gia`,`hoa_don`.`tong_thanh_toan` AS `tong_thanh_toan`,`hoa_don`.`trang_thai_don_hang` AS `trang_thai_don_hang`,`hoa_don`.`ngay_dat` AS `ngay_dat`,`hoa_don`.`ngay_cap_nhat` AS `ngay_cap_nhat`,`hoa_don`.`ma_hoa_don` AS `ma_hoa_don` from `hoa_don` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-01 21:33:06

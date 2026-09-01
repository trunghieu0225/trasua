-- ============================================================================
-- TEAJOY STORE - SAMPLE SEED DATA FOR MYSQL 8.0
-- DỮ LIỆU MẪU BAN ĐẦU CHO 11 THỰC THỂ
-- ============================================================================

USE `teajoy_store`;

-- 1. SEED TAI_KHOAN (Mật khẩu mặc định demo: '1', '123', hoặc '123456')
INSERT INTO `TAI_KHOAN` (`id`, `ten_dang_nhap`, `mat_khau_hash`, `email`, `so_dien_thoai`, `vai_tro`, `trang_thai`) VALUES
(1, 'admin', '123456', 'admin@dodo.vn', '0901234567', 'admin', 'hoat_dong'),
(2, 'thungan', '123456', 'thungan@dodo.vn', '0912345678', 'nhan_vien', 'hoat_dong'),
(3, 'phache', '123456', 'phache@dodo.vn', '0933445566', 'nhan_vien', 'hoat_dong');

-- 2. SEED NHAN_VIEN
INSERT INTO `NHAN_VIEN` (`id`, `tai_khoan_id`, `ma_nhan_vien`, `ho_ten`, `chuc_vu`, `cccd`, `ngay_sinh`, `gioi_tinh`, `luong_co_ban`, `ngay_vao_lam`, `trang_thai_lam_viec`) VALUES
(1, 1, 'NV-001', 'Đỗ Trung Hiếu (Quản Lý)', 'Quản Lý Cửa Hàng', '079090001122', '1992-05-15', 'nam', 15000000.00, '2026-01-01', 'dang_lam'),
(2, 2, 'NV-002', 'Nguyễn Văn Thu Ngân', 'Thu Ngân & Bán Hàng', '079195003344', '1998-08-20', 'nam', 7500000.00, '2026-02-15', 'dang_lam'),
(3, 3, 'NV-003', 'Trần Thị Pha Chế', 'Nhân Viên Pha Chế', '079195005566', '2000-01-10', 'nu', 8000000.00, '2026-03-01', 'dang_lam');

-- 3. SEED KHACH_HANG (Ban đầu rỗng - Khách hàng sẽ tự đăng ký tài khoản qua Pop-up Đăng ký)
-- (Không chèn dữ liệu khách hàng mẫu để giữ database sạch)

-- 4. SEED NHA_CUNG_CAP
INSERT INTO `NHA_CUNG_CAP` (`id`, `ma_ncc`, `ten_nha_cung_cap`, `nguoi_dai_dien`, `so_dien_thoai`, `email`, `dia_chi`, `danh_muc_nguyen_lieu`, `trang_thai`) VALUES
(1, 'SUP-01', 'Công ty Trà Cao Cương Lâm Đồng', 'Anh Cương', '0908889900', 'cuongtra@lamdong.vn', 'Bảo Lộc, Lâm Đồng', 'Lá trà Ô long nướng, Trà đen Assam, Lục trà nhài', 'dang_hop_tac'),
(2, 'SUP-02', 'Sữa Tươi Thanh Trùng DalatMilk', 'Chị Hạnh', '0903332211', 'hanh@dalatmilk.vn', 'Đà Lạt, Lâm Đồng', 'Sữa tươi thanh trùng, Kem béo, Bơ phô mai', 'dang_hop_tac'),
(3, 'SUP-03', 'Nhà cung cấp Topping & Bao bì Tân Phú', 'Anh Thắng', '0977112233', 'thang@tanphupack.vn', 'Tân Phú, TP.HCM', 'Trân châu hoàng kim, Cốc giấy, Ống hút sinh học', 'dang_hop_tac');

-- 5. SEED SAN_PHAM
INSERT INTO `SAN_PHAM` (`id`, `ma_sku`, `nha_cung_cap_id`, `danh_muc`, `ten_san_pham`, `mo_ta`, `gia_goc`, `gia_khuyen_mai`, `hinh_anh_url`, `so_luong_ton`, `da_ban`, `danh_gia_tb`, `trang_thai`) VALUES
(1, 'TS-01', 1, 'tra-sua', 'Trà Sữa Trân Châu Hoàng Kim', 'Vị trà đen đậm đà quyện cùng sữa tươi béo ngậy và trân châu hoàng kim nấu đường nâu thơm phức dẻo bùi.', 35000.00, 42000.00, 'https://images.unsplash.com/photo-1558857563-b37fcdd72460?auto=format&fit=crop&w=600&q=80', 85, 1420, 4.9, TRUE),
(2, 'TS-02', 1, 'tra-sua', 'Trà Sữa Oolong Nướng Kem Cheese', 'Trà Oolong nướng than đượm hương khói hòa quyện lớp kem mặn phô mai New Zealand béo bùi khó cưỡng.', 45000.00, 50000.00, 'https://images.unsplash.com/photo-1576092768241-dec231879fc3?auto=format&fit=crop&w=600&q=80', 64, 980, 5.0, TRUE),
(3, 'TS-03', 1, 'tra-sua', 'Trà Sữa Matcha Kyoto Phô Mai', 'Bột trà xanh Matcha nguyên chất nhập khẩu Nhật Bản kết hợp cùng sữa tươi thanh trùng và thạch phô mai.', 42000.00, 48000.00, 'https://images.unsplash.com/photo-1536256263959-770b48d82b0a?auto=format&fit=crop&w=600&q=80', 45, 760, 4.8, TRUE),
(4, 'TC-01', 1, 'tra-trai-cay', 'Trà Đào Cam Sả Tươi Mát', 'Nước cốt đào thơm thanh phối hợp cùng vị chua ngọt từ cam vàng tươi và hương sả nồng nàn giải nhiệt tức thì.', 38000.00, 45000.00, 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?auto=format&fit=crop&w=600&q=80', 90, 1150, 4.9, TRUE),
(5, 'CP-01', 1, 'ca-phe', 'Cà Phê Muối Kem Béo Xứ Huế', 'Cà phê phin truyền thống hòa quyện cùng lớp kem muối béo mặn mòi đặc sản xứ Huế trứ danh.', 32000.00, 38000.00, 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?auto=format&fit=crop&w=600&q=80', 100, 1300, 4.9, TRUE);

-- 5.1 SEED TOPPING
INSERT INTO `TOPPING` (`id`, `ma_topping`, `ten_topping`, `gia_them`, `trang_thai`) VALUES
(1, 'top-1', 'Trân Châu Hoàng Kim', 6000.00, TRUE),
(2, 'top-2', 'Trân Châu Đen Dẻo', 5000.00, TRUE),
(3, 'top-3', 'Thạch Phô Mai Tươi', 10000.00, TRUE),
(4, 'top-4', 'Pudding Trứng Mịn', 8000.00, TRUE),
(5, 'top-5', 'Kem Cheese Macchiato', 12000.00, TRUE),
(6, 'top-6', 'Thạch Củ Năng Giòn', 7000.00, TRUE),
(7, 'top-7', 'Thạch Dừa Giòn', 5000.00, TRUE),
(8, 'top-8', 'Đào Miếng Ngâm', 8000.00, TRUE);

-- 6. SEED VOUCHERS
INSERT INTO `VOUCHERS` (`id`, `ma_voucher`, `loai_giam`, `gia_tri_giam`, `giam_toi_da`, `don_hang_toi_thieu`, `so_luong_phat_hanh`, `so_luong_da_dung`, `ngay_bat_dau`, `ngay_ket_thuc`, `mo_ta`, `trang_thai`) VALUES
(1, 'BANMOI10', 'phan_tram', 10.00, 20000.00, 50000.00, 1000, 142, '2026-01-01 00:00:00', '2026-12-31 23:59:59', 'Giảm 10% cho bạn mới', TRUE),
(2, 'FREESHIP', 'tien_mat', 15000.00, NULL, 80000.00, 2000, 560, '2026-01-01 00:00:00', '2026-12-31 23:59:59', 'Miễn phí vận chuyển 15k', TRUE),
(3, 'TRAXANH20', 'tien_mat', 20000.00, NULL, 100000.00, 500, 89, '2026-01-01 00:00:00', '2026-12-31 23:59:59', 'Giảm ngay 20.000đ cho đơn từ 100k', TRUE);

-- 7. SEED DON_HANG (Ban đầu rỗng - Khách hàng sẽ đặt hàng trên web)
-- 8. SEED CHI_TIET_DON_HANG (Ban đầu rỗng)
-- 9. SEED THANH_TOAN (Ban đầu rỗng)

-- 10. SEED BAI_VIET
INSERT INTO `BAI_VIET` (`id`, `tac_gia_id`, `tieu_de`, `slug`, `loai_bai_viet`, `anh_dai_dien`, `tom_tat`, `noi_dung`, `trang_thai`) VALUES
(1, 1, 'Bí Quyết Chọn Lá Trà Ô Long Chuẩn Vị Tại Bảo Lộc', 'bi-quyet-chon-la-tra-o-long', 'tin_tuc', 'https://images.unsplash.com/photo-1558857563-b37fcdd72460?auto=format&fit=crop&w=1200&q=80', 'Khám phá quy trình thu hái búp trà 1 tôm 2 lá...', '<p>Chi tiết bài viết giới thiệu về nguồn gốc lá trà tự nhiên...</p>', 'xuat_ban');

-- 11. SEED REVIEWS (Ban đầu rỗng - Khách hàng sẽ đánh giá sau khi mua hàng)
-- (Không chèn dữ liệu đánh giá mẫu để tránh lỗi khóa ngoại)

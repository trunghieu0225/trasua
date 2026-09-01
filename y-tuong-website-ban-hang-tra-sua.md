# Đặc tả ý tưởng Website bán hàng trà sữa

## 1. Tổng quan

Xây dựng website bán hàng trà sữa cho phép **Quản lý – Nhân viên** quản lý hoạt động kinh doanh và cho phép **Khách hàng** xem sản phẩm, mua hàng, thanh toán và tương tác với cửa hàng.

### Công nghệ sử dụng

- **HTML5**: Xây dựng cấu trúc giao diện.
- **CSS3**: Thiết kế giao diện, bố cục và responsive.
- **JavaScript**: Xử lý tương tác, dữ liệu phía client, giỏ hàng, đặt hàng, kiểm tra biểu mẫu và các chức năng động.
- **Định hướng**: Có thể phát triển frontend thuần HTML/CSS/JavaScript trước, sau đó tích hợp backend/API khi cần.

---

# 2. Phân quyền người dùng

Hệ thống gồm 3 nhóm quyền chính:

### 2.1. Quản lý

Quản lý có quyền cao nhất trong hệ thống:

- Quản lý tài khoản.
- Quản lý nhân viên.
- Quản lý sản phẩm.
- Quản lý khách hàng.
- Quản lý đơn hàng.
- Quản lý truyền thông.
- Quản lý nhà cung cấp.
- Xem báo cáo, thống kê.

### 2.2. Nhân viên

Nhân viên thực hiện các nghiệp vụ bán hàng và chăm sóc khách hàng:

- Xem và cập nhật sản phẩm theo quyền được cấp.
- Quản lý khách hàng.
- Tiếp nhận và xử lý đơn hàng.
- Cập nhật trạng thái đơn hàng.
- Theo dõi phản hồi, bình luận, đánh giá và khiếu nại.
- Xem các báo cáo được phân quyền.

### 2.3. Khách hàng

Khách hàng có thể:

- Đăng ký, đăng nhập tài khoản.
- Xem sản phẩm.
- Tìm kiếm và lọc sản phẩm.
- Quản lý giỏ hàng.
- Đặt hàng.
- Thanh toán.
- Theo dõi đơn hàng.
- Bình luận và đánh giá sản phẩm.
- Gửi khiếu nại/phản hồi.

---

# 3. Chức năng dành cho Quản lý – Nhân viên

## 3.1. Quản lý tài khoản

### Mục tiêu

Cho phép quản lý tài khoản đăng nhập và phân quyền người dùng trong hệ thống.

### Chức năng

- Đăng nhập.
- Đăng xuất.
- Đổi mật khẩu.
- Cập nhật thông tin tài khoản.
- Quản lý trạng thái tài khoản.
- Phân quyền tài khoản.
- Khóa/mở khóa tài khoản.
- Tìm kiếm tài khoản.

### Thông tin tài khoản

- Mã tài khoản.
- Tên đăng nhập.
- Mật khẩu.
- Họ tên.
- Email.
- Số điện thoại.
- Vai trò.
- Trạng thái.
- Ngày tạo.

---

## 3.2. Quản lý nhân viên

### Chức năng

- Thêm nhân viên.
- Sửa thông tin nhân viên.
- Xóa nhân viên.
- Tìm kiếm nhân viên.
- Xem chi tiết nhân viên.
- Quản lý trạng thái làm việc.
- Phân quyền nhân viên.

### Thông tin nhân viên

- Mã nhân viên.
- Họ tên.
- Ngày sinh.
- Giới tính.
- Số điện thoại.
- Email.
- Địa chỉ.
- Chức vụ.
- Ngày vào làm.
- Trạng thái.

---

## 3.3. Quản lý sản phẩm

Đây là chức năng trung tâm của website bán trà sữa.

### Chức năng

- Thêm sản phẩm.
- Sửa sản phẩm.
- Xóa sản phẩm.
- Xem chi tiết sản phẩm.
- Tìm kiếm sản phẩm.
- Lọc theo danh mục.
- Quản lý giá bán.
- Quản lý hình ảnh.
- Quản lý trạng thái còn/hết hàng.
- Quản lý topping.
- Quản lý kích thước.
- Quản lý danh mục sản phẩm.

### Thông tin sản phẩm

- Mã sản phẩm.
- Tên sản phẩm.
- Danh mục.
- Hình ảnh.
- Mô tả.
- Giá bán.
- Kích thước.
- Topping.
- Trạng thái.
- Số lượng tồn kho.

### Ví dụ danh mục

- Trà sữa.
- Trà trái cây.
- Cà phê.
- Đá xay.
- Topping.
- Combo.

---

## 3.4. Quản lý khách hàng

### Chức năng

- Xem danh sách khách hàng.
- Tìm kiếm khách hàng.
- Xem thông tin khách hàng.
- Cập nhật thông tin.
- Khóa/mở khóa tài khoản khách hàng.
- Xem lịch sử mua hàng.
- Xem tổng số đơn hàng.
- Xem tổng tiền đã mua.
- Quản lý điểm/tích lũy nếu hệ thống có chương trình thành viên.

### Thông tin khách hàng

- Mã khách hàng.
- Họ tên.
- Email.
- Số điện thoại.
- Địa chỉ.
- Ngày đăng ký.
- Số đơn hàng.
- Tổng chi tiêu.
- Trạng thái.

---

## 3.5. Quản lý đơn hàng

### Chức năng

- Xem danh sách đơn hàng.
- Tìm kiếm đơn hàng.
- Xem chi tiết đơn hàng.
- Xác nhận đơn hàng.
- Cập nhật trạng thái đơn hàng.
- Hủy đơn hàng.
- Xem thông tin thanh toán.
- In/xuất hóa đơn.
- Theo dõi lịch sử xử lý đơn hàng.

### Trạng thái đơn hàng

```text
Chờ xác nhận
      ↓
Đã xác nhận
      ↓
Đang chuẩn bị
      ↓
Đang giao
      ↓
Đã giao
```

Ngoài ra:

```text
Chờ xác nhận → Đã hủy
```

### Thông tin đơn hàng

- Mã đơn hàng.
- Khách hàng.
- Danh sách sản phẩm.
- Số lượng.
- Đơn giá.
- Topping.
- Kích thước.
- Thành tiền.
- Phí giao hàng.
- Giảm giá.
- Tổng tiền.
- Phương thức thanh toán.
- Trạng thái thanh toán.
- Trạng thái đơn hàng.
- Thời gian đặt hàng.
- Địa chỉ giao hàng.

---

# 4. Quản lý truyền thông

Chức năng này dùng để quản lý nội dung hiển thị trên website.

### Chức năng

- Quản lý banner.
- Quản lý bài viết.
- Quản lý tin tức.
- Quản lý chương trình khuyến mãi.
- Quản lý thông báo.
- Thêm/sửa/xóa nội dung.
- Thiết lập trạng thái hiển thị.
- Quản lý thời gian hiển thị.

### Ví dụ

- Banner "Mua 2 tặng 1".
- Bài viết giới thiệu sản phẩm mới.
- Chương trình giảm giá.
- Thông báo cửa hàng.

---

# 5. Quản lý nhà cung cấp

### Chức năng

- Thêm nhà cung cấp.
- Sửa thông tin.
- Xóa nhà cung cấp.
- Tìm kiếm nhà cung cấp.
- Xem chi tiết nhà cung cấp.
- Quản lý nguyên liệu nhập.
- Theo dõi lịch sử nhập hàng.

### Thông tin nhà cung cấp

- Mã nhà cung cấp.
- Tên nhà cung cấp.
- Người liên hệ.
- Số điện thoại.
- Email.
- Địa chỉ.
- Sản phẩm/nguyên liệu cung cấp.
- Trạng thái.

---

# 6. Báo cáo và thống kê

Dashboard dành cho quản lý.

### Thống kê tổng quan

- Doanh thu hôm nay.
- Doanh thu theo ngày/tháng/năm.
- Tổng số đơn hàng.
- Số đơn đang xử lý.
- Số đơn hoàn thành.
- Số đơn bị hủy.
- Tổng số khách hàng.
- Tổng số sản phẩm.

### Thống kê nâng cao

- Doanh thu theo thời gian.
- Sản phẩm bán chạy.
- Danh mục bán chạy.
- Khách hàng mua nhiều nhất.
- Số lượng đơn hàng theo trạng thái.
- Doanh thu theo phương thức thanh toán.

### Biểu đồ đề xuất

- Biểu đồ đường: Doanh thu theo thời gian.
- Biểu đồ cột: Sản phẩm bán chạy.
- Biểu đồ tròn: Tỷ lệ trạng thái đơn hàng.

---

# 7. Chức năng dành cho Khách hàng

## 7.1. Trang chủ

Trang chủ cần có:

- Logo cửa hàng.
- Menu điều hướng.
- Thanh tìm kiếm.
- Banner quảng cáo.
- Danh mục sản phẩm.
- Sản phẩm nổi bật.
- Sản phẩm bán chạy.
- Chương trình khuyến mãi.
- Footer.

---

## 7.2. Xem sản phẩm

Khách hàng có thể:

- Xem danh sách sản phẩm.
- Xem chi tiết sản phẩm.
- Tìm kiếm sản phẩm.
- Lọc theo danh mục.
- Sắp xếp theo giá.
- Xem sản phẩm nổi bật.
- Xem đánh giá sản phẩm.

### Chi tiết sản phẩm

Hiển thị:

- Hình ảnh.
- Tên sản phẩm.
- Giá.
- Mô tả.
- Kích thước.
- Topping.
- Đánh giá.
- Số lượng đã bán.
- Nút "Thêm vào giỏ hàng".

---

# 8. Quản lý giỏ hàng

### Chức năng

- Thêm sản phẩm.
- Xóa sản phẩm.
- Tăng/giảm số lượng.
- Chọn kích thước.
- Chọn topping.
- Thêm ghi chú.
- Tính tạm tính.
- Áp dụng mã giảm giá.
- Tính tổng tiền.

### Công thức

```text
Thành tiền =
(Giá sản phẩm + Giá kích thước + Giá topping)
× Số lượng
```

```text
Tổng thanh toán =
Tổng tiền sản phẩm
+ Phí giao hàng
- Giảm giá
```

---

# 9. Đặt hàng

Quy trình đặt hàng:

```text
Giỏ hàng
   ↓
Kiểm tra sản phẩm
   ↓
Nhập thông tin giao hàng
   ↓
Chọn phương thức thanh toán
   ↓
Xác nhận đơn hàng
   ↓
Đặt hàng thành công
```

### Thông tin giao hàng

- Họ tên người nhận.
- Số điện thoại.
- Địa chỉ.
- Ghi chú.
- Phương thức nhận hàng.

---

# 10. Thanh toán

Website có thể thiết kế nhiều phương thức thanh toán:

- Thanh toán khi nhận hàng (COD).
- Thanh toán trực tuyến.
- Ví điện tử hoặc cổng thanh toán khi tích hợp backend/API.

> Với phiên bản HTML/CSS/JavaScript frontend, có thể xây dựng giao diện và mô phỏng trạng thái thanh toán trước. Việc thanh toán thật cần backend và cổng thanh toán có cơ chế xác thực an toàn.

---

# 11. Tương tác khách hàng

## 11.1. Bình luận

Khách hàng có thể:

- Viết bình luận.
- Xem bình luận.
- Sửa bình luận của mình.
- Xóa bình luận của mình.

## 11.2. Đánh giá

Khách hàng có thể:

- Đánh giá sản phẩm bằng số sao.
- Viết nhận xét.
- Xem đánh giá của khách hàng khác.

Có thể sử dụng thang điểm:

```text
★ 1 sao
★★ 2 sao
★★★ 3 sao
★★★★ 4 sao
★★★★★ 5 sao
```

## 11.3. Khiếu nại

Khách hàng có thể gửi:

- Mã đơn hàng.
- Nội dung khiếu nại.
- Hình ảnh minh chứng nếu cần.
- Thời gian gửi.
- Trạng thái xử lý.

### Trạng thái khiếu nại

```text
Mới gửi
   ↓
Đang xử lý
   ↓
Đã phản hồi
   ↓
Đã hoàn tất
```

---

# 12. Các trang giao diện đề xuất

## Khu vực khách hàng

```text
/
├── Trang chủ
├── /san-pham
├── /san-pham/:id
├── /gio-hang
├── /dat-hang
├── /thanh-toan
├── /don-hang
├── /don-hang/:id
├── /dang-nhap
├── /dang-ky
├── /tai-khoan
├── /danh-gia
└── /khieu-nai
```

## Khu vực quản lý

```text
/admin
├── Dashboard
├── Quản lý tài khoản
├── Quản lý nhân viên
├── Quản lý sản phẩm
├── Quản lý khách hàng
├── Quản lý đơn hàng
├── Quản lý truyền thông
├── Quản lý nhà cung cấp
└── Báo cáo - thống kê
```

---

# 13. Thiết kế giao diện

## Phong cách

Website nên sử dụng phong cách:

- Hiện đại.
- Đơn giản.
- Thân thiện.
- Phù hợp với thương hiệu trà sữa.
- Responsive trên máy tính, tablet và điện thoại.

## Màu sắc đề xuất

Có thể sử dụng tông:

- Kem/trắng làm nền.
- Nâu hoặc hồng làm màu chủ đạo.
- Màu đậm cho chữ.
- Màu nổi bật cho nút mua hàng.

## Header

```text
[LOGO]  Trang chủ  Sản phẩm  Khuyến mãi  Liên hệ
                              🔍  🛒  👤
```

## Dashboard quản lý

```text
┌──────────────────────────────────────────────────┐
│ Logo        Dashboard              👤 Quản lý    │
├───────────────┬──────────────────────────────────┤
│ Dashboard     │  Doanh thu   Đơn hàng  Khách hàng│
│ Sản phẩm      │                                  │
│ Đơn hàng      │  [ Biểu đồ doanh thu ]           │
│ Khách hàng    │                                  │
│ Nhân viên     │  [ Sản phẩm bán chạy ]           │
│ Nhà cung cấp  │                                  │
│ Truyền thông  │                                  │
│ Báo cáo       │                                  │
└───────────────┴──────────────────────────────────┘
```

---

# 14. Cấu trúc thư mục frontend

Có thể tổ chức project HTML/CSS/JavaScript như sau:

```text
milk-tea-shop/
│
├── index.html
│
├── pages/
│   ├── products.html
│   ├── product-detail.html
│   ├── cart.html
│   ├── checkout.html
│   ├── login.html
│   ├── register.html
│   ├── orders.html
│   └── profile.html
│
├── admin/
│   ├── index.html
│   ├── accounts.html
│   ├── employees.html
│   ├── products.html
│   ├── customers.html
│   ├── orders.html
│   ├── communications.html
│   ├── suppliers.html
│   └── reports.html
│
├── css/
│   ├── style.css
│   ├── responsive.css
│   └── admin.css
│
├── js/
│   ├── main.js
│   ├── products.js
│   ├── cart.js
│   ├── checkout.js
│   ├── auth.js
│   └── admin.js
│
├── images/
│   ├── products/
│   ├── banners/
│   └── logo/
│
└── README.md
```

---

# 15. Kiến trúc phát triển

## Giai đoạn 1 – Frontend

Sử dụng:

```text
HTML5
   +
CSS3
   +
JavaScript
```

Tập trung xây dựng:

- Giao diện.
- Điều hướng.
- Hiển thị sản phẩm.
- Giỏ hàng.
- Form đặt hàng.
- Dashboard quản lý.
- Các bảng dữ liệu.
- Biểu đồ thống kê mẫu.

## Giai đoạn 2 – Dữ liệu

Có thể sử dụng dữ liệu mẫu bằng JavaScript:

```javascript
const products = [
    {
        id: 1,
        name: "Trà sữa truyền thống",
        price: 35000,
        category: "Trà sữa",
        image: "images/products/tra-sua.jpg"
    }
];
```

Giỏ hàng có thể lưu tạm bằng:

```javascript
localStorage
```

## Giai đoạn 3 – Backend

Khi muốn website hoạt động thực tế, cần bổ sung:

```text
Frontend
HTML + CSS + JavaScript
        ↓
Backend / REST API
        ↓
Database
```

Backend chịu trách nhiệm:

- Đăng nhập và xác thực.
- Quản lý tài khoản.
- Quản lý sản phẩm.
- Quản lý đơn hàng.
- Lưu khách hàng.
- Lưu đánh giá/bình luận.
- Thanh toán.
- Phân quyền.
- Báo cáo và thống kê.

---

# 16. Các đối tượng dữ liệu chính

Khi xây dựng database, có thể dự kiến các bảng:

```text
TaiKhoan
NhanVien
KhachHang
SanPham
DanhMuc
KichThuoc
Topping
DonHang
ChiTietDonHang
GioHang
ChiTietGioHang
ThanhToan
NhaCungCap
NhapHang
ChiTietNhapHang
BaiViet
Banner
KhuyenMai
BinhLuan
DanhGia
KhieuNai
```

Quan hệ cơ bản:

```text
KhachHang
    │
    └──< DonHang
             │
             └──< ChiTietDonHang >── SanPham
                                      │
                                      ├── DanhMuc
                                      ├── KichThuoc
                                      └── Topping
```

---

# 17. Yêu cầu phi chức năng

Website cần đáp ứng:

- Giao diện dễ sử dụng.
- Responsive.
- Tốc độ tải trang tốt.
- Dữ liệu hiển thị rõ ràng.
- Phân quyền người dùng.
- Kiểm tra dữ liệu nhập vào.
- Hạn chế lỗi khi thao tác.
- Có thông báo thành công/thất bại.
- Có xác nhận trước các thao tác xóa.
- Bảo vệ thông tin tài khoản khi tích hợp backend.
- Có thể mở rộng thêm tính năng trong tương lai.

---

# 18. Mục tiêu phiên bản đầu tiên

Phiên bản đầu tiên nên tập trung hoàn thiện:

1. Trang chủ.
2. Danh sách sản phẩm.
3. Chi tiết sản phẩm.
4. Tìm kiếm/lọc sản phẩm.
5. Giỏ hàng.
6. Đặt hàng.
7. Đăng nhập/đăng ký giao diện.
8. Trang quản lý Dashboard.
9. Quản lý sản phẩm.
10. Quản lý khách hàng.
11. Quản lý đơn hàng.
12. Báo cáo thống kê cơ bản.
13. Bình luận và đánh giá giao diện.

Sau khi hoàn thiện frontend, có thể tích hợp backend, database và thanh toán thực tế.

---

# 19. Kết luận

Website bán hàng trà sữa được xây dựng theo hướng **thương mại điện tử kết hợp hệ thống quản lý cửa hàng**. Hệ thống phục vụ hai nhóm người dùng chính là **Quản lý – Nhân viên** và **Khách hàng**.

Frontend sử dụng **HTML, CSS và JavaScript**, trong đó HTML xây dựng cấu trúc, CSS đảm nhiệm giao diện và JavaScript xử lý các tương tác. Thiết kế theo hướng module giúp hệ thống dễ phát triển thêm backend, database, thanh toán trực tuyến và các chức năng nâng cao trong tương lai.

# BÁO CÁO KIỂM TRA CÁC LỖI TỒN ĐỌNG DỰ ÁN TEAJOY STORE (TRÀ SỮA)

> **Ngày kiểm tra:** 01/09/2026  
> **Repository:** `https://github.com/trunghieu0225/trasua.git`  
> **Trạng thái:** Đã kiểm tra toàn bộ mã nguồn. **Chưa sửa code**, chờ ý kiến duyệt từ bạn.

---

## 📑 BẢNG TỔNG HỢP CÁC LỖI TỒN ĐỌNG

| STT | Phân Loại | Tên Lỗi / Vấn Đề | Mức Độ | Tệp Tin Liên Quan |
|-----|-----------|------------------|--------|-------------------|
| 1 | **Runtime JS Error** | Thiếu hàm `ProductMgmt.openAddToppingModal()` khi bấm nút Thêm Topping | 🔴 Nghiêm trọng | `admin/products.html`, `js/admin/product-mgmt.js` |
| 2 | **HTML Missing** | Thiếu Markup Modal để nhập thông tin Topping mới | 🟠 Cao | `admin/products.html` |
| 3 | **Mobile Sidebar Bug** | Nút mở Menu Sidebar Admin bị ẩn hoàn toàn trên giao diện Mobile | 🔴 Nghiêm trọng | `admin/index.html`, `css/admin.css` |
| 4 | **Access Control** | Trang Admin không chặn truy cập trực tiếp khi chưa đăng nhập | 🔴 Nghiêm trọng | `js/admin/dashboard.js`, các trang `admin/*.html` |
| 5 | **Logic / Payment** | Mã VietQR tự phát sinh sai chuẩn EMVCo/VietQR (App Ngân hàng từ chối quét) | 🟠 Cao | `js/checkout.js` |
| 6 | **Logic / Voucher** | Không xóa Voucher đã áp dụng khi người dùng nhập sai mã mới | 🟡 Trung bình | `js/checkout.js`, `cart.html` |
| 7 | **Logic / Inventory** | Không kiểm tra tồn kho (`stockQty`) khi tùy biến ly trà sữa | 🟡 Trung bình | `js/client.js`, `js/cart.js` |
| 8 | **Date Format Bug** | Lỗi hiển thị ngày tháng `Invalid Date` trên trình duyệt Safari/WebKit cũ | 🟡 Trung bình | `js/utils/formatters.js` |
| 9 | **DB Mismatch** | Schema SQL (`schema.sql`) lệch chuẩn tên cột & cấu trúc với LocalStorage (`mock-data.js`) | 🟠 Cao | `database/schema.sql`, `js/db/mock-data.js` |
| 10 | **UI / Minigame** | Vòng quay may mắn cho phép quay vô hạn không giới hạn lượt/ngày | 🟢 Thấp | `js/client.js` |
| 11 | **Security** | Mật khẩu tài khoản lưu dạng chuỗi thô (Plain Text) | 🟠 Cao | `js/db/mock-data.js`, `database/schema.sql` |
| 12 | **Order Sync** | Trạng thái thanh toán của đơn VietQR bị hủy vẫn giữ là `paid` | 🟡 Trung bình | `js/tracking.js`, `js/db/storage.js` |

---

## 🔍 CHI TIẾT CÁC LỖI TỒN ĐỌNG & HƯỚNG XỬ LÝ ĐỀ XUẤT

### 🔴 1. Lỗi Runtime JavaScript: Thiếu hàm `openAddToppingModal`
- **Mô tả hiện trạng**: Tại trang Quản lý sản phẩm & Topping (`admin/products.html`), khi chuyển sang tab "✨ Quản Lý Topping" và bấm nút **"+ Thêm Topping"**, trình duyệt báo lỗi Javascript:
  `Uncaught TypeError: ProductMgmt.openAddToppingModal is not a function`
- **Nguyên nhân**: Thẻ `<button onclick="ProductMgmt.openAddToppingModal()">` gọi hàm này nhưng trong tệp `js/admin/product-mgmt.js` đối tượng `ProductMgmt` chưa hề định nghĩa hàm `openAddToppingModal`.
- **Đề xuất khắc phục**: Bổ sung hàm `openAddToppingModal()` và `saveToppingSubmit()` vào `js/admin/product-mgmt.js`.

---

### 🔴 2. Thiếu Markup Modal Thêm Topping trong HTML
- **Mô tả hiện trạng**: Tệp `admin/products.html` mới chỉ có modal `#product-form-modal` (dùng để sửa/thêm sản phẩm trà sữa), chưa có HTML Modal dành riêng cho việc nhập tên Topping, giá topping và trạng thái phục vụ.
- **Đề xuất khắc phục**: Thêm HTML `<div id="topping-form-modal" class="modal-backdrop">` vào `admin/products.html`.

---

### 🔴 3. Nút Toggle Menu Sidebar Admin bị ẩn trên Mobile
- **Mô tả hiện trạng**: 
  - Trong `admin/index.html` dòng 75: `<button id="sidebar-toggle-btn" style="display: none;">☰</button>`.
  - Trong tệp `css/admin.css`, ở quy tắc responsive `@media (max-width: 992px)`, Sidebar được ẩn đi (`transform: translateX(-100%)`) nhưng lại **không hiển thị** nút `#sidebar-toggle-btn`.
- **Hậu quả**: Khi quản trị viên dùng điện thoại hoặc máy tính bảng truy cập trang Admin, menu bên trái bị mất và không thể bấm vào đâu để mở menu ra.
- **Đề xuất khắc phục**: Thêm CSS trong `@media (max-width: 992px)`:
  ```css
  #sidebar-toggle-btn {
    display: flex !important;
  }
  ```

---

### 🔴 4. Hổng Bảo Mật Phân Quyền (Access Control / Authorization)
- **Mô tả hiện trạng**: Các trang Admin (`admin/index.html`, `admin/orders.html`, `admin/products.html`, v.v.) hiện tại chỉ kiểm tra quyền bằng hàm `checkAuth()` trong `dashboard.js`. Nếu người dùng chưa đăng nhập hoặc là tài khoản Khách Hàng, hệ thống chỉ hiển thị tên mặc định "Nguyễn Văn Quản Lý (Demo)" chứ **không tự động chuyển hướng (Redirect)** về trang đăng nhập `auth.html`.
- **Hậu quả**: Khách hàng thông thường chỉ cần gõ đường dẫn `/admin/index.html` là có thể xem toàn bộ doanh thu, danh sách đơn hàng, xóa sản phẩm của cửa hàng.
- **Đề xuất khắc phục**: Bổ sung đoạn mã kiểm tra quyền nghiêm ngặt ngay khi tải trang:
  ```javascript
  if (!Auth.isStaff()) {
    window.location.href = "../auth.html";
  }
  ```

---

### 🟠 5. Mã VietQR Thanh Toán Tự Phát Sinh Sai Chuẩn EMVCo / VietQR
- **Mô tả hiện trạng**: Tệp `js/checkout.js` tạo mã QR bằng chuỗi:
  `2|99|0901234567|TEAJOY|admin@teajoy.vn|0|0|159000|THANHTOAN TEAJOY|transfer_myqr` và gửi sang API `qrserver.com`.
- **Hậu quả**: Chuỗi này không đúng chuẩn VietQR (NAPAS 247). Khi khách hàng dùng ứng dụng ngân hàng thực tế (Momo, Vietcombank, MB Bank, Techcombank, VPBank...) để quét mã QR này, ứng dụng ngân hàng sẽ báo "Mã QR không hợp lệ" và không thể thực hiện chuyển tiền.
- **Đề xuất khắc phục**: Sử dụng chuẩn QuickLink VietQR của VietQR.io (Ví dụ: `https://img.vietqr.io/image/mbbank-0901234567-compact2.png?amount=${total}&addInfo=TEAJOY%20${orderId}`).

---

### ────────────── 6. Lỗi Logic Voucher Khuyến Mãi
- **Mô tả hiện trạng**: Tại trang Thanh Toán (`checkout.html`) và Giỏ hàng (`cart.html`), khi người dùng áp dụng thành công mã giảm giá (ví dụ `BANMOI10`), biến `appliedVoucher` lưu giá trị mã đó. Nếu sau đó người dùng xóa ô nhập và gõ một mã không tồn tại (ví dụ `SAI_MA`), hệ thống báo lỗi "Mã không hợp lệ" nhưng **không xóa voucher cũ**, làm đơn hàng vẫn tiếp tục được giảm giá bằng voucher cũ.
- **Đề xuất khắc phục**: Reset `appliedVoucher = null` và tính toán lại tổng tiền khi mã nhập mới không hợp lệ.

---

### 🟡 7. Thiếu Kiểm Tra Số Lượng Tồn Kho (`stockQty`)
- **Mô tả hiện trạng**: Mỗi sản phẩm có trường `stockQty` (ví dụ 50 ly). Tuy nhiên ở modal đặt món (`ClientApp.openCustomizer`) và trang chi tiết sản phẩm (`product-detail.html`), người dùng có thể bấm tăng số lượng lên 100-200 ly và thêm vào giỏ hàng bình thường mà hệ thống không chặn lại.
- **Đề xuất khắc phục**: Ràng buộc số lượng tối đa `max` của ô input số lượng theo `stockQty` của sản phẩm.

---

### 🟡 8. Lỗi Tương Thích Định Dạng Ngày Tháng (`dateTime`) trên Safari
- **Mô tả hiện trạng**: Hàm `dateTime(dateStr)` trong `js/utils/formatters.js` nhận vào chuỗi ngày dạng `"2026-09-01 10:15:30"`. Trên trình duyệt Safari hoặc iOS WebKit, `new Date("2026-09-01 10:15:30")` trả về `Invalid Date` do thiếu chữ `'T'` phân cách giữa Ngày và Giờ.
- **Đề xuất khắc phục**: Thay thế khoảng trắng thành `'T'` trước khi parse Date:
  `const d = new Date(dateStr.replace(' ', 'T'));`

---

### 🟠 9. Bất Đồng Bộ Giữa Cấu Trúc SQL Database (`schema.sql`) và Mock Data LocalStorage
- **Mô tả hiện trạng**:
  - `database/schema.sql` định nghĩa các cột dạng `snake_case`: `category_id`, `base_price`, `is_active`, `grand_total`, `order_status`.
  - `js/db/mock-data.js` dùng định dạng `camelCase`: `category`, `price`, `inStock`, `totalAmount`, `orderStatus`.
- **Hậu quả**: Nếu triển khai Backend (Node.js/PHP/Python) nối với CSDL MySQL theo file `schema.sql`, giao diện Frontend hiện tại sẽ hoàn toàn không tương thích.
- **Đề xuất khắc phục**: Cập nhật file SQL `schema.sql` hoặc tạo lớp Mapper chuyển đổi giữa DTO Frontend và CSDL Backend.

---

### 🟢 10. Vòng Quay May Mắn Không Giới Hạn Số Lần Quay
- **Mô tả hiện trạng**: Tại trang chủ `index.html`, người dùng có thể bấm nút "QUAY" liên tục để lấy voucher mà không bị giới hạn 1 lần/ngày hay kiểm tra trạng thái đăng nhập.
- **Đề xuất khắc phục**: Lưu trạng thái đã quay trong ngày vào `localStorage` (`teajoy_last_spin_date`) để chặn không cho quay tiếp trong cùng một ngày.

---

### 🔒 11. Mật Khẩu Chưa Được Mã Hóa
- **Mô tả hiện trạng**: Trong `mock-data.js` và `database/seed.sql`, mật khẩu người dùng lưu trực tiếp dạng Plain-Text (`"123"`).
- **Đề xuất khắc phục**: Trong môi trường thực tế, cần mã hóa mật khẩu bằng BCrypt/Argon2 trước khi lưu vào CSDL.

---

## 📌 HƯỚNG DẪN DÙNG DỰ ÁN & ĐỀ XUẤT BƯỚC TIẾP THEO

1. **Thư mục làm việc dự án:**  
   `C:\Users\DELL\.gemini\antigravity-ide\scratch\trasua`  
   *(Bạn nên đặt thư mục này làm **Active Workspace** trong IDE để quản lý thuận tiện hơn).*

2. **Quyết định tiếp theo:**  
   Vui lòng xem qua danh sách lỗi trên. Khi bạn sẵn sàng, hãy phản hồi lại để mình tiến hành **sửa toàn bộ các lỗi này** và hoàn thiện hệ thống cho bạn!

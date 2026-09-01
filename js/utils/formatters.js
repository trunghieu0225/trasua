/* ==========================================================================
   TEAJOY STORE - UTILITY FORMATTERS
   ========================================================================== */

const Formatters = {
  // Format Vietnamese Currency: 35000 -> "35.000 ₫"
  currency(amount) {
    if (isNaN(amount)) return "0 ₫";
    return new Intl.NumberFormat("vi-VN", {
      style: "currency",
      currency: "VND"
    }).format(amount).replace("VND", "₫").trim();
  },

  // Format Date: "2026-09-01 10:15:30" -> "10:15 - 01/09/2026"
  dateTime(dateStr) {
    if (!dateStr) return "";
    const d = new Date(dateStr);
    if (isNaN(d.getTime())) return dateStr;
    const hours = String(d.getHours()).padStart(2, "0");
    const mins = String(d.getMinutes()).padStart(2, "0");
    const day = String(d.getDate()).padStart(2, "0");
    const month = String(d.getMonth() + 1).padStart(2, "0");
    const year = d.getFullYear();
    return `${hours}:${mins} - ${day}/${month}/${year}`;
  },

  // Generate Unique Order ID: TS-XXXX
  generateOrderId() {
    const randomNum = Math.floor(1000 + Math.random() * 9000);
    return `TS-${randomNum}`;
  },

  // Order Status Label & HTML Badge
  orderStatusBadge(status) {
    const map = {
      pending: { label: "Chờ xác nhận", class: "badge-warning" },
      confirmed: { label: "Đã xác nhận", class: "badge-info" },
      preparing: { label: "Đang chuẩn bị", class: "badge-purple" },
      shipping: { label: "Đang giao", class: "badge-primary" },
      completed: { label: "Đã giao thành công", class: "badge-success" },
      cancelled: { label: "Đã hủy", class: "badge-danger" }
    };

    const target = map[status] || { label: status, class: "badge-secondary" };
    return `<span class="badge ${target.class}">${target.label}</span>`;
  },

  // Payment Method Name
  paymentMethodName(method) {
    const map = {
      vietqr: "Chuyển khoản VietQR",
      momo: "Ví điện tử MoMo",
      cod: "Tiền mặt khi nhận hàng (COD)"
    };
    return map[method] || method;
  }
};

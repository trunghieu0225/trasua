/* ==========================================================================
   TEAJOY STORE - PRODUCT & TOPPING MANAGEMENT CONTROLLER
   ========================================================================== */

const ProductMgmt = {
  currentTab: "products",

  init() {
    this.renderProductsTable();
    this.renderToppingsTable();
    this.initFilters();
  },

  switchTab(tab) {
    this.currentTab = tab;
    const prodContent = document.getElementById("products-tab-content");
    const topContent = document.getElementById("toppings-tab-content");
    const prodBtn = document.getElementById("tab-prod-btn");
    const topBtn = document.getElementById("tab-top-btn");

    if (tab === "products") {
      prodContent.style.display = "block";
      topContent.style.display = "none";
      prodBtn.style.borderBottom = "2.5px solid var(--primary)";
      prodBtn.style.color = "var(--primary)";
      topBtn.style.borderBottom = "none";
      topBtn.style.color = "var(--text-muted)";
    } else {
      prodContent.style.display = "none";
      topContent.style.display = "block";
      topBtn.style.borderBottom = "2.5px solid var(--primary)";
      topBtn.style.color = "var(--primary)";
      prodBtn.style.borderBottom = "none";
      prodBtn.style.color = "var(--text-muted)";
    }
  },

  initFilters() {
    const searchInput = document.getElementById("admin-prod-search");
    const catSelect = document.getElementById("admin-prod-cat-filter");

    if (searchInput) {
      searchInput.addEventListener("input", () => this.renderProductsTable());
    }
    if (catSelect) {
      catSelect.addEventListener("change", () => this.renderProductsTable());
    }
  },

  renderProductsTable() {
    const tbody = document.getElementById("admin-products-tbody");
    if (!tbody) return;

    let products = DB.getProducts();
    const query = document.getElementById("admin-prod-search")?.value.trim().toLowerCase();
    const cat = document.getElementById("admin-prod-cat-filter")?.value;

    if (cat && cat !== "all") {
      products = products.filter(p => p.category === cat);
    }
    if (query) {
      products = products.filter(p => p.name.toLowerCase().includes(query) || p.id.toLowerCase().includes(query));
    }

    if (products.length === 0) {
      tbody.innerHTML = `<tr><td colspan="7" class="text-center text-muted" style="padding: 2rem;">Không tìm thấy sản phẩm nào.</td></tr>`;
      return;
    }

    tbody.innerHTML = products.map(p => `
      <tr>
        <td>
          <img src="${p.image}" alt="${p.name}" style="width: 48px; height: 48px; border-radius: var(--radius-sm); object-fit: cover;">
        </td>
        <td>
          <div class="font-bold">${p.name}</div>
          <span class="text-xs text-muted">Mã: ${p.id}</span>
        </td>
        <td><span class="badge badge-secondary">${p.category}</span></td>
        <td>
          <div class="font-bold" style="color: var(--primary);">${Formatters.currency(p.price)}</div>
          ${p.oldPrice ? `<div class="text-xs text-muted" style="text-decoration: line-through;">${Formatters.currency(p.oldPrice)}</div>` : ''}
        </td>
        <td><b>${p.stockQty || 0}</b> ly</td>
        <td>
          <span class="badge ${p.inStock ? 'badge-success' : 'badge-danger'}">
            ${p.inStock ? 'Còn Hàng' : 'Hết Hàng'}
          </span>
        </td>
        <td>
          <div class="table-actions">
            <button class="action-icon-btn" onclick="ProductMgmt.openEditModal('${p.id}')" title="Chỉnh sửa">✏️</button>
            <button class="action-icon-btn btn-del" onclick="ProductMgmt.deleteProduct('${p.id}')" title="Xóa món">🗑️</button>
          </div>
        </td>
      </tr>
    `).join("");
  },

  renderToppingsTable() {
    const tbody = document.getElementById("admin-toppings-tbody");
    if (!tbody) return;

    const toppings = DB.getToppings();
    tbody.innerHTML = toppings.map(t => `
      <tr>
        <td class="font-bold text-primary">${t.id}</td>
        <td class="font-semibold">${t.name}</td>
        <td class="font-bold">${Formatters.currency(t.price)}</td>
        <td>
          <span class="badge ${t.inStock ? 'badge-success' : 'badge-danger'}">
            ${t.inStock ? 'Đang Phục Vụ' : 'Tạm Hết'}
          </span>
        </td>
        <td>
          <div class="table-actions">
            <button class="action-icon-btn" onclick="ProductMgmt.toggleToppingStock('${t.id}')" title="Đổi trạng thái">${t.inStock ? '⏸️' : '▶️'}</button>
          </div>
        </td>
      </tr>
    `).join("");
  },

  openAddModal() {
    document.getElementById("product-modal-title").textContent = "Thêm Sản Phẩm Mới";
    document.getElementById("form-prod-id").value = "";
    document.getElementById("form-prod-sku").value = `TS-0${DB.getProducts().length + 1}`;
    document.getElementById("form-prod-name").value = "";
    document.getElementById("form-prod-price").value = "";
    document.getElementById("form-prod-old-price").value = "";
    document.getElementById("form-prod-stock").value = "100";
    document.getElementById("form-prod-image").value = "https://images.unsplash.com/photo-1558857563-b37fcdd72460?auto=format&fit=crop&w=600&q=80";
    document.getElementById("form-prod-desc").value = "";
    Modal.open("product-form-modal");
  },

  openEditModal(productId) {
    const p = DB.getProductById(productId);
    if (!p) return;

    document.getElementById("product-modal-title").textContent = "Chỉnh Sửa Sản Phẩm";
    document.getElementById("form-prod-id").value = p.id;
    document.getElementById("form-prod-sku").value = p.id;
    document.getElementById("form-prod-name").value = p.name;
    document.getElementById("form-prod-cat").value = p.category;
    document.getElementById("form-prod-price").value = p.price;
    document.getElementById("form-prod-old-price").value = p.oldPrice || "";
    document.getElementById("form-prod-stock").value = p.stockQty || 50;
    document.getElementById("form-prod-status").value = p.inStock ? "true" : "false";
    document.getElementById("form-prod-image").value = p.image || "";
    document.getElementById("form-prod-desc").value = p.description || "";

    Modal.open("product-form-modal");
  },

  saveProductSubmit(e) {
    e.preventDefault();
    const editId = document.getElementById("form-prod-id").value;
    const sku = document.getElementById("form-prod-sku").value.trim().toUpperCase();
    const name = document.getElementById("form-prod-name").value.trim();
    const cat = document.getElementById("form-prod-cat").value;
    const price = parseInt(document.getElementById("form-prod-price").value) || 0;
    const oldPrice = parseInt(document.getElementById("form-prod-old-price").value) || 0;
    const stockQty = parseInt(document.getElementById("form-prod-stock").value) || 0;
    const inStock = document.getElementById("form-prod-status").value === "true";
    const image = document.getElementById("form-prod-image").value.trim() || "https://images.unsplash.com/photo-1558857563-b37fcdd72460?auto=format&fit=crop&w=600&q=80";
    const desc = document.getElementById("form-prod-desc").value.trim();

    const productObj = {
      id: editId || sku,
      name,
      category: cat,
      price,
      oldPrice,
      stockQty,
      inStock,
      image,
      description: desc,
      rating: 5.0,
      sold: 10
    };

    DB.saveProduct(productObj);
    Toast.success(`Đã lưu sản phẩm <b>${name}</b> thành công!`);
    Modal.close("product-form-modal");
    this.renderProductsTable();
  },

  deleteProduct(productId) {
    if (confirm(`Bạn có chắc muốn xóa sản phẩm ${productId} khỏi thực đơn?`)) {
      DB.deleteProduct(productId);
      Toast.info("Đã xóa sản phẩm.");
      this.renderProductsTable();
    }
  },

  toggleToppingStock(toppingId) {
    const toppings = DB.getToppings();
    const target = toppings.find(t => t.id === toppingId);
    if (target) {
      target.inStock = !target.inStock;
      DB.saveToppings(toppings);
      Toast.success(`Đã cập nhật trạng thái topping: <b>${target.name}</b>`);
      this.renderToppingsTable();
    }
  }
};

document.addEventListener("DOMContentLoaded", () => {
  ProductMgmt.init();
});

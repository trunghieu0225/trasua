/* ==========================================================================
   TEAJOY STORE - AUTHENTICATION & QUICK ROLE SWITCHER
   ========================================================================== */

const Auth = {
  getCurrentUser() {
    return DB.getCurrentUser();
  },

  isLoggedIn() {
    return !!this.getCurrentUser();
  },

  isAdmin() {
    const user = this.getCurrentUser();
    return user && user.role === "admin";
  },

  isStaff() {
    const user = this.getCurrentUser();
    return user && (user.role === "admin" || user.role === "staff");
  },

  login(username, password) {
    const users = DB.getUsers();
    const user = users.find(u => u.username.toLowerCase() === username.toLowerCase() && u.password === password);
    if (!user) {
      return { success: false, message: "Tên đăng nhập hoặc mật khẩu không chính xác!" };
    }
    if (user.status === "locked") {
      return { success: false, message: "Tài khoản này đang bị tạm khóa!" };
    }
    DB.setCurrentUser(user);
    return { success: true, user };
  },

  logout() {
    DB.setCurrentUser(null);
    window.location.href = "index.html";
  },

  register(userData) {
    const users = DB.getUsers();
    const exists = users.find(u => u.username.toLowerCase() === userData.username.toLowerCase());
    if (exists) {
      return { success: false, message: "Tên đăng nhập đã tồn tại trên hệ thống!" };
    }

    const newUser = {
      id: `USR-${Date.now()}`,
      username: userData.username,
      password: userData.password,
      fullName: userData.fullName || "Khách hàng mới",
      role: "customer",
      email: userData.email || "",
      phone: userData.phone || "",
      points: 50, // Bonus registration points
      tier: "Đồng",
      status: "active",
      createdAt: new Date().toISOString().split("T")[0]
    };

    DB.saveUser(newUser);
    DB.setCurrentUser(newUser);
    return { success: true, user: newUser };
  },

  // Switch role for quick testing/demo
  switchRole(role) {
    const users = DB.getUsers();
    const targetUser = users.find(u => u.role === role);
    if (targetUser) {
      DB.setCurrentUser(targetUser);
      Toast.success(`Đã chuyển sang vai trò: <b>${targetUser.fullName}</b> (${targetUser.role.toUpperCase()})`);
      setTimeout(() => {
        if (role === "admin" || role === "staff") {
          // If in client page, redirect to admin
          if (!window.location.pathname.includes("/admin/")) {
            window.location.href = "admin/index.html";
          } else {
            window.location.reload();
          }
        } else {
          // Customer role
          if (window.location.pathname.includes("/admin/")) {
            window.location.href = "../index.html";
          } else {
            window.location.reload();
          }
        }
      }, 500);
    }
  },

  // Inject Floating Quick Role Switcher widget on every page
  renderRoleSwitcher() {
    if (document.getElementById("quick-role-switcher")) return;

    const currentUser = this.getCurrentUser();
    const currentRole = currentUser ? currentUser.role : "Khách";
    const currentName = currentUser ? currentUser.fullName : "Chưa đăng nhập";

    const isInsideAdmin = window.location.pathname.includes("/admin/");
    const pathToHome = isInsideAdmin ? "../index.html" : "index.html";
    const pathToAdmin = isInsideAdmin ? "index.html" : "admin/index.html";

    const widget = document.createElement("div");
    widget.id = "quick-role-switcher";
    widget.className = "role-switcher-widget";
    widget.innerHTML = `
      <div style="display: flex; align-items: center; gap: 0.4rem;">
        <span style="font-size: 1.1rem;">⚡</span>
        <span class="role-tag">${currentRole.toUpperCase()}: ${currentName.split(" ").slice(-1)[0]}</span>
      </div>
      <div style="display: flex; gap: 0.25rem;">
        <button class="btn btn-sm ${currentRole === 'customer' ? 'btn-primary' : 'btn-outline'}" onclick="Auth.switchRole('customer')" title="Chuyển sang Khách Hàng">Khách</button>
        <button class="btn btn-sm ${currentRole === 'staff' ? 'btn-primary' : 'btn-outline'}" onclick="Auth.switchRole('staff')" title="Chuyển sang Nhân Viên">Nhân viên</button>
        <button class="btn btn-sm ${currentRole === 'admin' ? 'btn-primary' : 'btn-outline'}" onclick="Auth.switchRole('admin')" title="Chuyển sang Quản Lý Admin">Admin</button>
        ${!isInsideAdmin ? `<a href="${pathToAdmin}" class="btn btn-sm btn-secondary" title="Vào trang Quản trị">⚙️ Admin</a>` : `<a href="${pathToHome}" class="btn btn-sm btn-outline" title="Về trang Bán hàng">🛍️ Shop</a>`}
      </div>
    `;

    document.body.appendChild(widget);
  }
};

document.addEventListener("DOMContentLoaded", () => {
  Auth.renderRoleSwitcher();
});

window.Auth = Auth;

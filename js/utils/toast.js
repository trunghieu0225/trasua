/* ==========================================================================
   TEAJOY STORE - TOAST NOTIFICATION SYSTEM
   ========================================================================== */

const Toast = {
  container: null,

  init() {
    if (!this.container) {
      this.container = document.getElementById("toast-container");
      if (!this.container) {
        this.container = document.createElement("div");
        this.container.id = "toast-container";
        document.body.appendChild(this.container);
      }
    }
  },

  show(message, type = "info", duration = 3200) {
    this.init();

    const toast = document.createElement("div");
    toast.className = `toast toast-${type}`;

    const icons = {
      success: "✅",
      error: "❌",
      warning: "⚠️",
      info: "ℹ️"
    };

    toast.innerHTML = `
      <span class="toast-icon">${icons[type] || "ℹ️"}</span>
      <div class="toast-content">${message}</div>
    `;

    this.container.appendChild(toast);

    setTimeout(() => {
      toast.classList.add("removing");
      setTimeout(() => {
        toast.remove();
      }, 300);
    }, duration);
  },

  success(msg, duration) { this.show(msg, "success", duration); },
  error(msg, duration) { this.show(msg, "error", duration); },
  warning(msg, duration) { this.show(msg, "warning", duration); },
  info(msg, duration) { this.show(msg, "info", duration); }
};

window.Toast = Toast;

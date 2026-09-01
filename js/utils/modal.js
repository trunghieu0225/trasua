/* ==========================================================================
   TEAJOY STORE - MODAL CONTROLLER
   ========================================================================== */

const Modal = {
  open(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
      modal.classList.add("active");
      document.body.style.overflow = "hidden";
    }
  },

  close(modalId) {
    const modal = document.getElementById(modalId);
    if (modal) {
      modal.classList.remove("active");
      document.body.style.overflow = "";
    }
  },

  initGlobalListeners() {
    document.addEventListener("click", (e) => {
      // Close when clicking modal backdrop
      if (e.target.classList.contains("modal-backdrop")) {
        e.target.classList.remove("active");
        document.body.style.overflow = "";
      }
      // Close button with data-close-modal
      const closeBtn = e.target.closest("[data-close-modal]");
      if (closeBtn) {
        const modalId = closeBtn.getAttribute("data-close-modal");
        if (modalId) {
          Modal.close(modalId);
        } else {
          const parentModal = closeBtn.closest(".modal-backdrop");
          if (parentModal) {
            parentModal.classList.remove("active");
            document.body.style.overflow = "";
          }
        }
      }
    });

    // Close on Escape key
    document.addEventListener("keydown", (e) => {
      if (e.key === "Escape") {
        const activeModals = document.querySelectorAll(".modal-backdrop.active");
        activeModals.forEach(m => m.classList.remove("active"));
        document.body.style.overflow = "";
      }
    });
  }
};

document.addEventListener("DOMContentLoaded", () => {
  Modal.initGlobalListeners();
});

window.Modal = Modal;

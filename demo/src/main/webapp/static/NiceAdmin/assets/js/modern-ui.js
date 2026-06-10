/* =====================================================
   MODERN UI JAVASCRIPT
   Student Course Registration & Management System
   ===================================================== */

document.addEventListener("DOMContentLoaded", function () {
  // Initialize all modern UI components
  initPageTransition();
  initToastNotifications();
  initRippleEffect();
  initSmoothScrolling();
  initPasswordToggle();
  initLoadingSkeleton();
  initTableEnhancements();
  initFormValidation();
  initConfirmDialogs();
  initAnimateOnScroll();
  initBackToTop();
});

/* ================== PAGE TRANSITIONS ================== */
function initPageTransition() {
  // Add fade-in effect to main content
  const main = document.querySelector("main.main");
  if (main) {
    main.classList.add("fade-in");
  }

  // Add stagger animation to cards
  const cards = document.querySelectorAll(".card, .stat-card, .course-card");
  cards.forEach((card, index) => {
    card.style.animationDelay = `${index * 0.1}s`;
    card.classList.add("slide-up");
  });

  // Add stagger animation to table rows
  const tableRows = document.querySelectorAll("tbody tr");
  tableRows.forEach((row, index) => {
    row.style.animationDelay = `${index * 0.05}s`;
    row.classList.add("slide-up");
  });
}

/* ================== TOAST NOTIFICATIONS ================== */
function initToastNotifications() {
  // Create toast container if not exists
  let toastContainer = document.querySelector(".toast-container");
  if (!toastContainer) {
    toastContainer = document.createElement("div");
    toastContainer.className = "toast-container";
    document.body.appendChild(toastContainer);
  }

  // Convert alerts to toasts
  const alerts = document.querySelectorAll(".alert");
  alerts.forEach((alert) => {
    const message = alert.textContent.trim();
    let type = "info";
    if (alert.classList.contains("alert-success")) type = "success";
    if (alert.classList.contains("alert-danger")) type = "error";
    if (alert.classList.contains("alert-warning")) type = "warning";

    // Keep the alert but also show toast
    // showToast(message, type);
  });
}

// Global toast function
window.showToast = function (message, type = "info", duration = 5000) {
  let toastContainer = document.querySelector(".toast-container");
  if (!toastContainer) {
    toastContainer = document.createElement("div");
    toastContainer.className = "toast-container";
    document.body.appendChild(toastContainer);
  }

  const icons = {
    success: '<i class="bi bi-check-circle-fill"></i>',
    error: '<i class="bi bi-x-circle-fill"></i>',
    warning: '<i class="bi bi-exclamation-triangle-fill"></i>',
    info: '<i class="bi bi-info-circle-fill"></i>',
  };

  const titles = {
    success: "Thành công",
    error: "Lỗi",
    warning: "Cảnh báo",
    info: "Thông báo",
  };

  const toast = document.createElement("div");
  toast.className = `toast toast-${type}`;
  toast.innerHTML = `
        <div class="toast-icon">${icons[type]}</div>
        <div class="toast-content">
            <div class="toast-title">${titles[type]}</div>
            <div class="toast-message">${message}</div>
        </div>
        <button class="toast-close" onclick="this.parentElement.remove()">
            <i class="bi bi-x"></i>
        </button>
    `;

  toastContainer.appendChild(toast);

  // Auto remove after duration
  setTimeout(() => {
    toast.style.animation = "toastSlideOut 0.3s ease forwards";
    setTimeout(() => toast.remove(), 300);
  }, duration);
};

// Add CSS for toast slide out
const toastStyle = document.createElement("style");
toastStyle.textContent = `
    @keyframes toastSlideOut {
        from { opacity: 1; transform: translateX(0); }
        to { opacity: 0; transform: translateX(100%); }
    }
`;
document.head.appendChild(toastStyle);

/* ================== RIPPLE EFFECT ================== */
function initRippleEffect() {
  const buttons = document.querySelectorAll(".btn");

  buttons.forEach((button) => {
    button.addEventListener("click", function (e) {
      const rect = button.getBoundingClientRect();
      const ripple = document.createElement("span");
      const size = Math.max(rect.width, rect.height);

      ripple.style.cssText = `
                position: absolute;
                width: ${size}px;
                height: ${size}px;
                left: ${e.clientX - rect.left - size / 2}px;
                top: ${e.clientY - rect.top - size / 2}px;
                background: rgba(255, 255, 255, 0.4);
                border-radius: 50%;
                transform: scale(0);
                animation: ripple 0.6s ease-out;
                pointer-events: none;
            `;

      button.style.position = "relative";
      button.style.overflow = "hidden";
      button.appendChild(ripple);

      setTimeout(() => ripple.remove(), 600);
    });
  });
}

// Add ripple animation
const rippleStyle = document.createElement("style");
rippleStyle.textContent = `
    @keyframes ripple {
        to {
            transform: scale(4);
            opacity: 0;
        }
    }
`;
document.head.appendChild(rippleStyle);

/* ================== SMOOTH SCROLLING ================== */
function initSmoothScrolling() {
  document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
    anchor.addEventListener("click", function (e) {
      const target = document.querySelector(this.getAttribute("href"));
      if (target) {
        e.preventDefault();
        target.scrollIntoView({
          behavior: "smooth",
          block: "start",
        });
      }
    });
  });
}

/* ================== PASSWORD TOGGLE ================== */
function initPasswordToggle() {
  const passwordInputs = document.querySelectorAll('input[type="password"]');

  passwordInputs.forEach((input) => {
    const wrapper = document.createElement("div");
    wrapper.className = "password-toggle-wrapper";
    wrapper.style.cssText = "position: relative; width: 100%;";

    input.parentNode.insertBefore(wrapper, input);
    wrapper.appendChild(input);

    const toggleBtn = document.createElement("button");
    toggleBtn.type = "button";
    toggleBtn.className = "password-toggle-btn";
    toggleBtn.innerHTML = '<i class="bi bi-eye"></i>';
    toggleBtn.style.cssText = `
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: var(--text-muted);
            cursor: pointer;
            padding: 4px;
            transition: var(--transition);
        `;

    toggleBtn.addEventListener("click", function () {
      const isPassword = input.type === "password";
      input.type = isPassword ? "text" : "password";
      this.innerHTML = isPassword
        ? '<i class="bi bi-eye-slash"></i>'
        : '<i class="bi bi-eye"></i>';
    });

    wrapper.appendChild(toggleBtn);
  });
}

/* ================== LOADING SKELETON ================== */
function initLoadingSkeleton() {
  window.showSkeleton = function (container, count = 3) {
    const skeletons = [];
    for (let i = 0; i < count; i++) {
      const skeleton = document.createElement("div");
      skeleton.className = "skeleton skeleton-card";
      skeleton.style.marginBottom = "16px";
      skeletons.push(skeleton);
      container.appendChild(skeleton);
    }
    return skeletons;
  };

  window.hideSkeleton = function (skeletons) {
    skeletons.forEach((skeleton) => skeleton.remove());
  };
}

/* ================== TABLE ENHANCEMENTS ================== */
function initTableEnhancements() {
  const tables = document.querySelectorAll(".table");

  tables.forEach((table) => {
    // Add hover effect to rows
    const rows = table.querySelectorAll("tbody tr");
    rows.forEach((row) => {
      row.addEventListener("mouseenter", function () {
        this.style.transform = "scale(1.005)";
      });
      row.addEventListener("mouseleave", function () {
        this.style.transform = "scale(1)";
      });
    });

    // Select all checkbox functionality
    const selectAllCheckbox = table.querySelector(
      'thead input[type="checkbox"]'
    );
    if (selectAllCheckbox) {
      const checkboxes = table.querySelectorAll('tbody input[type="checkbox"]');

      selectAllCheckbox.addEventListener("change", function () {
        checkboxes.forEach((cb) => {
          cb.checked = this.checked;
          cb.closest("tr").classList.toggle("selected", this.checked);
        });
      });

      checkboxes.forEach((cb) => {
        cb.addEventListener("change", function () {
          this.closest("tr").classList.toggle("selected", this.checked);

          const allChecked = Array.from(checkboxes).every((c) => c.checked);
          const someChecked = Array.from(checkboxes).some((c) => c.checked);
          selectAllCheckbox.checked = allChecked;
          selectAllCheckbox.indeterminate = someChecked && !allChecked;
        });
      });
    }
  });

  // Add selected row style
  const selectedStyle = document.createElement("style");
  selectedStyle.textContent = `
        tbody tr.selected {
            background: rgba(37, 99, 235, 0.08) !important;
        }
    `;
  document.head.appendChild(selectedStyle);
}

/* ================== FORM VALIDATION ================== */
function initFormValidation() {
  const forms = document.querySelectorAll("form.needs-validation, form");

  forms.forEach((form) => {
    const inputs = form.querySelectorAll(
      "input[required], select[required], textarea[required]"
    );

    inputs.forEach((input) => {
      // Real-time validation
      input.addEventListener("blur", function () {
        validateInput(this);
      });

      input.addEventListener("input", function () {
        if (this.classList.contains("is-invalid")) {
          validateInput(this);
        }
      });
    });

    // Prevent default HTML5 validation and use custom
    form.addEventListener("submit", function (e) {
      let isValid = true;

      inputs.forEach((input) => {
        if (!validateInput(input)) {
          isValid = false;
        }
      });

      if (!isValid) {
        e.preventDefault();
        e.stopPropagation();

        // Focus first invalid field
        const firstInvalid = form.querySelector(".is-invalid");
        if (firstInvalid) {
          firstInvalid.focus();
          firstInvalid.scrollIntoView({ behavior: "smooth", block: "center" });
        }
      }
    });
  });
}

function validateInput(input) {
  const value = input.value.trim();
  let isValid = true;
  let message = "";

  // Required validation
  if (input.required && !value) {
    isValid = false;
    message = "Trường này là bắt buộc";
  }

  // Email validation
  if (input.type === "email" && value) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(value)) {
      isValid = false;
      message = "Email không hợp lệ";
    }
  }

  // Phone validation
  if (input.name && input.name.toLowerCase().includes("phone") && value) {
    const phoneRegex = /^[0-9]{10,11}$/;
    if (!phoneRegex.test(value.replace(/\D/g, ""))) {
      isValid = false;
      message = "Số điện thoại không hợp lệ";
    }
  }

  // Update UI
  input.classList.toggle("is-invalid", !isValid);
  input.classList.toggle("is-valid", isValid && value);

  // Show/hide error message
  let feedback = input.parentElement.querySelector(".invalid-feedback");
  if (!isValid && message) {
    if (!feedback) {
      feedback = document.createElement("div");
      feedback.className = "invalid-feedback";
      input.parentElement.appendChild(feedback);
    }
    feedback.textContent = message;
    feedback.style.display = "block";
  } else if (feedback) {
    feedback.style.display = "none";
  }

  return isValid;
}

// Add validation styles
const validationStyle = document.createElement("style");
validationStyle.textContent = `
    .form-control.is-valid,
    .form-select.is-valid {
        border-color: var(--success) !important;
    }
    .form-control.is-valid:focus,
    .form-select.is-valid:focus {
        box-shadow: 0 0 0 4px rgba(16, 185, 129, 0.1) !important;
    }
    .invalid-feedback {
        color: var(--danger);
        font-size: 0.875rem;
        margin-top: 4px;
        animation: shake 0.5s ease;
    }
`;
document.head.appendChild(validationStyle);

/* ================== CONFIRM DIALOGS ================== */
function initConfirmDialogs() {
  // Create modal container
  let modalContainer = document.getElementById("confirmModal");
  if (!modalContainer) {
    modalContainer = document.createElement("div");
    modalContainer.innerHTML = `
            <div class="modal fade" id="confirmModal" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content modal-confirm confirm-delete">
                        <div class="modal-body">
                            <div class="modal-icon">
                                <i class="bi bi-exclamation-triangle"></i>
                            </div>
                            <h4 class="modal-confirm-title">Xác nhận</h4>
                            <p class="modal-confirm-text">Bạn có chắc chắn muốn thực hiện hành động này?</p>
                        </div>
                        <div class="modal-footer justify-content-center border-0">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                            <button type="button" class="btn btn-danger" id="confirmModalBtn">Xác nhận</button>
                        </div>
                    </div>
                </div>
            </div>
        `;
    document.body.appendChild(modalContainer);
  }

  // Global confirm function
  window.showConfirm = function (message, callback, type = "danger") {
    const modal = new bootstrap.Modal(document.getElementById("confirmModal"));
    const modalEl = document.getElementById("confirmModal");

    modalEl.querySelector(".modal-confirm-text").textContent = message;
    modalEl.querySelector("#confirmModalBtn").className = `btn btn-${type}`;

    const confirmBtn = modalEl.querySelector("#confirmModalBtn");
    const newConfirmBtn = confirmBtn.cloneNode(true);
    confirmBtn.parentNode.replaceChild(newConfirmBtn, confirmBtn);

    newConfirmBtn.addEventListener("click", function () {
      modal.hide();
      if (callback) callback();
    });

    modal.show();
  };

  // Override default confirm for delete links
  document.querySelectorAll('a[onclick*="confirm"]').forEach((link) => {
    const originalOnclick = link.getAttribute("onclick");
    link.removeAttribute("onclick");

    link.addEventListener("click", function (e) {
      e.preventDefault();
      const href = this.getAttribute("href");

      showConfirm("Bạn có chắc chắn muốn xóa không?", function () {
        window.location.href = href;
      });
    });
  });
}

/* ================== ANIMATE ON SCROLL ================== */
function initAnimateOnScroll() {
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add("aos-animate");
        }
      });
    },
    {
      threshold: 0.1,
      rootMargin: "0px 0px -50px 0px",
    }
  );

  document.querySelectorAll(".card, .stat-card, section").forEach((el) => {
    el.classList.add("aos-init");
    observer.observe(el);
  });
}

// Add AOS styles
const aosStyle = document.createElement("style");
aosStyle.textContent = `
    .aos-init {
        opacity: 0;
        transform: translateY(30px);
        transition: opacity 0.6s ease, transform 0.6s ease;
    }
    .aos-animate {
        opacity: 1;
        transform: translateY(0);
    }
`;
document.head.appendChild(aosStyle);

/* ================== BACK TO TOP ================== */
function initBackToTop() {
  const backToTop = document.querySelector(".back-to-top");
  if (!backToTop) return;

  window.addEventListener("scroll", function () {
    if (window.scrollY > 300) {
      backToTop.classList.add("active");
    } else {
      backToTop.classList.remove("active");
    }
  });

  backToTop.addEventListener("click", function (e) {
    e.preventDefault();
    window.scrollTo({
      top: 0,
      behavior: "smooth",
    });
  });
}

/* ================== SEARCH FUNCTIONALITY ================== */
window.initSearchFilter = function (inputSelector, itemsSelector) {
  const input = document.querySelector(inputSelector);
  const items = document.querySelectorAll(itemsSelector);

  if (!input || !items.length) return;

  input.addEventListener("input", function () {
    const searchTerm = this.value.toLowerCase();

    items.forEach((item) => {
      const text = item.textContent.toLowerCase();
      const match = text.includes(searchTerm);
      item.style.display = match ? "" : "none";

      if (match && searchTerm) {
        item.classList.add("highlight");
      } else {
        item.classList.remove("highlight");
      }
    });
  });
};

/* ================== COUNTER ANIMATION ================== */
window.animateCounter = function (element, target, duration = 1000) {
  let start = 0;
  const increment = target / (duration / 16);

  function update() {
    start += increment;
    if (start < target) {
      element.textContent = Math.floor(start);
      requestAnimationFrame(update);
    } else {
      element.textContent = target;
    }
  }

  update();
};

/* ================== LOADING STATES ================== */
window.setLoading = function (button, isLoading) {
  if (isLoading) {
    button.disabled = true;
    button.dataset.originalText = button.innerHTML;
    button.innerHTML = `
            <span class="spinner-border spinner-border-sm me-2" role="status"></span>
            Đang xử lý...
        `;
  } else {
    button.disabled = false;
    button.innerHTML = button.dataset.originalText;
  }
};

/* ================== UTILITY FUNCTIONS ================== */
// Debounce function for search inputs
window.debounce = function (func, wait) {
  let timeout;
  return function executedFunction(...args) {
    const later = () => {
      clearTimeout(timeout);
      func(...args);
    };
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);
  };
};

// Format number with Vietnamese locale
window.formatNumber = function (num) {
  return new Intl.NumberFormat("vi-VN").format(num);
};

// Format date with Vietnamese locale
window.formatDate = function (date) {
  return new Intl.DateTimeFormat("vi-VN", {
    day: "2-digit",
    month: "2-digit",
    year: "numeric",
  }).format(new Date(date));
};

console.log("🎨 Modern UI System Loaded");

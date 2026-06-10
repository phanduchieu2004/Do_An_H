<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Đăng nhập - Hệ thống Quản lý Sinh viên</title>
    <meta content="Hệ thống quản lý sinh viên Đại học Vinh" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/static/NiceAdmin/assets/img/favicon.png" rel="icon" />
    
    <!-- Google Fonts: Lexend + Be Vietnam Pro -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Lexend:wght@300;400;500;600;700;800&family=Be+Vietnam+Pro:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,400&display=swap" rel="stylesheet" />
    
    <!-- Bootstrap CSS -->
    <link href="${pageContext.request.contextPath}/static/NiceAdmin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Bootstrap Icons -->
    <link href="${pageContext.request.contextPath}/static/NiceAdmin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
    
    <style>
      :root {
        --primary: #2563EB;
        --primary-dark: #1D4ED8;
        --primary-light: #3B82F6;
        --secondary: #1E293B;
        --bg-light: #F8FAFC;
        --text-dark: #1E293B;
        --text-muted: #64748B;
        --border-color: #E2E8F0;
        --danger: #EF4444;
        --success: #10B981;
      }
      
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }
      
      body {
        font-family: 'Lexend', 'Be Vietnam Pro', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
        min-height: 100vh;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #2563EB 100%);
        background-size: 200% 200%;
        animation: gradientMove 15s ease infinite;
        position: relative;
        overflow-x: hidden;
      }
      
      @keyframes gradientMove {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
      }
      
      /* Floating Bubbles */
      .bubbles {
        position: fixed;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        pointer-events: none;
        overflow: hidden;
        z-index: 0;
      }
      
      .bubble {
        position: absolute;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.1);
        animation: rise 20s infinite ease-in;
      }
      
      .bubble:nth-child(1) { width: 80px; height: 80px; left: 10%; animation-delay: 0s; }
      .bubble:nth-child(2) { width: 120px; height: 120px; left: 20%; animation-delay: 2s; }
      .bubble:nth-child(3) { width: 60px; height: 60px; left: 35%; animation-delay: 4s; }
      .bubble:nth-child(4) { width: 100px; height: 100px; left: 50%; animation-delay: 6s; }
      .bubble:nth-child(5) { width: 90px; height: 90px; left: 65%; animation-delay: 8s; }
      .bubble:nth-child(6) { width: 70px; height: 70px; left: 80%; animation-delay: 10s; }
      .bubble:nth-child(7) { width: 110px; height: 110px; left: 90%; animation-delay: 12s; }
      
      @keyframes rise {
        0% { transform: translateY(100vh) scale(0.5); opacity: 0; }
        10% { opacity: 0.8; }
        90% { opacity: 0.8; }
        100% { transform: translateY(-100vh) scale(1.2); opacity: 0; }
      }
      
      /* Login Card */
      .login-card {
        background: rgba(255, 255, 255, 0.98);
        backdrop-filter: blur(20px);
        -webkit-backdrop-filter: blur(20px);
        border: none;
        border-radius: 28px;
        box-shadow: 0 30px 60px -12px rgba(0, 0, 0, 0.3);
        overflow: hidden;
        animation: slideUp 0.6s ease;
      }
      
      @keyframes slideUp {
        from { opacity: 0; transform: translateY(40px); }
        to { opacity: 1; transform: translateY(0); }
      }
      
      /* Header with gradient */
      .login-header {
        text-align: center;
        padding: 2.5rem 2rem 1.5rem;
        background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
        position: relative;
      }
      
      .login-header::after {
        content: '';
        position: absolute;
        bottom: -25px;
        left: 0;
        right: 0;
        height: 50px;
        background: rgba(255, 255, 255, 0.98);
        border-radius: 50% 50% 0 0 / 100% 100% 0 0;
      }
      
      .login-logo {
        width: 90px;
        height: 90px;
        background: white;
        border-radius: 24px;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 1.25rem;
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
        position: relative;
        z-index: 1;
      }
      
      .login-logo i {
        font-size: 2.8rem;
        background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
      }
      
      .login-title {
        font-size: 1.85rem;
        font-weight: 700;
        color: white;
        margin-bottom: 0.5rem;
        position: relative;
        z-index: 1;
      }
      
      .login-subtitle {
        color: rgba(255, 255, 255, 0.9);
        font-size: 1rem;
        font-weight: 400;
        position: relative;
        z-index: 1;
      }
      
      /* Form */
      .login-form {
        padding: 2rem 2.5rem 1.5rem;
      }
      
      /* Input Group */
      .form-floating-custom {
        position: relative;
        margin-bottom: 1.5rem;
      }
      
      .form-floating-custom .form-control {
        width: 100%;
        height: 58px;
        padding: 1rem 3rem;
        border: 2px solid var(--border-color);
        border-radius: 16px;
        font-size: 1rem;
        font-family: inherit;
        color: var(--text-dark);
        background: var(--bg-light);
        transition: all 0.3s ease;
      }
      
      .form-floating-custom .form-control::placeholder {
        color: transparent;
      }
      
      .form-floating-custom .form-control:focus {
        border-color: var(--primary);
        background: white;
        box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
        outline: none;
      }
      
      .form-floating-custom .input-icon {
        position: absolute;
        left: 1.1rem;
        top: 50%;
        transform: translateY(-50%);
        color: var(--text-muted);
        font-size: 1.3rem;
        transition: all 0.3s ease;
        z-index: 2;
      }
      
      .form-floating-custom .form-control:focus ~ .input-icon {
        color: var(--primary);
      }
      
      .form-floating-custom label {
        position: absolute;
        top: 50%;
        left: 3rem;
        transform: translateY(-50%);
        color: var(--text-muted);
        font-size: 1rem;
        transition: all 0.25s ease;
        pointer-events: none;
        padding: 0 0.35rem;
        background: transparent;
      }
      
      .form-floating-custom .form-control:focus ~ label,
      .form-floating-custom .form-control:not(:placeholder-shown) ~ label {
        top: 0;
        left: 1rem;
        font-size: 0.8rem;
        color: var(--primary);
        font-weight: 600;
        background: white;
      }
      
      .password-toggle {
        position: absolute;
        right: 1rem;
        top: 50%;
        transform: translateY(-50%);
        background: none;
        border: none;
        color: var(--text-muted);
        cursor: pointer;
        padding: 0.25rem;
        transition: color 0.3s ease;
        z-index: 3;
      }
      
      .password-toggle:hover {
        color: var(--primary);
      }
      
      /* Error Message */
      .error-message {
        background: linear-gradient(135deg, #FEE2E2 0%, #FECACA 100%);
        border: 1px solid #FECACA;
        color: #991B1B;
        padding: 0.85rem 1rem;
        border-radius: 12px;
        font-size: 0.9rem;
        display: flex;
        align-items: center;
        gap: 0.6rem;
        margin-bottom: 1.25rem;
        animation: shake 0.5s ease;
      }
      
      .error-message i {
        font-size: 1.2rem;
        flex-shrink: 0;
      }
      
      @keyframes shake {
        0%, 100% { transform: translateX(0); }
        20% { transform: translateX(-8px); }
        40% { transform: translateX(8px); }
        60% { transform: translateX(-8px); }
        80% { transform: translateX(8px); }
      }
      
      /* Remember Check */
      .remember-check {
        display: flex;
        align-items: center;
        gap: 0.6rem;
        margin-bottom: 1.75rem;
      }
      
      .remember-check input[type="checkbox"] {
        width: 22px;
        height: 22px;
        accent-color: var(--primary);
        cursor: pointer;
        border-radius: 6px;
      }
      
      .remember-check label {
        color: var(--text-muted);
        font-size: 0.95rem;
        cursor: pointer;
      }
      
      /* Login Button */
      .btn-login {
        width: 100%;
        height: 58px;
        background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
        border: none;
        border-radius: 16px;
        color: white;
        font-size: 1.1rem;
        font-weight: 600;
        font-family: inherit;
        cursor: pointer;
        transition: all 0.3s ease;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 0.6rem;
        position: relative;
        overflow: hidden;
      }
      
      .btn-login:hover {
        transform: translateY(-3px);
        box-shadow: 0 15px 35px rgba(37, 99, 235, 0.4);
      }
      
      .btn-login:active {
        transform: translateY(-1px);
      }
      
      /* Footer */
      .login-footer {
        text-align: center;
        padding: 1.25rem 2rem 1.5rem;
        background: var(--bg-light);
        border-top: 1px solid var(--border-color);
      }
      
      .login-footer a {
        color: var(--primary);
        text-decoration: none;
        font-weight: 500;
        font-size: 0.95rem;
        display: inline-flex;
        align-items: center;
        gap: 0.4rem;
        transition: all 0.3s ease;
      }
      
      .login-footer a:hover {
        color: var(--primary-dark);
        gap: 0.6rem;
      }
      
      /* Credits */
      .credits {
        text-align: center;
        margin-top: 1.5rem;
        color: rgba(255, 255, 255, 0.8);
        font-size: 0.9rem;
      }
      
      .credits a {
        color: white;
        text-decoration: none;
        font-weight: 500;
      }
      
      /* Responsive */
      @media (max-width: 480px) {
        .login-header { padding: 2rem 1.5rem 1.25rem; }
        .login-form { padding: 1.75rem 1.5rem 1.25rem; }
        .login-footer { padding: 1rem 1.5rem 1.25rem; }
        .login-title { font-size: 1.5rem; }
        .login-logo { width: 75px; height: 75px; }
        .login-logo i { font-size: 2.2rem; }
      }
    </style>
  </head>

  <body>
    <!-- Floating Bubbles -->
    <div class="bubbles">
      <div class="bubble"></div>
      <div class="bubble"></div>
      <div class="bubble"></div>
      <div class="bubble"></div>
      <div class="bubble"></div>
      <div class="bubble"></div>
      <div class="bubble"></div>
    </div>
    
    <main>
      <div class="container">
        <section class="min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-5 col-md-7 col-sm-10">
                <!-- Login Card -->
                <div class="login-card">
                  <!-- Header -->
                  <div class="login-header">
                    <div class="login-logo">
                      <i class="bi bi-mortarboard-fill"></i>
                    </div>
                    <h1 class="login-title">Đăng Nhập</h1>
                    <p class="login-subtitle">Hệ thống Quản lý Sinh viên</p>
                  </div>

                  <!-- Form -->
                  <form
                    class="login-form"
                    action="${pageContext.request.contextPath}/taikhoan/dangnhap"
                    method="post" 
                    id="loginForm"
                    novalidate>
                    
                    <!-- Error Messages -->
                    <c:if test="${not empty loiDangNhap}">
                      <div class="error-message">
                        <i class="bi bi-exclamation-triangle-fill"></i>
                        <span><c:out value="${loiDangNhap}" /></span>
                        <c:remove scope="session" var="loiDangNhap" />
                      </div>
                    </c:if>
                    
                    <!-- User ID Field -->
                    <div class="form-floating-custom">
                      <input 
                        type="text" 
                        name="MaNguoiDung" 
                        class="form-control" 
                        id="MaNguoiDung" 
                        value="${not empty MaNguoiDung ? MaNguoiDung : ''}" 
                        placeholder=" "
                        required 
                        autocomplete="username"
                      />
                      <i class="bi bi-person-fill input-icon"></i>
                      <label for="MaNguoiDung">Mã người dùng</label>
                    </div>
                    <c:if test="${not empty loiMaNguoiDung}">
                      <div class="error-message" style="margin-top: -1rem; margin-bottom: 1.25rem;">
                        <i class="bi bi-exclamation-circle"></i>
                        <span><c:out value="${loiMaNguoiDung}" /></span>
                      </div>
                    </c:if>

                    <!-- Password Field -->
                    <div class="form-floating-custom">
                      <input 
                        type="password" 
                        name="MatKhau" 
                        class="form-control" 
                        id="MatKhau" 
                        placeholder=" "
                        required 
                        autocomplete="current-password"
                      />
                      <i class="bi bi-lock-fill input-icon"></i>
                      <label for="MatKhau">Mật khẩu</label>
                      <button type="button" class="password-toggle" onclick="togglePassword()" aria-label="Hiện/ẩn mật khẩu">
                        <i class="bi bi-eye" id="toggleIcon"></i>
                      </button>
                    </div>
                    <c:if test="${not empty loiMatKhau}">
                      <div class="error-message" style="margin-top: -1rem; margin-bottom: 1.25rem;">
                        <i class="bi bi-exclamation-circle"></i>
                        <span><c:out value="${loiMatKhau}" /></span>
                      </div>
                    </c:if>

                    <!-- Remember Me -->
                    <div class="remember-check">
                      <input
                        type="checkbox"
                        name="GhiNho"
                        value="true"
                        id="GhiNho"
                      />
                      <label for="GhiNho">Ghi nhớ đăng nhập</label>
                    </div>

                    <!-- Submit Button -->
                    <button class="btn-login" type="submit" id="btnLogin">
                      <i class="bi bi-box-arrow-in-right"></i>
                      <span>Đăng nhập</span>
                    </button>
                  </form>

                  <!-- Footer -->
                  <div class="login-footer">
                    <a href="${pageContext.request.contextPath}/">
                      <i class="bi bi-arrow-left"></i>
                      Quay lại trang chủ
                    </a>
                  </div>
                </div>

                <!-- Credits -->
                <div class="credits">
                  <p>© <span id="year"></span> <a href="#">Đại học Vinh</a> - Hệ thống Quản lý Sinh viên</p>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
    </main>

    <!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/static/NiceAdmin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
    <script>
      // Set current year
      document.getElementById('year').textContent = new Date().getFullYear();
      
      // Password toggle
      function togglePassword() {
        const passwordInput = document.getElementById('MatKhau');
        const toggleIcon = document.getElementById('toggleIcon');
        
        if (passwordInput.type === 'password') {
          passwordInput.type = 'text';
          toggleIcon.classList.replace('bi-eye', 'bi-eye-slash');
        } else {
          passwordInput.type = 'password';
          toggleIcon.classList.replace('bi-eye-slash', 'bi-eye');
        }
      }
      
      // Form submit loading state
      document.getElementById('loginForm').addEventListener('submit', function(e) {
        const btn = document.getElementById('btnLogin');
        const username = document.getElementById('MaNguoiDung').value.trim();
        const password = document.getElementById('MatKhau').value.trim();
        
        if (username && password) {
          btn.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span>Đang xử lý...';
          btn.disabled = true;
        }
      });
      
      // Focus animations
      document.querySelectorAll('.form-floating-custom input').forEach(input => {
        input.addEventListener('focus', function() {
          this.parentElement.classList.add('focused');
        });
        input.addEventListener('blur', function() {
          this.parentElement.classList.remove('focused');
        });
      });
    </script>
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Cổng Sinh Viên - Đại học Vinh</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/static/assets/img/favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/static/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Inter:wght@100;200;300;400;500;600;700;800;900&family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <!-- Vendor CSS Files -->
    <link href="${pageContext.request.contextPath}/static/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <!-- Main CSS File -->
    <link href="${pageContext.request.contextPath}/static/assets/css/main.css" rel="stylesheet">
</head>
</head>
<body>
    <body class="index-page">
        <header id="header" class="header d-flex align-items-center fixed-top">
            <div class="container-fluid container-xl position-relative d-flex align-items-center">
                <a href="index.jsp" class="logo d-flex align-items-center me-auto">
                    <img src="${pageContext.request.contextPath}/static/assets/img/logo.png" alt="">
                    <h1 class="sitename">Cổng sinh viên</h1>
                </a>
                <nav id="navmenu" class="navmenu">
                    <ul>
                        <li><a href="" class="active">Trang chủ </a></li>
                        <li><a href="">Giới thiệu</a></li>
                        <li><a href="">Liên hệ</a></li>
                    </ul>
                    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav>
                <a class="btn-getstarted" href="${pageContext.request.contextPath}/taikhoan">Tài khoản</a>
            </div>
        </header>
        <main class="main">
            <!-- Hero Section -->
            <section id="hero" class="hero section position-relative" style="min-height: 100vh;">
                <div class="hero-bg position-absolute w-100 h-100 top-0 start-0" style="z-index:0; opacity:0.2;">
                    <img src="${pageContext.request.contextPath}/static/assets/img/hero-bg-light.webp" alt="" class="w-100 h-100 object-fit-cover" style="object-fit:cover;">
                </div>
                <div class="container text-center position-relative" style="z-index:1;">
                    <div class="d-flex flex-column justify-content-center align-items-center" style="min-height: 80vh;">
                        <h1 data-aos="fade-up" class="mb-4">Chào mừng đến với <span class="text-primary">cổng sinh viên</span></h1>
                        <p class="lead mb-4" data-aos="fade-up" data-aos-delay="200">Website hỗ trợ sinh viên Đại học Vinh</p>
                        <img src="${pageContext.request.contextPath}/static/assets/img/Logo-Truong-DH-Vinh-VinhUni.webp" class="img-fluid hero-img mb-4" alt="Logo Đại học Vinh" data-aos="zoom-out" data-aos-delay="220" style="max-width:220px;">
                        <a href="${pageContext.request.contextPath}/taikhoan" class="btn btn-primary btn-lg" data-aos="fade-up" data-aos-delay="300">Đăng nhập</a>
                    </div>
                </div>
            </section>
        </main>
        <footer id="footer" class="footer position-relative light-background">
            <div class="container footer-top">
                <div class="row gy-4">
                    <div class="col-lg-4 col-md-6 footer-about">
                        <a href="index.jsp" class="logo d-flex align-items-center">
                            <span class="sitename">Cổng thực tập</span>
                        </a>
                        <div class="footer-contact pt-3">
                            <p>182 Lê Duẩn</p>
                            <p>Thành phố Vinh, Nghệ An Viet Nam</p>
                            <p class="mt-3"><strong>Điện thoại:</strong> <span>0238 3855 452</span></p>
                            <p><strong>Email:</strong> <span>info@vinhuni.edu.vn</span></p>
                        </div>
                        <div class="social-links d-flex mt-4">
                            <a href="#"><i class="bi bi-facebook"></i></a>
                            <a href="#"><i class="bi bi-youtube"></i></a>
                            <a href="#"><i class="bi bi-envelope"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-3 footer-links">
                        <h4>Liên kết nhanh</h4>
                        <ul>
                            <li><a href="#">Trang chủ</a></li>
                            <li><a href="#">Giới thiệu</a></li>
                            <li><a href="#">Dịch vụ</a></li>
                            <li><a href="#">Điều khoản</a></li>
                            <li><a href="#">Chính sách bảo mật</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-2 col-md-3 footer-links">
                        <h4>Dịch vụ</h4>
                        <ul>
                            <li><a href="#">Thiết kế web</a></li>
                            <li><a href="#">Phát triển phần mềm</a></li>
                            <li><a href="#">Quản lý sản phẩm</a></li>
                            <li><a href="#">Marketing</a></li>
                            <li><a href="#">Thiết kế đồ họa</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-4 col-md-12 footer-newsletter">
                        <h4>Bản tin</h4>
                        <p>Đăng ký nhận thông tin mới nhất về thực tập và các dịch vụ hỗ trợ sinh viên!</p>
                        <form action="#" method="post" class="php-email-form">
                            <div class="newsletter-form"><input type="email" name="email" placeholder="Nhập email..."><input type="submit" value="Đăng ký"></div>
                            <div class="loading">Đang gửi...</div>
                            <div class="error-message"></div>
                            <div class="sent-message">Đăng ký nhận tin thành công. Xin cảm ơn!</div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="container copyright text-center mt-4">
                <p>© <span>Bản quyền</span> <strong class="px-1 sitename">Cổng thực tập</strong><span>Đại học Vinh. Đã đăng ký bảo hộ.</span></p>
                <div class="credits">
                    Thiết kế bởi <a href="https://vinhuni.edu.vn/">Đại học Vinh</a>
                </div>
            </div>
        </footer>
        <!-- Scroll Top -->
        <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
        <!-- Preloader -->
        <div id="preloader"></div>
        <!-- Vendor JS Files -->
        <script src="${pageContext.request.contextPath}/static/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/assets/vendor/php-email-form/validate.js"></script>
        <script src="${pageContext.request.contextPath}/static/assets/vendor/aos/aos.js"></script>
        <script src="${pageContext.request.contextPath}/static/assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/assets/vendor/swiper/swiper-bundle.min.js"></script>
        <!-- Main JS File -->
        <script src="${pageContext.request.contextPath}/static/assets/js/main.js"></script>
    </body>
    <!-- Vendor JS Files -->
    <script src="${pageContext.request.contextPath}/static/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/vendor/aos/aos.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/main.js"></script>
</body>
</html>
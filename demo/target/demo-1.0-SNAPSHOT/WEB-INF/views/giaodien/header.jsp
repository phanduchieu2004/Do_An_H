<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!-- ======= Modern Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">
  <div class="d-flex align-items-center justify-content-between">
    <a href="index.html" class="logo d-flex align-items-center">
      <img
        src="${pageContext.request.contextPath}/static/NiceAdmin/assets/img/logo.png"
        alt=""
      />
      <span class="d-none d-lg-block">Cổng sinh viên</span>
    </a>
    <i class="bi bi-list toggle-sidebar-btn"></i>
  </div>
  <!-- End Logo -->

  <div class="search-bar">
    <form
      class="search-form d-flex align-items-center"
      method="POST"
      action="#"
    >
      <input
        type="text"
        name="query"
        placeholder="Tìm kiếm..."
        title="Tìm kiếm..."
      />
      <button type="submit" title="Search"><i class="bi bi-search"></i></button>
    </form>
  </div>
  <!-- End Search Bar -->
  
  <nav class="header-nav ms-auto">
    <ul class="d-flex align-items-center">
      <li class="nav-item d-block d-lg-none">
        <a class="nav-link nav-icon search-bar-toggle" href="#">
          <i class="bi bi-search"></i>
        </a>
      </li>
      <!-- End Search Icon-->

      <!-- Notifications -->
      <li class="nav-item dropdown">
        <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
          <i class="bi bi-bell"></i>
          <span class="badge bg-primary badge-number">0</span>
        </a>
        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
          <li class="dropdown-header">
            Không có thông báo mới
          </li>
        </ul>
      </li>
      <!-- End Notification Nav -->

      <!-- Set avatar variable based on role and account ID (MSSV/MaGV) -->
      <c:set var="userAvatar" value="" />
      <c:choose>
        <c:when test="${not empty sessionScope.SS_Anh}">
          <c:set var="userAvatar" value="${sessionScope.SS_Anh}" />
        </c:when>
        <c:when test="${not empty sessionScope.SS_TaiKhoan}">
          <!-- Try to find avatar by account ID (format: MSSV.jpg or MaGV.jpg) -->
          <c:set var="userAvatar" value="${sessionScope.SS_TaiKhoan}.jpg" />
        </c:when>
        <c:when test="${sessionScope.SS_VaiTro == 'SinhVien' and not empty sinhVien.AnhSV}">
          <c:set var="userAvatar" value="${sinhVien.AnhSV}" />
        </c:when>
        <c:when test="${sessionScope.SS_VaiTro == 'GiangVien' and not empty giangVien.AnhGV}">
          <c:set var="userAvatar" value="${giangVien.AnhGV}" />
        </c:when>
      </c:choose>
      
      <li class="nav-item dropdown pe-3">
        <a
          class="nav-link nav-profile d-flex align-items-center pe-0"
          href="#"
          data-bs-toggle="dropdown"
        >
          <!-- User Avatar - Dynamic based on login -->
          <c:choose>
            <c:when test="${not empty userAvatar}">
              <img
                src="${pageContext.request.contextPath}/static/uploads/${userAvatar}"
                alt="Profile"
                class="rounded-circle"
                style="width: 36px; height: 36px; object-fit: cover; border: 2px solid #E2E8F0;"
                onerror="this.onerror=null; this.parentElement.innerHTML='<div class=\'rounded-circle d-flex align-items-center justify-content-center\' style=\'width: 36px; height: 36px; background: linear-gradient(135deg, #2563EB, #1D4ED8); border: 2px solid #E2E8F0;\'><i class=\'bi bi-person-fill text-white\' style=\'font-size: 1rem;\'></i></div>';"
              />
            </c:when>
            <c:otherwise>
              <div class="rounded-circle d-flex align-items-center justify-content-center"
                   style="width: 36px; height: 36px; background: linear-gradient(135deg, #2563EB, #1D4ED8); border: 2px solid #E2E8F0;">
                <i class="bi bi-person-fill text-white" style="font-size: 1rem;"></i>
              </div>
            </c:otherwise>
          </c:choose>
          <span class="d-none d-md-block dropdown-toggle ps-2">
            ${sessionScope.SS_HoTen}
          </span>
        </a>
        <!-- End Profile Image Icon -->

        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
          <li class="dropdown-header">
            <div class="d-flex align-items-center">
              <c:choose>
                <c:when test="${not empty userAvatar}">
                  <img
                    src="${pageContext.request.contextPath}/static/uploads/${userAvatar}"
                    alt="Profile"
                    class="rounded-circle me-3"
                    style="width: 50px; height: 50px; object-fit: cover;"
                    onerror="this.onerror=null; this.parentElement.innerHTML='<div class=\'rounded-circle d-flex align-items-center justify-content-center me-3\' style=\'width: 50px; height: 50px; background: linear-gradient(135deg, #2563EB, #1D4ED8);\'><i class=\'bi bi-person-fill text-white\' style=\'font-size: 1.5rem;\'></i></div>' + this.parentElement.innerHTML.split('</img>')[1];"
                  />
                </c:when>
                <c:otherwise>
                  <div class="rounded-circle d-flex align-items-center justify-content-center me-3"
                       style="width: 50px; height: 50px; background: linear-gradient(135deg, #2563EB, #1D4ED8);">
                    <i class="bi bi-person-fill text-white" style="font-size: 1.5rem;"></i>
                  </div>
                </c:otherwise>
              </c:choose>
              <div>
                <h6 class="mb-0">${sessionScope.SS_HoTen}</h6>
                <span class="text-muted small">
                  <c:choose>
                    <c:when test="${sessionScope.SS_VaiTro == 'SinhVien'}">Sinh viên - MSSV: ${sessionScope.SS_TaiKhoan}</c:when>
                    <c:when test="${sessionScope.SS_VaiTro == 'GiangVien'}">Giảng viên - Mã GV: ${sessionScope.SS_TaiKhoan}</c:when>
                    <c:when test="${sessionScope.SS_VaiTro == 'Admin'}">Quản trị viên</c:when>
                    <c:otherwise>${sessionScope.SS_VaiTro}</c:otherwise>
                  </c:choose>
                </span>
                <p class="text-muted small mb-0">${sessionScope.SS_Email}</p>
              </div>
            </div>
          </li>
          <li>
            <hr class="dropdown-divider" />
          </li>

          <li>
            <c:choose>
              <c:when test="${sessionScope.SS_VaiTro == 'SinhVien'}">
                <a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/sinhvien/hoso">
                  <i class="bi bi-person me-2"></i>
                  <span>Hồ sơ của tôi</span>
                </a>
              </c:when>
              <c:when test="${sessionScope.SS_VaiTro == 'GiangVien'}">
                <a class="dropdown-item d-flex align-items-center" href="${pageContext.request.contextPath}/giangvien/hoso">
                  <i class="bi bi-person me-2"></i>
                  <span>Hồ sơ của tôi</span>
                </a>
              </c:when>
              <c:otherwise>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <i class="bi bi-person me-2"></i>
                  <span>Hồ sơ của tôi</span>
                </a>
              </c:otherwise>
            </c:choose>
          </li>
          <li>
            <hr class="dropdown-divider" />
          </li>

          <li>
            <a class="dropdown-item d-flex align-items-center" href="#">
              <i class="bi bi-gear me-2"></i>
              <span>Cài đặt</span>
            </a>
          </li>
          <li>
            <hr class="dropdown-divider" />
          </li>

          <li>
            <a class="dropdown-item d-flex align-items-center text-danger" href="${pageContext.request.contextPath}/dangxuat">
              <i class="bi bi-box-arrow-right me-2"></i>
              <span>Đăng xuất</span>
            </a>
          </li>
        </ul>
        <!-- End Profile Dropdown Items -->
      </li>
      <!-- End Profile Nav -->
    </ul>
  </nav>
  <!-- End Icons Navigation -->
</header>
<!-- End Header -->

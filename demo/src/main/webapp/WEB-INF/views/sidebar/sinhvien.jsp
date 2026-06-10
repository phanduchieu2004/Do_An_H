<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!-- ======= Modern Sidebar ======= -->
<aside id="sidebar" class="sidebar">
  <ul class="sidebar-nav" id="sidebar-nav">
    <!-- Home -->
    <li class="nav-item">
      <a
        class="nav-link collapsed"
        href="${pageContext.request.contextPath}/sinhvien"
      >
        <i class="bi bi-house-door"></i>
        <span>Trang chủ</span>
      </a>
    </li>
    <!-- Ho so sinh vien -->
    <li class="nav-item">
      <a
        class="nav-link collapsed"
        href="${pageContext.request.contextPath}/sinhvien/hoso"
      >
        <i class="bi bi-person-badge"></i>
        <span>Hồ sơ sinh viên</span>
      </a>
    </li>
    <!-- bang diem -->
    <li class="nav-item">
      <a
        class="nav-link collapsed"
        href="${pageContext.request.contextPath}/sinhvien/danhsachketqua/xem"
      >
        <i class="bi bi-bar-chart-line"></i>
        <span>Bảng điểm</span>
      </a>
    </li>

    <!-- Dang ky-->
    <li class="nav-item">
      <a
        class="nav-link collapsed"
        data-bs-target="#dangky"
        data-bs-toggle="collapse"
        href="#"
      >
        <i class="bi bi-journal-plus"></i>
        <span>Đăng ký</span>
        <i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul
        id="dangky"
        class="nav-content collapse"
        data-bs-parent="#sidebar-nav"
      >
        <li>
          <a
            href="${pageContext.request.contextPath}/sinhvien/dangkylophocphan"
          >
            <i class="bi bi-circle"></i>
            <span>Đăng ký học phần</span>
          </a>
        </li>
        <li>
          <a
            href="${pageContext.request.contextPath}/sinhvien/dangkylophocphan/dadangky"
          >
            <i class="bi bi-circle"></i>
            <span>Học phần đã đăng ký</span>
          </a>
        </li>
      </ul>
    </li>

    <!-- het  -->
  </ul>
</aside>
<!-- End Sidebar-->

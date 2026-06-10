<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!-- ======= Modern Sidebar ======= -->
<aside id="sidebar" class="sidebar">
  <ul class="sidebar-nav" id="sidebar-nav">
    <!-- Home -->
    <li class="nav-item">
      <a class="nav-link" href="${pageContext.request.contextPath}/admin">
        <i class="bi bi-house-door"></i>
        <span>Trang chủ</span>
      </a>
    </li>

    <!-- Quan ly sinh vien -->
    <li class="nav-item">
      <a
        class="nav-link collapsed"
        data-bs-target="#quanlysinhvien"
        data-bs-toggle="collapse"
        href="#">
        <i class="bi bi-mortarboard"></i>
        <span>Quản lý sinh viên</span>
        <i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul
        id="quanlysinhvien"
        class="nav-content collapse"
        data-bs-parent="#sidebar-nav">
        <li>
          <a
            href="${pageContext.request.contextPath}/admin/danhsachsinhvien/index">
            <i class="bi bi-circle"></i>
            <span>Danh sách sinh viên</span>
          </a>
        </li>
        <li>
          <a
            href="${pageContext.request.contextPath}/admin/danhsachketqua/index">
            <i class="bi bi-circle"></i>
            <span>Danh sách kết quả</span>
          </a>
        </li>
      </ul>
    </li>
    <!-- quản lý giảng viên -->
    <li class="nav-item">
      <a
        class="nav-link collapsed"
        data-bs-target="#quanlygiangvien"
        data-bs-toggle="collapse"
        href="#">
        <i class="bi bi-person-workspace"></i>
        <span>Quản lý giảng viên</span>
        <i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul
        id="quanlygiangvien"
        class="nav-content collapse"
        data-bs-parent="#sidebar-nav">
        <li>
          <a
            href="${pageContext.request.contextPath}/admin/danhsachgiangvien/index">
            <i class="bi bi-circle"></i>
            <span>Danh sách giảng viên</span>
          </a>
        </li>

      </ul>
    </li>
    <!-- Quan ly nganh -->
    <li class="nav-item">
      <a
        class="nav-link collapsed"
        data-bs-target="#quanlynganh"
        data-bs-toggle="collapse"
        href="#">
        <i class="bi bi-diagram-3"></i>
        <span>Quản lý ngành</span>
        <i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul
        id="quanlynganh"
        class="nav-content collapse"
        data-bs-parent="#sidebar-nav">
        <li>
          <a
            href="${pageContext.request.contextPath}/admin/danhsachnganh/index">
            <i class="bi bi-circle"></i>
            <span>Danh sách ngành</span>
          </a>
        </li>
      </ul>
    </li>

    <!-- Quan ly vien -->
    <li class="nav-item">
      <a
        class="nav-link collapsed"
        data-bs-target="#quanlyvien"
        data-bs-toggle="collapse"
        href="#">
        <i class="bi bi-building"></i>
        <span>Quản lý viện</span>
        <i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul
        id="quanlyvien"
        class="nav-content collapse"
        data-bs-parent="#sidebar-nav">
        <li>
          <a href="${pageContext.request.contextPath}/admin/danhsachvien/index">
            <i class="bi bi-circle"></i>
            <span>Danh sách viện</span>
          </a>
        </li>
      </ul>
    </li>
    <!-- Quan ly khoa -->
    <li class="nav-item">
      <a
        class="nav-link collapsed"
        data-bs-target="#quanlykhoa"
        data-bs-toggle="collapse"
        href="#">
        <i class="bi bi-calendar-range"></i>
        <span>Quản lý khoa</span>
        <i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul
        id="quanlykhoa"
        class="nav-content collapse"
        data-bs-parent="#sidebar-nav">
        <li>
          <a href="${pageContext.request.contextPath}/admin/danhsachkhoa/index">
            <i class="bi bi-circle"></i>
            <span>Danh sách Khoa</span>
          </a>
        </li>
      </ul>
    </li>
    <!-- Quan ly lop -->
    <li class="nav-item">
      <a
        class="nav-link collapsed"
        data-bs-target="#quanlylop"
        data-bs-toggle="collapse"
        href="#">
        <i class="bi bi-people"></i>
        <span>Quản lý lớp</span>
        <i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul
        id="quanlylop"
        class="nav-content collapse"
        data-bs-parent="#sidebar-nav">
        <li>
          <a href="${pageContext.request.contextPath}/admin/danhsachlop/index">
            <i class="bi bi-circle"></i>
            <span>Danh sách lớp</span>
          </a>
        </li>
      </ul>
    </li>

    <!-- Quan ly hoc phan -->
    <li class="nav-item">
      <a
        class="nav-link collapsed"
        data-bs-target="#quanlyhocphan"
        data-bs-toggle="collapse"
        href="#">
        <i class="bi bi-book"></i>
        <span>Quản lý học phần</span>
        <i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul
        id="quanlyhocphan"
        class="nav-content collapse"
        data-bs-parent="#sidebar-nav">
        <li>
          <a
            href="${pageContext.request.contextPath}/admin/danhsachhocphan/index">
            <i class="bi bi-circle"></i>
            <span>Danh sách học phần</span>
          </a>
        </li>
      </ul>
    </li>
    <!-- het  -->

    <!-- Quan ly lop hoc phan -->
    <li class="nav-item">
      <a
        class="nav-link collapsed"
        data-bs-target="#quanlylophocphan"
        data-bs-toggle="collapse"
        href="#">
        <i class="bi bi-journal-bookmark"></i>
        <span>Quản lý lớp học phần</span>
        <i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul
        id="quanlylophocphan"
        class="nav-content collapse"
        data-bs-parent="#sidebar-nav">
        <li>
          <a
            href="${pageContext.request.contextPath}/admin/danhsachlophocphan/index">
            <i class="bi bi-circle"></i>
            <span>Danh sách lớp học phần</span>
          </a>
        </li>
      </ul>
    </li>
    <!-- het  -->
    <!-- Quan ly tai khoan -->
    <li class="nav-item">
      <a
        class="nav-link collapsed"
        data-bs-target="#quanlytaikhoan"
        data-bs-toggle="collapse"
        href="#">
        <i class="bi bi-person-gear"></i>
        <span>Quản lý tài khoản</span>
        <i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul
        id="quanlytaikhoan"
        class="nav-content collapse"
        data-bs-parent="#sidebar-nav">
        <li>
          <a
            href="${pageContext.request.contextPath}/admin/danhsachtaikhoan/index">
            <i class="bi bi-circle"></i>
            <span>Danh sách tài khoản</span>
          </a>
        </li>
      </ul>
    </li>
    <!-- het  -->
    <!-- Quan ly sinh vien -->
    <li class="nav-item">
      <a
        class="nav-link collapsed"
        data-bs-target="#quanlydangkyhocphan"
        data-bs-toggle="collapse"
        href="#">
        <i class="bi bi-clipboard-check"></i>
        <span>Quản lý đăng ký học phần</span>
        <i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul
        id="quanlydangkyhocphan"
        class="nav-content collapse"
        data-bs-parent="#sidebar-nav">
        <li>
          <a
            href="${pageContext.request.contextPath}/admin/danhsachdangkyhocphan/index">
            <i class="bi bi-circle"></i>
            <span>Danh sách sinh viên</span>
          </a>
        </li>

      </ul>
    </li>
  </ul>
</aside>
<!-- End Sidebar-->

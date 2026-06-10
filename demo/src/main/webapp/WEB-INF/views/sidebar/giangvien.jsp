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
        href="${pageContext.request.contextPath}/giangvien"
      >
        <i class="bi bi-house-door"></i>
        <span>Trang chủ</span>
      </a>
    </li>
    <!-- Ho so giang vien -->
    <li class="nav-item">
      <a
        class="nav-link collapsed"
        href="${pageContext.request.contextPath}/giangvien/hoso"
      >
        <i class="bi bi-person-badge"></i>
        <span>Hồ sơ giảng viên</span>
      </a>
    </li>
    <!-- lop hoc phan -->
    <li class="nav-item">
      <a
        class="nav-link collapsed"
        href="${pageContext.request.contextPath}/giangvien/danhsachketqua/index"
      >
        <i class="bi bi-journal-bookmark"></i>
        <span>Danh sách lớp học phần</span>
      </a>
    </li>
  

    <!-- het  -->
  </ul>
</aside>
<!-- End Sidebar-->

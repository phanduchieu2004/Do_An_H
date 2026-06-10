<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!-- ======= Modern Footer ======= -->
<footer id="footer" class="footer">
    <div class="copyright">
      &copy; <span id="currentYear"></span> <strong><span>Quản lý sinh viên</span></strong>. Đại học Vinh - All Rights Reserved
    </div>
    <div class="credits">
      Thiết kế bởi <a href="https://vinhuni.edu.vn/">Đại học Vinh</a>
    </div>
  </footer><!-- End Footer -->

  <!-- Back to Top -->
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center">
    <i class="bi bi-arrow-up-short"></i>
  </a>

  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/static/NiceAdmin/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="${pageContext.request.contextPath}/static/NiceAdmin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/static/NiceAdmin/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="${pageContext.request.contextPath}/static/NiceAdmin/assets/vendor/echarts/echarts.min.js"></script>
  <script src="${pageContext.request.contextPath}/static/NiceAdmin/assets/vendor/quill/quill.js"></script>
  <script src="${pageContext.request.contextPath}/static/NiceAdmin/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="${pageContext.request.contextPath}/static/NiceAdmin/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="${pageContext.request.contextPath}/static/NiceAdmin/assets/vendor/php-email-form/validate.js"></script>
  <script src="${pageContext.request.contextPath}/static/NiceAdmin/assets/js/main.js"></script>
  
  <!-- Modern UI JS -->
  <script src="${pageContext.request.contextPath}/static/NiceAdmin/assets/js/modern-ui.js"></script>
  
  <script>
    // Set current year
    document.getElementById('currentYear').textContent = new Date().getFullYear();
  </script>


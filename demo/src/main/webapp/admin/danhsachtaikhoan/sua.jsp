<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Sửa tài khoản</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />
    <jsp:include page="/WEB-INF/views/giaodien/head.jsp" />
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/giaodien/header.jsp" />
    <jsp:include page="/WEB-INF/views/sidebar/admin.jsp" />
    <main id="main" class="main">
      <div class="pagetitle">
        <h1>Quản lý tài khoản</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">Trang chủ</li>
            <li class="breadcrumb-item active">Sửa tài khoản</li>
          </ol>
        </nav>
      </div>
      <div class="container shadow p-4">
        <form action="${pageContext.request.contextPath}/admin/danhsachtaikhoan/sua" method="post">
          <div class="row">
            <div class="form-group col-md-6 mb-3">
              <label>Mã tài khoản</label>
              <input type="text" class="form-control" name="MaNguoiDung" value="${tk.MaNguoiDung}" readonly/>
              <c:if test="${not empty loiMaNguoiDung}">
                <small class="text-danger"><c:out value="${loiMaNguoiDung}" /></small>
              </c:if>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Mật khẩu</label>
              <input type="text" class="form-control" name="MatKhau" value="${tk.MatKhau}" />
              <c:if test="${not empty loiMatKhau}">
                <small class="text-danger">${loiMatKhau}</small>
              </c:if>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Chức vụ</label>
              <input type="text" class="form-control" name="ChucVu" value="${tk.ChucVu}" />
              <c:if test="${not empty loiChucVu}">
                <small class="text-danger">${loiChucVu}</small>
              </c:if>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Trạng thái</label>
              <input type="text" class="form-control" name="TrangThaiTaiKhoan" value="${tk.TrangThaiTaiKhoan}" />
              <c:if test="${not empty loiTrangThaiTaiKhoan}">
                <small class="text-danger">${loiTrangThaiTaiKhoan}</small>
              </c:if>
            </div>
          </div>
          <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/danhsachtaikhoan/index">Quay lại</a>
          <button type="submit" class="btn btn-primary">Sửa</button>
        </form>
      </div>
    </main>
    <jsp:include page="/WEB-INF/views/giaodien/footer.jsp" />
  </body>
</html>

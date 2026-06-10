<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Thêm khoa</title>
    <jsp:include page="/WEB-INF/views/giaodien/head.jsp" />
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/giaodien/header.jsp" />
    <jsp:include page="/WEB-INF/views/sidebar/admin.jsp" />
    <main id="main" class="main">
      <div class="pagetitle">
        <h1>Quản lý khoa</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">Trang chủ</li>
            <li class="breadcrumb-item active">Thêm khoa</li>
          </ol>
        </nav>
      </div>
      <div class="container shadow p-4">
        <form action="${pageContext.request.contextPath}/admin/danhsachkhoa/them" method="post">
          <div class="row">
            <div class="form-group col-md-6 mb-3">
              <label>Mã khoa</label>
              <input type="text" class="form-control" name="MaKhoa" value="${not empty MaKhoa ? MaKhoa : ''}" />
              <c:if test="${not empty loiMaKhoa}"><small class="text-danger">${loiMaKhoa}</small></c:if>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Tên khoa</label>
              <input type="text" class="form-control" name="TenKhoa" value="${not empty TenKhoa ? TenKhoa : ''}" />
              <c:if test="${not empty loiTenKhoa}"><small class="text-danger">${loiTenKhoa}</small></c:if>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Viện</label>
              <select name="MaVien" class="form-select">
                <option value="">-- Chọn viện --</option>
                <c:forEach var="vien" items="${danhSachVien}">
                  <option value="${vien.MaVien}" <c:if test="${not empty MaVien and MaVien == vien.MaVien}">selected</c:if>>${vien.TenVien}</option>
                </c:forEach>
              </select>
              <c:if test="${not empty loiMaVien}"><small class="text-danger">${loiMaVien}</small></c:if>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Tên trưởng khoa</label>
              <input type="text" class="form-control" name="TenTruongKhoa" value="${not empty TenTruongKhoa ? TenTruongKhoa : ''}" />
              <c:if test="${not empty loiTenTruongKhoa}"><small class="text-danger">${loiTenTruongKhoa}</small></c:if>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Số điện thoại</label>
              <input type="text" class="form-control" name="SoDienThoaiKhoa" value="${not empty SoDienThoaiKhoa ? SoDienThoaiKhoa : ''}" />
              <c:if test="${not empty loiSoDienThoaiKhoa}"><small class="text-danger">${loiSoDienThoaiKhoa}</small></c:if>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Email</label>
              <input type="text" class="form-control" name="EmailKhoa" value="${not empty EmailKhoa ? EmailKhoa : ''}" />
              <c:if test="${not empty loiEmailKhoa}"><small class="text-danger">${loiEmailKhoa}</small></c:if>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Ngày thành lập</label>
              <input type="date" class="form-control" name="NgayThanhLapKhoa" value="${not empty NgayThanhLapKhoa ? NgayThanhLapKhoa : ''}" />
              <c:if test="${not empty loiNgayThanhLapKhoa}"><small class="text-danger">${loiNgayThanhLapKhoa}</small></c:if>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Mô tả</label>
              <textarea class="form-control" name="MoTaKhoa" rows="3">${not empty MoTaKhoa ? MoTaKhoa : ''}</textarea>
            </div>
          </div>
          <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/danhsachkhoa/index">Quay lại</a>
          <button type="submit" class="btn btn-primary">Thêm</button>
        </form>
      </div>
    </main>
    <jsp:include page="/WEB-INF/views/giaodien/footer.jsp" />
  </body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Thêm lớp</title>
    <jsp:include page="/WEB-INF/views/giaodien/head.jsp" />
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/giaodien/header.jsp" />
    <jsp:include page="/WEB-INF/views/sidebar/admin.jsp" />
    <main id="main" class="main">
      <div class="pagetitle">
        <h1>Quản lý lớp</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">Trang chủ</li>
            <li class="breadcrumb-item active">Thêm lớp</li>
          </ol>
        </nav>
      </div>
      <div class="container shadow p-4">
        <form action="${pageContext.request.contextPath}/admin/danhsachlop/them" method="post">
          <div class="row">
            <div class="form-group col-md-6 mb-3">
              <label>Mã lớp</label>
              <input type="text" class="form-control" name="MaLop" value="${not empty MaLop ? MaLop : ''}" />
              <c:if test="${not empty loiMaLop}"><small class="text-danger">${loiMaLop}</small></c:if>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Tên lớp</label>
              <input type="text" class="form-control" name="TenLop" value="${not empty TenLop ? TenLop : ''}" />
              <c:if test="${not empty loiTenLop}"><small class="text-danger">${loiTenLop}</small></c:if>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Khóa học</label>
              <input type="number" class="form-control" name="KhoaHoc" value="${not empty KhoaHoc ? KhoaHoc : ''}" />
              <c:if test="${not empty loiKhoaHoc}"><small class="text-danger">${loiKhoaHoc}</small></c:if>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Mã ngành</label>
              <select name="MaNganh" class="form-select">
                <option value="">-- Chọn ngành --</option>
                <c:forEach var="nganh" items="${danhSachNganh}">
                  <option value="${nganh.MaNganh}" <c:if test="${not empty MaNganh and MaNganh == nganh.MaNganh}">selected</c:if>>${nganh.TenNganh}</option>
                </c:forEach>
              </select>
              <c:if test="${not empty loiMaNganh}"><small class="text-danger">${loiMaNganh}</small></c:if>
            </div>
          </div>
          <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/danhsachlop/index">Quay lại</a>
          <button type="submit" class="btn btn-primary">Thêm</button>
        </form>
      </div>
    </main>
    <jsp:include page="/WEB-INF/views/giaodien/footer.jsp" />
  </body>
</html>

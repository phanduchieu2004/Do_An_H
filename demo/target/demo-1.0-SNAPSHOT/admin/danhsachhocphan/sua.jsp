<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Sửa học phần</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Include CSS files -->
    <jsp:include page="/WEB-INF/views/giaodien/head.jsp" />
  </head>

  <body>
    <!-- Include header -->
    <jsp:include page="/WEB-INF/views/giaodien/header.jsp" />

    <!-- Include sidebar -->
    <jsp:include page="/WEB-INF/views/sidebar/admin.jsp" />

    <main id="main" class="main">

      <!-- Phần đầu trang -->
      <div class="pagetitle">
        <h1>Quản lý học phần</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">Trang chủ</li>
            <li class="breadcrumb-item active">Sửa học phần</li>

          </ol>
        </nav>
      </div>

      <!-- Mục chính -->
      <div class="container shadow p-4">
        <form
      action="${pageContext.request.contextPath}/admin/danhsachhocphan/sua"
      method="post">

  <div class="row">
    <div class="form-group col-md-6 mb-3">
      <label>Mã học phần</label>
      <input type="text" class="form-control" name="MaHocPhan" value="${hp.MaHocPhan}" readonly/>
      <c:if test="${not empty loiMaHocPhan}">
        <small class="text-danger"><c:out value="${loiMaHocPhan}" /></small>
      </c:if>
    </div>
    <div class="form-group col-md-6 mb-3">
      <label>Tên học phần</label>
      <input type="text" class="form-control" name="TenHocPhan" value="${hp.TenHocPhan}" />
      <c:if test="${not empty loiTenHocPhan}">
        <small class="text-danger">${loiTenHocPhan}</small>
      </c:if>
    </div>
    <div class="form-group col-md-6 mb-3">
      <label>Số tín chỉ</label>
      <input type="number" class="form-control" name="SoTinChi" value="${hp.SoTinChi}" />
      <c:if test="${not empty loiSoTinChi}">
        <small class="text-danger">${loiSoTinChi}</small>
      </c:if>
    </div>
    <div class="form-group col-md-6 mb-3">
      <label>Học kỳ</label>
      <input type="number" class="form-control" name="HocKy" value="${hp.HocKy}" />
      <c:if test="${not empty loiHocKy}">
        <small class="text-danger">${loiHocKy}</small>
      </c:if>
    </div>
    <div class="form-group col-md-6 mb-3">
      <label>Ngành học</label>
      <select class="form-control" name="MaNganh">
        <c:forEach var="nganh" items="${danhSachNganh}">
          <option value="${nganh.MaNganh}" <c:if test="${hp.MaNganh == nganh.MaNganh}">selected</c:if>>
            ${nganh.TenNganh}
          </option>
        </c:forEach>
      </select>
      <c:if test="${not empty loiMaNganh}">
        <small class="text-danger">${loiMaNganh}</small>
      </c:if>
    </div>
    <div class="form-group col-md-12 mb-3">
      <label>Mô tả học phần</label>
      <textarea class="form-control" name="MoTaHocPhan">${hp.MoTaHocPhan}</textarea>
    </div>
  </div>

  <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/danhsachhocphan">Quay lại</a>
  <button type="submit" class="btn btn-primary">Sửa</button>
</form>

      </div>
    </main>

    <!-- Include footer -->
    <jsp:include page="/WEB-INF/views/giaodien/footer.jsp" />
  </body>
</html>

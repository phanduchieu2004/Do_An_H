<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Thêm viện</title>
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
        <h1>Quản lý viện</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">Trang chủ</li>
            <li class="breadcrumb-item active">Thêm viện</li>
          </ol>
        </nav>
      </div>

      <!-- Mục chính -->
      <div class="container shadow p-4">
        <form
          action="${pageContext.request.contextPath}/admin/danhsachvien/them"
          method="post"
        >
          <div class="row">
            <div class="form-group col-md-6 mb-3">
              <label>Mã viện</label>
              <input
                type="text"
                class="form-control"
                name="MaVien"
                value="${not empty MaVien ? MaVien : ''}"
              />
              <c:if test="${not empty loiMaVien}">
                <small class="text-danger">${loiMaVien}</small>
              </c:if>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Tên viện</label>
              <input
                type="text"
                class="form-control"
                name="TenVien"
                value="${not empty TenVien ? TenVien : ''}"
              />
              <c:if test="${not empty loiTenVien}">
                <small class="text-danger">${loiTenVien}</small>
              </c:if>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Trưởng viện</label>
              <input
                type="text"
                class="form-control"
                name="TenTruongVien"
                value="${not empty TenTruongVien ? TenTruongVien : ''}"
              />
              <c:if test="${not empty loiTenTruongVien}">
                <small class="text-danger">${loiTenTruongVien}</small>
              </c:if>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Số điện thoại</label>
              <input
                type="text"
                class="form-control"
                name="SoDienThoaiVien"
                value="${not empty SoDienThoaiVien ? SoDienThoaiVien : ''}"
              />
              <c:if test="${not empty loiSoDienThoaiVien}">
                <small class="text-danger">${loiSoDienThoaiVien}</small>
              </c:if>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Email</label>
              <input
                type="email"
                class="form-control"
                name="EmailVien"
                value="${not empty EmailVien ? EmailVien : ''}"
              />
              <c:if test="${not empty loiEmailVien}">
                <small class="text-danger">${loiEmailVien}</small>
              </c:if>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Ngày thành lập</label>
              <input
                type="date"
                class="form-control"
                name="NgayThanhLapVien"
                value="${not empty NgayThanhLapVien ? NgayThanhLapVien : ''}"
              />
              <c:if test="${not empty loiNgayThanhLapVien}">
                <small class="text-danger">${loiNgayThanhLapVien}</small>
              </c:if>
            </div>
          </div>
          <a
            class="btn btn-secondary"
            href="${pageContext.request.contextPath}/admin/danhsachvien/index"
            >Quay lại</a
          >
          <button type="submit" class="btn btn-primary">Thêm</button>
        </form>
      </div>
    </main>

    <!-- Include footer -->
    <jsp:include page="/WEB-INF/views/giaodien/footer.jsp" />
  </body>
</html>

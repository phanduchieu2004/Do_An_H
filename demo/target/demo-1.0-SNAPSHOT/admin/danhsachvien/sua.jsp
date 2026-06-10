<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Sửa viện</title>
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
            <li class="breadcrumb-item active">Sửa viện</li>

          </ol>
        </nav>
      </div>

      <!-- Mục chính -->
      <div class="container shadow p-4">
        <form
          action="${pageContext.request.contextPath}/admin/danhsachvien/sua"
          method="post"
        >
          <div class="row">
            <div class="form-group col-md-6 mb-3">
              <label>Mã viện</label>
              <input type="text" class="form-control" name="MaVien" value="${vien.MaVien}" readonly/>
              <c:if test="${not empty loiMaVien}">
                <small class="text-danger"><c:out value="${loiMaVien}" /></small>
              </c:if>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Tên viện</label>
              <input
                type="text"
                class="form-control"
                name="TenVien"
                value="${vien.TenVien}"
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
                value="${not empty vien.TenTruongVien ? vien.TenTruongVien : ''}"
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
                value="${not empty vien.SoDienThoaiVien ? vien.SoDienThoaiVien : ''}"
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
                value="${not empty vien.EmailVien ? vien.EmailVien : ''}"
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
                value="${not empty vien.NgayThanhLapVien ? vien.NgayThanhLapVien : ''}"
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
          <button type="submit" class="btn btn-primary">Sửa</button>
        </form>
      </div>
    </main>

    <!-- Include footer -->
    <jsp:include page="/WEB-INF/views/giaodien/footer.jsp" />
  </body>
</html>

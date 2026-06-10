<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Danh sách học phần</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- CSS files -->
    <jsp:include page="/WEB-INF/views/giaodien/head.jsp" />
  </head>

  <body>
    <!-- Header -->
    <jsp:include page="/WEB-INF/views/giaodien/header.jsp" />

    <!-- Sidebar -->
    <jsp:include page="/WEB-INF/views/sidebar/admin.jsp" />

    <main id="main" class="main">
      <!-- Phần thông báo -->
      <c:if test="${not empty thongBao}">
        <div
          class="alert alert-success alert-dismissible fade show"
          role="alert"
        >
          <strong>Thông báo:</strong>
          <c:out value="${thongBao}" />
          <c:remove scope="session" var="thongBao" />
          <button
            type="button"
            class="btn-close"
            data-bs-dismiss="alert"
            aria-label="Close"
          ></button>
        </div>
      </c:if>

      <!-- Phần đầu trang -->
      <div class="pagetitle">
        <h1>Quản lý học phần</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">Trang chủ</li>
            <li class="breadcrumb-item active">Danh sách học phần</li>
          </ol>
        </nav>
      </div>

      <!-- Nút Thêm học phần -->
     <a
        class="btn btn-danger btn-sm"
        href="${pageContext.request.contextPath}/admin/danhsachhocphan/them"
        >Thêm</a
      >
<!-- Form lọc -->
<div class="d-flex justify-content-end mb-3">
  <form method="get" action="${pageContext.request.contextPath}/admin/danhsachhocphan" class="d-flex align-items-center">

    <div class="me-3 d-flex align-items-center">
      <label for="hocKy" class="me-2">Học kỳ:</label>
      <select name="hocKy" id="hocKy" class="form-select form-select-sm" style="width:150px;">
        <option value="">-- Tất cả --</option>
        <c:forEach var="hk" items="${danhSachHocKy}">
          <option value="${hk}" <c:if test="${hk == hocKyDaChon}">selected</c:if>>
            ${hk}
          </option>
        </c:forEach>
      </select>
    </div>

    <div class="me-3 d-flex align-items-center">
      <label for="tenNganh" class="me-2">Tên ngành:</label>
      <select name="tenNganh" id="tenNganh" class="form-select form-select-sm" style="width:150px;">
        <option value="">-- Tất cả --</option>
        <c:forEach var="ng" items="${danhSachNganh}">
          <option value="${ng}" <c:if test="${ng == tenNganhDaChon}">selected</c:if>>
            ${ng}
          </option>
        </c:forEach>
      </select>
    </div>

    <button type="submit" class="btn btn-success btn-sm">Lọc</button>
  </form>
</div>



      <!-- Mục chính -->
      <section class="section dashboard">
        <form
          action="${pageContext.request.contextPath}/admin/danhsachhocphan"
          method="post"
        >
          <button
            class="btn btn-primary btn-sm"
            type="submit"
            style="margin-bottom: 10px"
            onclick="return confirm('Bạn có chắc chắn muốn xóa các mục đã chọn không?');"
          >
            Xóa các mục đã chọn
          </button>
          <br />
          <div class="row">
            <div class="col-lg-12">
              <div
                class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns"
              >
                <table class="table datatable table-bordered table-striped">
                  <thead>
                    <tr>
                      <th class="col text-center" scope="col"></th>
                      <th class="col text-center" scope="col">Mã học phần</th>
                      <th class="col text-center" scope="col">Tên học phần</th>
                      <th class="col text-center" scope="col">Số tín chỉ</th>
                      <th class="col text-center" scope="col">Học kỳ</th>
                      <th class="col text-center" scope="col">Tên ngành</th>
                      <th class="col text-center" scope="col">Mô tả</th>
                      <th class="col text-center" scope="col">Hành động</th>
                    </tr>
                  </thead>
                  <tbody>
                    <!-- Danh sách -->
                    <c:forEach var="hp" items="${danhSachHocPhan}">
                      <tr>
                        <td class="col text-center" scope="row">
                          <input
                            type="checkbox"
                            name="MaHocPhan"
                            value="${hp.MaHocPhan}"
                          />
                        </td>
                        <td class="col text-center" scope="row">
                          <c:out value="${hp.MaHocPhan}" />
                        </td>
                        <td class="col text-center" scope="row">
                          <c:out value="${hp.TenHocPhan}" />
                        </td>
                        <td class="col text-center" scope="row">
                          <c:out value="${hp.SoTinChi}" />
                        </td>
                        <td class="col text-center" scope="row">
                          <c:out value="${hp.HocKy}" />
                        </td>
                        <td class="col text-center" scope="row">
                          <c:out value="${hp.TenNganh}" />
                        </td>
                        <td class="col text-center" scope="row">
                          <c:out value="${hp.MoTaHocPhan}" />
                        </td>
                        <td class="col text-center" scope="row">
                          <a
                            class="btn btn-primary btn-sm"
                            href="${pageContext.request.contextPath}/admin/danhsachhocphan/sua?MaHocPhan=${hp.MaHocPhan}"
                            >Sửa</a
                          >
                          <a
                            class="btn btn-danger btn-sm"
                            href="${pageContext.request.contextPath}/admin/danhsachhocphan/xoa?MaHocPhan=${hp.MaHocPhan}"
                            onclick="return confirm('Bạn có chắc chắn muốn xóa không?');"
                            >Xóa</a
                          >
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </form>
      </section>
    </main>

    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/giaodien/footer.jsp" />
  </body>
</html>

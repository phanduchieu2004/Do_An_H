<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>Danh sách tài khoản</title>
  <jsp:include page="/WEB-INF/views/giaodien/head.jsp" />
</head>
<body>
  <jsp:include page="/WEB-INF/views/giaodien/header.jsp" />
  <jsp:include page="/WEB-INF/views/sidebar/admin.jsp" />

  <main id="main" class="main">
    <c:if test="${not empty thongBao}">
      <div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Thông báo:</strong>
        <c:out value="${thongBao}" />
        <c:remove scope="session" var="thongBao" />
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
    </c:if>

    <div class="pagetitle">
      <h1>Quản lý tài khoản</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">Trang chủ</li>
          <li class="breadcrumb-item active">Danh sách tài khoản</li>
        </ol>
      </nav>
    </div>

    <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/admin/danhsachtaikhoan/them">Thêm</a>

    <!-- Bộ lọc chức vụ -->
    <div class="d-flex justify-content-end mb-3">
      <form action="${pageContext.request.contextPath}/admin/danhsachtaikhoan/index" method="get" class="btn-group">
        <button type="submit" name="chucVu" value=""
                class="btn btn-outline-secondary btn-sm <c:if test='${empty chucVuDaChon}'>active</c:if>">Tất cả</button>
        <c:forEach var="cv" items="${danhSachChucVu}">
          <button type="submit" name="chucVu" value="${cv}"
                  class="btn btn-outline-primary btn-sm <c:if test='${chucVuDaChon == cv}'>active</c:if>">
            <c:out value="${cv}" />
          </button>
        </c:forEach>
      </form>
    </div>

    <section class="section dashboard">
      <form action="${pageContext.request.contextPath}/admin/danhsachtaikhoan/index" method="post">
        <button class="btn btn-primary btn-sm" type="submit" style="margin-bottom: 10px"
          onclick="return confirm('Bạn có chắc chắn muốn xóa các mục đã chọn không?');">
          Xóa các mục đã chọn
        </button>
        <br />
        <div class="row">
          <div class="col-lg-12">
            <div class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
              <table class="table datatable table-bordered table-striped">
                <thead>
                  <tr>
                    <th class="col text-center"></th>
                    <th class="col text-center">Mã tài khoản</th>
                    <th class="col text-center">Tên đăng nhập</th>
                    <th class="col text-center">Chức vụ</th>
                    <th class="col text-center">Trạng thái</th>
                    <th class="col text-center">Hành động</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="tk" items="${danhSachTaiKhoan}">
                    <tr>
                      <td class="text-center">
                        <input type="checkbox" name="MaTaiKhoan" value="${tk.MaNguoiDung}" />
                      </td>
                      <td class="text-center"><c:out value="${tk.MaNguoiDung}" /></td>
                      <td class="text-center"><c:out value="${tk.MaNguoiDung}" /></td>
                      <td class="text-center"><c:out value="${tk.ChucVu}" /></td>
                      <td class="text-center"><c:out value="${tk.TrangThaiTaiKhoan}" /></td>
                      <td class="text-center">
                        <a class="btn btn-primary btn-sm"
                          href="${pageContext.request.contextPath}/admin/danhsachtaikhoan/sua?MaTaiKhoan=${tk.MaNguoiDung}">Sửa</a>
                        <a class="btn btn-danger btn-sm"
                          href="${pageContext.request.contextPath}/admin/danhsachtaikhoan/xoa?MaTaiKhoan=${tk.MaNguoiDung}"
                          onclick="return confirm('Bạn có chắc chắn muốn xóa không?');">Xóa</a>
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

  <jsp:include page="/WEB-INF/views/giaodien/footer.jsp" />
</body>
</html>

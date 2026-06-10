
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Danh sách lớp</title>
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
        <h1>Quản lý lớp</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">Trang chủ</li>
            <li class="breadcrumb-item active">Danh sách lớp</li>
          </ol>
        </nav>
      </div>
      <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/admin/danhsachlop/them">Thêm</a>
      <br /><br />
      <section class="section dashboard">
        <form action="${pageContext.request.contextPath}/admin/danhsachlop/index" method="post">
          <button class="btn btn-primary btn-sm" type="submit" style="margin-bottom: 10px" onclick="return confirm('Bạn có chắc chắn muốn xóa các mục đã chọn không?');">Xóa các mục đã chọn</button>
          <div class="row">
            <div class="col-lg-12">
              <div class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
                <table class="table datatable table-bordered table-striped">
                  <thead>
                    <tr>
                      <th class="col text-center" scope="col"></th>
                      <th class="col text-center" scope="col">Mã lớp</th>
                      <th class="col text-center" scope="col">Tên lớp</th>
                      <th class="col text-center" scope="col">Khóa học</th>
                      <th class="col text-center" scope="col">Ngành</th>
                      <th class="col text-center" scope="col">Hành động</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="lop" items="${danhSachLop}">
                      <tr>
                        <td class="col text-center" scope="row">
                          <input type="checkbox" name="MaLop" value="${lop.MaLop}" />
                        </td>
                        <td class="col text-center" scope="row">
                          <c:out value="${lop.MaLop}" />
                        </td>
                        <td class="col text-center" scope="row">
                          <c:out value="${lop.TenLop}" />
                        </td>
                        <td class="col text-center" scope="row">
                          <c:out value="${lop.KhoaHoc}" />
                        </td>
                        <td class="col text-center" scope="row">
                          <c:out value="${lop.TenNganh}" />
                        </td>
                        <td class="col text-center" scope="row">
                          <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/admin/danhsachlop/sua?MaLop=${lop.MaLop}">Sửa</a>
                          <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/admin/danhsachlop/sua?MaLop=${lop.MaLop}" onclick="return confirm('Bạn có chắc chắn muốn xóa không?');">Xóa</a>
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

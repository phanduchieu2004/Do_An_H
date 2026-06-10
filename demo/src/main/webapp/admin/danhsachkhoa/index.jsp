<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Danh sách khoa</title>
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
        <h1>Quản lý khoa</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">Trang chủ</li>
            <li class="breadcrumb-item active">Danh sách khoa</li>
          </ol>
        </nav>
      </div>
      <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/admin/danhsachkhoa/them">Thêm</a>
      <br /><br />
      <section class="section dashboard">
        <form action="${pageContext.request.contextPath}/admin/danhsachkhoa/index" method="post">
          <button class="btn btn-primary btn-sm" type="submit" style="margin-bottom: 10px" onclick="return confirm('Bạn có chắc chắn muốn xóa các mục đã chọn không?');">Xóa các mục đã chọn</button>
          <br />
          <div class="row">
            <div class="col-lg-12">
              <div class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
                <table class="table datatable table-bordered table-striped">
                  <thead>
                    <tr>
                      <th class="col text-center" scope="col"></th>
                      <th class="col text-center" scope="col">Mã khoa</th>
                      <th class="col text-center" scope="col">Tên khoa</th>
                      <th class="col text-center" scope="col">Viện</th>
                      <th class="col text-center" scope="col">Trưởng khoa</th>
                      <th class="col text-center" scope="col">Số điện thoại</th>
                      <th class="col text-center" scope="col">Email</th>
                      <th class="col text-center" scope="col">Ngày thành lập</th>
                      <th class="col text-center" scope="col">Mô tả</th>
                      <th class="col text-center" scope="col">Hành động</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="khoa" items="${danhSachKhoa}">
                      <tr>
                        <td class="col text-center" scope="row">
                          <input type="checkbox" name="MaKhoa" value="${khoa.MaKhoa}" />
                        </td>
                        <td class="col text-center" scope="row"><c:out value="${khoa.MaKhoa}" /></td>
                        <td class="col text-center" scope="row"><c:out value="${khoa.TenKhoa}" /></td>
                        <td class="col text-center" scope="row"><c:out value="${khoa.TenVien}" /></td>
                        <td class="col text-center" scope="row"><c:out value="${khoa.TenTruongKhoa}" /></td>
                        <td class="col text-center" scope="row"><c:out value="${khoa.SoDienThoaiKhoa}" /></td>
                        <td class="col text-center" scope="row"><c:out value="${khoa.EmailKhoa}" /></td>
                        <td class="col text-center" scope="row"><c:out value="${khoa.NgayThanhLapKhoa}" /></td>
                        <td class="col text-center" scope="row"><c:out value="${khoa.MoTaKhoa}" /></td>
                        <td class="col text-center" scope="row">
                          <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/admin/danhsachkhoa/sua?MaKhoa=${khoa.MaKhoa}">Sửa</a>
                          <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/admin/danhsachkhoa/xoa?MaKhoa=${khoa.MaKhoa}" onclick="return confirm('Bạn có chắc chắn muốn xóa không?');">Xóa</a>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Danh sách lớp học phần</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />
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
        <h1>Danh sách lớp học phần</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">Trang chủ</li>
            <li class="breadcrumb-item active">Danh sách lớp học phần</li>
          </ol>
        </nav>
      </div>
      <section class="section dashboard">
        <form action="${pageContext.request.contextPath}/admin/danhsachlophocphan" method="post">
          <div class="row">
            <div class="col-lg-12">
              <div class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
                <table class="table datatable table-bordered table-striped">
                  <thead>
                    <tr>
                      <th></th>
                      <th class="col text-center" scope="col">Tên lớp học phần</th>
                      <th class="col text-center" scope="col">Tên học phần</th>
                      <th class="col text-center" scope="col">Tên ngành</th>
                      <th class="col text-center" scope="col">Tên giảng viên</th>
                      <th class="col text-center" scope="col">Trạng thái</th>
                      <th class="col text-center" scope="col">Hành động</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="lhp" items="${danhSachLopHocPhan}">
                      <tr>
                        <td class="col text-center" scope="row"><c:out value="${lhp.MaLopHocPhan}" /></td>
                        <td class="col text-center" scope="row"><c:out value="${lhp.TenLopHocPhan}" /></td>
                        <td class="col text-center" scope="row"><c:out value="${lhp.TenHocPhan}" /></td>
                         <td class="col text-center" scope="row"><c:out value="${lhp.TenNganh}" /></td>
                        <td class="col text-center" scope="row"><c:out value="${lhp.TenGiangVien}" /></td>
                        <td class="col text-center" scope="row"><c:out value="${lhp.TrangThaiLopHocPhan}" /></td>
                        <td class="col text-center" scope="row">
                          <a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/admin/danhsachketqua/xem?MaLopHocPhan=${lhp.MaLopHocPhan}">Xem danh sách</a>
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

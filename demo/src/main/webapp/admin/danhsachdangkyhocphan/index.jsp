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
        <h1>Danh sách đăng ký học phần</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">Trang chủ</li>
            <li class="breadcrumb-item active">Danh sách đăng ký học phần</li>
          </ol>
        </nav>
      </div>

<div class="d-flex justify-content-end mb-3">

  <form action="${pageContext.request.contextPath}/admin/danhsachdangkyhocphan/index" method="get" class="d-flex align-items-center me-3">
    <select name="tenLopHocPhan" class="form-select form-select-sm me-2" style="width: 180px;">
      <option value="">-- Tất cả --</option>
        <c:forEach var="lop" items="${danhSachLopHocPhan}">
            <option value="${lop}" 
                <c:if test="${lop == tenLopHocPhanDaChon}">selected</c:if>>
                ${lop}
            </option>
        </c:forEach>
    </select>

    <select name="tenGiangVien" class="form-select form-select-sm me-2" style="width: 180px;">
       <option value="">-- Tất cả --</option>
        <c:forEach var="gv" items="${danhSachGiangVien}">
            <option value="${gv}" 
                <c:if test="${gv == tenGiangVienDaChon}">selected</c:if>>
                ${gv}
            </option>
        </c:forEach>
    </select>

    <button type="submit" class="btn btn-success btn-sm">Lọc</button>
  </form>

  

</div>



      <!-- Mục chính -->
      <section class="section dashboard">
        <form
          action="${pageContext.request.contextPath}/admin/danhsachdangkyhocphan"
          method="post"
        >
         
          <br />
          <div class="row">
            <div class="col-lg-12">
              <div
                class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns"
              >
                <table class="table datatable table-bordered table-striped">
                  <thead>
                    <tr>
                      <th class="col text-center" scope="col">STT</th>
                                            <th class="col text-center" scope="col">Tên lớp học phần</th>
                      <th class="col text-center" scope="col">Tên học phần</th>
                      <th class="col text-center" scope="col">Tên sinh viên đăng ký</th>

                      <th class="col text-center" scope="col">Tên giảng viên</th>
                      <th class="col text-center" scope="col">Phòng học</th>
                      <th class="col text-center" scope="col">Tên ngành</th>
                      <th class="col text-center" scope="col">Thứ tiết</th>
                       <th class="col text-center" scope="col">Số lượng</th>
                      <th class="col text-center" scope="col">Thời gian bắt đầu đăng ký</th>
                       <th class="col text-center" scope="col">Thời gian kết thúc đăng ký</th>
                    </tr>
                  </thead>
                  <tbody>
                    <!-- Danh sách -->
                    <c:forEach var="hp" items="${danhSachDangKyHocPhan}">
                      <tr>
                        
                        <td class="col text-center" scope="row">
                          <c:out value="${hp.IDDangKyHocPhan}" />
                        </td>
                        <td class="col text-center" scope="row">
                          <c:out value="${hp.TenLopHocPhan}" />
                        </td>
                        <td class="col text-center" scope="row">
                          <c:out value="${hp.TenHocPhan}" />
                        </td>
                        <td class="col text-center" scope="row">
                          <c:out value="${hp.HoTenSV}" />
                        </td>
                        <td class="col text-center" scope="row">
                          <c:out value="${hp.HoTenGV}" />
                        </td>
                        <td class="col text-center" scope="row">
                          <c:out value="${hp.PhongHoc}" />
                        </td>
                        <td class="col text-center" scope="row">
                          <c:out value="${hp.TenNganh}" />
                        </td>
                        <td class="col text-center" scope="row">
                          <c:out value="${hp.ThuTiet}" />
                        </td>
                        <td class="col text-center" scope="row">
                          <c:out value="${hp.SoLuongDangKy}/${hp.SoLuongToiDa}" />
                        </td>
                        <td class="col text-center" scope="row">
                          <c:out value="${hp.ThoiGianBatDau}" />
                        </td>
                        <td class="col text-center" scope="row">
                          <c:out value="${hp.ThoiGianKetThuc}" />
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

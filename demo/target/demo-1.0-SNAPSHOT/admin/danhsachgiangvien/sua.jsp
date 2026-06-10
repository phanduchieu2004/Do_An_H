<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="utf-8" />
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <meta content="width=device-width, initial-scale=1.0" name="viewport" />
      <title>Sửa giảng viên</title>
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
          <h2><b>Quản lý giảng viên</b></h2>
          <nav>
            <ol class="breadcrumb">
              <li class="breadcrumb-item">Trang chủ</li>
              <li class="breadcrumb-item active">Sửa giảng viên</li>

            </ol>
          </nav>
        </div>

        <!-- Mục chính -->
        <div class="container shadow p-4">
          <form action="${pageContext.request.contextPath}/admin/danhsachgiangvien/sua" method="post"
            enctype="multipart/form-data">

            <div class="row">
              <div class="form-group col-md-6 mb-3">
                <label>Mã giảng viên</label>
                <input type="text" class="form-control" name="MSGV" value="${gv.MSGV}" />
                <c:if test="${not empty loiMSGV}">
                  <small class="text-danger">
                    <c:out value="${loiMSGV}" />
                  </small>
                </c:if>
              </div>

              <div class="form-group col-md-6 mb-3">
                <label>Họ tên giảng viên</label>
                <input type="text" class="form-control" name="HoTenGV" value="${gv.HoTenGV}" />
                <c:if test="${not empty loiHoTenGV}">
                  <small class="text-danger">${loiHoTenGV}</small>
                </c:if>
              </div>

              <div class="form-group col-md-6 mb-3">
                <label>Ngày sinh</label>
                <input type="date" class="form-control" name="NgaySinhGV" value="${gv.NgaySinhGV}" />
                <c:if test="${not empty loiNgaySinhGV}">
                  <small class="text-danger">${loiNgaySinhGV}</small>
                </c:if>
              </div>

              <div class="form-group col-md-6 mb-3">
                <label>Giới tính</label>
                <input type="text" class="form-control" name="GioiTinhGV" value="${gv.GioiTinhGV}" />
                <c:if test="${not empty loiGioiTinhGV}">
                  <small class="text-danger">${loiGioiTinhGV}</small>
                </c:if>
              </div>

              <div class="form-group col-md-6 mb-3">
                <label>Quê quán</label>
                <input type="text" class="form-control" name="QueQuanGV" value="${gv.QueQuanGV}" />
                <c:if test="${not empty loiQueQuanGV}">
                  <small class="text-danger">${loiQueQuanGV}</small>
                </c:if>
              </div>

              <div class="form-group col-md-6 mb-3">
                <label>Email</label>
                <input type="email" class="form-control" name="EmailGV" value="${gv.EmailGV}" />
                <c:if test="${not empty loiEmailGV}">
                  <small class="text-danger">${loiEmailGV}</small>
                </c:if>
              </div>

              <div class="form-group col-md-6 mb-3">
                <label>Ngành</label>
                <select class="form-control" name="MaNganh">
                  <c:forEach var="nganh" items="${danhSachNganh}">

                    <option value="${nganh.MaNganh}" <c:if test="${nganh.MaNganh == gv.MaNganh}">selected</c:if>>
                      ${nganh.TenNganh}
                    </option>
                  </c:forEach>
                </select>
                <c:if test="${not empty loiMaNganh}">
                  <small class="text-danger">${loiMaNganh}</small>
                </c:if>




              </div>

              <div class="form-group col-md-6 mb-3">
                <label>Số điện thoại</label>
                <input type="text" class="form-control" name="SoDienThoaiGV" value="${gv.SoDienThoaiGV}" />
                <c:if test="${not empty loiSoDienThoaiGV}">
                  <small class="text-danger">${loiSoDienThoaiGV}</small>
                </c:if>
              </div>

              <div class="form-group col-md-6 mb-3">
                <label>Ảnh giảng viên</label>
                <input type="file" class="form-control" name="AnhGV" id="AnhGV" accept="image/*" />
                <c:if test="${not empty loiAnhGV}"><small class="text-danger">${loiAnhGV}</small></c:if>
              </div>

              <div class="form-group col-md-6 mb-3">
                <label>Trình độ</label>
                <select name="TrangThaiGV" class="form-select">
                  <option value="">-- Trình độ --</option>
                  <option value="Cử nhân" <c:if test="${gv.TrangThaiGV == 'Cử nhân'}">selected</c:if>>Cử nhân</option>
                  <option value="Kỹ sư" <c:if test="${gv.TrangThaiGV == 'Kỹ sư'}">selected</c:if>>Kỹ sư</option>
                  <option value="Thạc sỹ" <c:if test="${gv.TrangThaiGV == 'Thạc sỹ'}">selected</c:if>>Thạc sỹ</option>
                  <option value="Tiến sỹ" <c:if test="${gv.TrangThaiGV == 'Tiến sỹ'}">selected</c:if>>Tiến sỹ</option>
                  <option value="Phó giáo sư" <c:if test="${gv.TrangThaiGV == 'Phó giáo sư'}">selected</c:if>>Phó giáo
                    sư</option>

                </select>
                <c:if test="${not empty loiTrangThaiGV}"><small class="text-danger">${loiTrangThaiGV}</small></c:if>
              </div>
            </div>
            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/danhsachgiangvien/index">Quay
              lại</a>
            <button type="submit" class="btn btn-primary">Sửa</button>
          </form>

        </div>
      </main>

      <!-- Include footer -->
      <jsp:include page="/WEB-INF/views/giaodien/footer.jsp" />
    </body>

    </html>
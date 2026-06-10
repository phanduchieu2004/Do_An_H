<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Thêm lớp học phần</title>
    <jsp:include page="/WEB-INF/views/giaodien/head.jsp" />
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/giaodien/header.jsp" />
    <jsp:include page="/WEB-INF/views/sidebar/admin.jsp" />
    <main id="main" class="main">
      <div class="pagetitle">
        <h1>Quản lý lớp học phần</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">Trang chủ</li>
            <li class="breadcrumb-item active">Thêm lớp học phần</li>
          </ol>
        </nav>
      </div>
      <div class="container shadow p-4">
        <form
          action="${pageContext.request.contextPath}/admin/danhsachlophocphan/them"
          method="post"
        >
          <div class="row">
            <div class="form-group col-md-6 mb-3">
              <label>Mã lớp học phần</label>
              <input
                type="text"
                class="form-control"
                name="MaLopHocPhan"
                value="${not empty MaLopHocPhan ? MaLopHocPhan : ''}"
              />
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Tên lớp học phần</label>
              <input
                type="text"
                class="form-control"
                name="TenLopHocPhan"
                value="${not empty TenLopHocPhan ? TenLopHocPhan : ''}"
              />
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Học phần</label>
              <select class="form-control" name="MaHocPhan">
                <c:forEach var="hp" items="${danhSachHocPhan}">
                  <option value="${hp.MaHocPhan}">${hp.TenHocPhan} - ${hp.TenNganh}</option>
                </c:forEach>
              </select>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Giảng viên</label>
              <select class="form-control" name="MSGV">
                <c:forEach var="gv" items="${danhSachGiangVien}">
                  <option value="${gv.MSGV}">${gv.HoTenGV}</option>
                </c:forEach>
              </select>
            </div>
            <div class="form-group col-md-4 mb-3">
              <label>Số buổi</label>
              <input
                type="number"
                class="form-control"
                name="SoBuoi"
                value="${not empty SoBuoi ? SoBuoi : ''}"
              />
            </div>
            <div class="form-group col-md-4 mb-3">
              <label>Số tiết</label>
              <input
                type="number"
                class="form-control"
                name="SoTiet"
                value="${not empty SoTiet ? SoTiet : ''}"
              />
            </div>
            <div class="form-group col-md-4 mb-3">
              <label>Số tuần học</label>
              <input
                type="text"
                class="form-control"
                name="SoTuanHoc"
                value="${not empty SoTuanHoc ? SoTuanHoc : ''}"
              />
            </div>
            <div class="form-group col-md-4 mb-3">
              <label>Thứ tiết</label>
              <input
                type="text"
                class="form-control"
                name="ThuTiet"
                value="${not empty ThuTiet ? ThuTiet : ''}"
              />
            </div>
            <div class="form-group col-md-4 mb-3">
              <label>Phòng học</label>
              <input
                type="text"
                class="form-control"
                name="PhongHoc"
                value="${not empty PhongHoc ? PhongHoc : ''}"
              />
            </div>
            <div class="form-group col-md-4 mb-3">
              <label>Số lượng tối đa</label>
              <input
                type="number"
                class="form-control"
                name="SoLuongToiDa"
                value="${not empty SoLuongToiDa ? SoLuongToiDa : ''}"
              />
            </div>
            <div class="form-group col-md-4 mb-3">
              <label>Thời gian bắt đầu</label>
              <input
                type="date"
                class="form-control"
                name="ThoiGianBatDau"
                value="${not empty ThoiGianBatDau ? ThoiGianBatDau : ''}"
              />
            </div>
            <div class="form-group col-md-4 mb-3">
              <label>Thời gian kết thúc</label>
              <input
                type="date"
                class="form-control"
                name="ThoiGianKetThuc"
                value="${not empty ThoiGianKetThuc ? ThoiGianKetThuc : ''}"
              />
            </div>
            <div class="form-group col-md-4 mb-3">
              <label>Thời gian học</label>
              <input
                type="date"
                class="form-control"
                name="ThoiGianHoc"
                value="${not empty ThoiGianHoc ? ThoiGianHoc : ''}"
              />
            </div>
            <div class="form-group col-md-4 mb-3">
              <label>Trạng thái</label>
              <select class="form-control" name="TrangThaiLopHocPhan">
                <option value="Đang mở" ${TrangThaiLopHocPhan == 'Đang mở' ? 'selected' : ''}>Đang mở</option>
                <option value="Đã đóng" ${TrangThaiLopHocPhan == 'Đã đóng' ? 'selected' : ''}>Đã đóng</option>
                <option value="Đã hủy" ${TrangThaiLopHocPhan == 'Đã hủy' ? 'selected' : ''}>Đã hủy</option>
              </select>
            </div>
          </div>
          <a
            class="btn btn-secondary"
            href="${pageContext.request.contextPath}/admin/danhsachlophocphan"
            >Quay lại</a
          >
          <button type="submit" class="btn btn-primary">Thêm</button>
        </form>
      </div>
    </main>
    <jsp:include page="/WEB-INF/views/giaodien/footer.jsp" />
  </body>
</html>

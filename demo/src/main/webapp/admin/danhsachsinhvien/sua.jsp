<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta content="width=device-width, initial-scale=1.0" name="viewport" />
  <title>Sửa sinh viên - Admin</title>
  <jsp:include page="/WEB-INF/views/giaodien/head.jsp" />
</head>

<body>
  <jsp:include page="/WEB-INF/views/giaodien/header.jsp" />
  <jsp:include page="/WEB-INF/views/sidebar/admin.jsp" />
  
  <main id="main" class="main">
    <!-- Page Header -->
    <div class="pagetitle mb-4">
      <div class="d-flex justify-content-between align-items-center flex-wrap gap-2">
        <div>
          <h1><i class="bi bi-pencil-square me-2"></i>Chỉnh sửa sinh viên</h1>
          <nav>
            <ol class="breadcrumb mb-0">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/index">Trang chủ</a></li>
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/danhsachsinhvien/index">Sinh viên</a></li>
              <li class="breadcrumb-item active">Chỉnh sửa</li>
            </ol>
          </nav>
        </div>
        <a href="${pageContext.request.contextPath}/admin/danhsachsinhvien/index" class="btn btn-outline-secondary">
          <i class="bi bi-arrow-left me-1"></i>Quay lại danh sách
        </a>
      </div>
    </div>

    <!-- Form Card -->
    <div class="card">
      <div class="card-header py-3 d-flex justify-content-between align-items-center">
        <h5 class="card-title mb-0">
          <i class="bi bi-info-circle me-2"></i>Thông tin sinh viên
        </h5>
        <span class="badge bg-primary-subtle text-primary px-3 py-2">MSSV: ${sv.MSSV}</span>
      </div>
      <div class="card-body pt-4">
        <form action="${pageContext.request.contextPath}/admin/danhsachsinhvien/sua" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
          <div class="row g-4">
            <!-- Mã sinh viên (readonly) -->
            <div class="col-md-6">
              <div class="form-floating">
                <input type="text" class="form-control bg-light" id="MSSV" name="MSSV" value="${sv.MSSV}" readonly />
                <label for="MSSV"><i class="bi bi-hash me-1"></i>Mã sinh viên</label>
              </div>
              <small class="text-muted"><i class="bi bi-lock me-1"></i>Không thể thay đổi mã sinh viên</small>
              <c:if test="${not empty loiMSSV}">
                <div class="text-danger small mt-1">${loiMSSV}</div>
              </c:if>
            </div>

            <!-- Họ tên -->
            <div class="col-md-6">
              <div class="form-floating">
                <input type="text" class="form-control ${not empty loiHoTenSV ? 'is-invalid' : ''}" id="HoTenSV" name="HoTenSV" placeholder="Nhập họ tên" value="${sv.HoTenSV}" required />
                <label for="HoTenSV"><i class="bi bi-person me-1"></i>Họ và tên</label>
                <c:if test="${not empty loiHoTenSV}">
                  <div class="invalid-feedback">${loiHoTenSV}</div>
                </c:if>
              </div>
            </div>

            <!-- Ngày sinh -->
            <div class="col-md-6">
              <div class="form-floating">
                <input type="date" class="form-control ${not empty loiNgaySinhSV ? 'is-invalid' : ''}" id="NgaySinhSV" name="NgaySinhSV" placeholder="Chọn ngày sinh" value="${sv.NgaySinhSV}" required />
                <label for="NgaySinhSV"><i class="bi bi-calendar-event me-1"></i>Ngày sinh</label>
                <c:if test="${not empty loiNgaySinhSV}">
                  <div class="invalid-feedback">${loiNgaySinhSV}</div>
                </c:if>
              </div>
            </div>

            <!-- Giới tính -->
            <div class="col-md-6">
              <div class="form-floating">
                <select name="GioiTinhSV" id="GioiTinhSV" class="form-select ${not empty loiGioiTinhSV ? 'is-invalid' : ''}" required>
                  <option value="">-- Chọn giới tính --</option>
                  <option value="Nam" <c:if test="${sv.GioiTinhSV == 'Nam'}">selected</c:if>>Nam</option>
                  <option value="Nữ" <c:if test="${sv.GioiTinhSV == 'Nữ'}">selected</c:if>>Nữ</option>
                </select>
                <label for="GioiTinhSV"><i class="bi bi-gender-ambiguous me-1"></i>Giới tính</label>
                <c:if test="${not empty loiGioiTinhSV}">
                  <div class="invalid-feedback">${loiGioiTinhSV}</div>
                </c:if>
              </div>
            </div>

            <!-- Quê quán -->
            <div class="col-md-6">
              <div class="form-floating">
                <input type="text" class="form-control ${not empty loiQueQuanSV ? 'is-invalid' : ''}" id="QueQuanSV" name="QueQuanSV" placeholder="Nhập quê quán" value="${sv.QueQuanSV}" />
                <label for="QueQuanSV"><i class="bi bi-geo-alt me-1"></i>Quê quán</label>
                <c:if test="${not empty loiQueQuanSV}">
                  <div class="invalid-feedback">${loiQueQuanSV}</div>
                </c:if>
              </div>
            </div>

            <!-- Email -->
            <div class="col-md-6">
              <div class="form-floating">
                <input type="email" class="form-control ${not empty loiEmailSV ? 'is-invalid' : ''}" id="EmailSV" name="EmailSV" placeholder="Nhập email" value="${sv.EmailSV}" required />
                <label for="EmailSV"><i class="bi bi-envelope me-1"></i>Email</label>
                <c:if test="${not empty loiEmailSV}">
                  <div class="invalid-feedback">${loiEmailSV}</div>
                </c:if>
              </div>
            </div>

            <!-- Trạng thái -->
            <div class="col-md-6">
              <div class="form-floating">
                <select name="TrangThaiSV" id="TrangThaiSV" class="form-select ${not empty loiTrangThaiSV ? 'is-invalid' : ''}" required>
                  <option value="">-- Trạng thái --</option>
                  <option value="Đang học" <c:if test="${sv.TrangThaiSV == 'Đang học'}">selected</c:if>>Đang học</option>
                  <option value="Tốt nghiệp" <c:if test="${sv.TrangThaiSV == 'Tốt nghiệp'}">selected</c:if>>Tốt nghiệp</option>
                  <option value="Bảo lưu" <c:if test="${sv.TrangThaiSV == 'Bảo lưu'}">selected</c:if>>Bảo lưu</option>
                  <option value="Nghỉ học" <c:if test="${sv.TrangThaiSV == 'Nghỉ học'}">selected</c:if>>Nghỉ học</option>
                </select>
                <label for="TrangThaiSV"><i class="bi bi-check-circle me-1"></i>Trạng thái</label>
                <c:if test="${not empty loiTrangThaiSV}">
                  <div class="invalid-feedback">${loiTrangThaiSV}</div>
                </c:if>
              </div>
            </div>

            <!-- Lớp -->
            <div class="col-md-6">
              <div class="form-floating">
                <select name="MaLop" id="MaLop" class="form-select ${not empty loiMaLop ? 'is-invalid' : ''}" required>
                  <option value="">-- Chọn lớp --</option>
                  <c:forEach var="lop" items="${danhSachLop}">
                    <option value="${lop.MaLop}" <c:if test="${sv.MaLop == lop.MaLop}">selected</c:if>>Lớp: ${lop.TenLop} Ngành: ${lop.TenNganh} Khoá: ${lop.KhoaHoc}</option>
                  </c:forEach>
                </select>
                <label for="MaLop"><i class="bi bi-people me-1"></i>Lớp</label>
                <c:if test="${not empty loiMaLop}">
                  <div class="invalid-feedback">${loiMaLop}</div>
                </c:if>
              </div>
            </div>

            <!-- Số điện thoại -->
            <div class="col-md-6">
              <div class="form-floating">
                <input type="text" class="form-control ${not empty loiSoDienThoaiSV ? 'is-invalid' : ''}" id="SoDienThoaiSV" name="SoDienThoaiSV" placeholder="Nhập số điện thoại" value="${sv.SoDienThoaiSV}" />
                <label for="SoDienThoaiSV"><i class="bi bi-telephone me-1"></i>Số điện thoại</label>
                <c:if test="${not empty loiSoDienThoaiSV}">
                  <div class="invalid-feedback">${loiSoDienThoaiSV}</div>
                </c:if>
              </div>
            </div>

            <!-- Ảnh sinh viên -->
            <div class="col-md-12">
              <label for="AnhSV" class="form-label fw-medium">
                <i class="bi bi-image me-1"></i>Ảnh sinh viên
              </label>
              <div class="input-group">
                <span class="input-group-text bg-light"><i class="bi bi-upload"></i></span>
                <input type="file" class="form-control ${not empty loiAnhSV ? 'is-invalid' : ''}" name="AnhSV" id="AnhSV" accept="image/*" />
                <c:if test="${not empty loiAnhSV}">
                  <div class="invalid-feedback">${loiAnhSV}</div>
                </c:if>
              </div>
              <small class="text-muted">Để trống nếu không muốn thay đổi ảnh. Chấp nhận: JPG, PNG, GIF. Tối đa: 5MB</small>
            </div>
          </div>

          <!-- Form Actions -->
          <hr class="my-4">
          <div class="d-flex justify-content-end gap-2">
            <a class="btn btn-light px-4" href="${pageContext.request.contextPath}/admin/danhsachsinhvien/index">
              <i class="bi bi-x-lg me-1"></i>Hủy bỏ
            </a>
            <button type="submit" class="btn btn-primary px-4">
              <i class="bi bi-check-lg me-1"></i>Lưu thay đổi
            </button>
          </div>
        </form>
      </div>
    </div>
  </main>
  
  <jsp:include page="/WEB-INF/views/giaodien/footer.jsp" />
</body>

</html>
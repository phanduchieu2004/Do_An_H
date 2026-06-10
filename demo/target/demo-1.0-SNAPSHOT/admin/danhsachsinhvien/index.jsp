<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Danh sách sinh viên</title>
    

    <jsp:include page="/WEB-INF/views/giaodien/head.jsp" />
    

    </head>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/giaodien/header.jsp" />
    <jsp:include page="/WEB-INF/views/sidebar/admin.jsp" />
    <main id="main" class="main">
      <!-- Toast Notification for Success -->
      <c:if test="${not empty thongBao}">
        <div
          class="alert alert-success alert-dismissible fade show"
          role="alert"
        >
          <i class="bi bi-check-circle me-2"></i>
          <strong>Thành công!</strong>
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
      
      <!-- Page Header -->
      <div class="pagetitle mb-4">
        <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
          <div>
            <h1><i class="bi bi-mortarboard me-2"></i>Quản lý sinh viên</h1>
            <nav>
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Trang chủ</a></li>
                <li class="breadcrumb-item active">Danh sách sinh viên</li>
              </ol>
            </nav>
          </div>
          <a
            class="btn btn-primary"
            href="${pageContext.request.contextPath}/admin/danhsachsinhvien/them"
          >
            <i class="bi bi-plus-lg me-1"></i>
            Thêm sinh viên
          </a>
        </div>
      </div>

      <!-- Filter Section -->
      <div class="card mb-4">
        <div class="card-body py-3">
          <div class="row g-3 align-items-end">
            <div class="col-lg-8">
              <form action="${pageContext.request.contextPath}/admin/danhsachsinhvien/index" method="get" class="d-flex flex-wrap gap-2 align-items-end">
                <div>
                  <label class="form-label small fw-semibold mb-1">Ngành học</label>
                  <select name="tenNganh" class="form-select" style="min-width: 180px;">
                    <option value="">-- Tất cả ngành --</option>
                    <c:forEach var="nganh" items="${danhSachNganh}">
                      <option value="${nganh}" <c:if test="${tenNganhDaChon == nganh}">selected</c:if>>${nganh}</option>
                    </c:forEach>
                  </select>
                </div>
                <div>
                  <label class="form-label small fw-semibold mb-1">Khóa học</label>
                  <select name="khoaHoc" class="form-select" style="min-width: 150px;">
                    <option value="">-- Tất cả khóa --</option>
                    <c:forEach var="khoa" items="${danhSachKhoaHoc}">
                      <option value="${khoa}" <c:if test="${khoaHocDaChon == khoa}">selected</c:if>>${khoa}</option>
                    </c:forEach>
                  </select>
                </div>
                <button type="submit" class="btn btn-primary">
                  <i class="bi bi-funnel me-1"></i>Lọc
                </button>
              </form>
            </div>
            <div class="col-lg-4">
              <div class="btn-group w-100" role="group">
                <a href="${pageContext.request.contextPath}/admin/danhsachsinhvien/index" 
                   class="btn btn-outline-secondary btn-sm <c:if test='${empty trangThaiDaChon}'>active</c:if>">Tất cả</a>
                <a href="${pageContext.request.contextPath}/admin/danhsachsinhvien/index?trangThai=Đang học" 
                   class="btn btn-outline-primary btn-sm <c:if test='${trangThaiDaChon == "Đang học"}'>active</c:if>">Đang học</a>
                <a href="${pageContext.request.contextPath}/admin/danhsachsinhvien/index?trangThai=Bảo lưu" 
                   class="btn btn-outline-warning btn-sm <c:if test='${trangThaiDaChon == "Bảo lưu"}'>active</c:if>">Bảo lưu</a>
                <a href="${pageContext.request.contextPath}/admin/danhsachsinhvien/index?trangThai=Tốt nghiệp" 
                   class="btn btn-outline-success btn-sm <c:if test='${trangThaiDaChon == "Tốt nghiệp"}'>active</c:if>">Tốt nghiệp</a>
                <a href="${pageContext.request.contextPath}/admin/danhsachsinhvien/index?trangThai=Nghỉ học" 
                   class="btn btn-outline-danger btn-sm <c:if test='${trangThaiDaChon == "Nghỉ học"}'>active</c:if>">Nghỉ học</a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Main Table Section -->
      <section class="section">
        <form
          action="${pageContext.request.contextPath}/admin/danhsachsinhvien/index"
          method="post"
          id="deleteForm"
        >
          <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center py-3">
              <h5 class="card-title mb-0">
                <i class="bi bi-list-ul me-2"></i>Danh sách sinh viên
              </h5>
              <button
                class="btn btn-danger btn-sm"
                type="submit"
                onclick="return confirm('Bạn có chắc chắn muốn xóa các sinh viên đã chọn không?');"
              >
                <i class="bi bi-trash me-1"></i>
                Xóa đã chọn
              </button>
            </div>
            <div class="card-body p-0">
              <div class="table-responsive">
                <table class="table datatable table-hover mb-0">
                  <thead>
                    <tr>
                      <th class="text-center" style="width: 40px; color: #000 !important;">
                        <input type="checkbox" class="form-check-input" id="selectAll" />
                      </th>
                      <th class="text-center" style="color: #000 !important;">Mã SV</th>
                      <th style="color: #000 !important;">Họ tên</th>
                      <th class="text-center" style="color: #000 !important;">Ngày sinh</th>
                      <th class="text-center" style="color: #000 !important;">Giới tính</th>
                      <th style="color: #000 !important;">Email</th>
                      <th style="color: #000 !important;">Lớp</th>
                      <th class="text-center" style="color: #000 !important;">Khóa</th>
                      <th style="color: #000 !important;">Ngành</th>
                      <th class="text-center" style="color: #000 !important;">SĐT</th>
                      <th class="text-center" style="color: #000 !important;">Ảnh</th>
                      <th class="text-center" style="color: #000 !important;">Trạng thái</th>
                      <th class="text-center" style="width: 120px; color: #000 !important;">Hành động</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="sv" items="${danhSachSinhVien}" varStatus="loop">
                      <tr>
                        <td class="text-center">
                          <input
                            type="checkbox"
                            class="form-check-input row-checkbox"
                            name="MSSV"
                            value="${sv.MSSV}"
                          />
                        </td>
                        <td class="text-center fw-semibold text-primary">
                          <c:out value="${sv.MSSV}" />
                        </td>
                        <td>
                          <div class="d-flex align-items-center">
                            <div class="avatar-sm me-2" style="width: 36px; height: 36px; background: linear-gradient(135deg, #2563EB, #1D4ED8); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-weight: 600; font-size: 0.85rem;">
                              ${sv.HoTenSV.substring(0,1)}
                            </div>
                            <span class="fw-medium"><c:out value="${sv.HoTenSV}" /></span>
                          </div>
                        </td>
                        <td class="text-center">
                          <c:out value="${sv.NgaySinhSV}" />
                        </td>
                        <td class="text-center">
                          <span class="badge ${sv.GioiTinhSV == 'Nam' ? 'bg-primary-soft text-primary' : 'bg-danger-soft text-danger'}" style="background: ${sv.GioiTinhSV == 'Nam' ? 'rgba(37, 99, 235, 0.1)' : 'rgba(239, 68, 68, 0.1)'};">
                            <c:out value="${sv.GioiTinhSV}" />
                          </span>
                        </td>
                        <td>
                          <small class="text-muted"><c:out value="${sv.EmailSV}" /></small>
                        </td>
                        <td>
                          <c:out value="${sv.TenLop}" />
                        </td>
                        <td class="text-center">
                          <span class="badge bg-secondary"><c:out value="${sv.KhoaHoc}" /></span>
                        </td>
                        <td>
                          <c:out value="${sv.TenNganh}" />
                        </td>
                        <td class="text-center">
                          <small><c:out value="${sv.SoDienThoaiSV}" /></small>
                        </td>
                        <td class="text-center">
                          <img
                            src="${pageContext.request.contextPath}/static/uploads/${sv.AnhSV}"
                            alt="${sv.HoTenSV}"
                            class="img-thumbnail"
                            style="width: 50px; height: 65px; object-fit: cover;"
                          />
                        </td>
                        <td class="text-center">
                          <c:choose>
                            <c:when test="${sv.TrangThaiSV == 'Đang học'}">
                              <span class="status-badge status-active">Đang học</span>
                            </c:when>
                            <c:when test="${sv.TrangThaiSV == 'Tốt nghiệp'}">
                              <span class="badge" style="background: rgba(16, 185, 129, 0.1); color: #065F46;">Tốt nghiệp</span>
                            </c:when>
                            <c:when test="${sv.TrangThaiSV == 'Bảo lưu'}">
                              <span class="status-badge status-pending">Bảo lưu</span>
                            </c:when>
                            <c:otherwise>
                              <span class="status-badge status-inactive">Nghỉ học</span>
                            </c:otherwise>
                          </c:choose>
                        </td>
                        <td class="text-center">
                          <div class="action-buttons justify-content-center">
                            <a
                              class="btn btn-info btn-sm"
                              href="${pageContext.request.contextPath}/admin/danhsachsinhvien/sua?MSSV=${sv.MSSV}"
                              title="Sửa"
                            >
                              <i class="bi bi-pencil"></i>
                            </a>
                            <a
                              class="btn btn-danger btn-sm"
                              href="${pageContext.request.contextPath}/admin/danhsachsinhvien/xoa?MSSV=${sv.MSSV}"
                              onclick="return confirm('Bạn có chắc chắn muốn xóa sinh viên này không?');"
                              title="Xóa"
                            >
                              <i class="bi bi-trash"></i>
                            </a>
                          </div>
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
    
    <script>
      // Select All Checkbox
      document.getElementById('selectAll').addEventListener('change', function() {
        const checkboxes = document.querySelectorAll('.row-checkbox');
        checkboxes.forEach(cb => cb.checked = this.checked);
      });
    </script>
  </body>
</html>

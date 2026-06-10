<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Danh sách lớp học phần - Admin</title>
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
          <i class="bi bi-check-circle me-2"></i>
          <strong>Thành công!</strong>
          <c:out value="${thongBao}" />
          <c:remove scope="session" var="thongBao" />
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
      </c:if>

      <div class="pagetitle mb-4">
        <div class="d-flex justify-content-between align-items-center flex-wrap gap-2">
          <div>
            <h1><i class="bi bi-journal-bookmark me-2"></i>Quản lý lớp học phần</h1>
            <nav>
              <ol class="breadcrumb mb-0">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/index">Trang chủ</a></li>
                <li class="breadcrumb-item active">Danh sách lớp học phần</li>
              </ol>
            </nav>
          </div>
          <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/danhsachlophocphan/them">
            <i class="bi bi-plus-circle me-1"></i>Thêm lớp học phần
          </a>
        </div>
      </div>

      <div class="card mb-4">
        <div class="card-body py-3">
          <form action="${pageContext.request.contextPath}/admin/danhsachlophocphan/index" method="get">
            <div class="row align-items-end g-3">
              <div class="col-lg-3 col-md-6">
                <label class="form-label small text-muted mb-1">Ngành</label>
                <select name="tenNganh" class="form-select">
                  <option value="">-- Tất cả ngành --</option>
                  <c:forEach var="nganh" items="${danhSachNganh}">
                    <option value="${nganh}" <c:if test="${tenNganhDaChon == nganh}">selected</c:if>>${nganh}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="col-lg-3 col-md-6">
                <label class="form-label small text-muted mb-1">Giảng viên</label>
                <select name="hoTenGV" class="form-select">
                  <option value="">-- Tất cả --</option>
                  <c:forEach var="gv" items="${danhSachGiangVien}">
                    <option value="${gv}" <c:if test="${tenGiangVienDaChon == gv}">selected</c:if>>${gv}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="col-lg-3 col-md-6">
                <label class="form-label small text-muted mb-1">Học phần</label>
                <select name="tenHocPhan" class="form-select">
                  <option value="">-- Tất cả --</option>
                  <c:forEach var="hp" items="${danhSachHocPhan}">
                    <option value="${hp}" <c:if test="${tenHocPhanDaChon == hp}">selected</c:if>>${hp}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="col-lg-3 col-md-6">
                <button type="submit" class="btn btn-outline-primary w-100">
                  <i class="bi bi-funnel me-1"></i>Áp dụng bộ lọc
                </button>
              </div>
            </div>
          </form>
        </div>
      </div>

      <div class="card">
        <div class="card-header py-3 d-flex justify-content-between align-items-center flex-wrap gap-2">
          <h5 class="card-title mb-0"><i class="bi bi-list-ul me-2"></i>Danh sách lớp học phần</h5>
          <div class="input-group" style="max-width: 300px;">
            <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
            <input type="text" class="form-control border-start-0 ps-0" placeholder="Tìm kiếm..." id="searchInput">
          </div>
        </div>
        <div class="card-body p-0">
          <form action="${pageContext.request.contextPath}/admin/danhsachlophocphan" method="post">
            <div class="d-flex justify-content-between align-items-center px-3 py-2 bg-light border-bottom">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" id="selectAll">
                <label class="form-check-label small" for="selectAll">Chọn tất cả</label>
              </div>
              <button class="btn btn-outline-danger btn-sm" type="submit" onclick="return confirm('Bạn có chắc chắn muốn xóa các mục đã chọn không?');">
                <i class="bi bi-trash me-1"></i>Xóa đã chọn
              </button>
            </div>
            <div class="table-responsive">
              <table class="table table-hover align-middle mb-0" id="dataTable">
                <thead>
                  <tr>
                    <th style="width: 40px;"></th>
                    <th>Lớp học phần</th>
                    <th>Học phần / Ngành</th>
                    <th>Giảng viên</th>
                    <th class="text-center">Lịch học</th>
                    <th class="text-center">Thời gian</th>
                    <th class="text-center">Sĩ số</th>
                    <th class="text-center">Trạng thái</th>
                    <th class="text-center" style="width: 120px;">Thao tác</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="lhp" items="${danhSachLopHocPhan}">
                    <tr class="table-row-hover">
                      <td class="text-center">
                        <input type="checkbox" class="form-check-input row-checkbox" name="MaLopHocPhan" value="${lhp.MaLopHocPhan}" />
                      </td>
                      <td>
                        <div class="d-flex align-items-center">
                          <div class="me-3" style="width: 40px; height: 40px; background: linear-gradient(135deg, #2563EB, #1D4ED8); border-radius: 10px; display: flex; align-items: center; justify-content: center;">
                            <i class="bi bi-journal text-white"></i>
                          </div>
                          <div>
                            <div class="fw-semibold"><c:out value="${lhp.TenLopHocPhan}" /></div>
                            <small class="text-muted">
                              <i class="bi bi-hash"></i><c:out value="${lhp.MaLopHocPhan}" /> 
                              <i class="bi bi-door-open me-1"></i><c:out value="${lhp.PhongHoc}" />
                            </small>
                          </div>
                        </div>
                      </td>
                      <td>
                        <div class="fw-medium"><c:out value="${lhp.TenHocPhan}" /></div>
                        <small class="text-muted"><c:out value="${lhp.TenNganh}" /></small>
                      </td>
                      <td>
                        <div class="d-flex align-items-center">
                          <div class="avatar-initials me-2" style="width: 32px; height: 32px; background: rgba(16, 185, 129, 0.1); color: #10B981; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 0.75rem;">
                            <i class="bi bi-person"></i>
                          </div>
                          <c:out value="${lhp.TenGiangVien}" />
                        </div>
                      </td>
                      <td class="text-center">
                        <span class="badge bg-info-subtle text-info">
                          <i class="bi bi-clock me-1"></i><c:out value="${lhp.ThuTiet}" />
                        </span>
                        <div class="small text-muted mt-1"><c:out value="${lhp.SoBuoi}" /> buổi  <c:out value="${lhp.SoTiet}" /> tiết</div>
                      </td>
                      <td class="text-center">
                        <small>
                          <div><i class="bi bi-calendar-event text-success me-1"></i><c:out value="${lhp.ThoiGianBatDau}" /></div>
                          <div><i class="bi bi-calendar-x text-danger me-1"></i><c:out value="${lhp.ThoiGianKetThuc}" /></div>
                        </small>
                      </td>
                      <td class="text-center">
                        <span class="badge bg-primary-subtle text-primary px-2 py-1">
                          <i class="bi bi-people me-1"></i><c:out value="${lhp.SoLuongToiDa}" />
                        </span>
                      </td>
                      <td class="text-center">
                        <c:choose>
                          <c:when test="${lhp.TrangThaiLopHocPhan == 'Đang mở' || lhp.TrangThaiLopHocPhan == 'Mở'}">
                            <span class="status-badge status-active"><c:out value="${lhp.TrangThaiLopHocPhan}" /></span>
                          </c:when>
                          <c:when test="${lhp.TrangThaiLopHocPhan == 'Đã đóng' || lhp.TrangThaiLopHocPhan == 'Đóng'}">
                            <span class="status-badge status-inactive"><c:out value="${lhp.TrangThaiLopHocPhan}" /></span>
                          </c:when>
                          <c:otherwise>
                            <span class="status-badge status-pending"><c:out value="${lhp.TrangThaiLopHocPhan}" /></span>
                          </c:otherwise>
                        </c:choose>
                      </td>
                      <td class="text-center">
                        <div class="btn-group btn-group-sm">
                          <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/admin/danhsachlophocphan/sua?MaLopHocPhan=${lhp.MaLopHocPhan}" title="Sửa"><i class="bi bi-pencil"></i></a>
                          <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/admin/danhsachlophocphan/xoa?MaLopHocPhan=${lhp.MaLopHocPhan}" onclick="return confirm('Bạn có chắc chắn muốn xóa không?');" title="Xóa"><i class="bi bi-trash"></i></a>
                        </div>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
            <c:if test="${empty danhSachLopHocPhan}">
              <div class="text-center py-5">
                <i class="bi bi-inbox" style="font-size: 4rem; color: #CBD5E1;"></i>
                <h5 class="text-muted mt-3">Không có dữ liệu</h5>
              </div>
            </c:if>
          </form>
        </div>
      </div>
    </main>
    <jsp:include page="/WEB-INF/views/giaodien/footer.jsp" />
    <script>
      document.getElementById('selectAll')?.addEventListener('change', function() {
        document.querySelectorAll('.row-checkbox').forEach(cb => cb.checked = this.checked);
      });
      document.getElementById('searchInput')?.addEventListener('input', function() {
        const searchTerm = this.value.toLowerCase();
        document.querySelectorAll('#dataTable tbody tr').forEach(row => {
          row.style.display = row.textContent.toLowerCase().includes(searchTerm) ? '' : 'none';
        });
      });
    </script>
  </body>
</html>

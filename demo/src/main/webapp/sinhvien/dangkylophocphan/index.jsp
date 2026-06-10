<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Đăng ký học phần</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Include CSS files -->
    <jsp:include page="/WEB-INF/views/giaodien/head.jsp" />
  </head>

  <body>
    <!-- Include header -->
    <jsp:include page="/WEB-INF/views/giaodien/header.jsp" />

    <!-- Include sidebar -->
    <jsp:include page="/WEB-INF/views/sidebar/sinhvien.jsp" />

    <main id="main" class="main">
      <!-- Toast Notification -->
      <c:if test="${not empty thongBao}">
        <div
          class="alert alert-success alert-dismissible fade show"
          role="alert"
        >
          <i class="bi bi-check-circle me-2"></i>
          <strong>Thành công!</strong>
          <c:out value="${thongBao}" />
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
            <h1><i class="bi bi-journal-plus me-2"></i>Đăng ký học phần</h1>
            <nav>
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/sinhvien">Trang chủ</a></li>
                <li class="breadcrumb-item active">Đăng ký học phần</li>
              </ol>
            </nav>
          </div>
          <a href="${pageContext.request.contextPath}/sinhvien/dangkylophocphan/dadangky" class="btn btn-info">
            <i class="bi bi-list-check me-1"></i>
            Xem đã đăng ký
          </a>
        </div>
      </div>

      <!-- bo sung -->
      <!-- <div class="row mb-4">
        <div class="col-lg-4 col-md-6 mb-3">
          <div class="stat-card">
            <div class="d-flex justify-content-between align-items-start">
              <div>
                <div class="stat-label">Tổng lớp học phần</div>
                <div class="stat-value">${danhSachLopHocPhan.size()}</div>
                <small class="text-muted">Lớp đang mở</small>
              </div>
              <div class="stat-icon" style="background: linear-gradient(135deg, #2563EB, #1D4ED8);">
                <i class="bi bi-book"></i>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 mb-3">
          <div class="stat-card">
            <div class="d-flex justify-content-between align-items-start">
              <div>
                <div class="stat-label">Có thể đăng ký</div>
                <div class="stat-value text-success">--</div>
                <small class="text-muted">Còn chỗ</small>
              </div>
              <div class="stat-icon" style="background: linear-gradient(135deg, #10B981, #059669);">
                <i class="bi bi-check-circle"></i>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 mb-3">
          <div class="stat-card">
            <div class="d-flex justify-content-between align-items-start">
              <div>
                <div class="stat-label">Đã đầy</div>
                <div class="stat-value text-danger">--</div>
                <small class="text-muted">Hết chỗ</small>
              </div>
              <div class="stat-icon" style="background: linear-gradient(135deg, #EF4444, #DC2626);">
                <i class="bi bi-x-circle"></i>
              </div>
            </div>
          </div>
        </div>
      </div> -->

      <!-- Main Content -->
      <section class="section">
        <div class="card">
          <div class="card-header py-3">
            <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
              <h5 class="card-title mb-0">
                <i class="bi bi-table me-2"></i>Danh sách lớp học phần
              </h5>
              <div class="d-flex gap-2">
                <div class="input-group" style="width: 300px;">
                  <span class="input-group-text bg-transparent border-end-0">
                    <i class="bi bi-search"></i>
                  </span>
                  <input type="text" class="form-control border-start-0" id="searchInput" placeholder="Tìm kiếm học phần...">
                </div>
              </div>
            </div>
          </div>
          <div class="card-body p-0">
            <div class="table-responsive">
              <table class="table datatable table-hover mb-0">
                <thead>
                  <tr>
                    <th class="text-center">Mã LHP</th>
                    <th>Tên LHP</th>
                    <th>Học phần</th>
                    <th>Giảng viên</th>
                    <th class="text-center">Thứ/Tiết</th>
                    <th class="text-center">Phòng</th>
                    <th class="text-center">Thời gian</th>
                    <th class="text-center">Số lượng</th>
                    <th class="text-center">Trạng thái</th>
                    <th class="text-center" style="width: 120px;">Hành động</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="lhp" items="${danhSachLopHocPhan}">
                    <tr>
                      <td class="text-center fw-semibold text-primary">
                        <c:out value="${lhp.MaLopHocPhan}" />
                      </td>
                      <td>
                        <div class="fw-medium"><c:out value="${lhp.TenLopHocPhan}" /></div>
                        <small class="text-muted"><c:out value="${lhp.TenNganh}" /></small>
                      </td>
                      <td>
                        <c:out value="${lhp.TenHocPhan}" />
                      </td>
                      <td>
                        <div class="d-flex align-items-center">
                          <div style="width: 32px; height: 32px; background: linear-gradient(135deg, #10B981, #059669); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-size: 0.75rem; font-weight: 600; margin-right: 8px;">
                            GV
                          </div>
                          <span><c:out value="${lhp.TenGiangVien}" /></span>
                        </div>
                      </td>
                      <td class="text-center">
                        <span class="badge bg-secondary"><c:out value="${lhp.ThuTiet}" /></span>
                      </td>
                      <td class="text-center">
                        <c:out value="${lhp.PhongHoc}" />
                      </td>
                      <td class="text-center">
                        <div class="small">
                          <div><i class="bi bi-calendar3 me-1"></i><c:out value="${lhp.ThoiGianBatDau}" /></div>
                          <div class="text-muted"><c:out value="${lhp.ThoiGianKetThuc}" /></div>
                        </div>
                      </td>
                      <td class="text-center">
                        <div class="d-flex flex-column align-items-center">
                          <span class="fw-semibold">
                            <c:out value="${lhp.SoLuongDangKy}/${lhp.SoLuongToiDa}" />
                          </span>
                          <div class="progress" style="width: 60px; height: 4px;">
                            <div class="progress-bar progress-bar-primary" style="width: ${(lhp.SoLuongDangKy / lhp.SoLuongToiDa) * 100}%"></div>
                          </div>
                        </div>
                      </td>
                      <td class="text-center">
                        <c:choose>
                          <c:when test="${lhp.TrangThaiLopHocPhan == 'Đang mở'}">
                            <span class="status-badge status-active">Đang mở</span>
                          </c:when>
                          <c:when test="${lhp.TrangThaiLopHocPhan == 'Đã đóng'}">
                            <span class="status-badge status-inactive">Đã đóng</span>
                          </c:when>
                          <c:when test="${lhp.TrangThaiLopHocPhan == 'Đã hủy'}">
                            <span class="status-badge status-danger">Đã hủy</span>
                          </c:when>
                          <c:otherwise>
                            <span class="status-badge status-pending"><c:out value="${lhp.TrangThaiLopHocPhan}" /></span>
                          </c:otherwise>
                        </c:choose>
                      </td>
                      <td class="text-center">
                        <c:choose>
                          <c:when test="${lhp.TrangThaiLopHocPhan == 'Đang mở'}">
                            <a
                              class="btn btn-primary btn-sm"
                              href="${pageContext.request.contextPath}/sinhvien/dangkylophocphan/dangky?MaLopHocPhan=${lhp.MaLopHocPhan}"
                            >
                              <i class="bi bi-plus-lg me-1"></i>Đăng ký
                            </a>
                          </c:when>
                          <c:otherwise>
                            <button class="btn btn-secondary btn-sm" disabled>
                              <i class="bi bi-lock me-1"></i>Không thể đăng ký
                            </button>
                          </c:otherwise>
                        </c:choose>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </section>
    </main>

    <!-- Include footer -->
    <jsp:include page="/WEB-INF/views/giaodien/footer.jsp" />
    
    <script>
      // Simple search functionality
      document.getElementById('searchInput').addEventListener('input', function() {
        const searchTerm = this.value.toLowerCase();
        const rows = document.querySelectorAll('tbody tr');
        
        rows.forEach(row => {
          const text = row.textContent.toLowerCase();
          row.style.display = text.includes(searchTerm) ? '' : 'none';
        });
      });
    </script>
  </body>
</html>

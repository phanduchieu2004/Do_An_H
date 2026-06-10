<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Học phần đã đăng ký - Sinh viên</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- CSS files -->
    <jsp:include page="/WEB-INF/views/giaodien/head.jsp" />
  </head>

  <body>
    <!-- Header -->
    <jsp:include page="/WEB-INF/views/giaodien/header.jsp" />

    <!-- Sidebar -->
    <jsp:include page="/WEB-INF/views/sidebar/sinhvien.jsp" />

    <main id="main" class="main">
      <!-- Toast Notification -->
      <c:if test="${not empty thongBao}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
          <i class="bi bi-check-circle me-2"></i>
          <strong>Thành công!</strong>
          <c:out value="${thongBao}" />
          <c:remove scope="session" var="thongBao" />
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
      </c:if>

      <!-- Page Header -->
      <div class="pagetitle mb-4">
        <div class="d-flex justify-content-between align-items-center flex-wrap gap-2">
          <div>
            <h1><i class="bi bi-bookmark-check me-2"></i>Học phần đã đăng ký</h1>
            <nav>
              <ol class="breadcrumb mb-0">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/sinhvien/index">Trang chủ</a></li>
                <li class="breadcrumb-item active">Học phần đã đăng ký</li>
              </ol>
            </nav>
          </div>
          <a href="${pageContext.request.contextPath}/sinhvien/dangkylophocphan/index" class="btn btn-primary">
            <i class="bi bi-plus-circle me-1"></i>Đăng ký thêm
          </a>
        </div>
      </div>

      <!-- Summary Stats -->
      <div class="row mb-4">
        <div class="col-lg-3 col-md-6 mb-3">
          <div class="stat-card hover-lift">
            <div class="d-flex justify-content-between align-items-center">
              <div>
                <div class="stat-label">Tổng học phần</div>
                <div class="stat-value">${danhSachDaDangKy.size()}</div>
              </div>
              <div class="stat-icon" style="background: linear-gradient(135deg, #2563EB, #1D4ED8);">
                <i class="bi bi-journal-bookmark"></i>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 mb-3">
          <div class="stat-card hover-lift">
            <div class="d-flex justify-content-between align-items-center">
              <div>
                <div class="stat-label">Tổng tín chỉ</div>
                <div class="stat-value text-primary">${tongTinChi}</div>
              </div>
              <div class="stat-icon" style="background: linear-gradient(135deg, #8B5CF6, #7C3AED);">
                <i class="bi bi-mortarboard"></i>
              </div>
            </div>
          </div>
        </div>
        <!-- <div class="col-lg-3 col-md-6 mb-3">
          <div class="stat-card hover-lift">
            <div class="d-flex justify-content-between align-items-center">
              <div>
                <div class="stat-label">Điểm TB tích lũy</div>
                <div class="stat-value text-success">${diemTrungBinhTichLuy}</div>
              </div>
              <div class="stat-icon" style="background: linear-gradient(135deg, #10B981, #059669);">
                <i class="bi bi-graph-up-arrow"></i>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 mb-3">
          <div class="stat-card hover-lift">
            <div class="d-flex justify-content-between align-items-center">
              <div>
                <div class="stat-label">Xếp loại học lực</div>
                <div class="stat-value 
                  <c:choose>
                    <c:when test="${xepLoaiHocLuc == 'Xuất sắc' || xepLoaiHocLuc == 'Giỏi'}">text-success</c:when>
                    <c:when test="${xepLoaiHocLuc == 'Khá'}">text-info</c:when>
                    <c:when test="${xepLoaiHocLuc == 'Trung bình'}">text-warning</c:when>
                    <c:when test="${xepLoaiHocLuc == 'Yếu'}">text-danger</c:when>
                    <c:otherwise>text-muted</c:otherwise>
                  </c:choose>
                " style="font-size: 1.25rem;">${xepLoaiHocLuc}</div>
              </div>
              <div class="stat-icon" style="background: linear-gradient(135deg, #F59E0B, #D97706);">
                <i class="bi bi-award"></i>
              </div>
            </div>
          </div>
        </div> -->
      </div>

      <!-- Main Table Card -->
      <div class="card">
        <div class="card-header py-3 d-flex justify-content-between align-items-center flex-wrap gap-2">
          <h5 class="card-title mb-0">
            <i class="bi bi-list-ul me-2"></i>Danh sách học phần
          </h5>
          <div class="input-group" style="max-width: 300px;">
            <span class="input-group-text bg-white border-end-0">
              <i class="bi bi-search text-muted"></i>
            </span>
            <input type="text" class="form-control border-start-0 ps-0" placeholder="Tìm kiếm học phần..." id="searchInput">
          </div>
        </div>
        <div class="card-body p-0">
          <div class="table-responsive">
            <table class="table table-hover align-middle mb-0" id="dataTable">
              <thead>
                <tr>
                  <th class="text-center" style="width: 80px;">ID</th>
                  <th>Lớp học phần</th>
                  <th>Tên học phần</th>
                  <th class="text-center">Tín chỉ</th>
                  <th>Giảng viên</th>
                  <th class="text-center">Lịch học</th>
                  <th class="text-center">Điểm TK</th>
                  <th class="text-center">Xếp loại</th>
                  <th class="text-center" style="width: 140px;">Hành động</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="ds" items="${danhSachDaDangKy}">
                  <tr class="table-row-hover">
                    <td class="text-center">
                      <span class="badge bg-light text-dark">#<c:out value="${ds.IDDangKyHocPhan}" /></span>
                    </td>
                    <td>
                      <div class="d-flex align-items-center">
                        <div class="avatar-sm me-2" style="width: 36px; height: 36px; background: linear-gradient(135deg, #2563EB, #1D4ED8); border-radius: 8px; display: flex; align-items: center; justify-content: center;">
                          <i class="bi bi-journal text-white"></i>
                        </div>
                        <span class="fw-medium"><c:out value="${ds.TenLopHocPhan}" /></span>
                      </div>
                    </td>
                    <td>
                      <span class="text-dark"><c:out value="${ds.TenHocPhan}" /></span>
                    </td>
                    <td class="text-center">
                      <span class="badge bg-primary-subtle text-primary px-3 py-2">
                        <c:out value="${ds.SoTinChi}" /> TC
                      </span>
                    </td>
                    <td>
                      <div class="d-flex align-items-center">
                        <div class="avatar-initials me-2" style="width: 32px; height: 32px; background: rgba(16, 185, 129, 0.1); color: #10B981; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 0.75rem; font-weight: 600;">
                          <i class="bi bi-person-workspace"></i>
                        </div>
                        <c:out value="${ds.TenGiangVien}" />
                      </div>
                    </td>
                    <td class="text-center">
                      <span class="badge bg-info-subtle text-info px-3 py-2">
                        <i class="bi bi-clock me-1"></i>
                        <c:out value="${ds.ThuTiet}" />
                      </span>
                    </td>
                    <td class="text-center">
                      <c:choose>
                        <c:when test="${ds.DiemTongKet != null && ds.DiemTongKet > 0}">
                          <span class="fw-bold 
                            <c:choose>
                              <c:when test="${ds.DiemTongKet >= 8.0}">text-success</c:when>
                              <c:when test="${ds.DiemTongKet >= 6.5}">text-info</c:when>
                              <c:when test="${ds.DiemTongKet >= 5.0}">text-warning</c:when>
                              <c:otherwise>text-danger</c:otherwise>
                            </c:choose>
                          "><c:out value="${ds.DiemTongKet}" /></span>
                        </c:when>
                        <c:otherwise>
                          <span class="text-muted">--</span>
                        </c:otherwise>
                      </c:choose>
                    </td>
                    <td class="text-center">
                      <c:choose>
                        <c:when test="${ds.XepLoaiHP == 'Giỏi'}">
                          <span class="badge bg-success"><c:out value="${ds.XepLoaiHP}" /></span>
                        </c:when>
                        <c:when test="${ds.XepLoaiHP == 'Khá'}">
                          <span class="badge bg-info"><c:out value="${ds.XepLoaiHP}" /></span>
                        </c:when>
                        <c:when test="${ds.XepLoaiHP == 'Trung Bình'}">
                          <span class="badge bg-warning text-dark"><c:out value="${ds.XepLoaiHP}" /></span>
                        </c:when>
                        <c:when test="${ds.XepLoaiHP == 'Yếu'}">
                          <span class="badge bg-danger"><c:out value="${ds.XepLoaiHP}" /></span>
                        </c:when>
                        <c:otherwise>
                          <span class="badge bg-secondary"><c:out value="${ds.XepLoaiHP}" /></span>
                        </c:otherwise>
                      </c:choose>
                    </td>
                    <td class="text-center">
                      <a class="btn btn-outline-danger btn-sm px-3"
                         href="${pageContext.request.contextPath}/sinhvien/dangkylophocphan/huydangky?id=${ds.MaDangKyHocPhan}"
                         onclick="return confirm('Bạn có chắc chắn muốn hủy đăng ký lớp học phần này không?');">
                        <i class="bi bi-x-circle me-1"></i>Hủy
                      </a>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
          
          <!-- Empty State -->
          <c:if test="${empty danhSachDaDangKy}">
            <div class="text-center py-5">
              <div class="mb-3">
                <i class="bi bi-inbox" style="font-size: 4rem; color: #CBD5E1;"></i>
              </div>
              <h5 class="text-muted">Chưa có học phần nào</h5>
              <p class="text-muted mb-3">Bạn chưa đăng ký học phần nào trong học kỳ này</p>
              <a href="${pageContext.request.contextPath}/sinhvien/dangkylophocphan/index" class="btn btn-primary">
                <i class="bi bi-plus-circle me-1"></i>Đăng ký học phần ngay
              </a>
            </div>
          </c:if>
        </div>
      </div>
    </main>

    <!-- Footer -->
    <jsp:include page="/WEB-INF/views/giaodien/footer.jsp" />
    
    <script>
      // Simple search functionality
      document.getElementById('searchInput')?.addEventListener('input', function() {
        const searchTerm = this.value.toLowerCase();
        const rows = document.querySelectorAll('#dataTable tbody tr');
        rows.forEach(row => {
          const text = row.textContent.toLowerCase();
          row.style.display = text.includes(searchTerm) ? '' : 'none';
        });
      });
    </script>
  </body>
</html>

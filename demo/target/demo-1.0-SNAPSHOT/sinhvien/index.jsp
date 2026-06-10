<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Trang chủ - Sinh viên</title>
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
        <div class="alert alert-success alert-dismissible fade show" role="alert">
          <i class="bi bi-check-circle me-2"></i>
          <strong>Thành công!</strong>
          <c:out value="${thongBao}" />
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
      </c:if>

      <!-- Page Header -->
      <div class="pagetitle mb-4">
        <h1><i class="bi bi-house-door me-2"></i>Trang chủ</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item active">Trang chủ</li>
          </ol>
        </nav>
      </div>

      <!-- Welcome Banner -->
      <div class="card mb-4" style="background: linear-gradient(135deg, #2563EB 0%, #1D4ED8 100%); border: none;">
        <div class="card-body p-4">
          <div class="row align-items-center">
            <div class="col-lg-8">
              <h2 class="text-black mb-2">Xin chào, ${sessionScope.SS_HoTen}! 👋</h2>
              <p class="text-black-50 mb-3">Chào mừng bạn quay trở lại hệ thống quản lý sinh viên Đại học Vinh.</p>
              <div class="d-flex gap-2 flex-wrap">
                <a href="${pageContext.request.contextPath}/sinhvien/dangkylophocphan/index" class="btn btn-light">
                  <i class="bi bi-journal-plus me-1"></i>Đăng ký học phần
                </a>
                <a href="${pageContext.request.contextPath}/sinhvien/dangkylophocphan/dadangky" class="btn btn-outline-black">
                  <i class="bi bi-bookmark-check me-1"></i>Xem đã đăng ký
                </a>
              </div>
            </div>
            <div class="col-lg-4 text-end d-none d-lg-block">
              <i class="bi bi-mortarboard" style="font-size: 6rem; color: rgba(255,255,255,0.2);"></i>
            </div>
          </div>
        </div>
      </div>

      <!-- Quick Stats -->
      <div class="row mb-4">
        <div class="col-lg-3 col-md-6 mb-3">
          <div class="stat-card hover-lift">
            <div class="d-flex justify-content-between align-items-start">
              <div>
                <div class="stat-label">Học phần đã đăng ký</div>
                <div class="stat-value">${tongHocPhan}</div>
                <small class="text-muted">Kỳ này</small>
              </div>
              <div class="stat-icon" style="background: linear-gradient(135deg, #2563EB, #1D4ED8);">
                <i class="bi bi-journal-bookmark"></i>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 mb-3">
          <div class="stat-card hover-lift">
            <div class="d-flex justify-content-between align-items-start">
              <div>
                <div class="stat-label">Tổng tín chỉ</div>
                <div class="stat-value">${tongTinChi}/150</div>
                <small class="text-success"><i class="bi bi-check-circle"></i> Đã đăng ký</small>
              </div>
              <div class="stat-icon" style="background: linear-gradient(135deg, #10B981, #059669);">
                <i class="bi bi-award"></i>
              </div>
            </div>
          </div>
        </div>
        <!-- <div class="col-lg-3 col-md-6 mb-3">
          <div class="stat-card hover-lift">
            <div class="d-flex justify-content-between align-items-start">
              <div>
                <div class="stat-label">Điểm TB tích lũy</div>
                <div class="stat-value">${diemTrungBinhTichLuy}</div>
                <small class="text-info">Thang điểm 10</small>
              </div>
              <div class="stat-icon" style="background: linear-gradient(135deg, #F59E0B, #D97706);">
                <i class="bi bi-graph-up"></i>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 mb-3">
          <div class="stat-card hover-lift">
            <div class="d-flex justify-content-between align-items-start">
              <div>
                <div class="stat-label">Xếp loại</div>
                <div class="stat-value 
                  <c:choose>
                    <c:when test="${xepLoaiHocLuc == 'Xuất sắc' || xepLoaiHocLuc == 'Giỏi'}">text-success</c:when>
                    <c:when test="${xepLoaiHocLuc == 'Khá'}">text-info</c:when>
                    <c:when test="${xepLoaiHocLuc == 'Trung bình'}">text-warning</c:when>
                    <c:when test="${xepLoaiHocLuc == 'Yếu'}">text-danger</c:when>
                    <c:otherwise>text-muted</c:otherwise>
                  </c:choose>
                " style="font-size: 1.25rem;">${xepLoaiHocLuc}</div>
                <small class="text-muted">Học lực</small>
              </div>
              <div class="stat-icon" style="background: linear-gradient(135deg, #8B5CF6, #7C3AED);">
                <i class="bi bi-star"></i>
              </div>
            </div>
          </div>
        </div> -->
      </div>

      <!-- Quick Actions -->
      <div class="row">
        <div class="col-lg-8 mb-4">
          <div class="card h-100">
            <div class="card-header py-3">
              <h5 class="card-title mb-0"><i class="bi bi-lightning me-2"></i>Thao tác nhanh</h5>
            </div>
            <div class="card-body">
              <div class="row g-3">
                <div class="col-md-6">
                  <a href="${pageContext.request.contextPath}/sinhvien/dangkylophocphan/index" class="card text-decoration-none hover-lift h-100" style="border: 2px dashed #E2E8F0; background: #F8FAFC;">
                    <div class="card-body text-center py-4">
                      <div class="mb-3" style="width: 60px; height: 60px; margin: 0 auto; background: linear-gradient(135deg, #2563EB, #1D4ED8); border-radius: 16px; display: flex; align-items: center; justify-content: center;">
                        <i class="bi bi-journal-plus text-white" style="font-size: 1.5rem;"></i>
                      </div>
                      <h6 class="text-dark mb-1">Đăng ký học phần</h6>
                      <small class="text-muted">Đăng ký các lớp học phần mới</small>
                    </div>
                  </a>
                </div>
                <div class="col-md-6">
                  <a href="${pageContext.request.contextPath}/sinhvien/dangkylophocphan/dadangky" class="card text-decoration-none hover-lift h-100" style="border: 2px dashed #E2E8F0; background: #F8FAFC;">
                    <div class="card-body text-center py-4">
                      <div class="mb-3" style="width: 60px; height: 60px; margin: 0 auto; background: linear-gradient(135deg, #10B981, #059669); border-radius: 16px; display: flex; align-items: center; justify-content: center;">
                        <i class="bi bi-bookmark-check text-white" style="font-size: 1.5rem;"></i>
                      </div>
                      <h6 class="text-dark mb-1">Học phần đã đăng ký</h6>
                      <small class="text-muted">Xem và quản lý đăng ký</small>
                    </div>
                  </a>
                </div>
                <div class="col-md-6">
                  <a href="${pageContext.request.contextPath}/sinhvien/danhsachketqua/xem" class="card text-decoration-none hover-lift h-100" style="border: 2px dashed #E2E8F0; background: #F8FAFC;">
                    <div class="card-body text-center py-4">
                      <div class="mb-3" style="width: 60px; height: 60px; margin: 0 auto; background: linear-gradient(135deg, #F59E0B, #D97706); border-radius: 16px; display: flex; align-items: center; justify-content: center;">
                        <i class="bi bi-clipboard-data text-white" style="font-size: 1.5rem;"></i>
                      </div>
                      <h6 class="text-dark mb-1">Xem kết quả học tập</h6>
                      <small class="text-muted">Tra cứu điểm số</small>
                    </div>
                  </a>
                </div>
                <div class="col-md-6">
                  <a href="#" class="card text-decoration-none hover-lift h-100" style="border: 2px dashed #E2E8F0; background: #F8FAFC;">
                    <div class="card-body text-center py-4">
                      <div class="mb-3" style="width: 60px; height: 60px; margin: 0 auto; background: linear-gradient(135deg, #8B5CF6, #7C3AED); border-radius: 16px; display: flex; align-items: center; justify-content: center;">
                        <i class="bi bi-calendar3 text-white" style="font-size: 1.5rem;"></i>
                      </div>
                      <h6 class="text-dark mb-1">Thời khóa biểu</h6>
                      <small class="text-muted">Xem lịch học chi tiết</small>
                    </div>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Info Panel -->
        <div class="col-lg-4 mb-4">
          <div class="card h-100">
            <div class="card-header py-3">
              <h5 class="card-title mb-0"><i class="bi bi-info-circle me-2"></i>Thông tin</h5>
            </div>
            <div class="card-body">
              <div class="mb-4">
                <div class="d-flex justify-content-between mb-2">
                  <span class="fw-medium">Học kỳ hiện tại</span>
                  <span class="badge bg-primary">HK1 2025-2026</span>
                </div>
                <div class="d-flex justify-content-between mb-2">
                  <span class="fw-medium">Trạng thái đăng ký</span>
                  <span class="status-badge status-active">Đang mở</span>
                </div>
                <div class="d-flex justify-content-between mb-2">
                  <span class="fw-medium">Hạn đăng ký</span>
                  <span class="text-muted">15/01/2026</span>
                </div>
              </div>
              <hr>
              <div class="text-center">
                <p class="text-muted mb-2">Cần hỗ trợ?</p>
                <a href="mailto:support@vinhuni.edu.vn" class="btn btn-outline-primary btn-sm">
                  <i class="bi bi-envelope me-1"></i>Liên hệ hỗ trợ
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Hidden data table for JSTL loop - keeping backend compatibility -->
      <c:if test="${not empty danhSachSinhVien}">
        <div class="card d-none">
          <table class="table">
            <tr>
              <th>1</th>
              <th>2</th>
              <th>3</th>
            </tr>
            <c:forEach var="i" items="${danhSachSinhVien}">
              <tr>
                <td>${i.MSSV}</td>
                <td>${i.HoTenSV}</td>
                <td>${i.NgaySinhSV}</td>
              </tr>
            </c:forEach>
          </table>
        </div>
      </c:if>
    </main>

    <!-- Include footer -->
    <jsp:include page="/WEB-INF/views/giaodien/footer.jsp" />
  </body>
</html>

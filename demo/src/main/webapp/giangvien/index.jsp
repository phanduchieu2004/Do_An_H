<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Trang chủ - Giảng viên</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Include CSS files -->
    <jsp:include page="/WEB-INF/views/giaodien/head.jsp" />
  </head>

  <body>
    <!-- Include header -->
    <jsp:include page="/WEB-INF/views/giaodien/header.jsp" />

    <!-- Include sidebar -->
    <jsp:include page="/WEB-INF/views/sidebar/giangvien.jsp" />

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
        <h2><b><i class="bi bi-house-door me-2"></i>Trang chủ</b></h2>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item active">Trang chủ</li>
          </ol>
        </nav>
      </div>

      <!-- Welcome Banner -->
      <div class="card mb-4" style="background: linear-gradient(135deg, #10B981 0%, #059669 100%); border: none;">
        <div class="card-body p-4">
          <div class="row align-items-center">
            <div class="col-lg-8">
              <h2 class="text-black mb-2">Xin chào, ${sessionScope.SS_HoTen}! 👋</h2>
              <p class="text-black-50 mb-3">Chào mừng bạn quay trở lại hệ thống quản lý giảng dạy Đại học Vinh.</p>
              <div class="d-flex gap-2 flex-wrap">
                <a href="${pageContext.request.contextPath}/giangvien/danhsachketqua/index" class="btn btn-light">
                  <i class="bi bi-clipboard-data me-1"></i>Quản lý điểm
                </a>
                <a href="${pageContext.request.contextPath}/giangvien/hoso/index" class="btn btn-outline-black">
                  <i class="bi bi-person-circle me-1"></i>Hồ sơ cá nhân
                </a>
              </div>
            </div>
            <div class="col-lg-4 text-end d-none d-lg-block">
              <i class="bi bi-person-workspace" style="font-size: 6rem; color: rgba(255,255,255,0.2);"></i>
            </div>
          </div>
        </div>
      </div>

      <!-- Quick Stats -->
      <!-- <div class="row mb-4">
        <div class="col-lg-4 col-md-6 mb-3">
          <div class="stat-card hover-lift">
            <div class="d-flex justify-content-between align-items-start">
              <div>
                <div class="stat-label">Lớp học phần</div>
                <div class="stat-value">--</div>
                <small class="text-muted">Đang phụ trách</small>
              </div>
              <div class="stat-icon" style="background: linear-gradient(135deg, #2563EB, #1D4ED8);">
                <i class="bi bi-journal-bookmark"></i>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 mb-3">
          <div class="stat-card hover-lift">
            <div class="d-flex justify-content-between align-items-start">
              <div>
                <div class="stat-label">Tổng sinh viên</div>
                <div class="stat-value">--</div>
                <small class="text-success"><i class="bi bi-check-circle"></i> Đăng ký học</small>
              </div>
              <div class="stat-icon" style="background: linear-gradient(135deg, #10B981, #059669);">
                <i class="bi bi-mortarboard"></i>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 mb-3">
          <div class="stat-card hover-lift">
            <div class="d-flex justify-content-between align-items-start">
              <div>
                <div class="stat-label">Chưa nhập điểm</div>
                <div class="stat-value text-warning">--</div>
                <small class="text-muted">Cần cập nhật</small>
              </div>
              <div class="stat-icon" style="background: linear-gradient(135deg, #F59E0B, #D97706);">
                <i class="bi bi-exclamation-triangle"></i>
              </div>
            </div>
          </div>
        </div>
      </div> -->

      <!-- Quick Actions & Info -->
      <div class="row">
        <div class="col-lg-8 mb-4">
          <div class="card h-100">
            <div class="card-header py-3">
              <h5 class="card-title mb-0"><i class="bi bi-lightning me-2"></i>Thao tác nhanh</h5>
            </div>
            <div class="card-body">
              <div class="row g-3">
                <div class="col-md-6">
                  <a href="${pageContext.request.contextPath}/giangvien/danhsachketqua/index" class="card text-decoration-none hover-lift h-100" style="border: 2px dashed #E2E8F0; background: #F8FAFC;">
                    <div class="card-body text-center py-4">
                      <div class="mb-3" style="width: 60px; height: 60px; margin: 0 auto; background: linear-gradient(135deg, #2563EB, #1D4ED8); border-radius: 16px; display: flex; align-items: center; justify-content: center;">
                        <i class="bi bi-clipboard-data text-black" style="font-size: 1.5rem;"></i>
                      </div>
                      <h6 class="text-dark mb-1">Quản lý điểm</h6>
                      <small class="text-muted">Nhập và chỉnh sửa điểm sinh viên</small>
                    </div>
                  </a>
                </div>
                <div class="col-md-6">
                  <a href="${pageContext.request.contextPath}/giangvien/hoso/index" class="card text-decoration-none hover-lift h-100" style="border: 2px dashed #E2E8F0; background: #F8FAFC;">
                    <div class="card-body text-center py-4">
                      <div class="mb-3" style="width: 60px; height: 60px; margin: 0 auto; background: linear-gradient(135deg, #10B981, #059669); border-radius: 16px; display: flex; align-items: center; justify-content: center;">
                        <i class="bi bi-person-circle text-black" style="font-size: 1.5rem;"></i>
                      </div>
                      <h6 class="text-dark mb-1">Hồ sơ cá nhân</h6>
                      <small class="text-muted">Xem và cập nhật thông tin cá nhân</small>
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
                  <span class="fw-medium">Hạn nhập điểm</span>
                  <span class="text-muted">30/01/2026</span>
                </div>
                <div class="d-flex justify-content-between mb-2">
                  <span class="fw-medium">Trạng thái</span>
                  <span class="status-badge status-active">Đang giảng dạy</span>
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
    </main>

    <!-- Include footer -->
    <jsp:include page="/WEB-INF/views/giaodien/footer.jsp" />
  </body>
</html>

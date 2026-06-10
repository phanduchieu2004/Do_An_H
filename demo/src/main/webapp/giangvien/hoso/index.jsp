<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Hồ sơ giảng viên - Hệ thống Quản lý</title>
    <meta content="Hồ sơ giảng viên" name="description" />
    <meta content="" name="keywords" />

    <!-- Include CSS files -->
    <jsp:include page="/WEB-INF/views/giaodien/head.jsp" />
    
    <style>
      /* Profile Page Styles */
      .profile-header {
        background: linear-gradient(135deg, #10B981 0%, #059669 100%);
        border-radius: 20px;
        padding: 2.5rem;
        margin-bottom: 2rem;
        position: relative;
        overflow: hidden;
      }
      
      .profile-header::before {
        content: '';
        position: absolute;
        top: -50%;
        right: -20%;
        width: 400px;
        height: 400px;
        background: rgba(255, 255, 255, 0.1);
        border-radius: 50%;
      }
      
      .profile-header::after {
        content: '';
        position: absolute;
        bottom: -30%;
        left: -10%;
        width: 300px;
        height: 300px;
        background: rgba(255, 255, 255, 0.05);
        border-radius: 50%;
      }
      
      .profile-avatar-wrapper {
        position: relative;
        z-index: 2;
      }
      
      .profile-avatar {
        width: 140px;
        height: 140px;
        border-radius: 24px;
        object-fit: cover;
        border: 5px solid rgba(255, 255, 255, 0.3);
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        background: white;
      }
      
      .profile-avatar-placeholder {
        width: 140px;
        height: 140px;
        border-radius: 24px;
        background: rgba(255, 255, 255, 0.2);
        border: 5px solid rgba(255, 255, 255, 0.3);
        display: flex;
        align-items: center;
        justify-content: center;
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
      }
      
      .profile-avatar-placeholder i {
        font-size: 4rem;
        color: rgba(255, 255, 255, 0.8);
      }
      
      .profile-name {
        font-size: 2rem;
        font-weight: 700;
        color: white;
        margin-bottom: 0.5rem;
        position: relative;
        z-index: 2;
      }
      
      .profile-role {
        color: rgba(255, 255, 255, 0.9);
        font-size: 1.1rem;
        font-weight: 500;
        display: inline-flex;
        align-items: center;
        gap: 0.5rem;
        background: rgba(255, 255, 255, 0.2);
        padding: 0.5rem 1rem;
        border-radius: 50px;
        position: relative;
        z-index: 2;
      }
      
      .profile-id {
        color: rgba(255, 255, 255, 0.8);
        font-size: 0.95rem;
        margin-top: 0.5rem;
        position: relative;
        z-index: 2;
      }
      
      .info-card {
        background: white;
        border-radius: 16px;
        border: none;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        transition: all 0.3s ease;
        height: 100%;
      }
      
      .info-card:hover {
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        transform: translateY(-3px);
      }
      
      .info-card .card-header {
        background: transparent;
        border-bottom: 1px solid #E2E8F0;
        padding: 1.25rem 1.5rem;
      }
      
      .info-card .card-header h5 {
        font-weight: 600;
        color: #1E293B;
        margin: 0;
        display: flex;
        align-items: center;
        gap: 0.75rem;
      }
      
      .info-card .card-header .icon-box {
        width: 40px;
        height: 40px;
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.25rem;
      }
      
      .info-card .card-body {
        padding: 1.5rem;
      }
      
      .info-row {
        display: flex;
        padding: 1rem 0;
        border-bottom: 1px solid #F1F5F9;
      }
      
      .info-row:last-child {
        border-bottom: none;
        padding-bottom: 0;
      }
      
      .info-row:first-child {
        padding-top: 0;
      }
      
      .info-label {
        width: 180px;
        flex-shrink: 0;
        color: #64748B;
        font-weight: 500;
        font-size: 0.95rem;
        display: flex;
        align-items: center;
        gap: 0.5rem;
      }
      
      .info-label i {
        width: 20px;
        text-align: center;
        color: #94A3B8;
      }
      
      .info-value {
        flex: 1;
        color: #1E293B;
        font-weight: 500;
        font-size: 0.95rem;
      }
      
      .status-badge {
        padding: 0.4rem 0.9rem;
        border-radius: 50px;
        font-size: 0.8rem;
        font-weight: 600;
      }
      
      .status-active {
        background: #D1FAE5;
        color: #059669;
      }
      
      .status-inactive {
        background: #FEE2E2;
        color: #DC2626;
      }
      
      .quick-action-card {
        background: #F8FAFC;
        border: 2px dashed #E2E8F0;
        border-radius: 16px;
        padding: 1.5rem;
        text-align: center;
        transition: all 0.3s ease;
        text-decoration: none;
        display: block;
        height: 100%;
      }
      
      .quick-action-card:hover {
        background: white;
        border-color: #2563EB;
        transform: translateY(-3px);
        box-shadow: 0 10px 25px rgba(37, 99, 235, 0.15);
      }
      
      .quick-action-icon {
        width: 60px;
        height: 60px;
        border-radius: 16px;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 1rem;
        font-size: 1.5rem;
        color: white;
      }
      
      .quick-action-card h6 {
        color: #1E293B;
        font-weight: 600;
        margin-bottom: 0.5rem;
      }
      
      .quick-action-card p {
        color: #64748B;
        font-size: 0.85rem;
        margin: 0;
      }
      
      @media (max-width: 768px) {
        .profile-header {
          text-align: center;
        }
        
        .info-row {
          flex-direction: column;
          gap: 0.5rem;
        }
        
        .info-label {
          width: 100%;
        }
      }
    </style>
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
          <strong>Thành công!</strong> <c:out value="${thongBao}" />
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
      </c:if>

      <!-- Page Header -->
      <div class="pagetitle mb-4">
        <h1><i class="bi bi-person-circle me-2"></i>Hồ sơ giảng viên</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/giangvien/index">Trang chủ</a></li>
            <li class="breadcrumb-item active">Hồ sơ cá nhân</li>
          </ol>
        </nav>
      </div>

      <!-- Profile Header Banner -->
      <div class="profile-header">
        <div class="row align-items-center">
          <div class="col-auto">
            <div class="profile-avatar-wrapper">
              <c:choose>
                <c:when test="${not empty giangVien.AnhGV}">
                  <img src="${pageContext.request.contextPath}/static/uploads/${giangVien.AnhGV}" 
                       alt="Avatar" class="profile-avatar" 
                       onerror="this.onerror=null; this.parentElement.innerHTML='<div class=\'profile-avatar-placeholder\'><i class=\'bi bi-person-workspace\'></i></div>';">
                </c:when>
                <c:otherwise>
                  <div class="profile-avatar-placeholder">
                    <i class="bi bi-person-workspace"></i>
                  </div>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
          <div class="col">
            <h1 class="profile-name">
              <c:out value="${giangVien.HoTenGV}" default="${sessionScope.SS_HoTen}" />
            </h1>
            <div class="profile-role">
              <i class="bi bi-mortarboard-fill"></i>
              Giảng viên
            </div>
            <p class="profile-id">
              <i class="bi bi-hash"></i> Mã GV: <strong><c:out value="${giangVien.MaGV}" default="${sessionScope.SS_MaNguoiDung}" /></strong>
            </p>
          </div>
          <div class="col-auto d-none d-lg-block" style="position: relative; z-index: 2;">
            <i class="bi bi-person-badge" style="font-size: 5rem; color: rgba(255,255,255,0.2);"></i>
          </div>
        </div>
      </div>

      <div class="row">
        <!-- Personal Information -->
        <div class="col-lg-6 mb-4">
          <div class="info-card">
            <div class="card-header">
              <h5>
                <span class="icon-box" style="background: linear-gradient(135deg, #2563EB, #1D4ED8); color: white;">
                  <i class="bi bi-person"></i>
                </span>
                Thông tin cá nhân
              </h5>
            </div>
            <div class="card-body">
              <div class="info-row">
                <div class="info-label">
                  <i class="bi bi-person-badge"></i> Họ và tên
                </div>
                <div class="info-value">
                  <c:out value="${giangVien.HoTenGV}" default="Chưa cập nhật" />
                </div>
              </div>
              <div class="info-row">
                <div class="info-label">
                  <i class="bi bi-calendar-event"></i> Ngày sinh
                </div>
                <div class="info-value">
                  <c:out value="${giangVien.NgaySinhGV}" default="Chưa cập nhật" />
                </div>
              </div>
              <div class="info-row">
                <div class="info-label">
                  <i class="bi bi-gender-ambiguous"></i> Giới tính
                </div>
                <div class="info-value">
                  <c:out value="${giangVien.GioiTinhGV}" default="Chưa cập nhật" />
                </div>
              </div>
              <div class="info-row">
                <div class="info-label">
                  <i class="bi bi-geo-alt"></i> Quê quán
                </div>
                <div class="info-value">
                  <c:out value="${giangVien.QueQuanGV}" default="Chưa cập nhật" />
                </div>
              </div>
              <div class="info-row">
                <div class="info-label">
                  <i class="bi bi-check-circle"></i> Trạng thái
                </div>
                <div class="info-value">
                  <c:choose>
                    <c:when test="${giangVien.TrangThaiGV == 'Đang làm việc' || giangVien.TrangThaiGV == 'Hoạt động'}">
                      <span class="status-badge status-active">
                        <i class="bi bi-check-circle me-1"></i>${giangVien.TrangThaiGV}
                      </span>
                    </c:when>
                    <c:when test="${not empty giangVien.TrangThaiGV}">
                      <span class="status-badge status-inactive">${giangVien.TrangThaiGV}</span>
                    </c:when>
                    <c:otherwise>
                      <span class="status-badge status-active">
                        <i class="bi bi-check-circle me-1"></i>Đang làm việc
                      </span>
                    </c:otherwise>
                  </c:choose>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Contact Information -->
        <div class="col-lg-6 mb-4">
          <div class="info-card">
            <div class="card-header">
              <h5>
                <span class="icon-box" style="background: linear-gradient(135deg, #10B981, #059669); color: white;">
                  <i class="bi bi-telephone"></i>
                </span>
                Thông tin liên hệ
              </h5>
            </div>
            <div class="card-body">
              <div class="info-row">
                <div class="info-label">
                  <i class="bi bi-envelope"></i> Email
                </div>
                <div class="info-value">
                  <c:choose>
                    <c:when test="${not empty giangVien.EmailGV}">
                      <a href="mailto:${giangVien.EmailGV}" class="text-primary text-decoration-none">
                        <c:out value="${giangVien.EmailGV}" />
                      </a>
                    </c:when>
                    <c:otherwise>Chưa cập nhật</c:otherwise>
                  </c:choose>
                </div>
              </div>
              <div class="info-row">
                <div class="info-label">
                  <i class="bi bi-phone"></i> Số điện thoại
                </div>
                <div class="info-value">
                  <c:choose>
                    <c:when test="${not empty giangVien.SoDienThoaiGV}">
                      <a href="tel:${giangVien.SoDienThoaiGV}" class="text-primary text-decoration-none">
                        <c:out value="${giangVien.SoDienThoaiGV}" />
                      </a>
                    </c:when>
                    <c:otherwise>Chưa cập nhật</c:otherwise>
                  </c:choose>
                </div>
              </div>
              <div class="info-row">
                <div class="info-label">
                  <i class="bi bi-building"></i> Khoa
                </div>
                <div class="info-value">
                  <c:out value="${giangVien.TenKhoa}" default="Chưa cập nhật" />
                </div>
              </div>
              <div class="info-row">
                <div class="info-label">
                  <i class="bi bi-diagram-3"></i> Viện
                </div>
                <div class="info-value">
                  <c:out value="${giangVien.TenVien}" default="Chưa cập nhật" />
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>

      <!-- Quick Actions -->
      <div class="row">
        <div class="col-12 mb-4">
          <div class="info-card">
            <div class="card-header">
              <h5>
                <span class="icon-box" style="background: linear-gradient(135deg, #F59E0B, #D97706); color: white;">
                  <i class="bi bi-lightning"></i>
                </span>
                Thao tác nhanh
              </h5>
            </div>
            <div class="card-body">
              <div class="row g-3">
                <div class="col-md-4">
                  <a href="${pageContext.request.contextPath}/giangvien/danhsachketqua/index" class="quick-action-card">
                    <div class="quick-action-icon" style="background: linear-gradient(135deg, #2563EB, #1D4ED8);">
                      <i class="bi bi-journal-bookmark"></i>
                    </div>
                    <h6>Lớp học phần</h6>
                    <p>Xem danh sách các lớp đang phụ trách</p>
                  </a>
                </div>
                <div class="col-md-4">
                  <a href="${pageContext.request.contextPath}/giangvien/danhsachketqua/index" class="quick-action-card">
                    <div class="quick-action-icon" style="background: linear-gradient(135deg, #10B981, #059669);">
                      <i class="bi bi-clipboard-data"></i>
                    </div>
                    <h6>Quản lý điểm</h6>
                    <p>Nhập và chỉnh sửa điểm sinh viên</p>
                  </a>
                </div>
                <div class="col-md-4">
                  <a href="${pageContext.request.contextPath}/giangvien/index" class="quick-action-card">
                    <div class="quick-action-icon" style="background: linear-gradient(135deg, #8B5CF6, #7C3AED);">
                      <i class="bi bi-house-door"></i>
                    </div>
                    <h6>Trang chủ</h6>
                    <p>Quay lại trang chủ giảng viên</p>
                  </a>
                </div>
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

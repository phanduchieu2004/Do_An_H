<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Hồ sơ sinh viên</title>
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
        <h1><i class="bi bi-person-badge me-2"></i>Hồ sơ sinh viên</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/sinhvien">Trang chủ</a></li>
            <li class="breadcrumb-item active">Hồ sơ sinh viên</li>
          </ol>
        </nav>
      </div>

      <!-- Profile Section -->
      <section class="section profile">
        <div class="row">
          <!-- Profile Card -->
          <div class="col-xl-4">
            <div class="card">
              <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
                <!-- Avatar -->
                <c:choose>
                  <c:when test="${not empty sinhVien.AnhSV}">
                    <img src="${pageContext.request.contextPath}/static/uploads/${sinhVien.AnhSV}" 
                         alt="Ảnh sinh viên" 
                         class="rounded-circle shadow"
                         style="width: 120px; height: 120px; object-fit: cover; border: 4px solid #fff;">
                  </c:when>
                  <c:otherwise>
                    <div class="rounded-circle shadow d-flex align-items-center justify-content-center"
                         style="width: 120px; height: 120px; background: linear-gradient(135deg, #2563EB, #1D4ED8); border: 4px solid #fff;">
                      <i class="bi bi-person-fill text-white" style="font-size: 3rem;"></i>
                    </div>
                  </c:otherwise>
                </c:choose>
                
                <h2 class="mt-3 mb-1 fw-bold"><c:out value="${sinhVien.HoTenSV}" default="${sessionScope.SS_HoTen}" /></h2>
                <h6 class="text-muted mb-2">Sinh viên</h6>
                
                <!-- Student ID Badge -->
                <span class="badge bg-primary-subtle text-primary px-3 py-2 mb-3">
                  <i class="bi bi-hash me-1"></i>MSSV: <c:out value="${sinhVien.MSSV}" default="${sessionScope.SS_TaiKhoan}" />
                </span>
                
                <!-- Status Badge -->
                <c:choose>
                  <c:when test="${sinhVien.TrangThaiSV == 'Đang học'}">
                    <span class="status-badge status-active"><i class="bi bi-check-circle me-1"></i><c:out value="${sinhVien.TrangThaiSV}" /></span>
                  </c:when>
                  <c:when test="${sinhVien.TrangThaiSV == 'Tốt nghiệp'}">
                    <span class="status-badge status-active"><i class="bi bi-award me-1"></i><c:out value="${sinhVien.TrangThaiSV}" /></span>
                  </c:when>
                  <c:when test="${sinhVien.TrangThaiSV == 'Bảo lưu'}">
                    <span class="status-badge status-pending"><i class="bi bi-pause-circle me-1"></i><c:out value="${sinhVien.TrangThaiSV}" /></span>
                  </c:when>
                  <c:otherwise>
                    <span class="status-badge status-inactive"><i class="bi bi-x-circle me-1"></i><c:out value="${sinhVien.TrangThaiSV}" default="Đang học" /></span>
                  </c:otherwise>
                </c:choose>

                <!-- Quick Contact -->
                <div class="mt-4 w-100">
                  <div class="d-flex align-items-center py-2 border-bottom">
                    <i class="bi bi-envelope text-primary me-3"></i>
                    <span class="text-muted"><c:out value="${sinhVien.EmailSV}" default="${sessionScope.SS_Email}" /></span>
                  </div>
                  <div class="d-flex align-items-center py-2">
                    <i class="bi bi-telephone text-primary me-3"></i>
                    <span class="text-muted"><c:out value="${sinhVien.SoDienThoaiSV}" default="Chưa cập nhật" /></span>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Profile Details -->
          <div class="col-xl-8">
            <div class="card">
              <div class="card-body pt-3">
                <!-- Tabs Navigation -->
                <ul class="nav nav-tabs nav-tabs-bordered" role="tablist">
                  <li class="nav-item" role="presentation">
                    <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview" type="button" role="tab">
                      <i class="bi bi-person me-1"></i>Thông tin chung
                    </button>
                  </li>
                  <li class="nav-item" role="presentation">
                    <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-education" type="button" role="tab">
                      <i class="bi bi-mortarboard me-1"></i>Học vấn
                    </button>
                  </li>
                </ul>

                <!-- Tab Content -->
                <div class="tab-content pt-3">
                  <!-- Overview Tab -->
                  <div class="tab-pane fade show active" id="profile-overview" role="tabpanel">
                    <h5 class="card-title mb-3">
                      <i class="bi bi-info-circle me-2 text-primary"></i>Thông tin cá nhân
                    </h5>

                    <div class="row mb-3">
                      <div class="col-lg-4 col-md-4 fw-semibold text-muted">
                        <i class="bi bi-hash me-2"></i>Mã sinh viên
                      </div>
                      <div class="col-lg-8 col-md-8">
                        <c:out value="${sinhVien.MSSV}" default="${sessionScope.SS_TaiKhoan}" />
                      </div>
                    </div>

                    <div class="row mb-3">
                      <div class="col-lg-4 col-md-4 fw-semibold text-muted">
                        <i class="bi bi-person me-2"></i>Họ và tên
                      </div>
                      <div class="col-lg-8 col-md-8">
                        <c:out value="${sinhVien.HoTenSV}" default="${sessionScope.SS_HoTen}" />
                      </div>
                    </div>

                    <div class="row mb-3">
                      <div class="col-lg-4 col-md-4 fw-semibold text-muted">
                        <i class="bi bi-calendar-event me-2"></i>Ngày sinh
                      </div>
                      <div class="col-lg-8 col-md-8">
                        <c:out value="${sinhVien.NgaySinhSV}" default="Chưa cập nhật" />
                      </div>
                    </div>

                    <div class="row mb-3">
                      <div class="col-lg-4 col-md-4 fw-semibold text-muted">
                        <i class="bi bi-gender-ambiguous me-2"></i>Giới tính
                      </div>
                      <div class="col-lg-8 col-md-8">
                        <c:out value="${sinhVien.GioiTinhSV}" default="Chưa cập nhật" />
                      </div>
                    </div>

                    <div class="row mb-3">
                      <div class="col-lg-4 col-md-4 fw-semibold text-muted">
                        <i class="bi bi-geo-alt me-2"></i>Quê quán
                      </div>
                      <div class="col-lg-8 col-md-8">
                        <c:out value="${sinhVien.QueQuanSV}" default="Chưa cập nhật" />
                      </div>
                    </div>

                    <div class="row mb-3">
                      <div class="col-lg-4 col-md-4 fw-semibold text-muted">
                        <i class="bi bi-envelope me-2"></i>Email
                      </div>
                      <div class="col-lg-8 col-md-8">
                        <a href="" class="text-primary">
                          <c:out value="${sinhVien.EmailSV}" default="${sessionScope.SS_Email}" />
                        </a>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <div class="col-lg-4 col-md-4 fw-semibold text-muted">
                        <i class="bi bi-telephone me-2"></i>Số điện thoại
                      </div>
                      <div class="col-lg-8 col-md-8">
                        <c:out value="${sinhVien.SoDienThoaiSV}" default="Chưa cập nhật" />
                      </div>
                    </div>

                    <div class="row mb-3">
                      <div class="col-lg-4 col-md-4 fw-semibold text-muted">
                        <i class="bi bi-check-circle me-2"></i>Trạng thái
                      </div>
                      <div class="col-lg-8 col-md-8">
                        <c:choose>
                          <c:when test="${sinhVien.TrangThaiSV == 'Đang học'}">
                            <span class="badge bg-success"><c:out value="${sinhVien.TrangThaiSV}" /></span>
                          </c:when>
                          <c:when test="${sinhVien.TrangThaiSV == 'Tốt nghiệp'}">
                            <span class="badge bg-primary"><c:out value="${sinhVien.TrangThaiSV}" /></span>
                          </c:when>
                          <c:when test="${sinhVien.TrangThaiSV == 'Bảo lưu'}">
                            <span class="badge bg-warning"><c:out value="${sinhVien.TrangThaiSV}" /></span>
                          </c:when>
                          <c:otherwise>
                            <span class="badge bg-secondary"><c:out value="${sinhVien.TrangThaiSV}" default="Đang học" /></span>
                          </c:otherwise>
                        </c:choose>
                      </div>
                    </div>
                  </div>

                  <!-- Education Tab -->
                  <div class="tab-pane fade" id="profile-education" role="tabpanel">
                    <h5 class="card-title mb-3">
                      <i class="bi bi-mortarboard me-2 text-primary"></i>Thông tin học vấn
                    </h5>

                    <div class="row mb-3">
                      <div class="col-lg-4 col-md-4 fw-semibold text-muted">
                        <i class="bi bi-people me-2"></i>Lớp
                      </div>
                      <div class="col-lg-8 col-md-8">
                        <span class="badge bg-info-subtle text-info px-3 py-2">
                          <c:out value="${sinhVien.TenLop}" default="Chưa cập nhật" />
                        </span>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <div class="col-lg-4 col-md-4 fw-semibold text-muted">
                        <i class="bi bi-book me-2"></i>Ngành học
                      </div>
                      <div class="col-lg-8 col-md-8">
                        <c:out value="${sinhVien.TenNganh}" default="Chưa cập nhật" />
                      </div>
                    </div>

                    <div class="row mb-3">
                      <div class="col-lg-4 col-md-4 fw-semibold text-muted">
                        <i class="bi bi-building me-2"></i>Khoa
                      </div>
                      <div class="col-lg-8 col-md-8">
                        <c:out value="${sinhVien.TenKhoa}" default="Chưa cập nhật" />
                      </div>
                    </div>

                    <div class="row mb-3">
                      <div class="col-lg-4 col-md-4 fw-semibold text-muted">
                        <i class="bi bi-calendar3 me-2"></i>Khóa học
                      </div>
                      <div class="col-lg-8 col-md-8">
                        <c:out value="${sinhVien.KhoaHoc}" default="Chưa cập nhật" />
                      </div>
                    </div>

                    <!-- Academic Summary Card -->
                    <div class="card bg-light border-0 mt-4">
                      <div class="card-body">
                        <h6 class="fw-bold mb-3"><i class="bi bi-bar-chart me-2"></i>Tổng quan học tập</h6>
                        <div class="row g-3">
                          <div class="col-md-4">
                            <div class="text-center p-3 bg-white rounded shadow-sm">
                              <div class="text-primary fw-bold fs-4">--</div>
                              <small class="text-muted">Tín chỉ tích lũy</small>
                            </div>
                          </div>
                          <div class="col-md-4">
                            <div class="text-center p-3 bg-white rounded shadow-sm">
                              <div class="text-success fw-bold fs-4">--</div>
                              <small class="text-muted">Điểm TB tích lũy</small>
                            </div>
                          </div>
                          <div class="col-md-4">
                            <div class="text-center p-3 bg-white rounded shadow-sm">
                              <div class="text-warning fw-bold fs-4">--</div>
                              <small class="text-muted">Xếp loại</small>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Quick Actions Card -->
            <div class="card mt-3">
              <div class="card-body">
                <h5 class="card-title mb-3"><i class="bi bi-lightning me-2"></i>Thao tác nhanh</h5>
                <div class="row g-2">
                  <div class="col-md-4">
                    <a href="${pageContext.request.contextPath}/sinhvien/dangkylophocphan" class="btn btn-outline-primary w-100">
                      <i class="bi bi-journal-plus me-1"></i>Đăng ký học phần
                    </a>
                  </div>
                  <div class="col-md-4">
                    <a href="${pageContext.request.contextPath}/sinhvien/dangkylophocphan/dadangky" class="btn btn-outline-success w-100">
                      <i class="bi bi-bookmark-check me-1"></i>Xem đã đăng ký
                    </a>
                  </div>
                  <div class="col-md-4">
                    <a href="${pageContext.request.contextPath}/sinhvien/danhsachketqua/xem" class="btn btn-outline-info w-100">
                      <i class="bi bi-bar-chart-line me-1"></i>Xem bảng điểm
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>

    <!-- Include footer -->
    <jsp:include page="/WEB-INF/views/giaodien/footer.jsp" />
  </body>
</html>

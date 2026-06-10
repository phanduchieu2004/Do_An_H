  <%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
  prefix="c" %>
  <!DOCTYPE html>
  <html lang="vi">
    <head>
      <meta charset="UTF-8" />
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <meta content="width=device-width, initial-scale=1.0" name="viewport" />
      <title>Trang chủ - Admin</title>
      <meta content="" name="description" />
      <meta content="" name="keywords" />

      <!-- Include CSS files -->
      <jsp:include page="/WEB-INF/views/giaodien/head.jsp" />
    </head>

    <body>
      <!-- Include header -->
      <jsp:include page="/WEB-INF/views/giaodien/header.jsp" />

      <!-- Include sidebar -->
      <jsp:include page="/WEB-INF/views/sidebar/admin.jsp" />

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
          <h2><b><i class="bi bi-speedometer2 me-2"></i>Bảng điều khiển</b></h2>
          <nav>
            <ol class="breadcrumb">
              <li class="breadcrumb-item active">Trang chủ</li>
            </ol>
          </nav>
        </div>


        <!-- Quick Actions -->
        <div class="row mb-4">
          <div class="col-12">
            <div class="card">
              <div class="card-header py-3">
                <h5 class="card-title mb-0"><i class="bi bi-lightning me-2"></i>Thao tác nhanh</h5>
              </div>
              <div class="card-body">
                <div class="row g-3">
                  <div class="col-lg-3 col-md-6">
                    <a href="${pageContext.request.contextPath}/admin/danhsachsinhvien/them" class="btn btn-primary w-100 py-3">
                      <i class="bi bi-person-plus d-block mb-2" style="font-size: 1.5rem;"></i>
                      Thêm sinh viên
                    </a>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <a href="${pageContext.request.contextPath}/admin/danhsachgiangvien/them" class="btn btn-success w-100 py-3">
                      <i class="bi bi-person-plus-fill d-block mb-2" style="font-size: 1.5rem;"></i>
                      Thêm giảng viên
                    </a>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <a href="${pageContext.request.contextPath}/admin/danhsachlophocphan/them" class="btn btn-warning w-100 py-3">
                      <i class="bi bi-journal-plus d-block mb-2" style="font-size: 1.5rem;"></i>
                      Thêm lớp học phần
                    </a>
                  </div>
                  <div class="col-lg-3 col-md-6">
                    <a href="${pageContext.request.contextPath}/admin/danhsachdangkyhocphan/index" class="btn btn-info w-100 py-3">
                      <i class="bi bi-clipboard-data d-block mb-2" style="font-size: 1.5rem;"></i>
                      Quản lý đăng ký
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Recent Activity / Info Cards -->
        <div class="row">
          <div class="col-lg-6 mb-4">
            <div class="card h-100">
              <div class="card-header py-3 d-flex justify-content-between align-items-center">
                <h5 class="card-title mb-0"><i class="bi bi-people me-2"></i>Quản lý nhanh</h5>
              </div>
              <div class="card-body">
                <div class="list-group list-group-flush">
                  <a href="${pageContext.request.contextPath}/admin/danhsachsinhvien/index" class="list-group-item list-group-item-action d-flex align-items-center py-3">
                    <div class="me-3" style="width: 40px; height: 40px; background: rgba(37, 99, 235, 0.1); border-radius: 10px; display: flex; align-items: center; justify-content: center;">
                      <i class="bi bi-mortarboard text-primary"></i>
                    </div>
                    <div class="flex-grow-1">
                      <div class="fw-semibold">Danh sách sinh viên</div>
                      <small class="text-muted">Xem và quản lý tất cả sinh viên</small>
                    </div>
                    <i class="bi bi-chevron-right text-muted"></i>
                  </a>
                  <a href="${pageContext.request.contextPath}/admin/danhsachgiangvien/index" class="list-group-item list-group-item-action d-flex align-items-center py-3">
                    <div class="me-3" style="width: 40px; height: 40px; background: rgba(16, 185, 129, 0.1); border-radius: 10px; display: flex; align-items: center; justify-content: center;">
                      <i class="bi bi-person-workspace text-success"></i>
                    </div>
                    <div class="flex-grow-1">
                      <div class="fw-semibold">Danh sách giảng viên</div>
                      <small class="text-muted">Xem và quản lý giảng viên</small>
                    </div>
                    <i class="bi bi-chevron-right text-muted"></i>
                  </a>
                  <a href="${pageContext.request.contextPath}/admin/danhsachlophocphan/index" class="list-group-item list-group-item-action d-flex align-items-center py-3">
                    <div class="me-3" style="width: 40px; height: 40px; background: rgba(245, 158, 11, 0.1); border-radius: 10px; display: flex; align-items: center; justify-content: center;">
                      <i class="bi bi-book text-warning"></i>
                    </div>
                    <div class="flex-grow-1">
                      <div class="fw-semibold">Lớp học phần</div>
                      <small class="text-muted">Quản lý các lớp học phần</small>
                    </div>
                    <i class="bi bi-chevron-right text-muted"></i>
                  </a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-6 mb-4">
            <div class="card h-100">
              <div class="card-header py-3">
                <h5 class="card-title mb-0"><i class="bi bi-info-circle me-2"></i>Thông tin hệ thống</h5>
              </div>
              <div class="card-body">
                <div class="mb-4">
                  <div class="d-flex justify-content-between mb-2">
                    <span class="fw-medium">Phiên bản hệ thống</span>
                    <span class="badge bg-primary">v1.0.0</span>
                  </div>
                  <div class="d-flex justify-content-between mb-2">
                    <span class="fw-medium">Học kỳ hiện tại</span>
                    <span class="text-muted">Học kỳ 1 - 2025-2026</span>
                  </div>
                  <div class="d-flex justify-content-between mb-2">
                    <span class="fw-medium">Trạng thái đăng ký</span>
                    <span class="status-badge status-active">Đang mở</span>
                  </div>
                </div>
                <hr>
                <div class="text-center">
                  <p class="text-muted mb-3">Hệ thống quản lý sinh viên</p>
                  <small class="text-muted">© 2025 Đại học Vinh</small>
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

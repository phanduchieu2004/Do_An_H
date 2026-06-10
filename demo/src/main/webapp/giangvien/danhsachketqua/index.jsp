<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Danh sách lớp học phần - Giảng viên</title>
    <meta content="Danh sách lớp học phần giảng viên phụ trách" name="description" />
    <meta content="" name="keywords" />
    <jsp:include page="/WEB-INF/views/giaodien/head.jsp" />
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/giaodien/header.jsp" />
    <jsp:include page="/WEB-INF/views/sidebar/giangvien.jsp" />
    
    <main id="main" class="main">
      <!-- Toast Notification -->
      <c:if test="${not empty thongBao}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
          <i class="bi bi-check-circle me-2"></i>
          <strong>Thành công!</strong> <c:out value="${thongBao}" />
          <c:remove scope="session" var="thongBao" />
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
      </c:if>
      
      <!-- Page Header -->
      <div class="pagetitle mb-4">
        <h1><i class="bi bi-journal-bookmark me-2"></i>Danh sách lớp học phần</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/giangvien/index">Trang chủ</a></li>
            <li class="breadcrumb-item active">Danh sách lớp học phần</li>
          </ol>
        </nav>
      </div>
      
      <!-- Stats Cards -->
      <div class="row mb-4">
        <div class="col-md-4 mb-3">
          <div class="stat-card hover-lift">
            <div class="d-flex justify-content-between align-items-start">
              <div>
                <div class="stat-label">Tổng lớp học phần</div>
                <div class="stat-value">${not empty danhSachLopHocPhan ? danhSachLopHocPhan.size() : 0}</div>
                <small class="text-muted">Đang phụ trách</small>
              </div>
              <div class="stat-icon" style="background: linear-gradient(135deg, #2563EB, #1D4ED8);">
                <i class="bi bi-journal-bookmark"></i>
              </div>
            </div>
          </div>
        </div>
        <!-- <div class="col-md-4 mb-3">
          <div class="stat-card hover-lift">
            <div class="d-flex justify-content-between align-items-start">
              <div>
                <div class="stat-label">Đang mở</div>
                <div class="stat-value text-success">--</div>
                <small class="text-muted">Lớp đang hoạt động</small>
              </div>
              <div class="stat-icon" style="background: linear-gradient(135deg, #10B981, #059669);">
                <i class="bi bi-check-circle"></i>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-3">
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
        </div> -->
      </div>
      
      <!-- Main Card -->
      <div class="card">
        <div class="card-header py-3 d-flex justify-content-between align-items-center">
          <h5 class="card-title mb-0">
            <i class="bi bi-list-ul me-2"></i>Danh sách các lớp phụ trách
          </h5>
        </div>
        <div class="card-body">
          <c:choose>
            <c:when test="${not empty danhSachLopHocPhan}">
              <div class="table-responsive">
                <table class="table datatable table-hover">
                  <thead>
                    <tr>
                      <th class="text-center" style="width: 60px;">#</th>
                      <th>Mã LHP</th>
                      <th>Tên lớp học phần</th>
                      <th>Học phần</th>
                      <th>Ngành</th>
                      <th class="text-center">Lịch học</th>
                      <th class="text-center">Phòng</th>
                      <th class="text-center">SL tối đa</th>
                      <th class="text-center">Trạng thái</th>
                      <th class="text-center" style="width: 140px;">Thao tác</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="lhp" items="${danhSachLopHocPhan}" varStatus="stt">
                      <tr>
                        <td class="text-center fw-medium">${stt.index + 1}</td>
                        <td>
                          <span class="badge bg-light text-dark fw-medium">
                            <c:out value="${lhp.MaLopHocPhan}" />
                          </span>
                        </td>
                        <td>
                          <div class="fw-medium text-primary"><c:out value="${lhp.TenLopHocPhan}" /></div>
                          <small class="text-muted">
                            <i class="bi bi-clock me-1"></i><c:out value="${lhp.SoBuoi}" /> buổi - <c:out value="${lhp.SoTiet}" /> tiết
                          </small>
                        </td>
                        <td><c:out value="${lhp.TenHocPhan}" /></td>
                        <td><c:out value="${lhp.TenNganh}" /></td>
                        <td class="text-center">
                          <span class="badge bg-info-subtle text-info">
                            <i class="bi bi-calendar3 me-1"></i><c:out value="${lhp.ThuTiet}" />
                          </span>
                          <br>
                          <small class="text-muted"><c:out value="${lhp.SoTuanHoc}" /> tuần</small>
                        </td>
                        <td class="text-center">
                          <span class="badge bg-secondary-subtle text-secondary">
                            <i class="bi bi-geo-alt me-1"></i><c:out value="${lhp.PhongHoc}" />
                          </span>
                        </td>
                        <td class="text-center">
                          <span class="badge bg-primary-subtle text-primary fw-medium">
                            <c:out value="${lhp.SoLuongToiDa}" />
                          </span>
                        </td>
                        <td class="text-center">
                          <c:choose>
                            <c:when test="${lhp.TrangThaiLopHocPhan == 'Mở đăng ký' || lhp.TrangThaiLopHocPhan == 'Đang mở'}">
                              <span class="status-badge status-active">
                                <i class="bi bi-check-circle me-1"></i>${lhp.TrangThaiLopHocPhan}
                              </span>
                            </c:when>
                            <c:when test="${lhp.TrangThaiLopHocPhan == 'Đóng' || lhp.TrangThaiLopHocPhan == 'Đã đóng'}">
                              <span class="status-badge status-inactive">
                                <i class="bi bi-x-circle me-1"></i>${lhp.TrangThaiLopHocPhan}
                              </span>
                            </c:when>
                            <c:otherwise>
                              <span class="status-badge status-pending">
                                ${lhp.TrangThaiLopHocPhan}
                              </span>
                            </c:otherwise>
                          </c:choose>
                        </td>
                        <td class="text-center">
                          <a class="btn btn-sm btn-primary" 
                             href="${pageContext.request.contextPath}/giangvien/danhsachketqua/xem?MaLopHocPhan=${lhp.MaLopHocPhan}"
                             title="Xem danh sách sinh viên và nhập điểm">
                            <i class="bi bi-clipboard-data me-1"></i>Quản lý điểm
                          </a>
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </c:when>
            <c:otherwise>
              <div class="text-center py-5">
                <div class="mb-4">
                  <i class="bi bi-inbox" style="font-size: 4rem; color: #CBD5E1;"></i>
                </div>
                <h5 class="text-muted mb-2">Chưa có lớp học phần</h5>
                <p class="text-muted">Bạn chưa được phân công phụ trách lớp học phần nào.</p>
              </div>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </main>
    
    <jsp:include page="/WEB-INF/views/giaodien/footer.jsp" />
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Quản lý điểm - Giảng viên</title>
    <meta content="Quản lý điểm sinh viên trong lớp học phần" name="description" />
    <meta content="" name="keywords" />
    <jsp:include page="/WEB-INF/views/giaodien/head.jsp" />
    
    <style>
      .grade-input {
        width: 70px;
        text-align: center;
        border: 2px solid #E2E8F0;
        border-radius: 8px;
        padding: 0.4rem;
        font-weight: 500;
        transition: all 0.2s ease;
      }
      
      .grade-input:focus {
        border-color: #2563EB;
        box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
        outline: none;
      }
      
      .grade-badge {
        padding: 0.35rem 0.75rem;
        border-radius: 8px;
        font-weight: 600;
        font-size: 0.85rem;
      }
      
      .grade-a { background: #D1FAE5; color: #059669; }
      .grade-b { background: #DBEAFE; color: #2563EB; }
      .grade-c { background: #FEF3C7; color: #D97706; }
      .grade-d { background: #FED7AA; color: #EA580C; }
      .grade-f { background: #FEE2E2; color: #DC2626; }
      
      .student-row:hover {
        background: #F8FAFC;
      }
      
      .grade-form {
        background: #F8FAFC;
        border-radius: 12px;
        padding: 1rem;
        margin-top: 0.75rem;
        border: 1px solid #E2E8F0;
      }
      
      .info-header {
        background: linear-gradient(135deg, #2563EB 0%, #1D4ED8 100%);
        border-radius: 16px;
        padding: 1.5rem;
        color: white;
        margin-bottom: 1.5rem;
      }
      
      .info-header h4 {
        margin: 0;
        font-weight: 600;
      }
      
      .info-header p {
        margin: 0.5rem 0 0;
        opacity: 0.9;
      }
    </style>
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
        <h1><i class="bi bi-clipboard-data me-2"></i>Quản lý điểm</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/giangvien/index">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/giangvien/danhsachketqua/index">Lớp học phần</a></li>
            <li class="breadcrumb-item active">Quản lý điểm</li>
          </ol>
        </nav>
      </div>
      
      <!-- Class Info Header -->
      <div class="info-header">
        <div class="row align-items-center">
          <div class="col">
            <h4><i class="bi bi-journal-bookmark me-2"></i>Danh sách sinh viên</h4>
            <p>Nhập và chỉnh sửa điểm cho sinh viên trong lớp học phần</p>
          </div>
          <div class="col-auto">
            <a href="${pageContext.request.contextPath}/giangvien/danhsachketqua/index" class="btn btn-light">
              <i class="bi bi-arrow-left me-1"></i>Quay lại
            </a>
          </div>
        </div>
      </div>
      
      <!-- Main Card -->
      <div class="card">
        <div class="card-header py-3 d-flex justify-content-between align-items-center">
          <h5 class="card-title mb-0">
            <i class="bi bi-people me-2"></i>Bảng điểm sinh viên
          </h5>
          <span class="badge bg-primary">
            ${not empty danhSachDiem ? danhSachDiem.size() : 0} sinh viên
          </span>
        </div>
        <div class="card-body">
          <c:choose>
            <c:when test="${not empty danhSachDiem}">
              <div class="table-responsive">
                <table class="table datatable table-hover">
                  <thead>
                    <tr>
                      <th class="text-center" style="width: 50px;">#</th>
                      <th>MSSV</th>
                      <th>Họ và tên</th>
                      <th>Lớp học phần</th>
                      <th class="text-center">Điểm QT</th>
                      <th class="text-center">Điểm thi</th>
                      <th class="text-center">Tổng kết</th>
                      <th class="text-center">Xếp loại</th>
                      <th class="text-center" style="width: 120px;">Thao tác</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="ds" items="${danhSachDiem}" varStatus="stt">
                      <tr class="student-row">
                        <td class="text-center fw-medium">${stt.index + 1}</td>
                        <td>
                          <span class="badge bg-light text-dark fw-medium">
                            <c:out value="${ds.MaSinhVien}" />
                          </span>
                        </td>
                        <td class="fw-medium"><c:out value="${ds.TenSinhVien}" /></td>
                        <td><c:out value="${ds.TenLopHocPhan}" /></td>
                        <td class="text-center">
                          <c:choose>
                            <c:when test="${ds.DiemQuaTrinh != null}">
                              <span class="fw-medium">${ds.DiemQuaTrinh}</span>
                            </c:when>
                            <c:otherwise>
                              <span class="text-muted">--</span>
                            </c:otherwise>
                          </c:choose>
                        </td>
                        <td class="text-center">
                          <c:choose>
                            <c:when test="${ds.DiemThi != null}">
                              <span class="fw-medium">${ds.DiemThi}</span>
                            </c:when>
                            <c:otherwise>
                              <span class="text-muted">--</span>
                            </c:otherwise>
                          </c:choose>
                        </td>
                        <td class="text-center">
                          <c:choose>
                            <c:when test="${ds.DiemTongKet != null}">
                              <span class="fw-bold text-primary">${ds.DiemTongKet}</span>
                            </c:when>
                            <c:otherwise>
                              <span class="text-muted">--</span>
                            </c:otherwise>
                          </c:choose>
                        </td>
                        <td class="text-center">
                          <c:choose>
                            <c:when test="${ds.XepLoai == 'A' || ds.XepLoai == 'A+'}">
                              <span class="grade-badge grade-a">${ds.XepLoai}</span>
                            </c:when>
                            <c:when test="${ds.XepLoai == 'B' || ds.XepLoai == 'B+'}">
                              <span class="grade-badge grade-b">${ds.XepLoai}</span>
                            </c:when>
                            <c:when test="${ds.XepLoai == 'C' || ds.XepLoai == 'C+'}">
                              <span class="grade-badge grade-c">${ds.XepLoai}</span>
                            </c:when>
                            <c:when test="${ds.XepLoai == 'D' || ds.XepLoai == 'D+'}">
                              <span class="grade-badge grade-d">${ds.XepLoai}</span>
                            </c:when>
                            <c:when test="${ds.XepLoai == 'F'}">
                              <span class="grade-badge grade-f">${ds.XepLoai}</span>
                            </c:when>
                            <c:otherwise>
                              <span class="text-muted">--</span>
                            </c:otherwise>
                          </c:choose>
                        </td>
                        <td class="text-center">
                          <button class="btn btn-sm btn-outline-primary" type="button"
                                  data-bs-toggle="collapse" data-bs-target="#form-${ds.IDDiemLopHocPhan}"
                                  title="Nhập/sửa điểm">
                            <i class="bi bi-pencil-square"></i> Nhập điểm
                          </button>
                          
                          <!-- Collapse Form -->
                          <div class="collapse mt-2" id="form-${ds.IDDiemLopHocPhan}">
                            <form action="${pageContext.request.contextPath}/giangvien/danhsachketqua/nhapdiem" 
                                  method="post" class="grade-form">
                              <input type="hidden" name="MaDiemLopHocPhan" value="${ds.MaDiemLopHocPhan}" />
                              <input type="hidden" name="MaDangKyHocPhan" value="${ds.MaDangKyHocPhan}" />
                              <input type="hidden" name="MaLopHocPhan" value="${ds.MaLopHocPhan}" />
                              
                              <div class="row g-2 align-items-center justify-content-center">
                                <div class="col-auto">
                                  <label class="form-label mb-0 small text-muted">Điểm QT:</label>
                                  <input type="number" step="0.1" min="0" max="10" name="DiemQuaTrinh"
                                         value="${ds.DiemQuaTrinh}" placeholder="QT" class="grade-input" />
                                </div>
                                <div class="col-auto">
                                  <label class="form-label mb-0 small text-muted">Điểm Thi:</label>
                                  <input type="number" step="0.1" min="0" max="10" name="DiemThi"
                                         value="${ds.DiemThi}" placeholder="Thi" class="grade-input" />
                                </div>
                                <div class="col-auto">
                                  <button type="submit" class="btn btn-success btn-sm">
                                    <i class="bi bi-check-lg me-1"></i>Lưu điểm
                                  </button>
                                </div>
                              </div>
                            </form>
                          </div>
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
                <h5 class="text-muted mb-2">Chưa có sinh viên</h5>
                <p class="text-muted">Lớp học phần này chưa có sinh viên đăng ký.</p>
                <a href="${pageContext.request.contextPath}/giangvien/danhsachketqua/index" class="btn btn-primary mt-2">
                  <i class="bi bi-arrow-left me-1"></i>Quay lại danh sách
                </a>
              </div>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </main>
    
    <jsp:include page="/WEB-INF/views/giaodien/footer.jsp" />
  </body>
</html>

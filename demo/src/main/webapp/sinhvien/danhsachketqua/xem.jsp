<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Bảng điểm sinh viên</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />
    <jsp:include page="/WEB-INF/views/giaodien/head.jsp" />
    <style>
      .stats-card {
        border-radius: 16px;
        border: none;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
      }
      .stats-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
      }
      .stats-icon {
        width: 60px;
        height: 60px;
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.5rem;
      }
      .stats-icon.primary {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
      }
      .stats-icon.success {
        background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
        color: white;
      }
      .stats-icon.warning {
        background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        color: white;
      }
      .stats-icon.info {
        background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
        color: white;
      }
      .stats-value {
        font-size: 2rem;
        font-weight: 700;
        color: #2d3748;
      }
      .stats-label {
        color: #718096;
        font-size: 0.875rem;
        font-weight: 500;
      }
      .student-info-card {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        border-radius: 16px;
        border: none;
      }
      .student-info-card .card-body {
        padding: 1.5rem;
      }
      .grade-table {
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
      }
      .grade-table thead {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
      }
      .grade-table thead th {
        border: none;
        padding: 1rem;
        font-weight: 600;
        text-transform: uppercase;
        font-size: 0.75rem;
        letter-spacing: 0.5px;
      }
      .grade-table tbody tr {
        transition: background-color 0.2s ease;
      }
      .grade-table tbody tr:hover {
        background-color: #f8f9ff;
      }
      .grade-table tbody td {
        padding: 1rem;
        vertical-align: middle;
        border-bottom: 1px solid #e2e8f0;
      }
      .grade-badge {
        padding: 0.35rem 0.75rem;
        border-radius: 8px;
        font-weight: 600;
        font-size: 0.85rem;
      }
      .grade-a { background-color: #d4edda; color: #155724; }
      .grade-b { background-color: #cce5ff; color: #004085; }
      .grade-c { background-color: #fff3cd; color: #856404; }
      .grade-d { background-color: #ffe5d0; color: #a85600; }
      .grade-f { background-color: #f8d7da; color: #721c24; }
      .gpa-display {
        font-size: 3rem;
        font-weight: 800;
        background: linear-gradient(135deg, #ffffff 0%, #e0e7ff 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
      }
      .print-btn {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border: none;
        color: white;
        padding: 0.75rem 1.5rem;
        border-radius: 10px;
        font-weight: 600;
        transition: transform 0.2s ease, box-shadow 0.2s ease;
      }
      .print-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
        color: white;
      }
      @media print {
        .sidebar, .header, .pagetitle nav, .print-btn, .no-print {
          display: none !important;
        }
        .main {
          margin: 0 !important;
          padding: 20px !important;
        }
        .card {
          box-shadow: none !important;
          border: 1px solid #ddd !important;
        }
      }
    </style>
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/giaodien/header.jsp" />
    <jsp:include page="/WEB-INF/views/sidebar/sinhvien.jsp" />
    
    <main id="main" class="main">
      <!-- Thông báo -->
      <c:if test="${not empty thongBao}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
          <i class="bi bi-check-circle me-2"></i>
          <strong>Thông báo:</strong>
          <c:out value="${thongBao}" />
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
      </c:if>

      <!-- Page Header -->
      <div class="pagetitle d-flex justify-content-between align-items-center mb-4">
        <div>
          <h1><i class="bi bi-journal-text me-2"></i>Bảng điểm sinh viên</h1>
          <nav>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/sinhvien">Trang chủ</a></li>
              <li class="breadcrumb-item active">Bảng điểm</li>
            </ol>
          </nav>
        </div>
        <div class="no-print d-flex gap-2">
          <a href="${pageContext.request.contextPath}/sinhvien/danhsachketqua/xuatexcel" class="print-btn" style="background: linear-gradient(135deg, #10B981 0%, #059669 100%); text-decoration: none;">
            <i class="bi bi-file-earmark-excel me-2"></i>Xuất Excel
          </a>
          <button class="print-btn" onclick="window.print()">
            <i class="bi bi-printer me-2"></i>In bảng điểm
          </button>
        </div>
      </div>

      <!-- Student Info Card -->
      <div class="row mb-4">
        <div class="col-12">
          <div class="card student-info-card">
            <div class="card-body">
              <div class="row align-items-center">
                <div class="col-md-8">
                  <div class="d-flex align-items-center">
                    <div class="rounded-circle bg-white p-3 me-4">
                      <i class="bi bi-person-circle text-primary" style="font-size: 2.5rem;"></i>
                    </div>
                    <div>
                      <h3 class="mb-1 fw-bold text-dark">${sessionScope.SS_HoTen}</h3>
                      <p class="mb-0 text-dark">
                        <i class="bi bi-hash me-1"></i>MSSV: ${sessionScope.SS_MaNguoiDung}
                        <span class="mx-2">|</span>
                        <i class="bi bi-mortarboard me-1"></i>${sessionScope.SS_Nganh}
                      </p>
                    </div>
                  </div>
                </div>
                <div class="col-md-4 text-md-end mt-3 mt-md-0">
                  <div class="d-inline-block text-center">
                    <div class="gpa-display">${gpa}</div>
                    <div class="opacity-75 small">Điểm trung bình tích lũy (GPA)</div>
                    <span class="badge bg-light text-dark mt-2 px-3 py-2">${xepLoaiHocLuc}</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Stats Cards -->
      <!-- <div class="row mb-4">
        <div class="col-xl-3 col-md-6 mb-3 mb-xl-0">
          <div class="card stats-card h-100">
            <div class="card-body d-flex align-items-center">
              <div class="stats-icon primary me-3">
                <i class="bi bi-book"></i>
              </div>
              <div>
                <div class="stats-value">${tongSoMon}</div>
                <div class="stats-label">Tổng số môn</div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-3 mb-xl-0">
          <div class="card stats-card h-100">
            <div class="card-body d-flex align-items-center">
              <div class="stats-icon success me-3">
                <i class="bi bi-check-circle"></i>
              </div>
              <div>
                <div class="stats-value">${soMonDat}</div>
                <div class="stats-label">Môn đạt</div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-md-6 mb-3 mb-xl-0">
          <div class="card stats-card h-100">
            <div class="card-body d-flex align-items-center">
              <div class="stats-icon warning me-3">
                <i class="bi bi-x-circle"></i>
              </div>
              <div>
                <div class="stats-value">${soMonKhongDat}</div>
                <div class="stats-label">Môn không đạt</div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-md-6">
          <div class="card stats-card h-100">
            <div class="card-body d-flex align-items-center">
              <div class="stats-icon info me-3">
                <i class="bi bi-journal-bookmark"></i>
              </div>
              <div>
                <div class="stats-value">${tongTinChi}</div>
                <div class="stats-label">Tổng tín chỉ</div>
              </div>
            </div>
          </div>
        </div>
      </div> -->

      <!-- Grade Table -->
      <section class="section">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header bg-white border-0 py-3">
                <div class="d-flex justify-content-between align-items-center">
                  <h5 class="mb-0 fw-bold">
                    <i class="bi bi-table me-2 text-primary"></i>Chi tiết điểm học phần
                  </h5>
                </div>
              </div>
              <div class="card-body p-0">
                <div class="table-responsive">
                  <table class="table grade-table mb-0">
                    <thead>
                      <tr>
                        <th class="text-center">STT</th>
                        <th>Mã HP</th>
                        <th>Tên học phần</th>
                        <th class="text-center">Tín chỉ</th>
                        <th>Giảng viên</th>
                        <th class="text-center">Điểm QT</th>
                        <th class="text-center">Điểm thi</th>
                        <th class="text-center">Điểm TK (10)</th>
                        <th class="text-center">Điểm TK (4)</th>
                        <th class="text-center">Điểm chữ</th>
                        <th class="text-center">Xếp loại</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:choose>
                        <c:when test="${not empty danhSachDiem}">
                          <c:forEach var="ds" items="${danhSachDiem}" varStatus="loop">
                            <tr>
                              <td class="text-center fw-bold">${loop.index + 1}</td>
                              <td>
                                <span class="badge bg-light text-dark">
                                  <c:out value="${ds.MaHocPhan}" default="${ds.MaLopHocPhan}" />
                                </span>
                              </td>
                              <td>
                                <div class="fw-semibold"><c:out value="${ds.TenHocPhan}" default="${ds.TenLopHocPhan}" /></div>
                                <small class="text-muted"><c:out value="${ds.TenLopHocPhan}" /></small>
                              </td>
                              <td class="text-center">
                                <span class="badge bg-info-subtle text-info">
                                  <c:out value="${ds.SoTinChi}" default="3" />
                                </span>
                              </td>
                              <td><c:out value="${ds.TenGiangVien}" /></td>
                              <td class="text-center">
                                <c:choose>
                                  <c:when test="${ds.DiemQuaTrinh != null}">
                                    <span class="fw-semibold"><fmt:formatNumber value="${ds.DiemQuaTrinh}" maxFractionDigits="1"/></span>
                                  </c:when>
                                  <c:otherwise>
                                    <span class="text-muted">-</span>
                                  </c:otherwise>
                                </c:choose>
                              </td>
                              <td class="text-center">
                                <c:choose>
                                  <c:when test="${ds.DiemThi != null}">
                                    <span class="fw-semibold"><fmt:formatNumber value="${ds.DiemThi}" maxFractionDigits="1"/></span>
                                  </c:when>
                                  <c:otherwise>
                                    <span class="text-muted">-</span>
                                  </c:otherwise>
                                </c:choose>
                              </td>
                              <td class="text-center">
                                <c:choose>
                                  <c:when test="${ds.DiemTongKet != null}">
                                    <span class="fw-bold fs-5">
                                      <fmt:formatNumber value="${ds.DiemTongKet}" maxFractionDigits="1"/>
                                    </span>
                                  </c:when>
                                  <c:otherwise>
                                    <span class="text-muted">-</span>
                                  </c:otherwise>
                                </c:choose>
                              </td>
                              <td class="text-center">
                                <c:choose>
                                  <c:when test="${ds.DiemHe4 != null}">
                                    <span class="fw-semibold"><fmt:formatNumber value="${ds.DiemHe4}" maxFractionDigits="1"/></span>
                                  </c:when>
                                  <c:otherwise>
                                    <span class="text-muted">-</span>
                                  </c:otherwise>
                                </c:choose>
                              </td>
                              <td class="text-center">
                                <c:choose>
                                  <c:when test="${ds.DiemChu == 'A+' || ds.DiemChu == 'A'}">
                                    <span class="grade-badge grade-a">${ds.DiemChu}</span>
                                  </c:when>
                                  <c:when test="${ds.DiemChu == 'B+' || ds.DiemChu == 'B'}">
                                    <span class="grade-badge grade-b">${ds.DiemChu}</span>
                                  </c:when>
                                  <c:when test="${ds.DiemChu == 'C+' || ds.DiemChu == 'C'}">
                                    <span class="grade-badge grade-c">${ds.DiemChu}</span>
                                  </c:when>
                                  <c:when test="${ds.DiemChu == 'D+' || ds.DiemChu == 'D'}">
                                    <span class="grade-badge grade-d">${ds.DiemChu}</span>
                                  </c:when>
                                  <c:when test="${ds.DiemChu == 'F'}">
                                    <span class="grade-badge grade-f">${ds.DiemChu}</span>
                                  </c:when>
                                  <c:otherwise>
                                    <span class="text-muted">-</span>
                                  </c:otherwise>
                                </c:choose>
                              </td>
                              <td class="text-center">
                                <c:choose>
                                  <c:when test="${ds.XepLoai == 'Đạt' || ds.XepLoai == 'Giỏi' || ds.XepLoai == 'Xuất sắc'}">
                                    <span class="badge bg-success-subtle text-success px-3 py-2">
                                      <i class="bi bi-check-circle me-1"></i><c:out value="${ds.XepLoai}" />
                                    </span>
                                  </c:when>
                                  <c:when test="${ds.XepLoai == 'Khá'}">
                                    <span class="badge bg-info-subtle text-info px-3 py-2">
                                      <i class="bi bi-star me-1"></i><c:out value="${ds.XepLoai}" />
                                    </span>
                                  </c:when>
                                  <c:when test="${ds.XepLoai == 'Trung bình'}">
                                    <span class="badge bg-warning-subtle text-warning px-3 py-2">
                                      <i class="bi bi-dash-circle me-1"></i><c:out value="${ds.XepLoai}" />
                                    </span>
                                  </c:when>
                                  <c:when test="${ds.XepLoai == 'Không đạt' || ds.XepLoai == 'Yếu'}">
                                    <span class="badge bg-danger-subtle text-danger px-3 py-2">
                                      <i class="bi bi-x-circle me-1"></i><c:out value="${ds.XepLoai}" />
                                    </span>
                                  </c:when>
                                  <c:otherwise>
                                    <span class="badge bg-secondary-subtle text-secondary px-3 py-2">
                                      <c:out value="${ds.XepLoai}" default="Chưa có" />
                                    </span>
                                  </c:otherwise>
                                </c:choose>
                              </td>
                            </tr>
                          </c:forEach>
                        </c:when>
                        <c:otherwise>
                          <tr>
                            <td colspan="11" class="text-center py-5">
                              <div class="text-muted">
                                <i class="bi bi-inbox display-4 d-block mb-3"></i>
                                <h5>Chưa có dữ liệu điểm</h5>
                                <p class="mb-0">Bạn chưa có kết quả học tập nào được ghi nhận</p>
                              </div>
                            </td>
                          </tr>
                        </c:otherwise>
                      </c:choose>
                    </tbody>
                  </table>
                </div>
              </div>
              <c:if test="${not empty danhSachDiem}">
                <div class="card-footer bg-light border-0 py-3">
                  <div class="row text-center">
                    <div class="col-md-4">
                      <div class="text-muted small">Tổng số môn học</div>
                      <div class="fw-bold text-primary fs-5">${tongSoMon}</div>
                    </div>
                    <div class="col-md-4">
                      <div class="text-muted small">Tổng tín chỉ tích lũy</div>
                      <div class="fw-bold text-success fs-5">${tongTinChi}</div>
                    </div>
                    <div class="col-md-4">
                      <div class="text-muted small">Điểm trung bình tích lũy</div>
                      <div class="fw-bold text-info fs-5">${gpa}/4.0</div>
                    </div>
                  </div>
                </div>
              </c:if>
            </div>
          </div>
        </div>
      </section>

      <!-- Grade Legend -->
      <section class="section mt-4 no-print">
        <div class="card">
          <div class="card-header bg-white border-0 py-3">
            <h5 class="mb-0 fw-bold">
              <i class="bi bi-info-circle me-2 text-primary"></i>Chú thích thang điểm
            </h5>
          </div>
          <div class="card-body">
            <div class="row">
              <div class="col-md-6">
                <h6 class="fw-bold mb-3">Thang điểm chữ</h6>
                <table class="table table-sm table-bordered">
                  <thead class="table-light">
                    <tr>
                      <th>Điểm số (thang 10)</th>
                      <th>Điểm chữ</th>
                      <th>Điểm hệ 4</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr><td>9.0 - 10</td><td><span class="grade-badge grade-a">A+</span></td><td>4.0</td></tr>
                    <tr><td>8.5 - 8.9</td><td><span class="grade-badge grade-a">A</span></td><td>3.7</td></tr>
                    <tr><td>8.0 - 8.4</td><td><span class="grade-badge grade-b">B+</span></td><td>3.5</td></tr>
                    <tr><td>7.0 - 7.9</td><td><span class="grade-badge grade-b">B</span></td><td>3.0</td></tr>
                    <tr><td>6.5 - 6.9</td><td><span class="grade-badge grade-c">C+</span></td><td>2.5</td></tr>
                    <tr><td>5.5 - 6.4</td><td><span class="grade-badge grade-c">C</span></td><td>2.0</td></tr>
                    <tr><td>5.0 - 5.4</td><td><span class="grade-badge grade-d">D+</span></td><td>1.5</td></tr>
                    <tr><td>4.0 - 4.9</td><td><span class="grade-badge grade-d">D</span></td><td>1.0</td></tr>
                    <tr><td>< 4.0</td><td><span class="grade-badge grade-f">F</span></td><td>0.0</td></tr>
                  </tbody>
                </table>
              </div>
              <div class="col-md-6">
                <h6 class="fw-bold mb-3">Xếp loại học lực</h6>
                <table class="table table-sm table-bordered">
                  <thead class="table-light">
                    <tr>
                      <th>GPA (hệ 4)</th>
                      <th>Xếp loại</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr><td>3.6 - 4.0</td><td><span class="badge bg-success">Xuất sắc</span></td></tr>
                    <tr><td>3.2 - 3.59</td><td><span class="badge bg-primary">Giỏi</span></td></tr>
                    <tr><td>2.5 - 3.19</td><td><span class="badge bg-info">Khá</span></td></tr>
                    <tr><td>2.0 - 2.49</td><td><span class="badge bg-warning text-dark">Trung bình</span></td></tr>
                    <tr><td>1.0 - 1.99</td><td><span class="badge bg-danger">Yếu</span></td></tr>
                    <tr><td>< 1.0</td><td><span class="badge bg-dark">Kém</span></td></tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>

    <jsp:include page="/WEB-INF/views/giaodien/footer.jsp" />
  </body>
</html>

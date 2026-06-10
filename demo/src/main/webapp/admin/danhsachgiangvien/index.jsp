<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Danh sách giảng viên - Admin</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />
    <jsp:include page="/WEB-INF/views/giaodien/head.jsp" />
  </head>

  <body>
    <jsp:include page="/WEB-INF/views/giaodien/header.jsp" />
    <jsp:include page="/WEB-INF/views/sidebar/admin.jsp" />

    <main id="main" class="main">
      <c:if test="${not empty thongBao}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
          <i class="bi bi-check-circle me-2"></i>
          <strong>Thành công!</strong>
          <c:out value="${thongBao}" />
          <c:remove scope="session" var="thongBao" />
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
      </c:if>

      <div class="pagetitle mb-4">
        <div class="d-flex justify-content-between align-items-center flex-wrap gap-2">
          <div>
            <h1><i class="bi bi-person-workspace me-2"></i>Quản lý giảng viên</h1>
            <nav>
              <ol class="breadcrumb mb-0">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/index">Trang chủ</a></li>
                <li class="breadcrumb-item active">Danh sách giảng viên</li>
              </ol>
            </nav>
          </div>
          <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/danhsachgiangvien/them">
            <i class="bi bi-plus-circle me-1"></i>Thêm giảng viên
          </a>
        </div>
      </div>

      <div class="card mb-4">
        <div class="card-body py-3">
          <div class="row align-items-end g-3">
            <div class="col-lg-4 col-md-6">
              <form action="${pageContext.request.contextPath}/admin/danhsachgiangvien/index" method="get" class="d-flex align-items-center gap-2">
                <div class="flex-grow-1">
                  <label class="form-label small text-muted mb-1">Lọc theo ngành</label>
                  <select name="tenNganh" class="form-select">
                    <option value="">-- Tất cả ngành --</option>
                    <c:forEach var="nganh" items="${danhSachNganh}">
                      <option value="${nganh}" <c:if test="${tenNganhDaChon == nganh}">selected</c:if>>${nganh}</option>
                    </c:forEach>
                  </select>
                </div>
                <button type="submit" class="btn btn-outline-primary mt-auto" style="height: 38px;">
                  <i class="bi bi-funnel"></i>
                </button>
              </form>
            </div>
            <div class="col-lg-8 col-md-6">
              <label class="form-label small text-muted mb-1">Lọc theo học vị</label>
              <form action="${pageContext.request.contextPath}/admin/danhsachgiangvien/index" method="get" class="btn-group w-100 flex-wrap">
                <button type="submit" name="trangThai" value="" class="btn btn-outline-secondary <c:if test='${empty trangThaiDaChon}'>active</c:if>">Tất cả</button>
                <button type="submit" name="trangThai" value="Cử nhân" class="btn btn-outline-primary <c:if test='${trangThaiDaChon == "Cử nhân"}'>active</c:if>">Cử nhân</button>
                <button type="submit" name="trangThai" value="Kỹ sư" class="btn btn-outline-info <c:if test='${trangThaiDaChon == "Kỹ sư"}'>active</c:if>">Kỹ sư</button>
                <button type="submit" name="trangThai" value="Thạc sỹ" class="btn btn-outline-warning <c:if test='${trangThaiDaChon == "Thạc sỹ"}'>active</c:if>">Thạc sỹ</button>
                <button type="submit" name="trangThai" value="Tiến sỹ" class="btn btn-outline-success <c:if test='${trangThaiDaChon == "Tiến sỹ"}'>active</c:if>">Tiến sỹ</button>
                <button type="submit" name="trangThai" value="Phó giáo sư" class="btn btn-outline-danger <c:if test='${trangThaiDaChon == "Phó giáo sư"}'>active</c:if>">PGS</button>
              </form>
            </div>
          </div>
        </div>
      </div>

      <div class="card">
        <div class="card-header py-3 d-flex justify-content-between align-items-center flex-wrap gap-2">
          <h5 class="card-title mb-0"><i class="bi bi-list-ul me-2"></i>Danh sách giảng viên</h5>
          <div class="input-group" style="max-width: 300px;">
            <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
            <input type="text" class="form-control border-start-0 ps-0" placeholder="Tìm kiếm..." id="searchInput">
          </div>
        </div>
        <div class="card-body p-0">
          <form action="${pageContext.request.contextPath}/admin/danhsachgiangvien" method="post">
            <div class="d-flex justify-content-between align-items-center px-3 py-2 bg-light border-bottom">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" id="selectAll">
                <label class="form-check-label small" for="selectAll">Chọn tất cả</label>
              </div>
              <button class="btn btn-outline-danger btn-sm" type="submit" onclick="return confirm('Bạn có chắc chắn muốn xóa các mục đã chọn không?');">
                <i class="bi bi-trash me-1"></i>Xóa đã chọn
              </button>
            </div>
            <div class="table-responsive">
              <table class="table table-hover align-middle mb-0" id="dataTable">
                <thead>
                  <tr>
                    <th style="width: 40px;"></th>
                    <th>Giảng viên</th>
                    <th>Thông tin liên hệ</th>
                    <th class="text-center" style="color: #000 !important;">Ngành</th>
                    <th class="text-center">Học vị</th>
                    <th class="text-center" style="width: 120px;">Hành động</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="gv" items="${danhSachGiangVien}">
                    <tr class="table-row-hover">
                      <td class="text-center">
                        <input type="checkbox" class="form-check-input row-checkbox" name="MSGV" value="${gv.MSGV}" />
                      </td>
                      <td>
                        <div class="d-flex align-items-center">
                          <c:choose>
                            <c:when test="${not empty gv.AnhGV}">
                              <img src="${pageContext.request.contextPath}/static/uploads/${gv.AnhGV}" alt="Avatar" class="rounded-circle me-3" style="width: 48px; height: 48px; object-fit: cover;">
                            </c:when>
                            <c:otherwise>
                              <div class="avatar-initials me-3" style="width: 48px; height: 48px; background: linear-gradient(135deg, #10B981, #059669); color: black; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 600;">GV</div>
                            </c:otherwise>
                          </c:choose>
                          <div>
                            <div class="fw-semibold"><c:out value="${gv.HoTenGV}" /></div>
                            <small class="text-muted">
                              <i class="bi bi-hash"></i><c:out value="${gv.MSGV}" />  
                              <i class="bi bi-calendar3 me-1"></i><c:out value="${gv.NgaySinhGV}" />  
                              <c:out value="${gv.GioiTinhGV}" />
                            </small>
                          </div>
                        </div>
                      </td>
                      <td>
                        <div><i class="bi bi-envelope text-muted me-1"></i><c:out value="${gv.EmailGV}" /></div>
                        <small class="text-muted">
                          <i class="bi bi-telephone me-1"></i><c:out value="${gv.SoDienThoaiGV}" />
                          <c:if test="${not empty gv.QueQuanGV}">  <i class="bi bi-geo-alt me-1"></i><c:out value="${gv.QueQuanGV}" /></c:if>
                        </small>
                      </td>
                      <td class="text-center"><span class="badge bg-info-subtle text-info"><c:out value="${gv.TenNganh}" /></span></td>
                      <td class="text-center">
                        <c:choose>
                          <c:when test="${gv.TrangThaiGV == 'Tiến sỹ' || gv.TrangThaiGV == 'Phó giáo sư'}">
                            <span class="status-badge status-active"><c:out value="${gv.TrangThaiGV}" /></span>
                          </c:when>
                          <c:when test="${gv.TrangThaiGV == 'Thạc sỹ'}">
                            <span class="status-badge status-pending"><c:out value="${gv.TrangThaiGV}" /></span>
                          </c:when>
                          <c:otherwise>
                            <span class="status-badge status-inactive"><c:out value="${gv.TrangThaiGV}" /></span>
                          </c:otherwise>
                        </c:choose>
                      </td>
                      <td class="text-center">
                        <div class="btn-group btn-group-sm">
                          <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/admin/danhsachgiangvien/sua?MSGV=${gv.MSGV}" title="Sửa"><i class="bi bi-pencil"></i></a>
                          <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/admin/danhsachgiangvien/xoa?MSGV=${gv.MSGV}" onclick="return confirm('Bạn có chắc chắn muốn xóa không?');" title="Xóa"><i class="bi bi-trash"></i></a>
                        </div>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
            <c:if test="${empty danhSachGiangVien}">
              <div class="text-center py-5">
                <i class="bi bi-inbox" style="font-size: 4rem; color: #CBD5E1;"></i>
                <h5 class="text-muted mt-3">Không có dữ liệu</h5>
              </div>
            </c:if>
          </form>
        </div>
      </div>
    </main>
    <jsp:include page="/WEB-INF/views/giaodien/footer.jsp" />
    <script>
      document.getElementById('selectAll')?.addEventListener('change', function() {
        document.querySelectorAll('.row-checkbox').forEach(cb => cb.checked = this.checked);
      });
      document.getElementById('searchInput')?.addEventListener('input', function() {
        const searchTerm = this.value.toLowerCase();
        document.querySelectorAll('#dataTable tbody tr').forEach(row => {
          row.style.display = row.textContent.toLowerCase().includes(searchTerm) ? '' : 'none';
        });
      });
    </script>
  </body>
</html>

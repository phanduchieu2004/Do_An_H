<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
  <title>Sửa ngành</title>
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

      <!-- Phần đầu trang -->
      <div class="pagetitle">
    <h1>Quản lý ngành</h1>
        <nav>
          <ol class="breadcrumb">
            <li class="breadcrumb-item">Trang chủ</li>
            <li class="breadcrumb-item active">Sửa ngành</li>
          </ol>
        </nav>
      </div>

      <!-- Mục chính -->
      <div class="container shadow p-4">
        <form
          action="${pageContext.request.contextPath}/admin/danhsachnganh/sua"
          method="post"
        >
          <div class="row">
            <div class="form-group col-md-6 mb-3">
              <label>Mã ngành</label>
              <input type="text" class="form-control" name="MaNganh" value="${nganh.MaNganh}" readonly/>
              <c:if test="${not empty loiMaNganh}">
                <small class="text-danger"><c:out value="${loiMaNganh}" /></small>
              </c:if>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Tên ngành</label>
              <input type="text" class="form-control" name="TenNganh" value="${nganh.TenNganh}"/>
              <c:if test="${not empty loiTenNganh}">
                <small class="text-danger"><c:out value="${loiTenNganh}" /></small>
              </c:if>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Mã khoa</label>
              <select name="MaKhoa" class="form-select">
                <option value="">-- Chọn khoa --</option>
                <c:forEach var="khoa" items="${danhSachKhoa}">
                  <option
                    value="${khoa.MaKhoa}"
                    <c:if
                      test="${not empty nganh.MaKhoa and nganh.MaKhoa == khoa.MaKhoa}"
                    >
                      selected
                    </c:if>
                  >
                    ${khoa.TenKhoa}
                  </option>
                </c:forEach>
              </select>
              <c:if test="${not empty loiMaKhoa}">
                <small class="text-danger">${loiMaKhoa}</small>
              </c:if>
            </div>
            <div class="form-group col-md-6 mb-3">
              <label>Mô tả</label>
              <textarea
                type="text"
                class="form-control"
                name="MoTaNganh"
                rows="3"
              >${not empty nganh.MoTaNganh ? nganh.MoTaNganh : ''}</textarea>
            </div>
          </div>
          <a
            class="btn btn-secondary"
            href="${pageContext.request.contextPath}/admin/danhsachnganh"
            >Quay lại</a
          >
          <button type="submit" class="btn btn-primary">Sửa</button>
        </form>
      </div>
    </main>

    <!-- Include footer -->
    <jsp:include page="/WEB-INF/views/giaodien/footer.jsp" />
  </body>
</html>

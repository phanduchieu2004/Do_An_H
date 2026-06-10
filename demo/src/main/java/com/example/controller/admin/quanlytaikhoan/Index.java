package com.example.controller.admin.quanlytaikhoan;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.example.data.ChucNangSQL;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachtaikhoan", "/admin/danhsachtaikhoan/index" })
public class Index extends HttpServlet {
    private final ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            sql.kiemTraDangNhap(req, resp);
        } catch (Exception e) {
        }
        if (!resp.isCommitted()) {
            String chucVu = req.getParameter("chucVu");

            // Lấy toàn bộ tài khoản
            List<Map<String, Object>> allTaiKhoan = sql.hienThi("tblTaiKhoan");

            // Lấy danh sách chức vụ distinct để hiển thị nút lọc
            List<String> danhSachChucVu = allTaiKhoan.stream()
                    .map(tk -> tk.get("ChucVu").toString())
                    .distinct()
                    .toList();

            // Lọc theo chức vụ nếu có chọn
            List<Map<String, Object>> danhSach = allTaiKhoan.stream()
                    .filter(tk -> chucVu == null || chucVu.isBlank()
                            || chucVu.equalsIgnoreCase(String.valueOf(tk.get("ChucVu"))))
                    .toList();

            req.setAttribute("danhSachTaiKhoan", danhSach);
            req.setAttribute("chucVuDaChon", chucVu);
            req.setAttribute("danhSachChucVu", danhSachChucVu);

            req.getRequestDispatcher("/admin/danhsachtaikhoan/index.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] maTaiKhoan = req.getParameterValues("MaTaiKhoan");
        if (maTaiKhoan != null) {
            for (String ma : maTaiKhoan) {
                sql.xoaBanGhi("tblTaiKhoan", "MaNguoiDung = '" + ma + "'");
            }
        }
        req.getSession().setAttribute("thongBao", "Xóa các tài khoản đã chọn thành công");
        resp.sendRedirect(req.getContextPath() + "/admin/danhsachtaikhoan");
    }
}

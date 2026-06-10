package com.example.controller.taikhoan;

import java.io.IOException;

import com.example.model.tblTaiKhoan;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/taikhoan", "/taikhoan/dangnhap" })
public class DangNhap extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {


        req.getRequestDispatcher("/taikhoan/dangnhap.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        final String maNguoiDung = req.getParameter("MaNguoiDung").trim();
        String matKhau = req.getParameter("MatKhau").trim();
        String ghiNho = req.getParameter("GhiNho");
        // Nếu được chọn, ghiNho = "true"
        System.out.println(maNguoiDung + " " + matKhau);
        tblTaiKhoan tk = new tblTaiKhoan();
        tk.request = req;
        tk.response = resp;
        if (maNguoiDung.isEmpty()) {
            req.setAttribute("loiMaNguoiDung", "Mã người dùng chưa nhập");
            req.getRequestDispatcher("/taikhoan/dangnhap.jsp").forward(req, resp);
            return;
        } else if (matKhau.isEmpty()) {
            req.setAttribute("MaNguoiDung", maNguoiDung);
            req.setAttribute("loiMatKhau", "Mật khẩu chưa nhập");
            req.getRequestDispatcher("/taikhoan/dangnhap.jsp").forward(req, resp);
            return;
        }
        tk.kiemTraDangNhap(maNguoiDung, matKhau);
        if (tk.bao_loi) {
            req.setAttribute("MaNguoiDung", maNguoiDung);
            req.getRequestDispatcher("/taikhoan/dangnhap.jsp").forward(req, resp);
            return;
        }

        System.out.println("Đăng nhập thành công! bao_loi = " + tk.bao_loi);
        tk.layThongTinSession();

        if (ghiNho != null && ghiNho.equals("true")) {
            // * kéo dài thời gian SS
            req.getSession().setMaxInactiveInterval(60 * 60 * 24 * 3); // ? 30p lên 3 ngày
        }
        String chucVuSession = (String) req.getSession().getAttribute("SS_ChucVu");
        System.out.println("Chuc vụ trong SS: " + chucVuSession);
        if (chucVuSession != null) {
            switch (chucVuSession.toLowerCase()) {
                case "admin" -> {
                    resp.sendRedirect(req.getContextPath() + "/admin");
                }
                case "giangvien", "giảng viên" -> {
                    resp.sendRedirect(req.getContextPath() + "/giangvien");
                }
                case "sinhvien", "sinh viên" -> {
                    resp.sendRedirect(req.getContextPath() + "/sinhvien");
                }
                default -> {
                    req.getSession().setAttribute("loiDangNhap",
                            "Chức vụ không hợp lệ. Vui lòng liên hệ quản trị viên.");
                    resp.sendRedirect(req.getContextPath() + "/taikhoan/dangnhap");
                }
            }
        }
        System.out.println("Chuc vụ trong SS: " + chucVuSession);
    }
}

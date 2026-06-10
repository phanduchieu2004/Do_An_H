package com.example.controller.admin.quanlytaikhoan;

import java.io.IOException;

import com.example.model.tblTaiKhoan;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/danhsachtaikhoan/them")
public class Them extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/admin/danhsachtaikhoan/them.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        tblTaiKhoan tk = new tblTaiKhoan();
        tk.request = req;
        tk.response = resp;
        tk.setMaNguoiDung(req.getParameter("MaTaiKhoan"));
        tk.setMatKhau(req.getParameter("MatKhau"));
        tk.setChucVu(req.getParameter("ChucVu"));
        tk.setTrangThaiTaiKhoan(req.getParameter("TrangThaiTaiKhoan"));
        if (tk.bao_loi) {
            req.setAttribute("MaTaiKhoan", req.getParameter("MaTaiKhoan"));
            req.setAttribute("ChucVu", req.getParameter("ChucVu"));
            req.setAttribute("TrangThaiTaiKhoan", req.getParameter("TrangThaiTaiKhoan"));
            req.getRequestDispatcher("/admin/danhsachtaikhoan/them.jsp").forward(req, resp);
            return;
        }
        tk.them();
        req.getSession().setAttribute("thongBao", "Thêm tài khoản thành công");
        resp.sendRedirect(req.getContextPath() + "/admin/danhsachtaikhoan");
    }
}

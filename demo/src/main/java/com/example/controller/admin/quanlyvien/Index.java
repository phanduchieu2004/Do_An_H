package com.example.controller.admin.quanlyvien;

import java.io.IOException;

import com.example.data.ChucNangSQL;
import com.example.model.tblVien;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachvien", "/admin/danhsachvien/index" })
public class Index extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            sql.kiemTraDangNhap(req, resp);
        } catch (Exception e) {
        }
        if (!resp.isCommitted()) {
            req.setAttribute("danhSachVien", sql.hienThi("tblVien"));
            req.getRequestDispatcher("/admin/danhsachvien/index.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {
        String[] maVien = req.getParameterValues("MaVien");
        // System.out.println("Đã vào hàm doPost xóa viện");
        // System.out.println("MaVien nhận được: " + java.util.Arrays.toString(maVien));
        if (maVien != null) {
            for (String ma : maVien) {
                tblVien vien = new tblVien();
                vien.maVien = ma;
                vien.xoa();
                System.out.println("Đã xóa viện với Mã Viện: " + ma);
            }
        }
        req.getSession().setAttribute("thongBao", "Xóa các viện đã chọn thành công");
        resp.sendRedirect(
                req.getContextPath() + "/admin/danhsachvien");
    }

}

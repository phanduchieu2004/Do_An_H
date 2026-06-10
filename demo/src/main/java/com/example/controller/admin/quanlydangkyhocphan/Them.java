package com.example.controller.admin.quanlydangkyhocphan;

import java.time.LocalDate;
import java.io.IOException;
import com.example.data.ChucNangSQL;
import com.example.model.tblDangKyHocPhan;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachdangkyhocphan/them" })
public class Them extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/admin/danhsachdangkyhocphan/them.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        final String maDangKy = req.getParameter("MaDangKy").trim();
        final String maSinhVien = req.getParameter("MaSinhVien").trim();
        final String maLopHocPhan = req.getParameter("MaLopHocPhan").trim();
        final String ngayDangKy = sql.doiDinhDangNgay(LocalDate.now().toString());

        tblDangKyHocPhan dangKy = new tblDangKyHocPhan(req);
        dangKy.setMaDangKyHocPhan(maDangKy);
        dangKy.setMSSV(maSinhVien);
        dangKy.setMaLopHocPhan(maLopHocPhan);
        dangKy.setNgayDangKy(ngayDangKy);

        if (dangKy.bao_loi) {
            req.setAttribute("MaDangKy", maDangKy);
            req.setAttribute("MaSinhVien", maSinhVien);
            req.setAttribute("MaLopHocPhan", maLopHocPhan);

            req.getRequestDispatcher("/admin/danhsachdangkyhocphan/them.jsp").forward(req, resp);
            return; 
        }
        dangKy.them();
        req.getSession().setAttribute("thongBao", "Thêm đăng ký học phần thành công");
        resp.sendRedirect(req.getContextPath() + "/admin/danhsachdangkyhocphan");
    }
}

package com.example.controller.admin.quanlydangkyhocphan;

import java.io.IOException;
import java.util.Map;
import com.example.data.ChucNangSQL;
import com.example.model.tblDangKyHocPhan;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachdangkyhocphan/sua" })
public class Sua extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String maDangKy = req.getParameter("MaDangKy");
        Map<String, Object> dangKy = sql.hienThi_DieuKien("tblDangKyHocPhan", "MaDangKy='" + maDangKy + "'").get(0);
        req.setAttribute("dangKy", dangKy);
        req.getRequestDispatcher("/admin/danhsachdangkyhocphan/sua.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String maDangKy = req.getParameter("MaDangKy");
        String maSinhVien = req.getParameter("MaSinhVien");
        String maLopHocPhan = req.getParameter("MaLopHocPhan");
        String ngayDangKy = req.getParameter("NgayDangKy");

        tblDangKyHocPhan dangKy = new tblDangKyHocPhan(req);
        dangKy.setMaDangKyHocPhan(maDangKy);
        dangKy.setMSSV(maSinhVien);
        dangKy.setMaLopHocPhan(maLopHocPhan);
        dangKy.setNgayDangKy(ngayDangKy);
        dangKy.sua();

        req.getSession().setAttribute("thongBao", "Sửa đăng ký học phần thành công");
        resp.sendRedirect(req.getContextPath() + "/admin/danhsachdangkyhocphan");
    }
}

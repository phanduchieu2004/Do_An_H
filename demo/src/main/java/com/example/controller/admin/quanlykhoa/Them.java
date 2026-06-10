package com.example.controller.admin.quanlykhoa;

import java.io.IOException;

import com.example.data.ChucNangSQL;
import com.example.model.tblKhoa;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachkhoa/them" })
public class Them extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("danhSachVien", sql.hienThi("tblVien"));
        req.getRequestDispatcher("/admin/danhsachkhoa/them.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        final String maKhoa = req.getParameter("MaKhoa").trim();
        final String tenKhoa = req.getParameter("TenKhoa").trim();
        final String maVien = req.getParameter("MaVien").trim();
        final String tenTruongKhoa = req.getParameter("TenTruongKhoa").trim();
        final String soDienThoaiKhoa = req.getParameter("SoDienThoaiKhoa").trim();
        final String emailKhoa = req.getParameter("EmailKhoa").trim();
        final String ngayThanhLapKhoa = sql.doiDinhDangNgay(req.getParameter("NgayThanhLapKhoa").trim());
        final String moTaKhoa = req.getParameter("MoTaKhoa").trim();

        tblKhoa khoa = new tblKhoa(req);
        khoa.setMaKhoa(maKhoa);
        khoa.setTenKhoa(tenKhoa);
        khoa.setMaVien(maVien);
        khoa.setTenTruongKhoa(tenTruongKhoa);
        khoa.setSoDienThoaiKhoa(soDienThoaiKhoa);
        khoa.setEmailKhoa(emailKhoa);
        khoa.setNgayThanhLapKhoa(ngayThanhLapKhoa);
        khoa.moTaKhoa = moTaKhoa;

        if (khoa.bao_loi) {
            req.setAttribute("MaKhoa", maKhoa);
            req.setAttribute("TenKhoa", tenKhoa);
            req.setAttribute("MaVien", maVien);
            req.setAttribute("TenTruongKhoa", tenTruongKhoa);
            req.setAttribute("SoDienThoaiKhoa", soDienThoaiKhoa);
            req.setAttribute("EmailKhoa", emailKhoa);
            req.setAttribute("NgayThanhLapKhoa", ngayThanhLapKhoa);
            req.setAttribute("MoTaKhoa", moTaKhoa);
            req.setAttribute("danhSachVien", sql.hienThi("tblVien"));
            req.getRequestDispatcher("/admin/danhsachkhoa/them.jsp").forward(req, resp);
            return;
        }
        khoa.them();

        req.getSession().setAttribute("thongBao", "Thêm khoa thành công");
        resp.sendRedirect(req.getContextPath() + "/admin/danhsachkhoa/index");
    }
}

package com.example.controller.admin.quanlynganh;

import java.io.IOException;

import com.example.data.ChucNangSQL;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachnganh/them" })
public class Them extends HttpServlet {

    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        req.setAttribute("danhSachKhoa", sql.hienThi("tblKhoa"));

        req.getRequestDispatcher("/admin/danhsachnganh/them.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        final String maNganh = req.getParameter("MaNganh").trim();
        final String tenNganh = req.getParameter("TenNganh").trim();
        final String maKhoa = req.getParameter("MaKhoa").trim();
        final String moTaNganh = req.getParameter("MoTaNganh").trim();

        boolean loi = false;
        if (sql.kiemTraKhoaChinh("tblNganh", "MaNganh", maNganh)) {
            req.setAttribute("loiMaNganh", "Mã ngành đã tồn tại");
            loi = true;
        }
        if (maNganh == null || maNganh.trim().isEmpty()) {
            req.setAttribute("loiMaNganh", "Mã ngành không được để trống");
            loi = true;
        }
        if (tenNganh == null || tenNganh.trim().isEmpty()) {
            req.setAttribute("loiTenNganh", "Tên ngành không được để trống");
            loi = true;
        }
        if (maKhoa == null || maKhoa.trim().isEmpty()) {
            req.setAttribute("loiMaVien", "Mã viện không được để trống");
            loi = true;
        }

        if (loi) {
            req.setAttribute("MaNganh", maNganh);
            req.setAttribute("TenNganh", tenNganh);
            req.setAttribute("MaKhoa", maKhoa);
            req.setAttribute("MoTaNganh", moTaNganh);

            req.setAttribute("danhSachKhoa", sql.hienThi("tblKhoa"));
            req.getRequestDispatcher("/admin/danhsachnganh/them.jsp").forward(req, resp);
            return;
        }
        // sql.themNganh(maNganh, tenNganh, maKhoa, moTaNganh);
        req.getSession().setAttribute("thongBao", "Thêm ngành thành công");
        resp.sendRedirect(req.getContextPath() + "/admin/danhsachnganh/index");
    }

}

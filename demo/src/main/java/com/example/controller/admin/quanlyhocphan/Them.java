package com.example.controller.admin.quanlyhocphan;

import java.io.IOException;

import com.example.data.ChucNangSQL;
import com.example.model.tblHocPhan;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@MultipartConfig
@WebServlet({ "/admin/danhsachhocphan/them" })
public class Them extends HttpServlet {

    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        // Lấy danh sách ngành để hiển thị trong form
        req.setAttribute("danhSachNganh", sql.hienThi("tblNganh"));
        req.getRequestDispatcher("/admin/danhsachhocphan/them.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        final String maHocPhan = req.getParameter("MaHocPhan").trim();
        final String tenHocPhan = req.getParameter("TenHocPhan").trim();
        final String soTinChiStr = req.getParameter("SoTinChi").trim();
        final String maNganh = req.getParameter("MaNganh").trim();
        final String moTaHocPhan = req.getParameter("MoTaHocPhan").trim();
        final String hocKyStr = req.getParameter("HocKy").trim();

        Integer soTinChi;
        Integer hocKy;

        soTinChi = Integer.valueOf(soTinChiStr);

        hocKy = Integer.valueOf(hocKyStr);

        tblHocPhan hp = new tblHocPhan(req);
        hp.setMaHocPhan(maHocPhan);
        hp.setTenHocPhan(tenHocPhan);
        hp.setSoTinChi(soTinChi);
        hp.setMaNganh(maNganh);
        hp.moTaHocPhan = moTaHocPhan;
        hp.setHocKy(hocKy);

        if (hp.bao_loi) {
            req.setAttribute("MaHocPhan", maHocPhan);
            req.setAttribute("TenHocPhan", tenHocPhan);
            req.setAttribute("SoTinChi", soTinChiStr);
            req.setAttribute("MaNganh", maNganh);
            req.setAttribute("MoTaHocPhan", moTaHocPhan);
            req.setAttribute("HocKy", hocKyStr);
            req.setAttribute("danhSachNganh", sql.hienThi("tblNganh"));
            req.getRequestDispatcher("/admin/danhsachhocphan/them.jsp").forward(req, resp);
            return;
        } else {
            hp.them();
        }

        req.getSession().setAttribute("thongBao", "Thêm học phần thành công");
        resp.sendRedirect(req.getContextPath() + "/admin/danhsachhocphan");
    }
}

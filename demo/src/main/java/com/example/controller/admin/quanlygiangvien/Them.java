package com.example.controller.admin.quanlygiangvien;

import java.io.IOException;

import com.example.data.ChucNangSQL;
import com.example.model.tblGiangVien;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
@WebServlet({ "/admin/danhsachgiangvien/them" })
public class Them extends HttpServlet {

    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {
        // Kiểm tra đăng nhập
        // try {
        // sql.kiemTraDangNhap(req, resp);
        // } catch (Exception e) {
        // System.out.println("Lỗi: " + e.getMessage());
        // }

        // Lấy danh sách ngành để hiển thị trong form
        req.setAttribute("danhSachNganh", sql.hienThi("tblNganh"));
        req.getRequestDispatcher("/admin/danhsachgiangvien/them.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        final String msgv = req.getParameter("MSGV").trim();
        final String hoTenGV = req.getParameter("HoTenGV").trim();
        final String ngaySinhGV = req.getParameter("NgaySinhGV").trim();
        final String gioiTinhGV = req.getParameter("GioiTinhGV").trim();
        final String queQuanGV = req.getParameter("QueQuanGV").trim();
        final String emailGV = req.getParameter("EmailGV").trim();
        final String maNganh = req.getParameter("MaNganh").trim();
        final String soDienThoaiGV = req.getParameter("SoDienThoaiGV").trim();
        final String trangThaiGV = req.getParameter("TrangThaiGV").trim();

        Part fileAnh = req.getPart("AnhGV");

        tblGiangVien gv = new tblGiangVien(req);
        gv.setMSGV(msgv);
        gv.setHoTenGV(hoTenGV);
        gv.setNgaySinhGV(ngaySinhGV);
        gv.setGioiTinhGV(gioiTinhGV);
        gv.setQueQuanGV(queQuanGV);
        gv.setEmailGV(emailGV);
        gv.setMaNganh(maNganh);
        gv.setSoDienThoaiGV(soDienThoaiGV);
        gv.setTrangThaiGV(trangThaiGV);
        gv.setAnhGV(fileAnh);

        // Kiểm tra dữ liệu
        if (gv.bao_loi) {
            req.setAttribute("MSGV", msgv);
            req.setAttribute("HoTenGV", hoTenGV);
            req.setAttribute("NgaySinhGV", ngaySinhGV);
            req.setAttribute("GioiTinhGV", gioiTinhGV);
            req.setAttribute("QueQuanGV", queQuanGV);
            req.setAttribute("EmailGV", emailGV);
            req.setAttribute("MaNganh", maNganh);
            req.setAttribute("SoDienThoaiGV", soDienThoaiGV);
            req.setAttribute("TrangThaiGV", trangThaiGV);
            req.setAttribute("AnhGV", fileAnh);

            req.setAttribute("danhSachNganh", sql.hienThi("tblNganh"));
            req.getRequestDispatcher("/admin/danhsachgiangvien/them.jsp").forward(req, resp);
            return;
        } else {
            gv.them();
        }

        req.getSession().setAttribute("thongBao", "Thêm giảng viên thành công");
        resp.sendRedirect(req.getContextPath() + "/admin/danhsachgiangvien/index");
    }
}

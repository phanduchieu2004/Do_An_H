package com.example.controller.admin.quanlysinhvien;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.example.data.ChucNangSQL;
import com.example.model.tblNganh;
import com.example.model.tblSinhVien;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
@WebServlet({ "/admin/danhsachsinhvien/them" })
public class Them extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<Map<String, Object>> danhSachLop = sql.hienThi("tblLop");
        for (Map<String, Object> map : danhSachLop) {
            tblNganh nganh = new tblNganh();
            System.out.println("MaNganh: " + map.get("MaNganh").toString());
            nganh.truyVanTheoMa(map.get("MaNganh").toString());
            System.out.println("TenNganh: " + nganh.tenNganh);
            map.put("TenNganh", nganh.tenNganh);
        }
        req.setAttribute("danhSachLop", danhSachLop);

        req.getRequestDispatcher("/admin/danhsachsinhvien/them.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        final String mssv = req.getParameter("MSSV").trim();
        final String hoTenSV = req.getParameter("HoTenSV").trim();
        final String ngaySinhSV = req.getParameter("NgaySinhSV").trim();
        final String gioiTinhSV = req.getParameter("GioiTinhSV").trim();
        final String queQuanSV = req.getParameter("QueQuanSV").trim();
        final String emailSV = req.getParameter("EmailSV").trim();
        final String maLop = req.getParameter("MaLop").trim();
        final String soDienThoaiSV = req.getParameter("SoDienThoaiSV").trim();

        Part fileAnh = req.getPart("AnhSV");

        tblSinhVien sv = new tblSinhVien(req);
        sv.setMSSV(mssv);
        sv.setHoTenSV(hoTenSV);
        sv.setNgaySinhSV(ngaySinhSV);
        sv.setGioiTinhSV(gioiTinhSV);
        sv.setQueQuanSV(queQuanSV);
        sv.setEmailSV(emailSV);
        sv.setMaLop(maLop);
        sv.setSoDienThoaiSV(soDienThoaiSV);
        sv.setAnhSV(fileAnh);

        if (sv.bao_loi) {
            req.setAttribute("MSSV", mssv);
            req.setAttribute("HoTenSV", hoTenSV);
            req.setAttribute("NgaySinhSV", ngaySinhSV);
            req.setAttribute("GioiTinhSV", gioiTinhSV);
            req.setAttribute("QueQuanSV", queQuanSV);
            req.setAttribute("EmailSV", emailSV);
            req.setAttribute("MaLop", maLop);
            req.setAttribute("SoDienThoaiSV", soDienThoaiSV);
            req.setAttribute("AnhSV", fileAnh);

            req.setAttribute("danhSachLop", sql.hienThi("tblLop"));

            req.getRequestDispatcher("/admin/danhsachsinhvien/them.jsp").forward(req, resp);
            return;
        }
        sv.them();

        req.getSession().setAttribute("thongBao", "Thêm sinh viên thành công");
        resp.sendRedirect(req.getContextPath() + "/admin/danhsachsinhvien/index");
    }
}

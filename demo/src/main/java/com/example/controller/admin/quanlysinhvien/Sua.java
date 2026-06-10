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
@WebServlet({ "/admin/danhsachsinhvien/sua" })
public class Sua extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String mssv = req.getParameter("MSSV");
        Map<String, Object> sv = sql.hienThi_DieuKien("tblSinhVien", "MSSV='" + mssv + "'").get(0);
        sv.put("NgaySinhSV", sql.doiDinhDangNgay_ViewEdit(sv.get("NgaySinhSV").toString()));
        List<Map<String, Object>> danhSachLop = sql.hienThi("tblLop");
        for (Map<String, Object> map : danhSachLop) {
            tblNganh nganh = new tblNganh();
            System.out.println("MaNganh: " + map.get("MaNganh").toString());
            nganh.truyVanTheoMa(map.get("MaNganh").toString());
            System.out.println("TenNganh: " + nganh.tenNganh);
            map.put("TenNganh", nganh.tenNganh);
        }
        req.setAttribute("danhSachLop", danhSachLop);

        req.setAttribute("sv", sv);
        req.getRequestDispatcher("/admin/danhsachsinhvien/sua.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String mssv = req.getParameter("MSSV");
        String hoTenSV = req.getParameter("HoTenSV");
        String ngaySinhSV = req.getParameter("NgaySinhSV");
        String gioiTinhSV = req.getParameter("GioiTinhSV");
        String queQuanSV = req.getParameter("QueQuanSV");
        String emailSV = req.getParameter("EmailSV");
        String maLop = req.getParameter("MaLop");
        String soDienThoaiSV = req.getParameter("SoDienThoaiSV");
        String trangThaiSV = req.getParameter("TrangThaiSV");
        Part fileAnh = req.getPart("AnhSV");

        tblSinhVien sv = new tblSinhVien(req);
        sv.mssv = mssv;
        sv.hoTenSV = hoTenSV;
        sv.ngaySinhSV = ngaySinhSV;
        sv.gioiTinhSV = gioiTinhSV;
        sv.queQuanSV = queQuanSV;
        sv.emailSV = emailSV;
        sv.maLop = maLop;
        sv.soDienThoaiSV = soDienThoaiSV;
        sv.trangThaiSV = trangThaiSV;
        sv.setAnhSV(fileAnh);
        sv.sua();
        req.getSession().setAttribute("thongBao", "Sửa sinh viên thành công");
        resp.sendRedirect(req.getContextPath() + "/admin/danhsachsinhvien/index");
    }
}

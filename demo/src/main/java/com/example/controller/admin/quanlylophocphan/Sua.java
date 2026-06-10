package com.example.controller.admin.quanlylophocphan;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.example.data.ChucNangSQL;
import com.example.model.tblLopHocPhan;
import com.example.model.tblNganh;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachlophocphan/sua" })
public class Sua extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String maLopHocPhan = req.getParameter("MaLopHocPhan");
        List<Map<String, Object>> danhSach = sql.hienThi_DieuKien("tblLopHocPhan",
                "MaLopHocPhan='" + maLopHocPhan + "'");
        req.setAttribute("lhp", danhSach.get(0));

        List<Map<String, Object>> danhsachhp = sql.hienThi("tblHocPhan");
        for (Map<String, Object> map : danhsachhp) {
            tblNganh nganh = new tblNganh();
            nganh.truyVanTheoMa(map.get("MaNganh").toString());
            map.put("TenNganh", nganh.tenNganh);
        }
        req.setAttribute("danhSachHocPhan", danhsachhp);

        req.setAttribute("danhSachGiangVien", sql.hienThi("tblGiangVien"));
        req.getRequestDispatcher("/admin/danhsachlophocphan/sua.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        final String maLopHocPhan = req.getParameter("MaLopHocPhan").trim();
        final String tenLopHocPhan = req.getParameter("TenLopHocPhan").trim();
        final String maHocPhan = req.getParameter("MaHocPhan").trim();
        final String msgv = req.getParameter("MSGV").trim();
        final String soBuoiStr = req.getParameter("SoBuoi").trim();
        final String soTietStr = req.getParameter("SoTiet").trim();
        final String soTuanHoc = req.getParameter("SoTuanHoc").trim();
        final String thuTiet = req.getParameter("ThuTiet").trim();
        final String phongHoc = req.getParameter("PhongHoc").trim();
        final String thoiGianBatDau = req.getParameter("ThoiGianBatDau").trim();
        final String thoiGianKetThuc = req.getParameter("ThoiGianKetThuc").trim();
        final String thoiGianHoc = req.getParameter("ThoiGianHoc").trim();
        final String soLuongToiDaStr = req.getParameter("SoLuongToiDa").trim();
        final String trangThai = req.getParameter("TrangThaiLopHocPhan").trim();

        Integer soBuoi, soTiet, soLuongToiDa;

        soBuoi = Integer.valueOf(soBuoiStr);

        soTiet = Integer.valueOf(soTietStr);

        soLuongToiDa = Integer.valueOf(soLuongToiDaStr);

        tblLopHocPhan lhp = new tblLopHocPhan(req);
        lhp.maLopHocPhan = maLopHocPhan;
        lhp.tenLopHocPhan = tenLopHocPhan;
        lhp.maHocPhan = maHocPhan;
        lhp.msgv = msgv;
        lhp.soBuoi = soBuoi;
        lhp.soTiet = soTiet;
        lhp.soTuanHoc = soTuanHoc;
        lhp.thuTiet = thuTiet;
        lhp.phongHoc = phongHoc;
        lhp.thoiGianBatDau = thoiGianBatDau;
        lhp.thoiGianKetThuc = thoiGianKetThuc;
        lhp.thoiGianHoc = thoiGianHoc;
        lhp.soLuongToiDa = soLuongToiDa;
        lhp.trangThaiLopHocPhan = trangThai;

        if (lhp.bao_loi) {
            req.setAttribute("lhp", lhp);
            req.setAttribute("danhSachHocPhan", sql.hienThi("tblHocPhan"));
            req.setAttribute("danhSachGiangVien", sql.hienThi("tblGiangVien"));
            req.getRequestDispatcher("/admin/danhsachlophocphan/sua.jsp").forward(req, resp);
            return;
        } else {
            lhp.sua();
        }
        req.getSession().setAttribute("thongBao", "Sửa lớp học phần thành công");
        resp.sendRedirect(req.getContextPath() + "/admin/danhsachlophocphan");
    }
}

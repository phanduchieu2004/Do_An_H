package com.example.controller.admin.quanlykhoa;

import java.io.IOException;
import java.util.Map;
import java.util.List;
import com.example.data.ChucNangSQL;
import com.example.model.tblKhoa;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachkhoa/sua" })
public class Sua extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String maKhoa = req.getParameter("MaKhoa");
        List<Map<String, Object>> khoa = sql.hienThi_DieuKien("tblKhoa", "MaKhoa='" + maKhoa + "'");
         for (Map<String, Object> i : khoa) {
                        // ?Định dạng lại ngày tháng về dạng năm-tháng-ngày trước khi hiển thị lên trang
                        khoa.get(0).put("NgayThanhLapKhoa",
                                        sql.doiDinhDangNgay_ViewEdit(i.get("NgayThanhLapKhoa").toString()));
                }
        req.setAttribute("danhSachVien", sql.hienThi("tblVien"));
        req.setAttribute("khoa", khoa.get(0));
        req.getRequestDispatcher("/admin/danhsachkhoa/sua.jsp").forward(req, resp);
        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String maKhoa = req.getParameter("MaKhoa");
        String tenKhoa = req.getParameter("TenKhoa");
        String maVien = req.getParameter("MaVien");
        String tenTruongKhoa = req.getParameter("TenTruongKhoa");
        String soDienThoaiKhoa = req.getParameter("SoDienThoaiKhoa");
        String emailKhoa = req.getParameter("EmailKhoa");
        String ngayThanhLapKhoa = sql.doiDinhDangNgay(req.getParameter("NgayThanhLapKhoa"));
        String moTaKhoa = req.getParameter("MoTaKhoa");

        tblKhoa khoa = new tblKhoa(req);
        khoa.maKhoa = maKhoa;
        khoa.tenKhoa = tenKhoa;
        khoa.maVien = maVien;
        khoa.tenTruongKhoa = tenTruongKhoa;
        khoa.soDienThoaiKhoa = soDienThoaiKhoa;
        khoa.emailKhoa = emailKhoa;
        khoa.ngayThanhLapKhoa = ngayThanhLapKhoa;
        khoa.moTaKhoa = moTaKhoa;
        khoa.sua();

        req.getSession().setAttribute("thongBao", "Sửa khoa thành công");
        resp.sendRedirect(req.getContextPath() + "/admin/danhsachkhoa/index");
    }
}

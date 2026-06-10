package com.example.controller.admin.quanlydiem;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.example.data.ChucNangSQL;
import com.example.model.tblDangKyHocPhan;
import com.example.model.tblLopHocPhan;
import com.example.model.tblSinhVien;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachketqua/xem" })
public class Xem extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String maLopHocPhan = req.getParameter("MaLopHocPhan");
        List<Map<String, Object>> danhsach = sql.hienThi("tblDiemLopHocPhan");
        danhsach.removeIf(map -> {
            tblDangKyHocPhan dangKy = new tblDangKyHocPhan();
            System.out.println("ma dang ky: " + map.get("MaDangKyHocPhan").toString());
            dangKy.truyVanTheoMa(map.get("MaDangKyHocPhan").toString());
            System.out.println("" + dangKy.maLopHocPhan + " - " + maLopHocPhan);
            return !dangKy.maLopHocPhan.equals(maLopHocPhan);
        });
        for (Map<String, Object> map : danhsach) {
            tblDangKyHocPhan dangKy = new tblDangKyHocPhan();
            dangKy.truyVanTheoMa(map.get("MaDangKyHocPhan").toString());
            map.put("MaSinhVien", dangKy.mssv);
            tblSinhVien sinhVien = new tblSinhVien();
            sinhVien.truyVanTheoMa(dangKy.mssv);
            map.put("TenSinhVien", sinhVien.hoTenSV);
            tblLopHocPhan lopHocPhan = new tblLopHocPhan();
            lopHocPhan.truyVanTheoMa(dangKy.maLopHocPhan);
            map.put("TenLopHocPhan", lopHocPhan.tenLopHocPhan);
        }
        req.setAttribute("danhSachDiem", danhsach);
        req.getRequestDispatcher("/admin/danhsachketqua/xem.jsp").forward(req, resp);
    }

}

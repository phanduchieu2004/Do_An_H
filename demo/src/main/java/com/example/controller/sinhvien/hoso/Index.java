package com.example.controller.sinhvien.hoso;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.example.data.ChucNangSQL;
import com.example.model.tblLop;
import com.example.model.tblNganh;
import com.example.model.tblSinhVien;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/sinhvien/hoso/index", "/sinhvien/hoso" })
public class Index extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            sql.kiemTraDangNhap(req, resp);
        } catch (Exception e) {
        }
        List<Map<String, Object>> ds = sql.hienThi_DieuKien("tblSinhVien",
                "MSSV = '" + req.getSession().getAttribute("SS_MaNguoiDung") + "'");
        if (!ds.isEmpty()) {
            Map<String, Object> map = ds.get(0);
            tblSinhVien sv = new tblSinhVien();
            sv.truyVanTheoMa((String) map.get("MSSV"));

            tblLop lop = new tblLop();
            lop.truyVanTheoMa(sv.maLop);
            map.put("TenLop", lop.tenLop);

            tblNganh nganh = new tblNganh();
            nganh.truyVanTheoMa(lop.maNganh);
            map.put("TenNganh", nganh.tenNganh);

            map.put("KhoaHoc", lop.khoaHoc);

            req.setAttribute("sinhVien", map);
        }

        req.getRequestDispatcher("/sinhvien/hoso/index.jsp").forward(req, resp);
    }

}

package com.example.controller.giangvien.hoso;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.example.data.ChucNangSQL;
import com.example.model.tblGiangVien;
import com.example.model.tblKhoa;
import com.example.model.tblNganh;
import com.example.model.tblVien;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/giangvien/hoso/index", "/giangvien/hoso" })
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
        List<Map<String, Object>> ds = sql.hienThi_DieuKien("tblGiangVien",
                "MSGV = '" + req.getSession().getAttribute("SS_MaNguoiDung") + "'");
        if (!ds.isEmpty()) {
            Map<String, Object> map = ds.get(0);
            tblGiangVien gv = new tblGiangVien();
            gv.truyVanTheoMa((String) map.get("MSGV"));
            tblNganh nganh = new tblNganh();
            nganh.truyVanTheoMa(gv.maNganh);
            map.put("TenNganh", nganh.tenNganh);
            tblKhoa khoa = new tblKhoa();
            khoa.truyVanTheoMa(nganh.maKhoa);
            map.put("TenKhoa", khoa.tenKhoa);
            tblVien vien = new tblVien();
            vien.truyVanTheoMa(khoa.maVien);
            map.put("TenVien", vien.tenVien);
            req.setAttribute("giangVien", map);
        }

        req.getRequestDispatcher("/giangvien/hoso/index.jsp").forward(req, resp);
    }

}

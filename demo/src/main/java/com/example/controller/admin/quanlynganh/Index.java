package com.example.controller.admin.quanlynganh;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import com.example.data.ChucNangSQL;
import com.example.model.tblKhoa;
import com.example.model.tblVien;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachnganh", "/admin/danhsachnganh/index" })
public class Index extends HttpServlet {

    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            sql.kiemTraDangNhap(req, resp);
        } catch (Exception e) {
        }
        if (!resp.isCommitted()) {
            List<Map<String, Object>> danhsach = sql.hienThi("tblNganh");

            for (Map<String, Object> map : danhsach) {
                tblKhoa khoa = new tblKhoa();
                khoa.truyVanTheoMa(map.get("MaKhoa").toString());
                map.put("TenKhoa", khoa.tenKhoa);
                tblVien vien = new tblVien();
                vien.truyVanTheoMa(khoa.maVien);
                map.put("TenVien", vien.tenVien);
            }

            req.setAttribute("danhSachNganh", danhsach);
            req
                    .getRequestDispatcher("/admin/danhsachnganh/index.jsp")
                    .forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String[] maNganh = req.getParameterValues("MaNganh");
        System.out.println("Đã vào hàm doPost xóa ngành");
        System.out.println("MaNganh nhận được: " + Arrays.toString(maNganh));
        if (maNganh != null) {
            for (String ma : maNganh) {
                sql.xoaBanGhi("tblNganh", "MaNganh = '" + ma + "'");
            }
        }
        req
                .getSession()
                .setAttribute("thongBao", "Xóa các ngành đã chọn thành công");
        resp.sendRedirect(req.getContextPath() + "/admin/danhsachnganh");
    }
}

package com.example.controller.admin.quanlylop;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.example.data.ChucNangSQL;
import com.example.model.tblNganh;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachlop", "/admin/danhsachlop/index" })
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
            List<Map<String, Object>> danhsach = sql.hienThi("tblLop");
            for (Map<String, Object> map : danhsach) {
                tblNganh nganh = new tblNganh();
                nganh.truyVanTheoMa(map.get("MaNganh").toString());
                map.put("TenNganh", nganh.tenNganh);
            }
            req.setAttribute("danhSachLop", danhsach);
            req.getRequestDispatcher("/admin/danhsachlop/index.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String[] maLop = req.getParameterValues("MaLop");
        if (maLop != null) {
            for (String ma : maLop) {
                sql.xoaBanGhi("tblLop", "MaLop = '" + ma + "'");
            }
        }
        req.getSession().setAttribute("thongBao", "Xóa các lớp đã chọn thành công");
        resp.sendRedirect(req.getContextPath() + "/admin/danhsachlop");
    }
}

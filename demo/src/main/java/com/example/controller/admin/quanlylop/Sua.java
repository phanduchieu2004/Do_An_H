package com.example.controller.admin.quanlylop;

import java.io.IOException;
import java.util.Map;

import com.example.data.ChucNangSQL;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachlop/sua" })
public class Sua extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String maLop = req.getParameter("MaLop");
        Map<String, Object> lop = sql.hienThi_DieuKien("tblLop", "MaLop='" + maLop + "'").get(0);
        req.setAttribute("danhSachNganh", sql.hienThi("tblNganh"));
        req.setAttribute("lop", lop);
        req.getRequestDispatcher("/admin/danhsachlop/sua.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String maLop = req.getParameter("MaLop");
        String tenLop = req.getParameter("TenLop");
        int khoaHoc = Integer.parseInt(req.getParameter("KhoaHoc"));
        String maNganh = req.getParameter("MaNganh");
        sql.suaLop(maLop, khoaHoc, tenLop, maNganh);
        req.getSession().setAttribute("thongBao", "Sửa lớp thành công");
        resp.sendRedirect(req.getContextPath() + "/admin/danhsachlop/index");
    }
}

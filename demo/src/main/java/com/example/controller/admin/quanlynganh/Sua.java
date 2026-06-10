package com.example.controller.admin.quanlynganh;

import java.io.IOException;
import java.util.Map;

import com.example.data.ChucNangSQL;
import com.example.model.tblNganh;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachnganh/sua" })
public class Sua extends HttpServlet {

    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {
        String maNganh = req.getParameter("MaNganh");
        Map<String, Object> danhSachList = sql.hienThi_DieuKien("tblNganh", "MaNganh='" + maNganh + "'").get(0);
        req.setAttribute("danhSachKhoa", sql.hienThi("tblKhoa"));
        req.setAttribute("nganh", danhSachList);

        req.getRequestDispatcher("/admin/danhsachnganh/sua.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        String maNganh = req.getParameter("MaNganh");
        String tenNganh = req.getParameter("TenNganh");
        String maKhoa = req.getParameter("MaKhoa");
        String moTaNganh = req.getParameter("MoTaNganh");

        tblNganh nganh = new tblNganh();
        nganh.maNganh = maNganh;
        nganh.tenNganh = tenNganh;
        nganh.maKhoa = maKhoa;
        nganh.moTaNganh = moTaNganh;
        nganh.sua();
        req.getSession().setAttribute("thongBao", "Sửa ngành thành công");
        resp.sendRedirect(req.getContextPath() + "/admin/danhsachnganh/index");
    }

}

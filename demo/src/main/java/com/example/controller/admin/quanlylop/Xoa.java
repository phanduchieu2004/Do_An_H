package com.example.controller.admin.quanlylop;

import java.io.IOException;

import com.example.data.ChucNangSQL;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachlop/xoa" })
public class Xoa extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String maLop = req.getParameter("MaLop");
        sql.xoaBanGhi("tblLop", "MaLop = '" + maLop + "'");
        req.setAttribute("thongBao", "Xóa lớp thành công");
        req.getRequestDispatcher(req.getContextPath() + "/admin/danhsachlop").forward(req, resp);
    }
}

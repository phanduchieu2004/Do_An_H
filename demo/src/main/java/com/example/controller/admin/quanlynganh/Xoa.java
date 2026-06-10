package com.example.controller.admin.quanlynganh;

import java.io.IOException;

import com.example.data.ChucNangSQL;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachnganh/xoa" })
public class Xoa extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        String maNganh = req.getParameter("MaNganh");

        sql.xoaBanGhi("tblNganh", "MaNganh = '" + maNganh + "'");

        req.setAttribute("thongBao", "Xóa ngành thành công");
        req.getRequestDispatcher(req.getContextPath() + "/admin/danhsachnganh").forward(req, resp);
    }

}

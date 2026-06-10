package com.example.controller.admin;

import java.io.IOException;

import com.example.data.ChucNangSQL;
import com.example.model.tblVien;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/index", "/admin" })
public class Index extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    //
    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            sql.kiemTraDangNhap(req, resp);
        } catch (Exception e) {
        }
        if (!resp.isCommitted()) {
            tblVien vien = new tblVien();
            vien.truyVanTheoMa("V01");
            System.out.println(vien.tenVien);
            req.getRequestDispatcher("/admin/index.jsp").forward(req, resp);
        }
    }
}

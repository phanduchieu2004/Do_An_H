package com.example.controller.giangvien;

import java.io.IOException;

import com.example.data.ChucNangSQL;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/giangvien/index", "/giangvien/" })
public class Index extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            ChucNangSQL sql = new ChucNangSQL();
            sql.kiemTraDangNhap(req, resp);
        } catch (Exception e) {
        }

        if (!resp.isCommitted()) {
            System.out.println("Giang vien");

            req.getRequestDispatcher("/giangvien/index.jsp").forward(req, resp);
        }
    }

}

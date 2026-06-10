package com.example;

import java.io.IOException;

import com.example.model.tblVien;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "" }, name = "helloWorldServlet")
public class HelloWorldServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        tblVien vien = new tblVien();
        vien.maVien = "V09";
        vien.tenVien = "Viện Công nghệ Thông tin và Truyền thông";
        vien.sua();
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}

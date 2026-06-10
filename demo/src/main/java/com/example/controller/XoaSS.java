package com.example.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/xoass" })
public class XoaSS extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {
        System.out.println("chuc vu: " + req.getSession().getAttribute("SS_ChucVu"));
        req.getSession().invalidate();
        System.out.println("Đã xóa SS_ChucVu");
        resp.sendRedirect(req.getContextPath() + "/taikhoan/dangnhap");
    }
}

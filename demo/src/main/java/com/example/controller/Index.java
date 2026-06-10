package com.example.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/index" })
public class Index extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {
        String role = (String) req.getSession().getAttribute("SS_ChucVu");
        String path = req.getServletPath();
        if (role != null) {
            String roleLower = role.toLowerCase();
            if (path.startsWith("/admin") && roleLower.equals("admin")) {

            } else if (path.startsWith("/giangvien") && (roleLower.equals("giangvien") || roleLower.equals("giảng viên"))) {

            } else if (path.startsWith("/sinhvien") && (roleLower.equals("sinhvien") || roleLower.equals("sinh viên"))) {

            } else {
                req.getSession().setAttribute("loiDangNhap",
                        "Vui lòng đăng nhập đúng tài khoản chức vụ được giao tương ứng để tiếp tục");
                resp.sendRedirect(req.getContextPath() + "/taikhoan/dangnhap");
            }

        } else {
            req.getSession().setAttribute("loiDangNhap", "Vui lòng đăng nhập để tiếp tục");
            resp.sendRedirect(req.getContextPath() + "/taikhoan/dangnhap");
        }
    }

}

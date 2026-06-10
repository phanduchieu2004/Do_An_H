package com.example.controller.sinhvien.quanlydangky;

import java.io.IOException;

import com.example.model.tblDangKyHocPhan;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/sinhvien/dangkylophocphan/huydangky" })
public class HuyDangKy extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        tblDangKyHocPhan dkhp = new tblDangKyHocPhan();
        String maDangKy = req.getParameter("id");
        dkhp.maDangKyHocPhan = maDangKy;
        dkhp.xoa();
        req.getSession().setAttribute("thongBao", "Hủy đăng ký lớp học phần thành công");
        // req.getSession().setAttribute("thongBao", "eo biet ghi gi");
        resp.sendRedirect(
                req.getContextPath() + "/sinhvien/dangkylophocphan/dadangky");

    }

}

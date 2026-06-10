package com.example.controller.admin.quanlydangkyhocphan;

import java.io.IOException;

import com.example.data.ChucNangSQL;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachdangkyhocphan/xoa" })
public class Xoa extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String maDangKy = req.getParameter("MaDangKy");
        sql.xoaBanGhi("tblDangKyHocPhan", "MaDangKy = '" + maDangKy + "'");
        req.setAttribute("thongBao", "Xóa đăng ký học phần thành công");
        req.getRequestDispatcher(req.getContextPath() + "/admin/danhsachdangkyhocphan").forward(req, resp);
    }
}

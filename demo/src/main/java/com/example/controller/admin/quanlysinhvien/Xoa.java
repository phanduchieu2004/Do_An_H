package com.example.controller.admin.quanlysinhvien;

import java.io.IOException;

import com.example.data.ChucNangSQL;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachsinhvien/xoa" })
public class Xoa extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String mssv = req.getParameter("MSSV");
        sql.xoaBanGhi("tblSinhVien", "MSSV = '" + mssv + "'");
        req.setAttribute("thongBao", "Xóa sinh viên thành công");
        req.getRequestDispatcher(req.getContextPath() + "/admin/danhsachsinhvien").forward(req, resp);
    }
}

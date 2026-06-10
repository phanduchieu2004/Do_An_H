package com.example.controller.admin.quanlyvien;

import java.io.IOException;

import com.example.model.tblVien;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachvien/xoa" })
public class Xoa extends HttpServlet {
    // ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {
        String maVien = req.getParameter("MaVien");
        // ? Xóa viện theo Mã Viện
        tblVien vien = new tblVien();
        vien.maVien = maVien;
        vien.xoa();
        req.setAttribute("thongBao", "Xóa viện thành công");
        req.getRequestDispatcher(req.getContextPath() + "/admin/danhsachvien").forward(req, resp);
    }

}

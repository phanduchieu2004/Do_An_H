package com.example.controller.admin.quanlylophocphan;

import java.io.IOException;

import com.example.model.tblLopHocPhan;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachlophocphan/xoa" })
public class Xoa extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String maLopHocPhan = req.getParameter("MaLopHocPhan");
        tblLopHocPhan lhp = new tblLopHocPhan();
        lhp.maLopHocPhan = maLopHocPhan;
        lhp.xoa();
        req.setAttribute("thongBao", "Xóa lớp học phần thành công");
        req.getRequestDispatcher("/admin/danhsachlophocphan").forward(req, resp);
    }
}

package com.example.controller.admin.quanlytaikhoan;

import java.io.IOException;

import com.example.model.tblTaiKhoan;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachtaikhoan/xoa" })
public class Xoa extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String ma = req.getParameter("MaTaiKhoan");
        tblTaiKhoan tk = new tblTaiKhoan();
        tk.maNguoiDung = ma;
        tk.xoa();

        req.setAttribute("thongBao", "Xóa sinh viên thành công");
        req.getRequestDispatcher(req.getContextPath() + "/admin/danhsachtaikhoan").forward(req, resp);
    }
}

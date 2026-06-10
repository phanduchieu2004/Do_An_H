package com.example.controller.admin.quanlyhocphan;

import java.io.IOException;

import com.example.model.tblHocPhan;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachhocphan/xoa" })
public class Xoa extends HttpServlet {
    // ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        String maHocPhan = req.getParameter("MaHocPhan");
        tblHocPhan hp = new tblHocPhan();
        hp.maHocPhan = maHocPhan;
        hp.xoa();

        req.setAttribute("thongBao", "Xóa học phần thành công");
        req.getRequestDispatcher("/admin/danhsachhocphan").forward(req, resp);
    }

}

// !Ditme Mấy thằng chim bé

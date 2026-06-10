package com.example.controller.admin.quanlygiangvien;

import java.io.IOException;

import com.example.data.ChucNangSQL;
import com.example.model.tblGiangVien;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachgiangvien/xoa" })
public class Xoa extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {
        // Kiểm tra đăng nhập
        try {
            sql.kiemTraDangNhap(req, resp);
        } catch (Exception e) {
            System.out.println("Lỗi: " + e.getMessage());
        }

        String msgv = req.getParameter("MSGV");
        // ? Xóa viện theo Mã
        tblGiangVien gv = new tblGiangVien();
        gv.msgv = msgv;
        gv.xoa();

        req.setAttribute("thongBao", "Xóa giảng viên thành công");
        req.getRequestDispatcher(req.getContextPath() + "/admin/danhsachgiangvien").forward(req, resp);
    }

}

// !Ditme Mấy thằng chim bé

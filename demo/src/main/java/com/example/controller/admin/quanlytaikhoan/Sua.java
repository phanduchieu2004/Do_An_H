package com.example.controller.admin.quanlytaikhoan;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.example.data.ChucNangSQL;
import com.example.model.tblTaiKhoan;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/danhsachtaikhoan/sua")
public class Sua extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ma = req.getParameter("MaTaiKhoan");
        List<Map<String, Object>> ds = sql.hienThi_DieuKien("tblTaiKhoan", "MaNguoiDung='" + ma + "'");
        req.setAttribute("tk", ds.get(0));
        req.getRequestDispatcher("/admin/danhsachtaikhoan/sua.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        tblTaiKhoan tk = new tblTaiKhoan();
        tk.request = req;
        tk.response = resp;
        tk.maNguoiDung = req.getParameter("MaNguoiDung");
        tk.setMatKhau(req.getParameter("MatKhau"));
        tk.setChucVu(req.getParameter("ChucVu"));
        tk.setTrangThaiTaiKhoan(req.getParameter("TrangThaiTaiKhoan"));
        if (tk.bao_loi) {
            req.setAttribute("MatKhau", req.getParameter("MatKhau"));
            req.getRequestDispatcher("/admin/danhsachtaikhoan/sua.jsp").forward(req, resp);
            return;
        }
        tk.sua();
        req.getSession().setAttribute("thongBao", "Cập nhật tài khoản thành công");
        resp.sendRedirect(req.getContextPath() + "/admin/danhsachtaikhoan");
    }
}

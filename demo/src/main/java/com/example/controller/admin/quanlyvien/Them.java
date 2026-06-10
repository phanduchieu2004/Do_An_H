package com.example.controller.admin.quanlyvien;

import java.io.IOException;

import com.example.data.ChucNangSQL;
import com.example.model.tblVien;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachvien/them" })
public class Them extends HttpServlet {

    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("/admin/danhsachvien/them.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        final String maVien = req.getParameter("MaVien").trim();
        final String tenVien = req.getParameter("TenVien").trim();
        final String tenTruongVien = req.getParameter("TenTruongVien").trim();
        final String soDienThoaiVien = req.getParameter("SoDienThoaiVien").trim();
        final String emailVien = req.getParameter("EmailVien").trim();
        final String ngayThanhLapVien = sql.doiDinhDangNgay(req.getParameter("NgayThanhLapVien").trim());

        tblVien vien = new tblVien(req);
        vien.setMaVien(maVien);
        vien.setTenVien(tenVien);
        vien.setTenTruongVien(tenTruongVien);
        vien.setSoDienThoaiVien(soDienThoaiVien);
        vien.setEmailVien(emailVien);
        vien.setNgayThanhLapVien(ngayThanhLapVien);
        // ?Kiểm tra dữ liệu nếu bị thiếu
        if (vien.bao_loi) {
            // Trả lại dữ liệu đã nhập
            req.setAttribute("MaVien", maVien);
            req.setAttribute("TenVien", tenVien);
            req.setAttribute("TenTruongVien", tenTruongVien);
            req.setAttribute("SoDienThoaiVien", soDienThoaiVien);
            req.setAttribute("EmailVien", emailVien);
            req.setAttribute("NgayThanhLapVien",
                    ngayThanhLapVien);
            // System.err.println("Lỗi rồi");
            req.getRequestDispatcher("/admin/danhsachvien/them.jsp").forward(req, resp);
            return;
        } else {
            // ?Thêm viện vào cơ sở dữ liệu nếu không thiếu dữ liệu
            vien.them();
        }
        req.getSession().setAttribute("thongBao", "Thêm viện thành công");
        resp.sendRedirect(req.getContextPath() + "/admin/danhsachvien/index");
    }

}

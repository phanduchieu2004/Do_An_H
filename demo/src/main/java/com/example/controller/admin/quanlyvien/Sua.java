package com.example.controller.admin.quanlyvien;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.example.data.ChucNangSQL;
import com.example.model.tblVien;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachvien/sua" })
public class Sua extends HttpServlet {

        ChucNangSQL sql = new ChucNangSQL();

        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp)
                        throws ServletException, IOException {
                String maVien = req.getParameter("MaVien");

                // ?Lấy danh sách viện có điều kiện theo Mã Viện
                List<Map<String, Object>> danhSachVienList = sql.hienThi_DieuKien("tblVien", "MaVien='" + maVien + "'");

                for (Map<String, Object> i : danhSachVienList) {
                        // ?Định dạng lại ngày tháng về dạng năm-tháng-ngày trước khi hiển thị lên trang
                        danhSachVienList.get(0).put("NgayThanhLapVien",
                                        sql.doiDinhDangNgay_ViewEdit(i.get("NgayThanhLapVien").toString()));
                }

                req.setAttribute("vien", danhSachVienList.get(0));

                req.getRequestDispatcher("/admin/danhsachvien/sua.jsp")
                                .forward(req, resp);
        }

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp)
                        throws ServletException, IOException {
                final String maVien = req.getParameter("MaVien").trim();
                final String tenVien = req.getParameter("TenVien").trim();
                final String tenTruongVien = req.getParameter("TenTruongVien").trim();
                final String soDienThoaiVien = req
                                .getParameter("SoDienThoaiVien")
                                .trim();
                final String emailVien = req.getParameter("EmailVien").trim();
                final String ngayThanhLapVien = sql.doiDinhDangNgay(req.getParameter("NgayThanhLapVien").trim());

                tblVien vien = new tblVien(maVien, tenVien, tenTruongVien,
                                soDienThoaiVien, emailVien, ngayThanhLapVien);
                vien.sua(vien);

                req.getSession().setAttribute("thongBao", "Sửa viện thành công");
                resp.sendRedirect(req.getContextPath() + "/admin/danhsachvien/index");
        }
}

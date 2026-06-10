package com.example.controller.admin.quanlysinhvien;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.example.data.ChucNangSQL;
import com.example.model.tblLop;
import com.example.model.tblNganh;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachsinhvien", "/admin/danhsachsinhvien/index" })
public class Index extends HttpServlet {
        private final ChucNangSQL sql = new ChucNangSQL();
        // List<Map<String, Object>> danhSach_xuat;

        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp)
                        throws ServletException, IOException {

                try {
                        sql.kiemTraDangNhap(req, resp);
                } catch (Exception e) {
                }
                String trangThai = req.getParameter("trangThai");
                String tenNganh = req.getParameter("tenNganh");
                String khoaHoc = req.getParameter("khoaHoc");

                List<Map<String, Object>> allSinhVien = sql.hienThi("tblSinhVien");

                allSinhVien.forEach(map -> {
                        tblLop lop = new tblLop();
                        lop.truyVanTheoMa(map.get("MaLop").toString());
                        map.put("TenLop", lop.tenLop);
                        map.put("KhoaHoc", lop.khoaHoc);

                        tblNganh nganh = new tblNganh();
                        nganh.truyVanTheoMa(lop.maNganh);
                        map.put("TenNganh", nganh.tenNganh);
                });

                List<String> danhSachNganh = allSinhVien.stream()
                                .map(sv -> sv.get("TenNganh").toString())
                                .distinct().toList();

                List<String> danhSachKhoaHoc = allSinhVien.stream()
                                .map(sv -> sv.get("KhoaHoc").toString())
                                .distinct().toList();

                List<Map<String, Object>> danhsach = allSinhVien.stream()
                                .filter(sv -> trangThai == null || trangThai.isBlank()
                                                || trangThai.equalsIgnoreCase(String.valueOf(sv.get("TrangThaiSV"))))
                                .filter(sv -> tenNganh == null || tenNganh.isBlank()
                                                || tenNganh.equalsIgnoreCase(String.valueOf(sv.get("TenNganh"))))
                                .filter(sv -> khoaHoc == null || khoaHoc.isBlank()
                                                || khoaHoc.equalsIgnoreCase(String.valueOf(sv.get("KhoaHoc"))))
                                .toList();

                req.setAttribute("danhSachSinhVien", danhsach);
                req.setAttribute("trangThaiDaChon", trangThai);
                req.setAttribute("tenNganhDaChon", tenNganh);
                req.setAttribute("khoaHocDaChon", khoaHoc);
                req.setAttribute("danhSachNganh", danhSachNganh);
                req.setAttribute("danhSachKhoaHoc", danhSachKhoaHoc);
                // danhSach_xuat = danhsach;

                if (!resp.isCommitted()) {
                        req.getRequestDispatcher("/admin/danhsachsinhvien/index.jsp").forward(req, resp);
                }
        }

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp)
                        throws ServletException, IOException {
                String[] mssv = req.getParameterValues("MSSV");

                // sql.xuatExcel(danhSach_xuat);
                if (mssv != null) {
                        for (String ma : mssv) {
                                sql.xoaBanGhi("tblSinhVien", "MSSV = '" + ma + "'");
                        }
                }
                req.getSession().setAttribute("thongBao", "Xóa các sinh viên đã chọn thành công");
                resp.sendRedirect(req.getContextPath() + "/admin/danhsachsinhvien");
        }
}

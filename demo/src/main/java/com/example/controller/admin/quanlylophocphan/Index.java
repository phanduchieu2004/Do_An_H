package com.example.controller.admin.quanlylophocphan;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.example.data.ChucNangSQL;
import com.example.model.tblGiangVien;
import com.example.model.tblHocPhan;
import com.example.model.tblNganh;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachlophocphan", "/admin/danhsachlophocphan/index" })
public class Index extends HttpServlet {

        private final ChucNangSQL sql = new ChucNangSQL();

        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp)
                        throws ServletException, IOException {

                // Lấy tham số lọc từ request
                String tenNganh = req.getParameter("tenNganh");
                String hoTenGV = req.getParameter("hoTenGV");
                String tenHocPhan = req.getParameter("tenHocPhan");

                // Lấy toàn bộ lớp học phần
                List<Map<String, Object>> allLopHocPhan = sql.hienThi("tblLopHocPhan");

                // Bổ sung tên học phần, ngành, giảng viên cho từng lớp học phần
                for (Map<String, Object> i : allLopHocPhan) {
                        tblHocPhan hp = new tblHocPhan();
                        hp.truyVanTheoMa((String) i.get("MaHocPhan"));
                        i.put("TenHocPhan", hp.tenHocPhan);

                        tblNganh nganh = new tblNganh();
                        nganh.truyVanTheoMa(hp.maNganh);
                        i.put("TenNganh", nganh.tenNganh);

                        tblGiangVien gv = new tblGiangVien();
                        gv.truyVanTheoMa((String) i.get("MSGV"));
                        i.put("TenGiangVien", gv.hoTenGV);
                }

                // Lấy danh sách distinct cho dropdown
                List<String> danhSachNganh = allLopHocPhan.stream()
                                .map(lhp -> lhp.get("TenNganh").toString())
                                .distinct()
                                .collect(Collectors.toList());

                List<String> danhSachGiangVien = allLopHocPhan.stream()
                                .map(lhp -> lhp.get("TenGiangVien").toString())
                                .distinct()
                                .collect(Collectors.toList());

                List<String> danhSachHocPhan = allLopHocPhan.stream()
                                .map(lhp -> lhp.get("TenHocPhan").toString())
                                .distinct()
                                .collect(Collectors.toList());

                // Lọc theo tham số
                List<Map<String, Object>> danhsach = allLopHocPhan.stream()
                                .filter(lhp -> tenNganh == null || tenNganh.isBlank()
                                                || tenNganh.equalsIgnoreCase(String.valueOf(lhp.get("TenNganh"))))
                                .filter(lhp -> hoTenGV == null || hoTenGV.isBlank()
                                                || hoTenGV.equalsIgnoreCase(String.valueOf(lhp.get("TenGiangVien"))))
                                .filter(lhp -> tenHocPhan == null || tenHocPhan.isBlank()
                                                || tenHocPhan.equalsIgnoreCase(String.valueOf(lhp.get("TenHocPhan"))))
                                .collect(Collectors.toList());

                // Gửi dữ liệu sang JSP
                req.setAttribute("danhSachLopHocPhan", danhsach);
                req.setAttribute("danhSachNganh", danhSachNganh);
                req.setAttribute("danhSachGiangVien", danhSachGiangVien);
                req.setAttribute("danhSachHocPhan", danhSachHocPhan);

                req.setAttribute("tenNganhDaChon", tenNganh);
                req.setAttribute("tenGiangVienDaChon", hoTenGV);
                req.setAttribute("tenHocPhanDaChon", tenHocPhan);

                req.getRequestDispatcher("/admin/danhsachlophocphan/index.jsp").forward(req, resp);
        }

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp)
                        throws ServletException, IOException {
                String[] maLopHocPhan = req.getParameterValues("MaLopHocPhan");
                if (maLopHocPhan != null) {
                        for (String ma : maLopHocPhan) {
                                sql.xoaBanGhi("tblLopHocPhan", "MaLopHocPhan = '" + ma + "'");
                        }
                }
                req.getSession().setAttribute("thongBao", "Xóa các lớp học phần đã chọn thành công");
                resp.sendRedirect(req.getContextPath() + "/admin/danhsachlophocphan");
        }
}

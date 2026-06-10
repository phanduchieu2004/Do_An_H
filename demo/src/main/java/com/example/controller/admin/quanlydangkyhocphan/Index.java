package com.example.controller.admin.quanlydangkyhocphan;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.example.data.ChucNangSQL;
import com.example.model.tblGiangVien;
import com.example.model.tblHocPhan;
import com.example.model.tblLopHocPhan;
import com.example.model.tblNganh;
import com.example.model.tblSinhVien;
import com.example.model.tblVien;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachdangkyhocphan", "/admin/danhsachdangkyhocphan/index" })
public class Index extends HttpServlet {
        private final ChucNangSQL sql = new ChucNangSQL();

        @Override
        protected void doGet(HttpServletRequest req,
                        HttpServletResponse resp)
                        throws ServletException, IOException {
                try {
                        sql.kiemTraDangNhap(req, resp);
                } catch (Exception e) {
                }

                String tenLopHocPhan = req.getParameter("tenLopHocPhan");
                String tenGiangVien = req.getParameter("tenGiangVien");

                List<Map<String, Object>> danhSachDangKy = sql.hienThi("tblDangKyHocPhan");
                for (Map<String, Object> map : danhSachDangKy) {

                        tblSinhVien sv = new tblSinhVien();
                        sv.truyVanTheoMa(map.get("MSSV").toString());
                        map.put("HoTenSV", sv.hoTenSV);

                        tblLopHocPhan lhp = new tblLopHocPhan();
                        lhp.truyVanTheoMa(map.get("MaLopHocPhan").toString());
                        map.put("TenLopHocPhan", lhp.tenLopHocPhan);
                        map.put("ThuTiet", lhp.thuTiet);
                        map.put("ThoiGianBatDau", lhp.thoiGianBatDau);
                        map.put("ThoiGianKetThuc", lhp.thoiGianKetThuc);
                        map.put("PhongHoc", lhp.phongHoc);
                        map.put("SoLuongToiDa", lhp.soLuongToiDa);
                        map.put("SoLuongDangKy", lhp.getSoLuongDangKy());

                        tblGiangVien gv = new tblGiangVien();
                        gv.truyVanTheoMa(lhp.msgv);
                        map.put("HoTenGV", gv.hoTenGV);

                        tblHocPhan hp = new tblHocPhan();
                        hp.truyVanTheoMa(lhp.maHocPhan);
                        map.put("TenHocPhan", hp.tenHocPhan);

                        tblNganh nganh = new tblNganh();
                        nganh.truyVanTheoMa(hp.maNganh);
                        map.put("TenNganh", nganh.tenNganh);
                }

                List<String> danhSachLopHocPhan = danhSachDangKy.stream()
                                .map(sv -> sv.get("TenLopHocPhan").toString())
                                .distinct().toList();

                List<String> danhSachGiangVien = danhSachDangKy.stream()
                                .map(sv -> sv.get("HoTenGV").toString())
                                .distinct().toList();

                // Lọc theo lớp học phần và tên giảng viên
                List<Map<String, Object>> danhSachLoc = danhSachDangKy.stream()
                                .filter(sv -> tenLopHocPhan == null || tenLopHocPhan.isBlank()
                                                || tenLopHocPhan.equalsIgnoreCase(
                                                                String.valueOf(sv.get("TenLopHocPhan"))))
                                .filter(sv -> tenGiangVien == null || tenGiangVien.isBlank()
                                                || tenGiangVien.equalsIgnoreCase(String.valueOf(sv.get("HoTenGV"))))
                                .toList();

                if (!resp.isCommitted()) {
                    req.setAttribute("danhSachDangKyHocPhan", danhSachLoc);
                    req.setAttribute("tenLopHocPhanDaChon", tenLopHocPhan);
                    req.setAttribute("tenGiangVienDaChon", tenGiangVien);
                    req.setAttribute("danhSachLopHocPhan", danhSachLopHocPhan);
                    req.setAttribute("danhSachGiangVien", danhSachGiangVien);

                    req.getRequestDispatcher("/admin/danhsachdangkyhocphan/index.jsp").forward(req, resp);
                }
        }

        @Override
        protected void doPost(HttpServletRequest req,
                        HttpServletResponse resp)
                        throws ServletException, IOException {
                String[] maVien = req.getParameterValues("MaVien");
                if (maVien != null) {
                        for (String ma : maVien) {
                                tblVien vien = new tblVien();
                                vien.maVien = ma;
                                vien.xoa();
                                System.out.println("Đã xóa viện với Mã Viện: " + ma);
                        }
                }
                req.getSession().setAttribute("thongBao", "Xóa các viện đã chọn thành công");
                resp.sendRedirect(
                                req.getContextPath() + "/admin/danhsachvien");
        }
}

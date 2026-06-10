package com.example.controller.admin.quanlygiangvien;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.example.data.ChucNangSQL;
import com.example.model.tblGiangVien;
import com.example.model.tblNganh;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachgiangvien", "/admin/danhsachgiangvien/index" })
public class Index extends HttpServlet {

    private final ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            sql.kiemTraDangNhap(req, resp);
        } catch (Exception e) {
        }
        
        if (!resp.isCommitted()) {
            String trangThai = req.getParameter("trangThai");
            String tenNganh = req.getParameter("tenNganh");
            List<Map<String, Object>> allGiangVien = sql.hienThi("tblGiangVien");

            allGiangVien.forEach(map -> {
                tblNganh nganh = new tblNganh();
                nganh.truyVanTheoMa(map.get("MaNganh").toString());
                map.put("TenNganh", nganh.tenNganh);

            });
            List<String> danhSachNganh = allGiangVien.stream()
                    .map(sv -> sv.get("TenNganh").toString())
                    .distinct().toList();
            List<Map<String, Object>> danhsach = allGiangVien.stream()
                    .filter(sv -> trangThai == null || trangThai.isBlank()
                            || trangThai.equalsIgnoreCase(String.valueOf(sv.get("TrangThaiGV"))))
                    .filter(sv -> tenNganh == null || tenNganh.isBlank()
                            || tenNganh.equalsIgnoreCase(String.valueOf(sv.get("TenNganh"))))

                    .toList();
            req.setAttribute("danhSachGiangVien", danhsach);
            req.setAttribute("trangThaiDaChon", trangThai);
            req.setAttribute("tenNganhDaChon", tenNganh);
            req.setAttribute("danhSachNganh", danhSachNganh);
            req.getRequestDispatcher("/admin/danhsachgiangvien/index.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String[] gv = req.getParameterValues("MSGV");
        if (gv != null) {
            for (String ma : gv) {
                tblGiangVien giangVien = new tblGiangVien();
                giangVien.msgv = ma;
                giangVien.xoa();
            }
        }
        req.getSession().setAttribute("thongBao", "Xóa các khoa đã chọn thành công");
        resp.sendRedirect(req.getContextPath() + "/admin/danhsachgiangvien");
    }
}

package com.example.controller.admin.quanlyhocphan;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.example.data.ChucNangSQL;
import com.example.model.tblNganh;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachhocphan", "/admin/danhsachhocphan/index" })
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
            // Lấy tham số lọc từ request
            String hocKy = req.getParameter("hocKy");
            String tenNganh = req.getParameter("tenNganh");

            List<Map<String, Object>> danhsach = sql.hienThi("tblHocPhan");
            for (Map<String, Object> i : danhsach) {
                tblNganh nganh = new tblNganh();
                nganh.truyVanTheoMa(i.get("MaNganh").toString());
                i.put("TenNganh", nganh.tenNganh);
            }

            // Lấy danh sách distinct để hiển thị combobox lọc
            List<String> danhSachHocKy = danhsach.stream()
                    .map(hp -> hp.get("HocKy").toString())
                    .distinct().toList();

            List<String> danhSachNganh = danhsach.stream()
                    .map(hp -> hp.get("TenNganh").toString())
                    .distinct().toList();

            // Lọc theo học kỳ và tên ngành
            List<Map<String, Object>> danhSachLoc = danhsach.stream()
                    .filter(hp -> hocKy == null || hocKy.isBlank()
                            || hocKy.equalsIgnoreCase(String.valueOf(hp.get("HocKy"))))
                    .filter(hp -> tenNganh == null || tenNganh.isBlank()
                            || tenNganh.equalsIgnoreCase(String.valueOf(hp.get("TenNganh"))))
                    .toList();

            // Gửi dữ liệu sang JSP
            req.setAttribute("danhSachHocPhan", danhSachLoc);
            req.setAttribute("hocKyDaChon", hocKy);
            req.setAttribute("tenNganhDaChon", tenNganh);
            req.setAttribute("danhSachHocKy", danhSachHocKy);
            req.setAttribute("danhSachNganh", danhSachNganh);

            req.getRequestDispatcher("/admin/danhsachhocphan/index.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String[] maHocPhan = req.getParameterValues("MaHocPhan");
        if (maHocPhan != null) {
            for (String ma : maHocPhan) {
                sql.xoaBanGhi("tblHocPhan", "MaHocPhan = '" + ma + "'");
            }
        }
        req.getSession().setAttribute("thongBao", "Xóa các học phần đã chọn thành công");
        resp.sendRedirect(req.getContextPath() + "/admin/danhsachhocphan");
    }
}

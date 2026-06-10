package com.example.controller.sinhvien.quanlydangky;

import java.io.IOException;
import java.time.LocalDate;

import com.example.data.ChucNangSQL;
import com.example.model.tblDangKyHocPhan;
import com.example.model.tblLopHocPhan;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/sinhvien/dangkylophocphan/dangky" })
public class DangKy extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {

            sql.kiemTraDangNhap(req, resp);
        } catch (Exception e) {
        }
        String maLopHocPhan = req.getParameter("MaLopHocPhan");
        // System.out.println("Mã lớp học phần đăng ký: ");
        System.out.println("Mã lớp học phần đăng ký: " + maLopHocPhan);
        tblDangKyHocPhan dkhp = new tblDangKyHocPhan();
        tblLopHocPhan lhp = new tblLopHocPhan();
        dkhp.maDangKyHocPhan = "DKHP" + (dkhp.getSoLuongDangKy() + 1);
        System.out.println("so luong dang ky: " + dkhp.getSoLuongDangKy());
        dkhp.mssv = (String) req.getSession().getAttribute("SS_MaNguoiDung");
        dkhp.maLopHocPhan = maLopHocPhan;
        dkhp.trangThaiDangKyHocPhan = "Đã đăng ký";
        dkhp.ngayDangKy = sql.doiDinhDangNgay(LocalDate.now().toString());
        lhp.truyVanTheoMa(maLopHocPhan);
        if (lhp.getSoLuongDangKy() >= lhp.soLuongToiDa) {
            req.getSession().setAttribute("thongBao",
                    "Lớp học phần đã đầy, vui lòng chọn lớp học phần khác");
            resp.sendRedirect(
                    req.getContextPath() + "/sinhvien/dangkylophocphan");
            return;
        }
        // Kiểm tra trạng thái lớp học phần
        if (!"Đang mở".equals(lhp.trangThaiLopHocPhan)) {
            req.getSession().setAttribute("thongBao",
                    "Lớp học phần đã đóng hoặc đã hủy, không thể đăng ký");
            resp.sendRedirect(
                    req.getContextPath() + "/sinhvien/dangkylophocphan");
            return;
        }

        dkhp.them();
        req.getSession().setAttribute("thongBao", "Đăng ký lớp học phần thành công");
        resp.sendRedirect(req.getContextPath() + "/sinhvien/dangkylophocphan/index");
    }

}

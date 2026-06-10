package com.example.controller.giangvien.quanlydiem;

import java.io.IOException;

import com.example.model.tblDangKyHocPhan;
import com.example.model.tblDiemLopHocPhan;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/giangvien/danhsachketqua/nhapdiem" })
public class NhapDiem extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String maDiemLopHocPhan = req.getParameter("MaDiemLopHocPhan");
        String maDangKyHocPhan = req.getParameter("MaDangKyHocPhan");
        String diemQuaTrinhStr = req.getParameter("DiemQuaTrinh");
        String diemThiStr = req.getParameter("DiemThi");

        // Kiểm tra tất cả tham số không rỗng
        if (maDiemLopHocPhan == null || maDiemLopHocPhan.trim().isEmpty() ||
                maDangKyHocPhan == null || maDangKyHocPhan.trim().isEmpty() ||
                diemQuaTrinhStr == null || diemQuaTrinhStr.trim().isEmpty() ||
                diemThiStr == null || diemThiStr.trim().isEmpty()) {
            req.getSession().setAttribute("thongBao", "Dữ liệu không đầy đủ. Vui lòng nhập đủ thông tin");
            resp.sendRedirect(req.getContextPath() + "/giangvien/danhsachketqua");
            return;
        }

        // Kiểm tra định dạng và phạm vi điểm
        Double diemQuaTrinh;
        Double diemThi;
        try {
            diemQuaTrinh = Double.valueOf(diemQuaTrinhStr);
            diemThi = Double.valueOf(diemThiStr);

            // Kiểm tra phạm vi điểm
            if (diemQuaTrinh < 0 || diemQuaTrinh > 10 || diemThi < 0 || diemThi > 10) {
                req.getSession().setAttribute("thongBao", "Điểm phải nằm trong khoảng 0-10");
                resp.sendRedirect(req.getContextPath() + "/giangvien/danhsachketqua");
                return;
            }
        } catch (NumberFormatException e) {
            req.getSession().setAttribute("thongBao", "Điểm phải là số hợp lệ (0-10)");
            resp.sendRedirect(req.getContextPath() + "/giangvien/danhsachketqua");
            return;
        }
        System.out.println("ma diem lop hoc phan: " + maDiemLopHocPhan);

        System.out.println("diem qua trinh: " + diemQuaTrinh);
        System.out.println("diem thi: " + diemThi);

        tblDiemLopHocPhan diem = new tblDiemLopHocPhan(req);
        System.out.println("ma dang ky hoc phan: " + maDangKyHocPhan);
        diem.truyVanTheoMa(maDiemLopHocPhan);
        System.out.println("diem thi 2: " + diemThi);
        diem.maDangKyHocPhan = maDangKyHocPhan;
        diem.setDiemQuaTrinh(diemQuaTrinh);
        diem.setDiemThi(diemThi);
        diem.setDiemTongKet();
        System.out.println("diem tong ket: " + diem.diemTongKet);
        diem.setXepLoai();
        diem.sua();

        tblDangKyHocPhan dangKy = new tblDangKyHocPhan(req);
        dangKy.truyVanTheoMa(maDangKyHocPhan);
        System.out.println("diem thi: " + dangKy.mssv);

        if (diem.bao_loi) {
            req.getSession().setAttribute("thongBao", "Điểm không hợp lệ");
            if (dangKy.maLopHocPhan != null && !dangKy.maLopHocPhan.isEmpty()) {
                resp.sendRedirect(req.getContextPath() + "/giangvien/danhsachketqua/xem?MaLopHocPhan="
                        + dangKy.maLopHocPhan);
            } else {
                resp.sendRedirect(req.getContextPath() + "/giangvien/danhsachketqua");
            }
            return;
        }

        req.getSession().setAttribute("thongBao", "Lưu điểm thành công");
        if (dangKy.maLopHocPhan != null && !dangKy.maLopHocPhan.isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/giangvien/danhsachketqua/xem?MaLopHocPhan="
                    + dangKy.maLopHocPhan);
        } else {
            resp.sendRedirect(req.getContextPath() + "/giangvien/danhsachketqua");
        }
    }

}

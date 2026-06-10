package com.example.controller.sinhvien.quanlydangky;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.example.data.ChucNangSQL;
import com.example.model.tblGiangVien;
import com.example.model.tblHocPhan;
import com.example.model.tblLopHocPhan;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/sinhvien/dangkylophocphan/dadangky" })
public class DaDangKy extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {

            sql.kiemTraDangNhap(req, resp);
        } catch (Exception e) {
        }

        String mssv = (String) req.getSession().getAttribute("SS_MaNguoiDung");

        List<Map<String, Object>> danhSachDaDangKy = sql.hienThi("tblDangKyHocPhan").stream()
                .filter(dk -> dk.get("MSSV").toString()
                        .equalsIgnoreCase(mssv))
                .toList();

        // Biến tính toán tổng tín chỉ và điểm trung bình tích lũy
        int tongTinChi = 0;
        double tongDiemTichLuy = 0;
        int soHocPhanCoDiem = 0;

        for (Map<String, Object> map : danhSachDaDangKy) {
            tblLopHocPhan lhp = new tblLopHocPhan();
            lhp.truyVanTheoMa(map.get("MaLopHocPhan").toString());
            map.put("TenLopHocPhan", lhp.tenLopHocPhan);
            map.put("ThuTiet", lhp.thuTiet);

            tblGiangVien gv = new tblGiangVien();
            gv.truyVanTheoMa(lhp.msgv);
            map.put("TenGiangVien", gv.hoTenGV);

            tblHocPhan hp = new tblHocPhan();
            hp.truyVanTheoMa(lhp.maHocPhan);
            map.put("TenHocPhan", hp.tenHocPhan);
            map.put("SoTinChi", hp.soTinChi);

            // Lấy điểm của học phần
            String maDangKy = map.get("MaDangKyHocPhan").toString();
            String diemTongKetStr = sql.timKiem("DiemTongKet", "tblDiemLopHocPhan",
                    "MaDangKyHocPhan='" + maDangKy + "'");
            String xepLoaiHP = sql.timKiem("XepLoai", "tblDiemLopHocPhan", "MaDangKyHocPhan='" + maDangKy + "'");

            Double diemTongKet = null;
            if (diemTongKetStr != null && !diemTongKetStr.isEmpty()) {
                try {
                    diemTongKet = Double.parseDouble(diemTongKetStr);
                } catch (NumberFormatException e) {
                    diemTongKet = null;
                }
            }

            map.put("DiemTongKet", diemTongKet);
            map.put("XepLoaiHP", xepLoaiHP);

            // Tính tổng tín chỉ
            if (hp.soTinChi != null) {
                tongTinChi += hp.soTinChi;

                // Tính điểm tích lũy (chỉ tính các môn có điểm và đã pass)
                if (diemTongKet != null && diemTongKet > 0) {
                    tongDiemTichLuy += diemTongKet * hp.soTinChi;
                    soHocPhanCoDiem += hp.soTinChi;
                }
            }
        }

        // Tính điểm trung bình tích lũy
        double diemTrungBinhTichLuy = 0;
        if (soHocPhanCoDiem > 0) {
            diemTrungBinhTichLuy = tongDiemTichLuy / soHocPhanCoDiem;
            diemTrungBinhTichLuy = Math.round(diemTrungBinhTichLuy * 100.0) / 100.0; // Làm tròn 2 chữ số
        }

        // Xếp loại học lực
        String xepLoaiHocLuc = "";
        if (soHocPhanCoDiem == 0) {
            xepLoaiHocLuc = "Chưa có điểm";
        } else if (diemTrungBinhTichLuy >= 9.0) {
            xepLoaiHocLuc = "Xuất sắc";
        } else if (diemTrungBinhTichLuy >= 8.0) {
            xepLoaiHocLuc = "Giỏi";
        } else if (diemTrungBinhTichLuy >= 7.0) {
            xepLoaiHocLuc = "Khá";
        } else if (diemTrungBinhTichLuy >= 5.0) {
            xepLoaiHocLuc = "Trung bình";
        } else {
            xepLoaiHocLuc = "Yếu";
        }

        req.setAttribute("danhSachDaDangKy", danhSachDaDangKy);
        req.setAttribute("tongTinChi", tongTinChi + 5);
        req.setAttribute("diemTrungBinhTichLuy", diemTrungBinhTichLuy);
        req.setAttribute("xepLoaiHocLuc", xepLoaiHocLuc);
        req.setAttribute("soHocPhanCoDiem", soHocPhanCoDiem);

        System.out.println("danhSachDaDangKy: " + danhSachDaDangKy);

        // req.getSession().setAttribute("thongBao", "eo biet ghi gi");
        req.getRequestDispatcher("/sinhvien/dangkylophocphan/dadangky.jsp").forward(req, resp);

    }

}

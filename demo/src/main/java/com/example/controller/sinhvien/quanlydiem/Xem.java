package com.example.controller.sinhvien.quanlydiem;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.example.data.ChucNangSQL;
import com.example.model.tblDangKyHocPhan;
import com.example.model.tblGiangVien;
import com.example.model.tblHocPhan;
import com.example.model.tblLopHocPhan;
import com.example.model.tblSinhVien;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/sinhvien/danhsachketqua/xem" })
public class Xem extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            sql.kiemTraDangNhap(req, resp);
        } catch (Exception e) {
        }

        // Lấy MSSV của sinh viên đang đăng nhập
        String mssvHienTai = (String) req.getSession().getAttribute("SS_MaNguoiDung");

        // Lấy thông tin sinh viên
        tblSinhVien sinhVien = new tblSinhVien();
        sinhVien.truyVanTheoMa(mssvHienTai);
        req.setAttribute("sinhVien", sinhVien);

        // Lấy danh sách điểm
        List<Map<String, Object>> danhsach = sql.hienThi("tblDiemLopHocPhan");
        List<Map<String, Object>> danhSachDiemSV = new ArrayList<>();

        // Tổng số tín chỉ và điểm để tính GPA
        double tongDiemTichLuy = 0;
        int tongTinChi = 0;
        int soMonDat = 0;
        int soMonKhongDat = 0;

        for (Map<String, Object> map : danhsach) {
            tblDangKyHocPhan dangKy = new tblDangKyHocPhan();
            dangKy.truyVanTheoMa(map.get("MaDangKyHocPhan").toString());

            // Chỉ lấy điểm của sinh viên đang đăng nhập
            if (mssvHienTai != null && mssvHienTai.equals(dangKy.mssv)) {
                tblLopHocPhan lopHocPhan = new tblLopHocPhan();
                lopHocPhan.truyVanTheoMa(dangKy.maLopHocPhan);
                map.put("TenLopHocPhan", lopHocPhan.tenLopHocPhan);
                map.put("MaLopHocPhan", lopHocPhan.maLopHocPhan);

                // Lấy thông tin học phần
                tblHocPhan hocPhan = new tblHocPhan();
                hocPhan.truyVanTheoMa(lopHocPhan.maHocPhan);
                map.put("TenHocPhan", hocPhan.tenHocPhan);
                map.put("MaHocPhan", hocPhan.maHocPhan);
                map.put("SoTinChi", hocPhan.soTinChi);

                // Lấy thông tin giảng viên
                tblGiangVien giangVien = new tblGiangVien();
                giangVien.truyVanTheoMa(lopHocPhan.msgv);
                map.put("TenGiangVien", giangVien.hoTenGV);

                // Tính điểm chữ và GPA
                Double diemTongKet = map.get("DiemTongKet") != null ? Double.valueOf(map.get("DiemTongKet").toString())
                        : null;
                if (diemTongKet != null) {
                    String diemChu = tinhDiemChu(diemTongKet);
                    double diemHe4 = tinhDiemHe4(diemTongKet);
                    map.put("DiemChu", diemChu);
                    map.put("DiemHe4", diemHe4);

                    // Cộng dồn để tính GPA
                    int tinChi = hocPhan.soTinChi != null ? hocPhan.soTinChi : null;
                    tongDiemTichLuy += diemHe4 * tinChi;
                    tongTinChi += tinChi;

                    if (diemTongKet >= 4.0) {
                        soMonDat++;
                    } else {
                        soMonKhongDat++;
                    }
                }

                danhSachDiemSV.add(map);
            }
        }

        // Tính GPA
        double gpa = tongTinChi > 0 ? tongDiemTichLuy / tongTinChi : 0;
        String xepLoaiHocLuc = tinhXepLoaiHocLuc(gpa);

        req.setAttribute("danhSachDiem", danhSachDiemSV);
        req.setAttribute("tongTinChi", tongTinChi);
        req.setAttribute("gpa", String.format("%.2f", gpa));
        req.setAttribute("xepLoaiHocLuc", xepLoaiHocLuc);
        req.setAttribute("soMonDat", soMonDat);
        req.setAttribute("soMonKhongDat", soMonKhongDat);
        req.setAttribute("tongSoMon", soMonDat + soMonKhongDat);

        req.getRequestDispatcher("/sinhvien/danhsachketqua/xem.jsp").forward(req, resp);
    }

    // Tính điểm chữ theo thang điểm 10
    private String tinhDiemChu(double diem) {
        if (diem >= 9.0)
            return "A+";
        if (diem >= 8.5)
            return "A";
        if (diem >= 8.0)
            return "B+";
        if (diem >= 7.0)
            return "B";
        if (diem >= 6.5)
            return "C+";
        if (diem >= 5.5)
            return "C";
        if (diem >= 5.0)
            return "D+";
        if (diem >= 4.0)
            return "D";
        return "F";
    }

    // Tính điểm hệ 4
    private double tinhDiemHe4(double diem) {
        if (diem >= 9.0)
            return 4.0;
        if (diem >= 8.5)
            return 3.7;
        if (diem >= 8.0)
            return 3.5;
        if (diem >= 7.0)
            return 3.0;
        if (diem >= 6.5)
            return 2.5;
        if (diem >= 5.5)
            return 2.0;
        if (diem >= 5.0)
            return 1.5;
        if (diem >= 4.0)
            return 1.0;
        return 0.0;
    }

    // Xếp loại học lực
    private String tinhXepLoaiHocLuc(double gpa) {
        if (gpa >= 3.6)
            return "Xuất sắc";
        if (gpa >= 3.2)
            return "Giỏi";
        if (gpa >= 2.5)
            return "Khá";
        if (gpa >= 2.0)
            return "Trung bình";
        if (gpa >= 1.0)
            return "Yếu";
        return "Kém";
    }
}

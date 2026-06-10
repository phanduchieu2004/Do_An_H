package com.example.controller.sinhvien;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.example.data.ChucNangSQL;
import com.example.model.tblHocPhan;
import com.example.model.tblLopHocPhan;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/sinhvien/index", "/sinhvien/" })
public class Index extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {
        ChucNangSQL sql = new ChucNangSQL();
        try {
            sql.kiemTraDangNhap(req, resp);
        } catch (Exception e) {
        }

        String mssv = (String) req.getSession().getAttribute("SS_MaNguoiDung");

        // Lấy danh sách học phần đã đăng ký của sinh viên
        List<Map<String, Object>> danhSachDaDangKy = sql.hienThi("tblDangKyHocPhan").stream()
                .filter(dk -> dk.get("MSSV").toString().equalsIgnoreCase(mssv))
                .toList();

        // Tính toán các thống kê
        int tongHocPhan = danhSachDaDangKy.size();
        int tongTinChi = 0;
        double tongDiemTichLuy = 0;
        int soTinChiCoDiem = 0;

        for (Map<String, Object> dk : danhSachDaDangKy) {
            // Lấy thông tin học phần để có số tín chỉ
            tblLopHocPhan lhp = new tblLopHocPhan();
            lhp.truyVanTheoMa(dk.get("MaLopHocPhan").toString());

            tblHocPhan hp = new tblHocPhan();
            hp.truyVanTheoMa(lhp.maHocPhan);

            if (hp.soTinChi != null) {
                tongTinChi += hp.soTinChi;

                // Lấy điểm tổng kết
                String maDangKy = dk.get("MaDangKyHocPhan").toString();
                String diemTongKetStr = sql.timKiem("DiemTongKet", "tblDiemLopHocPhan",
                        "MaDangKyHocPhan='" + maDangKy + "'");

                if (diemTongKetStr != null && !diemTongKetStr.isEmpty()) {
                    try {
                        Double diemTongKet = Double.parseDouble(diemTongKetStr);
                        if (diemTongKet > 0) {
                            tongDiemTichLuy += diemTongKet * hp.soTinChi;
                            soTinChiCoDiem += hp.soTinChi;
                        }
                    } catch (NumberFormatException e) {
                        // Ignore
                    }
                }
            }
        }

        // Tính điểm trung bình tích lũy
        double diemTrungBinhTichLuy = 0;
        if (soTinChiCoDiem > 0) {
            diemTrungBinhTichLuy = tongDiemTichLuy / soTinChiCoDiem;
            diemTrungBinhTichLuy = Math.round(diemTrungBinhTichLuy * 100.0) / 100.0;
        }

        // Xếp loại học lực
        String xepLoaiHocLuc = "";
        if (soTinChiCoDiem == 0) {
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

        // Đặt các thuộc tính để hiển thị
        req.setAttribute("tongHocPhan", tongHocPhan);
        req.setAttribute("tongTinChi", tongTinChi);
        req.setAttribute("diemTrungBinhTichLuy", diemTrungBinhTichLuy);
        req.setAttribute("xepLoaiHocLuc", xepLoaiHocLuc);

        if (!resp.isCommitted()) {
            List<Map<String, Object>> danhsach = sql.hienThi("tblSinhVien");
            req.setAttribute("danhSachSinhVien", danhsach);
            req.getRequestDispatcher("/sinhvien/index.jsp").forward(req, resp);
        }
    }

}

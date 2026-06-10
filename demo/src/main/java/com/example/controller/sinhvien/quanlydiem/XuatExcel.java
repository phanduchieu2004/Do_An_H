package com.example.controller.sinhvien.quanlydiem;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.example.data.ChucNangSQL;
import com.example.model.tblDangKyHocPhan;
import com.example.model.tblGiangVien;
import com.example.model.tblHocPhan;
import com.example.model.tblLopHocPhan;
import com.example.model.tblSinhVien;
import com.example.util.ExcelExporter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/sinhvien/danhsachketqua/xuatexcel" })
public class XuatExcel extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            sql.kiemTraDangNhap(req, resp);
        } catch (Exception e) {
            return;
        }

        // Lấy MSSV của sinh viên đang đăng nhập
        String mssvHienTai = (String) req.getSession().getAttribute("SS_MaNguoiDung");
        String hoTen = (String) req.getSession().getAttribute("SS_HoTen");

        if (mssvHienTai == null) {
            resp.sendRedirect(req.getContextPath() + "/taikhoan/dangnhap");
            return;
        }

        // Lấy thông tin sinh viên
        tblSinhVien sinhVien = new tblSinhVien();
        sinhVien.truyVanTheoMa(mssvHienTai);

        // Lấy danh sách điểm
        List<Map<String, Object>> danhsach = sql.hienThi("tblDiemLopHocPhan");
        List<Map<String, Object>> danhSachExcel = new ArrayList<>();

        int stt = 1;
        double tongDiemTichLuy = 0;
        int tongTinChi = 0;

        for (Map<String, Object> map : danhsach) {
            tblDangKyHocPhan dangKy = new tblDangKyHocPhan();
            dangKy.truyVanTheoMa(map.get("MaDangKyHocPhan").toString());

            // Chỉ lấy điểm của sinh viên đang đăng nhập
            if (mssvHienTai != null && mssvHienTai.equals(dangKy.mssv)) {
                tblLopHocPhan lopHocPhan = new tblLopHocPhan();
                lopHocPhan.truyVanTheoMa(dangKy.maLopHocPhan);

                // Lấy thông tin học phần
                tblHocPhan hocPhan = new tblHocPhan();
                hocPhan.truyVanTheoMa(lopHocPhan.maHocPhan);

                // Lấy thông tin giảng viên
                tblGiangVien giangVien = new tblGiangVien();
                giangVien.truyVanTheoMa(lopHocPhan.msgv);

                // Tính điểm
                Double diemQuaTrinh = map.get("DiemQuaTrinh") != null
                        ? Double.valueOf(map.get("DiemQuaTrinh").toString())
                        : null;
                Double diemThi = map.get("DiemThi") != null ? Double.valueOf(map.get("DiemThi").toString()) : null;
                Double diemTongKet = map.get("DiemTongKet") != null ? Double.valueOf(map.get("DiemTongKet").toString())
                        : null;

                String diemChu = "-";
                double diemHe4 = 0;
                String xepLoai = "Chưa có";

                if (diemTongKet != null) {
                    diemChu = tinhDiemChu(diemTongKet);
                    diemHe4 = tinhDiemHe4(diemTongKet);
                    xepLoai = diemTongKet >= 4.0 ? "Đạt" : "Không đạt";

                    int tinChi = hocPhan.soTinChi != null ? hocPhan.soTinChi : null;
                    tongDiemTichLuy += diemHe4 * tinChi;
                    tongTinChi += tinChi;
                }

                // Tạo map với thứ tự cột cố định
                Map<String, Object> row = new LinkedHashMap<>();
                row.put("STT", stt++);
                row.put("Mã HP", hocPhan.maHocPhan != null ? hocPhan.maHocPhan : lopHocPhan.maLopHocPhan);
                row.put("Tên học phần", hocPhan.tenHocPhan != null ? hocPhan.tenHocPhan : lopHocPhan.tenLopHocPhan);
                row.put("Tín chỉ", hocPhan.soTinChi != null ? hocPhan.soTinChi : null);
                row.put("Giảng viên", giangVien.hoTenGV != null ? giangVien.hoTenGV : "");
                row.put("Điểm QT", diemQuaTrinh != null ? diemQuaTrinh : "-");
                row.put("Điểm thi", diemThi != null ? diemThi : "-");
                row.put("Điểm TK (10)", diemTongKet != null ? diemTongKet : "-");
                row.put("Điểm TK (4)", diemTongKet != null ? diemHe4 : "-");
                row.put("Điểm chữ", diemChu);
                row.put("Xếp loại", xepLoai);

                danhSachExcel.add(row);
            }
        }

        if (danhSachExcel.isEmpty()) {
            resp.setContentType("text/html;charset=UTF-8");
            resp.getWriter().println("<script>alert('Không có dữ liệu để xuất!'); window.history.back();</script>");
            return;
        }

        // Tính GPA
        double gpa = tongTinChi > 0 ? tongDiemTichLuy / tongTinChi : 0;
        String xepLoaiHocLuc = tinhXepLoaiHocLuc(gpa);

        // Thêm dòng tổng kết
        Map<String, Object> summaryRow = new LinkedHashMap<>();
        summaryRow.put("STT", "");
        summaryRow.put("Mã HP", "");
        summaryRow.put("Tên học phần", "TỔNG KẾT");
        summaryRow.put("Tín chỉ", tongTinChi);
        summaryRow.put("Giảng viên", "");
        summaryRow.put("Điểm QT", "");
        summaryRow.put("Điểm thi", "");
        summaryRow.put("Điểm TK (10)", "");
        summaryRow.put("Điểm TK (4)", String.format("%.2f", gpa));
        summaryRow.put("Điểm chữ", "GPA");
        summaryRow.put("Xếp loại", xepLoaiHocLuc);
        danhSachExcel.add(summaryRow);

        // Tên file: BangDiem_MSSV_HoTen.xlsx
        String fileName = "BangDiem_" + mssvHienTai + "_"
                + (hoTen != null ? hoTen.replaceAll("\\s+", "_") : "SinhVien");

        // Xuất Excel
        ExcelExporter.exportToResponse(danhSachExcel, resp, fileName, "Bảng điểm");
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

package com.example.data;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;

import com.example.util.ExcelExporter;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class ChucNangSQL {
    QuanLySQL ql = new QuanLySQL();

    public boolean kiemTraKhoaChinh(String tenBang, String tenCotKhoaChinh, String giaTriKhoaChinh) {
        List<Map<String, Object>> kq = ql
                .LayTruyVan("SELECT * FROM " + tenBang + " WHERE " + tenCotKhoaChinh + "='" + giaTriKhoaChinh + "';");
        return !kq.isEmpty();
    }

    /**
     * Tìm kiếm và trả về giá trị từ một cột trong bảng theo điều kiện.
     * SQL: SELECT [cotCanLay] FROM [tenBang] WHERE [dieuKien]
     */
    public String timKiem(String cotCanLay, String tenBang, String dieuKien) {
        List<Map<String, Object>> kq = ql.LayTruyVan("SELECT " + cotCanLay + " FROM " + tenBang + " WHERE " + dieuKien);
        if (!kq.isEmpty()) {
            Object value = kq.get(0).get(cotCanLay);
            return value != null ? value.toString() : "";
        }
        return "";
    }

    /**
     * Tìm kiếm và trả về giá trị từ một cột trong bảng lấy từ lệnh sql.
     * SQL: [lenhSQL]
     */
    public String timKiem_SQL(String cotCanLay, String lenhSQL) {
        List<Map<String, Object>> kq = ql.LayTruyVan(lenhSQL);
        if (!kq.isEmpty()) {
            Object value = kq.get(0).get(cotCanLay);
            return value != null ? value.toString() : "";
        }
        return "";
    }

    /**
     * Tìm kiếm bằng truy vấn lồng và trả về giá trị từ một cột trong bảng theo điều
     * kiện.
     * SQL: SELECT [cotCanLay] FROM [tenBang] WHERE cotDieuKien = ( [dieuKien])
     ***
     * Ví dụ:
     * SELECT TenVien
     * FROM tblVien
     * WHERE MaVien = (
     * SELECT MaVien FROM tblKhoa WHERE MaKhoa = '...'
     * );
     */
    public String timKiem_TruyVanLong(String cotCanLay, String tenBang, String cotDieuKien, String dieuKien) {
        List<Map<String, Object>> kq = ql.LayTruyVan(
                "SELECT " + cotCanLay + " FROM " + tenBang + " WHERE " + cotDieuKien + " = (" + dieuKien + ")");
        if (!kq.isEmpty()) {
            Object value = kq.get(0).get(cotCanLay);
            return value != null ? value.toString() : "";
        }
        System.out.println("Không tìm thấy giá trị phù hợp.");
        return "";
    }

    /**
     * Hiển thị tất cả dữ liệu từ một bảng.
     * SQL: SELECT * FROM [tenBang]
     */
    public List<Map<String, Object>> hienThi(String tenBang) {
        return ql.LayTruyVan("SELECT * FROM " + tenBang);
    }

    /**
     * Hiển thị dữ liệu từ một bảng theo điều kiện.
     * SQL: SELECT * FROM [tenBang] WHERE [dieuKien]
     */
    public List<Map<String, Object>> hienThi_DieuKien(String tenBang, String dieuKien) {
        return ql.LayTruyVan("SELECT * FROM " + tenBang + " WHERE " + dieuKien);
    }

    // =========================
    // Chức năng Viện
    // =========================

    /**
     * Thêm viện mới vào hệ thống.
     * SQL: INSERT INTO tblVien (...)
     */
    public void themVien(String maVien, String tenVien, String tenTruongVien, String soDienThoaiVien, String emailVien,
            String ngayThanhLapVien) {
        ql.ChayLenhSQL(
                "INSERT INTO tblVien (MaVien, TenVien, TenTruongVien, SoDienThoaiVien, EmailVien, NgayThanhLapVien) VALUES ('"
                        + maVien + "', '" + tenVien + "', '" + tenTruongVien + "', '" + soDienThoaiVien + "', '"
                        + emailVien + "', '" + ngayThanhLapVien + "');");
    }

    /**
     * Sửa thông tin viện.
     * SQL: UPDATE tblVien SET ... WHERE MaVien='...'
     */
    public void suaVien(String maVienCanSua, String tenVien, String tenTruongVien, String soDienThoaiVien,
            String emailVien, String ngayThanhLapVien) {
        ql.ChayLenhSQL("UPDATE tblVien SET TenVien='" + tenVien + "', TenTruongVien='" + tenTruongVien
                + "', SoDienThoaiVien='" + soDienThoaiVien + "', EmailVien='" + emailVien + "', NgayThanhLapVien='"
                + ngayThanhLapVien + "' WHERE MaVien='" + maVienCanSua + "';");
    }

    // =========================
    // Chức năng Khoa
    // =========================

    /**
     * Thêm khoa mới vào hệ thống.
     * SQL: INSERT INTO tblKhoa (...)
     * Các trường: MaKhoa, TenKhoa, MaVien, TenTruongKhoa, SoDienThoaiKhoa,
     * EmailKhoa, NgayThanhLapKhoa, MoTaKhoa, TrangThaiKhoa
     */
    public void themKhoa(String maKhoa, String tenKhoa, String maVien, String tenTruongKhoa, String soDienThoaiKhoa,
            String emailKhoa, String ngayThanhLapKhoa, String moTaKhoa, String trangThaiKhoa) {
        ql.ChayLenhSQL(
                "INSERT INTO tblKhoa (MaKhoa, TenKhoa, MaVien, TenTruongKhoa, SoDienThoaiKhoa, EmailKhoa, NgayThanhLapKhoa, MoTaKhoa, TrangThaiKhoa) VALUES ('"
                        + maKhoa + "', '" + tenKhoa + "', '" + maVien + "', '" + tenTruongKhoa + "', '"
                        + soDienThoaiKhoa + "', '" + emailKhoa + "', '" + ngayThanhLapKhoa + "', '" + moTaKhoa + "', '"
                        + trangThaiKhoa + "');");
    }

    /**
     * Sửa thông tin khoa.
     * SQL: UPDATE tblKhoa SET ... WHERE MaKhoa='...'
     * Các trường: TenKhoa, MaVien, TenTruongKhoa, SoDienThoaiKhoa, EmailKhoa,
     * NgayThanhLapKhoa, MoTaKhoa, TrangThaiKhoa
     */
    public void suaKhoa(String maKhoaCanSua, String tenKhoa, String maVien, String tenTruongKhoa,
            String soDienThoaiKhoa, String emailKhoa, String ngayThanhLapKhoa, String moTaKhoa, String trangThaiKhoa) {
        ql.ChayLenhSQL("UPDATE tblKhoa SET TenKhoa='" + tenKhoa + "', MaVien='" + maVien + "', TenTruongKhoa='"
                + tenTruongKhoa + "', SoDienThoaiKhoa='" + soDienThoaiKhoa + "', EmailKhoa='" + emailKhoa
                + "', NgayThanhLapKhoa='" + ngayThanhLapKhoa + "', MoTaKhoa='" + moTaKhoa + "', TrangThaiKhoa='"
                + trangThaiKhoa + "' WHERE MaKhoa='"
                + maKhoaCanSua + "';");
    }

    // =========================
    // Chức năng Ngành
    // =========================

    /**
     * Thêm ngành mới vào hệ thống.
     * SQL: INSERT INTO tblNganh (...)
     * Các trường: MaNganh, TenNganh, MaKhoa, MoTaNganh, TrangThaiNganh
     */
    public void themNganh(String maNganh, String tenNganh, String maKhoa, String moTaNganh, String trangThaiNganh) {
        ql.ChayLenhSQL("INSERT INTO tblNganh (MaNganh, TenNganh, MaKhoa, MoTaNganh, TrangThaiNganh) VALUES ('" + maNganh
                + "', '"
                + tenNganh + "', '" + maKhoa + "', '" + moTaNganh + "', '" + trangThaiNganh + "');");
    }

    /**
     * Sửa thông tin ngành.
     * SQL: UPDATE tblNganh SET ... WHERE MaNganh='...'
     * Các trường: TenNganh, MaKhoa, MoTaNganh, TrangThaiNganh
     */
    public void suaNganh(String maNganhCanSua, String tenNganh, String maKhoa, String moTaNganh,
            String trangThaiNganh) {
        ql.ChayLenhSQL("UPDATE tblNganh SET TenNganh='" + tenNganh + "', MaKhoa='" + maKhoa + "', MoTaNganh='"
                + moTaNganh + "', TrangThaiNganh='" + trangThaiNganh + "' WHERE MaNganh='" + maNganhCanSua + "';");
    }

    // =========================
    // Chức năng Lớp
    // =========================

    /**
     * Thêm lớp mới vào hệ thống.
     * SQL: INSERT INTO tblLop (...)
     */
    public void themLop(String maLop, Integer khoaHoc, String tenLop, String maNganh) {
        ql.ChayLenhSQL("INSERT INTO tblLop (MaLop, KhoaHoc, TenLop, MaNganh) VALUES ('" + maLop + "', "
                + (khoaHoc == null ? "NULL" : khoaHoc) + ", '" + tenLop + "', '" + maNganh + "');");
    }

    /**
     * Sửa thông tin lớp.
     * SQL: UPDATE tblLop SET ... WHERE MaLop='...'
     */
    public void suaLop(String maLopCanSua, Integer khoaHoc, String tenLop, String maNganh) {
        ql.ChayLenhSQL("UPDATE tblLop SET KhoaHoc=" + (khoaHoc == null ? "NULL" : khoaHoc) + ", TenLop='" + tenLop
                + "', MaNganh='" + maNganh + "' WHERE MaLop='" + maLopCanSua + "';");
    }

    // =========================
    // Chức năng Lớp học phần
    // =========================

    /**
     * Thêm lớp học phần mới vào hệ thống.
     * SQL: INSERT INTO tblLopHocPhan (...)
     * Các trường: MaLopHocPhan, TenLopHocPhan, MaHocPhan, MSGV, SoBuoi, SoTiet,
     * SoTuanHoc, ThuTiet, PhongHoc, ThoiGianBatDau, ThoiGianKetThuc, ThoiGianHoc,
     * SoLuongToiDa, TrangThaiLopHocPhan
     */
    public void themLopHocPhan(String maLopHocPhan, String tenLopHocPhan, String maHocPhan, String msgv,
            Integer soBuoi, Integer soTiet, String soTuanHoc, String thuTiet, String phongHoc, String thoiGianBatDau,
            String thoiGianKetThuc, String thoiGianHoc, Integer soLuongToiDa, String trangThaiLopHocPhan) {
        ql.ChayLenhSQL(
                "INSERT INTO tblLopHocPhan (MaLopHocPhan, TenLopHocPhan, MaHocPhan, MSGV, SoBuoi, SoTiet, SoTuanHoc, ThuTiet, PhongHoc, ThoiGianBatDau, ThoiGianKetThuc, ThoiGianHoc, SoLuongToiDa, TrangThaiLopHocPhan) VALUES ('"
                        + maLopHocPhan + "', '" + tenLopHocPhan + "', '" + maHocPhan + "', '" + msgv + "', "
                        + (soBuoi == null ? "NULL" : soBuoi) + ", " + (soTiet == null ? "NULL" : soTiet) + ", '"
                        + (soTuanHoc == null ? "" : soTuanHoc) + "', '" + (thuTiet == null ? "" : thuTiet) + "', '"
                        + (phongHoc == null ? "" : phongHoc) + "', '" + (thoiGianBatDau == null ? "" : thoiGianBatDau)
                        + "', '"
                        + (thoiGianKetThuc == null ? "" : thoiGianKetThuc) + "', '"
                        + (thoiGianHoc == null ? "" : thoiGianHoc) + "', "
                        + (soLuongToiDa == null ? "NULL" : soLuongToiDa) + ", '"
                        + (trangThaiLopHocPhan == null ? "" : trangThaiLopHocPhan) + "');");
    }

    /**
     * Sửa thông tin lớp học phần.
     * SQL: UPDATE tblLopHocPhan SET ... WHERE MaLopHocPhan='...'
     * Các trường: TenLopHocPhan, MaHocPhan, MSGV, SoBuoi, SoTiet, SoTuanHoc,
     * ThuTiet, PhongHoc, ThoiGianBatDau, ThoiGianKetThuc, ThoiGianHoc,
     * SoLuongToiDa, TrangThaiLopHocPhan
     */
    public void suaLopHocPhan(String maLopHocPhan, String tenLopHocPhan, String maHocPhan, String msgv,
            Integer soBuoi, Integer soTiet, String soTuanHoc, String thuTiet, String phongHoc, String thoiGianBatDau,
            String thoiGianKetThuc, String thoiGianHoc, Integer soLuongToiDa, String trangThaiLopHocPhan) {
        ql.ChayLenhSQL("UPDATE tblLopHocPhan SET TenLopHocPhan='" + tenLopHocPhan + "', MaHocPhan='" + maHocPhan
                + "', MSGV='" + msgv + "', SoBuoi=" + (soBuoi == null ? "NULL" : soBuoi) + ", SoTiet="
                + (soTiet == null ? "NULL" : soTiet)
                + ", SoTuanHoc='" + (soTuanHoc == null ? "" : soTuanHoc) + "', ThuTiet='"
                + (thuTiet == null ? "" : thuTiet) + "', PhongHoc='" + (phongHoc == null ? "" : phongHoc)
                + "', ThoiGianBatDau='" + (thoiGianBatDau == null ? "" : thoiGianBatDau) + "', ThoiGianKetThuc='"
                + (thoiGianKetThuc == null ? "" : thoiGianKetThuc)
                + "', ThoiGianHoc='" + (thoiGianHoc == null ? "" : thoiGianHoc) + "', SoLuongToiDa="
                + (soLuongToiDa == null ? "NULL" : soLuongToiDa)
                + ", TrangThaiLopHocPhan='" + (trangThaiLopHocPhan == null ? "" : trangThaiLopHocPhan)
                + "' WHERE MaLopHocPhan='" + maLopHocPhan + "';");
    }

    // =========================
    // Chức năng Học phần
    // =========================

    public void themHocPhan(String maHocPhan, String tenHocPhan, Integer hocKy, Integer soTinChi, String maNganh,
            String moTaHocPhan) {
        ql.ChayLenhSQL("INSERT INTO tblHocPhan (MaHocPhan, TenHocPhan,HocKy, SoTinChi, MaNganh, MoTaHocPhan) VALUES ('"
                + maHocPhan
                + "', '" + tenHocPhan
                + "', " + hocKy
                + ", " + (soTinChi == null ? "NULL" : soTinChi)
                + ", '" + maNganh + "', '"
                + moTaHocPhan + "');");
    }

    public void suaHocPhan(String maHocPhanCanSua, String tenHocPhan, Integer hocKy, Integer soTinChi, String maNganh,
            String moTaHocPhan) {
        ql.ChayLenhSQL("UPDATE tblHocPhan SET TenHocPhan='" + tenHocPhan
                + "', HocKy=" + (hocKy == null ? "NULL" : hocKy)
                + ", SoTinChi=" + (soTinChi == null ? "NULL" : soTinChi)
                + ", MaNganh='" + maNganh
                + "', MoTaHocPhan='" + moTaHocPhan
                + "' WHERE MaHocPhan='" + maHocPhanCanSua
                + "';");
    }

    // =========================
    // Chức năng Đăng ký học phần
    // =========================

    /**
     * Thêm đăng ký học phần mới vào hệ thống.
     * SQL: INSERT INTO tblDangKyHocPhan (...)
     * Các trường: MaDangKyHocPhan, MSSV, MaLopHocPhan, TrangThaiDangKyHocPhan
     */
    public void themDangKyHocPhan(String maDangKyHocPhan, String mssv, String maLopHocPhan, String ngayDangKy,
            String trangThaiDangKyHocPhan) {
        ql.ChayLenhSQL(
                "INSERT INTO tblDangKyHocPhan (MaDangKyHocPhan, MSSV, MaLopHocPhan, NgayDangKy, TrangThaiDangKyHocPhan) VALUES ('"
                        + maDangKyHocPhan + "', '" + mssv + "', '" + maLopHocPhan + "', '" + ngayDangKy + "', '"
                        + (trangThaiDangKyHocPhan == null ? "" : trangThaiDangKyHocPhan) + "');");
    }

    /**
     * Sửa thông tin đăng ký học phần.
     * SQL: UPDATE tblDangKyHocPhan SET ... WHERE MaDangKyHocPhan='...'
     * Các trường: MSSV, MaLopHocPhan, TrangThaiDangKyHocPhan
     */
    public void suaDangKyHocPhan(String maDangKyHocPhan, String mssv, String maLopHocPhan, String ngayDangKy,
            String trangThaiDangKyHocPhan) {
        ql.ChayLenhSQL("UPDATE tblDangKyHocPhan SET MSSV='" + mssv + "', MaLopHocPhan='" + maLopHocPhan
                + "', NgayDangKy='" + ngayDangKy + "', TrangThaiDangKyHocPhan='"
                + (trangThaiDangKyHocPhan == null ? "" : trangThaiDangKyHocPhan)
                + "' WHERE MaDangKyHocPhan='" + maDangKyHocPhan + "';");
    }

    // =========================
    // Chức năng Điểm lớp học phần
    // =========================

    /**
     * Thêm điểm lớp học phần mới vào hệ thống.
     * SQL: INSERT INTO tblDiemLopHocPhan (...)
     * Các trường: MaDiemLopHocPhan, MaDangKyHocPhan, DiemQuaTrinh, DiemThi,
     * DiemTongKet, XepLoai
     */
    public void themDiemLopHocPhan(String maDiemLopHocPhan, String maDangKyHocPhan, Double diemQuaTrinh, Double diemThi,
            Double diemTongKet, String xepLoai) {
        ql.ChayLenhSQL(
                "INSERT INTO tblDiemLopHocPhan (MaDiemLopHocPhan, MaDangKyHocPhan, DiemQuaTrinh, DiemThi, DiemTongKet, XepLoai) VALUES ('"
                        + maDiemLopHocPhan + "', '" + maDangKyHocPhan + "', "
                        + (diemQuaTrinh == null ? "NULL" : diemQuaTrinh) + ", "
                        + (diemThi == null ? "NULL" : diemThi) + ", "
                        + (diemTongKet == null ? "NULL" : diemTongKet) + ", '" + (xepLoai == null ? "" : xepLoai)
                        + "');");
    }

    /**
     * Sửa thông tin điểm lớp học phần.
     * SQL: UPDATE tblDiemLopHocPhan SET ... WHERE MaDiemLopHocPhan='...'
     * Các trường: MaDangKyHocPhan, DiemQuaTrinh, DiemThi, DiemTongKet, XepLoai
     */
    public void suaDiemLopHocPhan(String maDiemLopHocPhan, String maDangKyHocPhan, Double diemQuaTrinh, Double diemThi,
            Double diemTongKet, String xepLoai) {
        ql.ChayLenhSQL("UPDATE tblDiemLopHocPhan SET MaDangKyHocPhan='" + maDangKyHocPhan + "', DiemQuaTrinh="
                + (diemQuaTrinh == null ? "NULL" : diemQuaTrinh) + ", DiemThi=" + (diemThi == null ? "NULL" : diemThi)
                + ", DiemTongKet=" + (diemTongKet == null ? "NULL" : diemTongKet) + ", XepLoai='"
                + (xepLoai == null ? "" : xepLoai)
                + "' WHERE MaDiemLopHocPhan='" + maDiemLopHocPhan + "';");
    }

    // =========================
    // Chức năng Điểm danh
    // =========================

    /**
     * Thêm điểm danh mới vào hệ thống.
     * SQL: INSERT INTO tblDiemDanh (...)
     * Các trường: MaDiemDanh, MaDangKyHocPhan, ChuoiDiemDanh, GhiChu
     */
    public void themDiemDanh(String maDiemDanh, String maDangKyHocPhan, String chuoiDiemDanh, String ghiChu) {
        ql.ChayLenhSQL("INSERT INTO tblDiemDanh (MaDiemDanh, MaDangKyHocPhan, ChuoiDiemDanh, GhiChu) VALUES ('"
                + maDiemDanh + "', '" + maDangKyHocPhan + "', '" + (chuoiDiemDanh == null ? "" : chuoiDiemDanh) + "', '"
                + (ghiChu == null ? "" : ghiChu) + "');");
    }

    /**
     * Sửa thông tin điểm danh.
     * SQL: UPDATE tblDiemDanh SET ... WHERE MaDiemDanh='...'
     * Các trường: MaDangKyHocPhan, ChuoiDiemDanh, GhiChu
     */
    public void suaDiemDanh(String maDiemDanh, String maDangKyHocPhan, String chuoiDiemDanh, String ghiChu) {
        ql.ChayLenhSQL("UPDATE tblDiemDanh SET MaDangKyHocPhan='" + maDangKyHocPhan + "', ChuoiDiemDanh='"
                + (chuoiDiemDanh == null ? "" : chuoiDiemDanh) + "', GhiChu='" + (ghiChu == null ? "" : ghiChu)
                + "' WHERE MaDiemDanh='" + maDiemDanh + "';");
    }

    // =========================
    // Chức năng Tài khoản
    // =========================

    /**
     * Thêm tài khoản mới vào hệ thống.
     * SQL: INSERT INTO tblTaiKhoan (...)
     * Các trường: MaNguoiDung, MatKhau, ChucVu, TrangThaiTaiKhoan
     */
    public void themTaiKhoan(String maNguoiDung, String matKhau, String chucVu, String trangThaiTaiKhoan) {
        ql.ChayLenhSQL("INSERT INTO tblTaiKhoan (MaNguoiDung, MatKhau, ChucVu, TrangThaiTaiKhoan) VALUES ('"
                + maNguoiDung + "', '"
                + matKhau + "', '" + (chucVu == null ? "" : chucVu) + "', '"
                + (trangThaiTaiKhoan == null ? "" : trangThaiTaiKhoan) + "');");
    }

    /**
     * Sửa thông tin tài khoản.
     * SQL: UPDATE tblTaiKhoan SET ... WHERE MaNguoiDung='...'
     * Các trường: MatKhau, ChucVu, TrangThaiTaiKhoan
     */
    public void suaTaiKhoan(String maNguoiDung, String matKhau, String chucVu, String trangThaiTaiKhoan) {
        ql.ChayLenhSQL("UPDATE tblTaiKhoan SET MatKhau='" + matKhau + "', ChucVu='" + (chucVu == null ? "" : chucVu)
                + "', TrangThaiTaiKhoan='" + (trangThaiTaiKhoan == null ? "" : trangThaiTaiKhoan)
                + "' WHERE MaNguoiDung='" + maNguoiDung + "';");
    }

    // =========================
    // Chức năng Giảng viên
    // =========================

    /**
     * Thêm giảng viên mới vào hệ thống.
     * SQL: INSERT INTO tblGiangVien (...)
     */
    public void themGiangVien(String msgv, String hoTen, String ngaySinh, String gioiTinh, String queQuan, String email,
            String maNganh, String soDienThoai, String anhGV, String trangThaiGV) {
        ql.ChayLenhSQL(
                "INSERT INTO tblGiangVien (MSGV, HoTenGV, NgaySinhGV, GioiTinhGV, QueQuanGV, EmailGV, MaNganh, SoDienThoaiGV, AnhGV, TrangThaiGV) VALUES ('"
                        + msgv + "', '" + hoTen + "', '" + ngaySinh + "', '" + gioiTinh + "', '" + queQuan + "', '"
                        + email + "', '" + maNganh + "', '" + soDienThoai + "', '" + anhGV + "', '" + trangThaiGV
                        + "');");
    }

    /**
     * Sửa thông tin giảng viên.
     * SQL: UPDATE tblGiangVien SET ... WHERE MSGV='...'
     */
    public void suaGiangVien(String msgvCanSua, String hoTen, String ngaySinh, String gioiTinh, String queQuan,
            String email, String maNganh, String soDienThoai, String anhGV, String trangThaiGV) {
        ql.ChayLenhSQL("UPDATE tblGiangVien SET HoTenGV='" + hoTen + "', NgaySinhGV='" + ngaySinh + "', GioiTinhGV='"
                + gioiTinh + "', QueQuanGV='" + queQuan + "', EmailGV='" + email + "', MaNganh='" + maNganh
                + "', SoDienThoaiGV='" + soDienThoai + "', AnhGV='" + anhGV + "', TrangThaiGV='" + trangThaiGV
                + "' WHERE MSGV='" + msgvCanSua + "';");
    }

    // =========================
    // Chức năng Sinh viên
    // =========================

    /**
     * Thêm sinh viên mới vào hệ thống.
     * SQL: INSERT INTO tblSinhVien (...)
     */
    public void themSinhVien(String mssv, String hoTen, String ngaySinh, String gioiTinh, String queQuan, String email,
            String maLop, String soDienThoai, String anhSV, String trangThaiSV) {
        ql.ChayLenhSQL(
                "INSERT INTO tblSinhVien (MSSV, HoTenSV, NgaySinhSV, GioiTinhSV, QueQuanSV, EmailSV, MaLop, SoDienThoaiSV, AnhSV, TrangThaiSV) VALUES ('"
                        + mssv + "', '" + hoTen + "', '" + ngaySinh + "', '" + gioiTinh + "', '" + queQuan + "', '"
                        + email + "', '" + maLop + "', '" + soDienThoai + "', '" + anhSV + "', '" + trangThaiSV
                        + "');");
    }

    /**
     * Sửa thông tin sinh viên.
     * SQL: UPDATE tblSinhVien SET ... WHERE MSSV='...'
     */
    public void suaSinhVien(String mssvCanSua, String hoTen, String ngaySinh, String gioiTinh, String queQuan,
            String email, String maLop, String soDienThoai, String anhSV, String trangThaiSV) {
        ql.ChayLenhSQL("UPDATE tblSinhVien SET HoTenSV='" + hoTen + "', NgaySinhSV='" + ngaySinh + "', GioiTinhSV='"
                + gioiTinh + "', QueQuanSV='" + queQuan + "', EmailSV='" + email + "', MaLop='" + maLop
                + "', SoDienThoaiSV='" + soDienThoai + "', AnhSV='" + anhSV + "', TrangThaiSV='" + trangThaiSV
                + "' WHERE MSSV='" + mssvCanSua + "';");
    }

    // =========================
    // Xóa bản ghi
    // =========================

    /**
     * Xóa bản ghi từ bảng theo điều kiện.
     * SQL: DELETE FROM [tenBang] WHERE [dieuKien]
     */
    public void xoaBanGhi(String tenBang, String dieuKien) {
        ql.ChayLenhSQL("DELETE FROM " + tenBang + " WHERE " + dieuKien + ";");
    }

    // =========================
    // * Upload file
    // =========================

    /**
     * Thêm file vào thư mục uploads của ứng dụng.
     * Lưu file vào: /src/main/webapp/uploads/
     */

    public void themFile(Part filePart, ServletContext context) throws IOException {
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = filePart.getSubmittedFileName();
            String uploadDir = context.getRealPath("/static/uploads");
            System.out.println("Địa chỉ upload: " + uploadDir);

            File dir = new File(uploadDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            String filePath = uploadDir + File.separator + fileName;
            File file = new File(filePath);

            // Nếu file đã tồn tại thì xóa
            if (file.exists()) {
                boolean deleted = file.delete();
                if (!deleted) {
                    throw new IOException("Không thể xóa file cũ: " + fileName);
                }
            }

            // Ghi file mới
            filePart.write(filePath);
        } else {
            throw new IOException("File rỗng hoặc không tồn tại");
        }
    }

    // =========================
    // * Upload file với mã số
    // =========================

    /**
     * Upload một file vào thư mục /static/uploads của ứng dụng.
     * - Đặt tên file theo mã số (maSo) và giữ nguyên phần mở rộng của file gốc.
     * - Nếu file có cùng mã số đã tồn tại, sẽ xóa file cũ trước khi ghi đè.
     *
     * @param filePart Đối tượng Part chứa dữ liệu file upload từ form.
     * @param context  ServletContext để lấy đường dẫn thực tế của thư mục uploads.
     * @param maSo     Mã số dùng để đặt tên file.
     */

    public String themFile_Ma(Part filePart, ServletContext context, String maSo) throws IOException {
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = filePart.getSubmittedFileName();
            String extension = "";

            // ?Lấy phần đuôi file
            int dotIndex = fileName.lastIndexOf('.');
            if (dotIndex > 0) {
                extension = fileName.substring(dotIndex);
            }

            // Đường dẫn thư mục upload
            String uploadDir = context.getRealPath("/static/uploads");
            Path uploadPath = Paths.get(uploadDir);

            // Tạo thư mục nếu chưa tồn tại
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            // Đặt tên file theo maSo + extension
            Path filePath = uploadPath.resolve(maSo + extension);

            // Nếu file cũ tồn tại thì xóa
            if (Files.exists(filePath)) {
                boolean deleted = Files.deleteIfExists(filePath);
                if (!deleted) {
                    throw new IOException("Không thể xóa file cũ: " + filePath.getFileName());
                }
                System.out.println("Đã xóa file cũ: " + filePath.getFileName());
            }

            // Ghi file mới
            filePart.write(filePath.toString());
            System.out.println("Upload thành công: " + filePath);
            return maSo + extension;
        } else {
            throw new IOException("File rỗng hoặc không tồn tại");
        }
    }

    // !Có thể không sử dụng
    // =========================
    // * Bổ sung dữ liệu cho danh sách theo mã số (Chưa bao quát)
    // =========================

    /**
     * Bổ sung dữ liệu cho danh sách theo mã số.
     * Ví dụ: bổ sung thông tin vào cho danh sách dựa vào mã số.
     ***
     * SQL: SELECT [cotChoVao] FROM [bangCuaCot] WHERE [tenCotMaSo] = '[giá trị dựa
     * theo
     * tenCotMaSo trong danh sách]'
     */
    public void boSungDS(List<Map<String, Object>> danhSachCanBoSung, String cotChoVao, String bangCuaCot,
            String tenCotMaSo) {
        for (Map<String, Object> i : danhSachCanBoSung) {
            i.put(cotChoVao, timKiem(cotChoVao, bangCuaCot, tenCotMaSo + " = '" + i.get(tenCotMaSo) + "'"));
        }
    }

    // =========================
    // * Bổ sung dữ liệu cho danh sách theo truy vấn lồng (Chưa ổn định)
    // =========================
    /**
     * Bổ sung dữ liệu cho danh sách theo truy vấn lồng (chưa ổn định).
     *
     * Mục đích: với mỗi bản ghi trong danh sách, lấy giá trị từ bảng khác
     * bằng cách dùng truy vấn.
     *
     * Cấu trúc SQL mong muốn:
     * SELECT [cotChoVao] FROM [bangCuaCot]
     * WHERE [cotDieuKien] = (
     * SELECT [cotDieuKien] FROM [bangCuaCotDieuKien] WHERE [tenCotDaCo] = '[giá trị
     * từ danh sách]'
     * );
     *
     * Ví dụ:
     * SELECT TenVien FROM tblVien
     * WHERE MaVien = (
     * SELECT MaVien FROM tblKhoa WHERE MaKhoa = 'K001'
     * );
     */
    public void boSungDS_TruyVanLong(List<Map<String, Object>> danhSachCanBoSung,
            String cotChoVao, String bangCuaCot,
            String cotDieuKien, String bangCuaCotDieuKien, String cotDaCo) {
        for (Map<String, Object> i : danhSachCanBoSung) {
            String sqlString = "SELECT " + cotDieuKien + " FROM " + bangCuaCotDieuKien +
                    " WHERE " + cotDaCo + " = '" + i.get(cotDaCo) + "'";
            i.put(cotChoVao, timKiem_TruyVanLong(cotChoVao, bangCuaCot, cotDieuKien, sqlString));
        }
        // System.out.println("Đã bổ sung " + cotChoVao + " dựa theo " + cotDaCo);
    }
    // public void boSungDS_TruyVanLong(List<Map<String, Object>> danhSachCanBoSung,
    // String cotChoVao, String bangCuaCot,
    // String cotDieuKien, String bangCuaCotDieuKien, String cotDaCo) {
    // for (Map<String, Object> i : danhSachCanBoSung) {
    // i.put(cotChoVao, timKiem_TruyVanLong(cotChoVao,
    // bangCuaCot,
    // cotDieuKien,
    // timKiem(cotDieuKien, bangCuaCotDieuKien, cotDaCo + " = '" +
    // i.get(cotDaCo) + "'")));
    // }
    // System.out.println("Đã bổ sung " + cotChoVao + " dựa theo " + cotDaCo);
    // }

    // =========================
    // * Bổ sung dữ liệu cho danh sách theo lệnh sql
    // =========================
    /**
     * Bổ sung dữ liệu cho danh sách theo điều kiện
     * Ví dụ: bổ sung thông tin vào cho danh sách dựa vào truy vấn theo lệnh SQL.
     ***
     * SQL: [lenhSQL]
     */
    public void boSungDS_VoiLenhSQL(List<Map<String, Object>> danhSachCanBoSung, String cotChoVao, String lenhSQL) {
        for (Map<String, Object> i : danhSachCanBoSung) {
            i.put(cotChoVao, timKiem_SQL(cotChoVao, lenhSQL));
        }
    }

    // =========================
    // * Đổi định dạng hiển thị ngày tháng năm dễ nhìn hơn
    // =========================
    public String doiDinhDangNgay(String ngayThangNamSQL) {
        String[] parts = ngayThangNamSQL.split("-");
        if (parts.length > 2) {
            return parts[2] + "/" + parts[1] + "/" + parts[0];
        }
        return ngayThangNamSQL;
    }

    // =========================
    // * Đổi định dạng hiển thị ngày tháng năm chỉ dành cho view bên edit
    // =========================
    public String doiDinhDangNgay_ViewEdit(String ngayThangNamSQL) {
        String[] parts = ngayThangNamSQL.split("/");
        if (parts.length == 3) {
            return parts[2] + "-" + parts[1] + "-" + parts[0];
        }
        return ngayThangNamSQL;
    }

    // =========================
    // * Kiểm tra đăng nhập
    // =========================
    public void kiemTraDangNhap(HttpServletRequest request, HttpServletResponse response) throws Exception {
        var session = ((HttpServletRequest) request).getSession();
        String role = (String) session.getAttribute("SS_ChucVu");
        System.out.println("chuc vu: " + role);
        String path = request.getServletPath();
        if (role != null) {
            String roleLower = role.toLowerCase();
            if (path.startsWith("/admin") && roleLower.equals("admin")) {
            } else if (path.startsWith("/giangvien")
                    && (roleLower.equals("giangvien") || roleLower.equals("giảng viên"))) {
            } else if (path.startsWith("/sinhvien")
                    && (roleLower.equals("sinhvien") || roleLower.equals("sinh viên"))) {
            } else {
                session.setAttribute("loiDangNhap",
                        "Vui lòng đăng nhập đúng tài khoản chức vụ được giao tương ứng để tiếp tục");
                response.sendRedirect(request.getContextPath() + "/taikhoan/dangnhap");
            }
        } else {
            session.setAttribute("loiDangNhap", "Vui lòng đăng nhập để tiếp tục");
            response.sendRedirect(request.getContextPath() + "/taikhoan/dangnhap");
        }
    }
    // =========================
    // * Chuyển đổi List<Map<String, Object>> sang Excel
    // =========================

    /**
     * Xuất dữ liệu từ List<Map<String, Object>> sang file Excel
     * 
     * @param data     Danh sách dữ liệu cần xuất
     * @param filePath Đường dẫn file Excel (ví dụ: "C:/exports/data.xlsx")
     * @throws IOException nếu có lỗi ghi file
     */
    public void xuatExcel(List<Map<String, Object>> data, String ten) throws IOException {
        String filePath = "src/main/webapp/static/fileExcel/" + ten + ".xlsx";
        ExcelExporter.exportToExcel(data, filePath);
    }

    // /**
    // * Xuất dữ liệu từ List<Map<String, Object>> sang file Excel
    // *
    // * @param data Danh sách dữ liệu cần xuất
    // * @param filePath Đường dẫn file Excel (ví dụ: "C:/exports/data.xlsx")
    // * @throws IOException nếu có lỗi ghi file
    // */
    // public void xuatExcel(List<Map<String, Object>> data, String filePath) throws
    // IOException {
    // ExcelExporter.exportToExcel(data, filePath);
    // }

    /**
     * Xuất dữ liệu từ List<Map<String, Object>> sang file Excel với tên sheet tùy
     * chỉnh
     * 
     * @param data      Danh sách dữ liệu cần xuất
     * @param filePath  Đường dẫn file Excel (ví dụ: "C:/exports/data.xlsx")
     * @param sheetName Tên của sheet trong file Excel
     * @throws IOException nếu có lỗi ghi file
     */
    public void xuatExcel(List<Map<String, Object>> data, String filePath, String sheetName) throws IOException {
        ExcelExporter.exportToExcel(data, filePath, sheetName);
    }

}

package com.example.model;

import java.util.List;
import java.util.Map;

import com.example.data.ChucNangSQL;

import jakarta.servlet.http.HttpServletRequest;

public class tblDangKyHocPhan {
    ChucNangSQL sql = new ChucNangSQL();

    public String maDangKyHocPhan;
    public String mssv;
    public String maLopHocPhan;
    public String ngayDangKy;
    public String trangThaiDangKyHocPhan;
    public HttpServletRequest request;
    public Boolean bao_loi = false;

    public tblDangKyHocPhan() {
    }

    public tblDangKyHocPhan(HttpServletRequest req) {
        this.request = req;
    }

    public void them() {
        sql.themDangKyHocPhan(maDangKyHocPhan, mssv, maLopHocPhan, ngayDangKy, trangThaiDangKyHocPhan);
        sql.themDiemLopHocPhan("D" + mssv + "L" + maLopHocPhan, maDangKyHocPhan, null, null, null, "Chưa có điểm");
    }

    public void them(tblDangKyHocPhan d) {
        sql.themDangKyHocPhan(d.maDangKyHocPhan, d.mssv, d.maLopHocPhan, d.ngayDangKy, d.trangThaiDangKyHocPhan);
        sql.themDiemLopHocPhan("D" + mssv + "L" + maLopHocPhan, maDangKyHocPhan, null, null, null, "Chưa có điểm");
    }

    public void sua() {
        sql.suaDangKyHocPhan(maDangKyHocPhan, mssv, maLopHocPhan, ngayDangKy, trangThaiDangKyHocPhan);
    }

    public void sua(tblDangKyHocPhan d) {
        sql.suaDangKyHocPhan(d.maDangKyHocPhan, d.mssv, d.maLopHocPhan, d.ngayDangKy, d.trangThaiDangKyHocPhan);
    }

    public void xoa() {
        sql.xoaBanGhi("tblDangKyHocPhan", "MaDangKyHocPhan = '" + maDangKyHocPhan + "'");
        sql.xoaBanGhi("tblDiemLopHocPhan", "MaDangKyHocPhan = '" + maDangKyHocPhan + "'");
    }

    public void truyVanTheoMa(String ma) {
        this.maDangKyHocPhan = ma;
        this.mssv = sql.timKiem("MSSV", "tblDangKyHocPhan", "MaDangKyHocPhan='" + ma + "'");
        this.maLopHocPhan = sql.timKiem("MaLopHocPhan", "tblDangKyHocPhan", "MaDangKyHocPhan='" + ma + "'");
        this.ngayDangKy = sql.timKiem("NgayDangKy", "tblDangKyHocPhan", "MaDangKyHocPhan='" + ma + "'");
        this.trangThaiDangKyHocPhan = sql.timKiem("TrangThaiDangKyHocPhan", "tblDangKyHocPhan",
                "MaDangKyHocPhan='" + ma + "'");
    }

    // *set
    public void setMaDangKyHocPhan(String ma) {
        this.maDangKyHocPhan = ma;
    }

    public void setMSSV(String mssv) {
        if (mssv == null || mssv.trim().isEmpty()) {
            request.setAttribute("loiMSSV", "MSSV không được để trống");
            bao_loi = true;
        } else {
            this.mssv = mssv;
        }
    }

    public void setMaLopHocPhan(String maLopHocPhan) {
        if (maLopHocPhan == null || maLopHocPhan.trim().isEmpty()) {
            request.setAttribute("loiMaLopHocPhan", "Mã lớp học phần không được để trống");
            bao_loi = true;
        } else {
            this.maLopHocPhan = maLopHocPhan;
        }
    }

    public void setNgayDangKy(String ngayDangKy) {
        this.ngayDangKy = ngayDangKy;
    }

    public void setTrangThaiDangKyHocPhan(String trangThai) {
        if (trangThai == null || trangThai.trim().isEmpty()) {
            request.setAttribute("loiTrangThaiDangKyHocPhan", "Trạng thái đăng ký học phần không được để trống");
            bao_loi = true;
        } else {
            this.trangThaiDangKyHocPhan = trangThai;
        }
    }

    // *get
    public Integer getSoLuongDangKy() {
        List<Map<String, Object>> danhSach = sql.hienThi("tblDangKyHocPhan");
        Integer soLuongDangKy = danhSach.size();
        return soLuongDangKy;
    }

    public String getHoTenSV() {
        String hoTenSV = sql.timKiem("HoTen", "tblSinhVien",
                "MSSV = (SELECT MSSV FROM tblDangKyHocPhan WHERE MaDangKyHocPhan = '" + maDangKyHocPhan + "')");
        return hoTenSV;
    }

    public String getTenLopHocPhan() {
        String tenLopHocPhan = sql.timKiem("TenLopHocPhan", "tblLopHocPhan",
                "MaLopHocPhan = (SELECT MaLopHocPhan FROM tblDangKyHocPhan WHERE MaDangKyHocPhan = '" + maDangKyHocPhan
                        + "')");
        return tenLopHocPhan;
    }

    // *Lay tong the
    public String getTblSinhVien(String tenTruongCanLay) {
        String kq = sql.timKiem(tenTruongCanLay, "tblSinhVien",
                "MSSV = (SELECT MSSV FROM tblDangKyHocPhan WHERE MaDangKyHocPhan = '" + maDangKyHocPhan + "')");
        return kq;
    }

    public String getTblLopHocPhan(String tenTruongCanLay) {
        return sql.timKiem(tenTruongCanLay, "tblLopHocPhan",
                "MaLopHocPhan = (SELECT MaLopHocPhan FROM tblDangKyHocPhan WHERE MaDangKyHocPhan = '" + maDangKyHocPhan
                        + "')");
    }

}

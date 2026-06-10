package com.example.model;

import com.example.data.ChucNangSQL;

import jakarta.servlet.http.HttpServletRequest;

public class tblKhoa {
    ChucNangSQL sql = new ChucNangSQL();

    public String maKhoa;
    public String tenKhoa;
    public String maVien;
    public String tenTruongKhoa;
    public String soDienThoaiKhoa;
    public String emailKhoa;
    public String ngayThanhLapKhoa;
    public String moTaKhoa;
    public String trangThaiKhoa;

    public HttpServletRequest request;
    public Boolean bao_loi = false;

    public tblKhoa() {
    }

    public tblKhoa(String maKhoa, String tenKhoa, String maVien, String tenTruongKhoa, String soDienThoaiKhoa,
            String emailKhoa, String ngayThanhLapKhoa, String moTaKhoa) {
        this.maKhoa = maKhoa;
        this.tenKhoa = tenKhoa;
        this.maVien = maVien;
        this.tenTruongKhoa = tenTruongKhoa;
        this.soDienThoaiKhoa = soDienThoaiKhoa;
        this.emailKhoa = emailKhoa;
        this.ngayThanhLapKhoa = ngayThanhLapKhoa;
        this.moTaKhoa = moTaKhoa;
    }

    public tblKhoa(HttpServletRequest req) {
        this.request = req;
    }

    public void them() {
        sql.themKhoa(maKhoa, tenKhoa, maVien, tenTruongKhoa, soDienThoaiKhoa, emailKhoa, ngayThanhLapKhoa, moTaKhoa,
                trangThaiKhoa);
    }

    public void them(tblKhoa k) {
        sql.themKhoa(k.maKhoa, k.tenKhoa, k.maVien, k.tenTruongKhoa, k.soDienThoaiKhoa, k.emailKhoa, k.ngayThanhLapKhoa,
                k.moTaKhoa, k.trangThaiKhoa);
    }

    public void sua() {
        sql.suaKhoa(maKhoa, tenKhoa, maVien, tenTruongKhoa, soDienThoaiKhoa, emailKhoa, ngayThanhLapKhoa, moTaKhoa,
                trangThaiKhoa);
    }

    public void sua(tblKhoa k) {
        sql.suaKhoa(k.maKhoa, k.tenKhoa, k.maVien, k.tenTruongKhoa, k.soDienThoaiKhoa, k.emailKhoa, k.ngayThanhLapKhoa,
                k.moTaKhoa, k.trangThaiKhoa);
    }

    public void xoa() {
        sql.xoaBanGhi("tblKhoa", "MaKhoa = '" + this.maKhoa + "'");
    }

    public void truyVanTheoMa(String ma) {
        this.maKhoa = ma;
        this.tenKhoa = sql.timKiem("TenKhoa", "tblKhoa", "MaKhoa = '" + ma + "'");
        this.maVien = sql.timKiem("MaVien", "tblKhoa", "MaKhoa = '" + ma + "'");
        this.tenTruongKhoa = sql.timKiem("TenTruongKhoa", "tblKhoa", "MaKhoa = '" + ma + "'");
        this.soDienThoaiKhoa = sql.timKiem("SoDienThoaiKhoa", "tblKhoa", "MaKhoa = '" + ma + "'");
        this.emailKhoa = sql.timKiem("EmailKhoa", "tblKhoa", "MaKhoa = '" + ma + "'");
        this.ngayThanhLapKhoa = sql.timKiem("NgayThanhLapKhoa", "tblKhoa", "MaKhoa = '" + ma + "'");
        this.moTaKhoa = sql.timKiem("MoTaKhoa", "tblKhoa", "MaKhoa = '" + ma + "'");
        this.trangThaiKhoa = sql.timKiem("TrangThaiKhoa", "tblKhoa", "MaKhoa = '" + ma + "'");
    }

    // *set
    public void setMaKhoa(String maKhoa) {
        if (sql.kiemTraKhoaChinh("tblKhoa", "MaKhoa", maKhoa)) {
            request.setAttribute("loiMaKhoa", "Mã khoa đã tồn tại");
            bao_loi = true;
        } else if (maKhoa == null || maKhoa.trim().isEmpty()) {
            request.setAttribute("loiMaKhoa", "Mã khoa không được để trống");
            bao_loi = true;
        } else {
            this.maKhoa = maKhoa;
        }
    }

    public void setTenKhoa(String tenKhoa) {
        if (tenKhoa == null || tenKhoa.trim().isEmpty()) {
            request.setAttribute("loiTenKhoa", "Tên khoa không được để trống");
            bao_loi = true;
        } else {
            this.tenKhoa = tenKhoa;
        }
    }

    public void setMaVien(String maVien) {
        if (maVien == null || maVien.trim().isEmpty()) {
            request.setAttribute("loiMaVien", "Mã viện không được để trống");
            bao_loi = true;
        } else {
            this.maVien = maVien;
        }
    }

    public void setTenTruongKhoa(String tenTruongKhoa) {
        if (tenTruongKhoa == null || tenTruongKhoa.trim().isEmpty()) {
            request.setAttribute("loiTenTruongKhoa", "Tên trưởng khoa không được để trống");
            bao_loi = true;
        } else {
            this.tenTruongKhoa = tenTruongKhoa;
        }
    }

    public void setSoDienThoaiKhoa(String soDienThoaiKhoa) {
        if (soDienThoaiKhoa == null || soDienThoaiKhoa.trim().isEmpty()) {
            request.setAttribute("loiSoDienThoaiKhoa", "Số điện thoại khoa không được để trống");
            bao_loi = true;
        } else {
            this.soDienThoaiKhoa = soDienThoaiKhoa;
        }
    }

    public void setEmailKhoa(String emailKhoa) {
        if (emailKhoa == null || emailKhoa.trim().isEmpty()) {
            request.setAttribute("loiEmailKhoa", "Email khoa không được để trống");
            bao_loi = true;
        } else {
            this.emailKhoa = emailKhoa;
        }
    }

    public void setNgayThanhLapKhoa(String ngay) {
        if (ngay == null || ngay.trim().isEmpty()) {
            request.setAttribute("loiNgayThanhLapKhoa", "Ngày thành lập không được để trống");
            bao_loi = true;
        } else {
            this.ngayThanhLapKhoa = ngay;
        }
    }

    public void setMoTaKhoa(String moTaKhoa) {
        if (moTaKhoa == null || moTaKhoa.trim().isEmpty()) {
            request.setAttribute("loiMoTaKhoa", "Mô tả khoa không được để trống");
            bao_loi = true;
        } else {
            this.moTaKhoa = moTaKhoa;
        }
    }

    public void setTrangThaiKhoa(String trangThaiKhoa) {
        if (trangThaiKhoa == null || trangThaiKhoa.trim().isEmpty()) {
            request.setAttribute("loiTrangThaiKhoa", "Trạng thái khoa không được để trống");
            bao_loi = true;
        } else {
            this.trangThaiKhoa = trangThaiKhoa;
        }
    }

    // *get
    public String getTenVien() {
        String tenVien = sql.timKiem("TenVien", "tblVien", "MaVien = '" + this.maVien + "'");
        if (tenVien == null) {
            tenVien = "";
        }
        return tenVien;
    }

    // * Lay tong the
    public String getTblVien(String tenTruongCanLay) {
        String kq = sql.timKiem(tenTruongCanLay, "tblVien",
                "MaVien = (SELECT MaVien FROM tblKhoa WHERE MaKhoa = '" + maKhoa + "')");
        return kq;
    }
}

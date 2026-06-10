package com.example.model;

import com.example.data.ChucNangSQL;

import jakarta.servlet.http.HttpServletRequest;

public class tblVien {
    ChucNangSQL sql = new ChucNangSQL();

    public String maVien;
    public String tenVien;
    public String tenTruongVien;
    public String soDienThoaiVien;
    public String emailVien;
    public String ngayThanhLapVien;
    public HttpServletRequest request;
    public Boolean bao_loi = false;

    public tblVien() {
    }

    public tblVien(HttpServletRequest _request) {
        this.request = _request;
    }

    public tblVien(String maVien, String tenVien, String tenTruongVien, String soDienThoaiVien,
            String emailVien, String ngayThanhLapVien) {
        this.maVien = maVien;
        this.tenVien = tenVien;
        this.tenTruongVien = tenTruongVien;
        this.soDienThoaiVien = soDienThoaiVien;
        this.emailVien = emailVien;
        this.ngayThanhLapVien = ngayThanhLapVien;
    }

    public void them(tblVien vien) {
        sql.themVien(maVien, tenVien, tenTruongVien, soDienThoaiVien, emailVien, ngayThanhLapVien);
    }

    public void them() {
        sql.themVien(this.maVien, this.tenVien, this.tenTruongVien, this.soDienThoaiVien, this.emailVien,
                this.ngayThanhLapVien);
    }

    public void sua(tblVien vien) {
        sql.suaVien(vien.maVien, vien.tenVien, vien.tenTruongVien, vien.soDienThoaiVien, vien.emailVien,
                vien.ngayThanhLapVien);
    }

    public void sua() {
        sql.suaVien(this.maVien, this.tenVien, this.tenTruongVien, this.soDienThoaiVien, this.emailVien,
                this.ngayThanhLapVien);
    }

    public void xoa(String maVienString) {
        sql.xoaBanGhi("tblVien", "MaVien = '" + maVienString + "'");
    }

    public void xoa() {
        sql.xoaBanGhi("tblVien", "MaVien = '" + this.maVien + "'");
    }

    public String truyVanTheoMa_1C(String tenCotCanLay) {
        return sql.timKiem(tenCotCanLay, "tblVien", "MaVien ='" + this.maVien + "'");
    }

    public String truyVanTheoMa_1C(String maVienString, String tenCotCanLay) {
        return sql.timKiem(tenCotCanLay, "tblVien", "MaVien ='" + maVienString + "'");
    }

    public void truyVanTheoMa(String maVienString) {
        this.maVien = maVienString;
        this.tenVien = truyVanTheoMa_1C(this.maVien, "TenVien");
        this.tenTruongVien = truyVanTheoMa_1C(this.maVien, "TenTruongVien");
        this.soDienThoaiVien = truyVanTheoMa_1C(this.maVien, "SoDienThoaiVien");
        this.emailVien = truyVanTheoMa_1C(this.maVien, "EmailVien");
        this.ngayThanhLapVien = truyVanTheoMa_1C(this.maVien, "NgayThanhLapVien");
    }

    public void setMaVien(String maVien) {
        if (sql.kiemTraKhoaChinh("tblVien", "MaVien", maVien)) {
            request.setAttribute("loiMaVien", "Mã viện đã tồn tại");
            bao_loi = true;
        } else if (maVien == null || maVien.trim().isEmpty()) {
            request.setAttribute("loiMaVien", "Mã viện cac không được để trống");
            bao_loi = true;
        } else {
            this.maVien = maVien;
        }
    }

    public void setTenVien(String tenVien) {
        if (tenVien == null || tenVien.trim().isEmpty()) {
            request.setAttribute("loiTenVien", "Tên viện không được để trống");
            bao_loi = true;
        } else {
            this.tenVien = tenVien;
        }
    }

    public void setTenTruongVien(String tenTruongVien) {
        if (tenTruongVien == null || tenTruongVien.trim().isEmpty()) {
            request.setAttribute("loiTenTruongVien", "Tên trưởng viện không được để trống");
            bao_loi = true;
        } else {
            this.tenTruongVien = tenTruongVien;
        }
    }

    public void setSoDienThoaiVien(String soDienThoaiVien) {
        if (soDienThoaiVien == null || soDienThoaiVien.trim().isEmpty()) {
            request.setAttribute("loiSoDienThoaiVien", "Số điện thoại viện không được để trống");
            bao_loi = true;
        } else {
            this.soDienThoaiVien = soDienThoaiVien;
        }
    }

    public void setEmailVien(String emailVien) {
        if (emailVien == null || emailVien.trim().isEmpty()) {
            request.setAttribute("loiEmailVien", "Email viện không được để trống");
            bao_loi = true;
        } else {
            this.emailVien = emailVien;
        }
    }

    public void setNgayThanhLapVien(String ngayThanhLapVien) {
        if (ngayThanhLapVien == null || ngayThanhLapVien.trim().isEmpty()) {
            request.setAttribute("loiNgayThanhLapVien", "Ngày thành lập viện không được để trống");
            bao_loi = true;
        } else {
            this.ngayThanhLapVien = ngayThanhLapVien;
        }
    }

}
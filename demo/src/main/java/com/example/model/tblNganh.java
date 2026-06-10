package com.example.model;

import com.example.data.ChucNangSQL;

import jakarta.servlet.http.HttpServletRequest;

public class tblNganh {
    ChucNangSQL sql = new ChucNangSQL();

    public String maNganh;
    public String tenNganh;
    public String maKhoa;
    public String moTaNganh;
    public String trangThaiNganh;
    public HttpServletRequest request;
    public Boolean bao_loi = false;

    public tblNganh() {
    }

    public tblNganh(String maNganh, String tenNganh, String maKhoa, String moTaNganh, String trangThaiNganh) {
        this.maNganh = maNganh;
        this.tenNganh = tenNganh;
        this.maKhoa = maKhoa;
        this.moTaNganh = moTaNganh;
        this.trangThaiNganh = trangThaiNganh;
    }

    public tblNganh(HttpServletRequest req) {
        this.request = req;
    }

    public void them() {
        sql.themNganh(maNganh, tenNganh, maKhoa, moTaNganh, trangThaiNganh);
    }

    public void them(tblNganh n) {
        sql.themNganh(n.maNganh, n.tenNganh, n.maKhoa, n.moTaNganh, n.trangThaiNganh);
    }

    public void sua() {
        sql.suaNganh(maNganh, tenNganh, maKhoa, moTaNganh, trangThaiNganh);
    }

    public void sua(tblNganh n) {
        sql.suaNganh(n.maNganh, n.tenNganh, n.maKhoa, n.moTaNganh, n.trangThaiNganh);
    }

    public void xoa() {
        sql.xoaBanGhi("tblNganh", "MaNganh = '" + this.maNganh + "'");
    }

    public void truyVanTheoMa(String ma) {
        this.maNganh = ma;
        this.tenNganh = sql.timKiem("TenNganh", "tblNganh", "MaNganh = '" + ma + "'");
        this.maKhoa = sql.timKiem("MaKhoa", "tblNganh", "MaNganh = '" + ma + "'");
        this.moTaNganh = sql.timKiem("MoTaNganh", "tblNganh", "MaNganh = '" + ma + "'");
        this.trangThaiNganh = sql.timKiem("TrangThaiNganh", "tblNganh", "MaNganh = '" + ma + "'");
    }

    // *set
    public void setMaNganh(String maNganh) {
        if (sql.kiemTraKhoaChinh("tblNganh", "MaNganh", maNganh)) {
            request.setAttribute("loiMaNganh", "Mã ngành đã tồn tại");
            bao_loi = true;
        } else if (maNganh == null || maNganh.trim().isEmpty()) {
            request.setAttribute("loiMaNganh", "Mã ngành không được để trống");
            bao_loi = true;
        } else {
            this.maNganh = maNganh;
        }
    }

    public void setTenNganh(String tenNganh) {
        if (tenNganh == null || tenNganh.trim().isEmpty()) {
            request.setAttribute("loiTenNganh", "Tên ngành không được để trống");
            bao_loi = true;
        } else {
            this.tenNganh = tenNganh;
        }
    }

    public void setMaKhoa(String maKhoa) {
        if (maKhoa == null || maKhoa.trim().isEmpty()) {
            request.setAttribute("loiMaKhoa", "Mã khoa không được để trống");
            bao_loi = true;
        } else {
            this.maKhoa = maKhoa;
        }
    }

    public void setMoTaNganh(String moTaNganh) {
        this.moTaNganh = moTaNganh;
    }

    public void setTrangThaiNganh(String trangThaiNganh) {
        this.trangThaiNganh = trangThaiNganh;
    }

    // *get
    public String getTenKhoa() {
        String tenKhoa = sql.timKiem("TenKhoa", "tblKhoa", "MaKhoa = '" + this.maKhoa + "'");
        return tenKhoa;
    }

    // * Lay tong the
    public String getTblKhoa(String tenTruongCanLay) {
        String kq = sql.timKiem(tenTruongCanLay, "tblKhoa",
                "MaKhoa = (SELECT MaKhoa FROM tblNganh WHERE MaNganh = '" + maNganh + "')");
        return kq;
    }

}

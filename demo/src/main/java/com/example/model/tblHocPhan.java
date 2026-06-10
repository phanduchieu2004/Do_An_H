package com.example.model;

import com.example.data.ChucNangSQL;

import jakarta.servlet.http.HttpServletRequest;

public class tblHocPhan {
    ChucNangSQL sql = new ChucNangSQL();

    public String maHocPhan;
    public String tenHocPhan;
    public Integer soTinChi;
    public String maNganh;
    public String moTaHocPhan;
    public Integer hocKy;
    public HttpServletRequest request;
    public Boolean bao_loi = false;

    public tblHocPhan() {
    }

    public tblHocPhan(String maHocPhan, String tenHocPhan, Integer soTinChi, String maNganh, String moTaHocPhan,
            Integer hocKy) {
        this.maHocPhan = maHocPhan;
        this.tenHocPhan = tenHocPhan;
        this.hocKy = hocKy;
        this.soTinChi = soTinChi;
        this.maNganh = maNganh;
        this.moTaHocPhan = moTaHocPhan;
    }

    public tblHocPhan(HttpServletRequest req) {
        this.request = req;
    }

    public void them() {
        sql.themHocPhan(maHocPhan, tenHocPhan, hocKy, soTinChi, maNganh, moTaHocPhan);
    }

    public void them(tblHocPhan h) {
        sql.themHocPhan(h.maHocPhan, h.tenHocPhan, h.hocKy, h.soTinChi, h.maNganh, h.moTaHocPhan);
    }

    public void sua() {
        sql.suaHocPhan(maHocPhan, tenHocPhan, hocKy, soTinChi, maNganh, moTaHocPhan);
    }

    public void sua(tblHocPhan h) {
        sql.suaHocPhan(h.maHocPhan, h.tenHocPhan, h.hocKy, h.soTinChi, h.maNganh, h.moTaHocPhan);
    }

    public void xoa() {
        sql.xoaBanGhi("tblHocPhan", "MaHocPhan = '" + this.maHocPhan + "'");
    }

    public void truyVanTheoMa(String ma) {
        this.maHocPhan = ma;
        this.tenHocPhan = sql.timKiem("TenHocPhan", "tblHocPhan", "MaHocPhan = '" + ma + "'");
        this.soTinChi = Integer.valueOf(sql.timKiem("SoTinChi", "tblHocPhan", "MaHocPhan = '" + ma + "'"));
        this.maNganh = sql.timKiem("MaNganh", "tblHocPhan", "MaHocPhan = '" + ma + "'");
        this.moTaHocPhan = sql.timKiem("MoTaHocPhan", "tblHocPhan", "MaHocPhan = '" + ma + "'");
    }

    // *set
    public void setMaHocPhan(String ma) {
        if (sql.kiemTraKhoaChinh("tblHocPhan", "MaHocPhan", ma)) {
            request.setAttribute("loiMaHocPhan", "Mã học phần đã tồn tại");
            bao_loi = true;
        } else if (ma == null || ma.trim().isEmpty()) {
            request.setAttribute("loiMaHocPhan", "Mã học phần không được để trống");
            bao_loi = true;
        } else {
            this.maHocPhan = ma;
        }
    }

    public void setTenHocPhan(String ten) {
        if (ten == null || ten.trim().isEmpty()) {
            request.setAttribute("loiTenHocPhan", "Tên học phần không được để trống");
            bao_loi = true;
        } else {
            this.tenHocPhan = ten;
        }
    }

    public void setSoTinChi(Integer soTinChi) {
        if (soTinChi == null || soTinChi <= 0) {
            request.setAttribute("loiSoTinChi", "Số tín chỉ phải là số dương");
            bao_loi = true;
        } else {
            this.soTinChi = soTinChi;
        }
    }

    public void setHocKy(Integer hocKy) {
        if (hocKy == null || hocKy <= 0) {
            request.setAttribute("loiHocKy", "Học kỳ phải là số dương");
            bao_loi = true;
        } else {
            this.hocKy = hocKy;
        }
    }

    public void setMaNganh(String maNganh) {
        if (maNganh == null || maNganh.trim().isEmpty()) {
            request.setAttribute("loiMaNganh", "Mã ngành không được để trống");
            bao_loi = true;
        } else {
            this.maNganh = maNganh;
        }
    }

    // *get
    public String getTenNganh() {
        String tenNganh = sql.timKiem("TenNganh", "tblNganh", "MaNganh = '" + this.maNganh + "'");
        if (tenNganh == null) {
            tenNganh = "";
        }
        return tenNganh;
    }

    // * Lay tong the */
    public String getTblNganh(String tenTruongCanLay) {
        String kq = sql.timKiem(tenTruongCanLay, "tblNganh",
                "MaNganh = (SELECT MaNganh FROM tblHocPhan WHERE MaHocPhan = '" + maHocPhan + "')");
        return kq;
    }

}

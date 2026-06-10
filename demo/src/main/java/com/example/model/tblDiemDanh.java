package com.example.model;

import com.example.data.ChucNangSQL;

import jakarta.servlet.http.HttpServletRequest;

public class tblDiemDanh {
    ChucNangSQL sql = new ChucNangSQL();
    public String maDiemDanh;
    public String maDangKyHocPhan;
    public String chuoiDiemDanh;
    public String ghiChu;
    public HttpServletRequest request;
    public Boolean bao_loi = false;

    public tblDiemDanh() {
    }

    public tblDiemDanh(HttpServletRequest req) {
        this.request = req;
    }

    public void them() {
        sql.themDiemDanh(maDiemDanh, maDangKyHocPhan, chuoiDiemDanh, ghiChu);
    }

    public void them(tblDiemDanh d) {
        sql.themDiemDanh(d.maDiemDanh, d.maDangKyHocPhan, d.chuoiDiemDanh, d.ghiChu);
    }

    public void sua() {
        sql.suaDiemDanh(maDiemDanh, maDangKyHocPhan, chuoiDiemDanh, ghiChu);
    }

    public void sua(tblDiemDanh d) {
        sql.suaDiemDanh(d.maDiemDanh, d.maDangKyHocPhan, d.chuoiDiemDanh, d.ghiChu);
    }

    public void xoa() {
        sql.xoaBanGhi("tblDiemDanh", "MaDiemDanh = '" + maDiemDanh + "'");
    }

    public void truyVanTheoMa(String ma) {
        this.maDiemDanh = ma;
        this.maDangKyHocPhan = sql.timKiem("MaDangKyHocPhan", "tblDiemDanh", "MaDiemDanh='" + ma + "'");
        this.chuoiDiemDanh = sql.timKiem("ChuoiDiemDanh", "tblDiemDanh", "MaDiemDanh='" + ma + "'");
        this.ghiChu = sql.timKiem("GhiChu", "tblDiemDanh", "MaDiemDanh='" + ma + "'");
    }

    // *set */
    public void setMaDiemDanh(String ma) {
        if (ma == null || ma.trim().isEmpty()) {
            request.setAttribute("loiMaDiemDanh", "Mã điểm danh không được để trống");
            bao_loi = true;
        } else {
            this.maDiemDanh = ma;
        }
    }

    public void setMaDangKyHocPhan(String ma) {
        if (ma == null || ma.trim().isEmpty()) {
            request.setAttribute("loiMaDangKyHocPhan", "Mã đăng ký học phần không được để trống");
            bao_loi = true;
        } else {
            this.maDangKyHocPhan = ma;
        }
    }

    // !can kiem tra lai
    public void setChuoiDiemDanh(String chuoi) {
        if (chuoi == null || chuoi.trim().isEmpty()) {
            request.setAttribute("loiChuoiDiemDanh", "Chuỗi điểm danh không được để trống");
            bao_loi = true;
        } else {
            this.chuoiDiemDanh = chuoi;
        }
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    // *get */

    // * Lay tong the */
    public String getTblDangKyHocPhan(String tenTruongCanLay) {
        String kq = sql.timKiem(tenTruongCanLay, "tblDangKyHocPhan",
                "MaDangKyHocPhan = (SELECT MaDangKyHocPhan FROM tblDiemDanh WHERE MaDiemDanh = '" + maDiemDanh
                        + "')");
        return kq;
    }

}

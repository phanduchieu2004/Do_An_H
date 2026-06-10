package com.example.model;

import com.example.data.ChucNangSQL;

import jakarta.servlet.http.HttpServletRequest;

public class tblLop {
    ChucNangSQL sql = new ChucNangSQL();

    public String maLop;
    public Integer khoaHoc;
    public String tenLop;
    public String maNganh;
    public HttpServletRequest request;
    public Boolean bao_loi = false;

    public tblLop() {
    }

    public tblLop(String maLop, Integer khoaHoc, String tenLop, String maNganh) {
        this.maLop = maLop;
        this.khoaHoc = khoaHoc;
        this.tenLop = tenLop;
        this.maNganh = maNganh;
    }

    public tblLop(HttpServletRequest req) {
        this.request = req;
    }

    public void them() {
        sql.themLop(maLop, khoaHoc, tenLop, maNganh);
    }

    public void them(tblLop l) {
        sql.themLop(l.maLop, l.khoaHoc, l.tenLop, l.maNganh);
    }

    public void sua() {
        sql.suaLop(maLop, khoaHoc, tenLop, maNganh);
    }

    public void sua(tblLop l) {
        sql.suaLop(l.maLop, l.khoaHoc, l.tenLop, l.maNganh);
    }

    public void xoa() {
        sql.xoaBanGhi("tblLop", "MaLop = '" + this.maLop + "'");
    }

    public void truyVanTheoMa(String ma) {
        this.maLop = ma;
        this.khoaHoc = Integer.valueOf(sql.timKiem("KhoaHoc", "tblLop", "MaLop = '" + ma + "'"));

        this.tenLop = sql.timKiem("TenLop", "tblLop", "MaLop = '" + ma + "'");
        this.maNganh = sql.timKiem("MaNganh", "tblLop", "MaLop = '" + ma + "'");
    }

    // *set
    public void setMaLop(String maLop) {
        if (sql.kiemTraKhoaChinh("tblLop", "MaLop", maLop)) {
            request.setAttribute("loiMaLop", "Mã lớp đã tồn tại");
            bao_loi = true;
        } else if (maLop == null || maLop.trim().isEmpty()) {
            request.setAttribute("loiMaLop", "Mã lớp không được để trống");
            bao_loi = true;
        } else {
            this.maLop = maLop;
        }
    }

    public void setTenLop(String tenLop) {
        if (tenLop == null || tenLop.trim().isEmpty()) {
            request.setAttribute("loiTenLop", "Tên lớp không được để trống");
            bao_loi = true;
        } else {
            this.tenLop = tenLop;
        }
    }

    public void setKhoaHoc(Integer khoaHoc) {
        if (khoaHoc == null || khoaHoc <= 0) {
            request.setAttribute("loiKhoaHoc", "Khóa học không được để trống hoặc nhỏ hơn bằng 0");
            bao_loi = true;
        } else {
            this.khoaHoc = khoaHoc;
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
        return tenNganh;
    }

    // * Lay tong the
    public String getTblNganh(String tenTruongCanLay) {
        String kq = sql.timKiem(tenTruongCanLay, "tblNganh",
                "MaNganh = (SELECT MaNganh FROM tblLop WHERE MaLop = '" + maLop + "')");
        return kq;
    }
}

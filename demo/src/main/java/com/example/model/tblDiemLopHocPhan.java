package com.example.model;

import com.example.data.ChucNangSQL;

import jakarta.servlet.http.HttpServletRequest;

public class tblDiemLopHocPhan {
    ChucNangSQL sql = new ChucNangSQL();

    public String maDiemLopHocPhan;
    public String maDangKyHocPhan;
    public Double diemQuaTrinh;
    public Double diemThi;
    public Double diemTongKet;
    public String xepLoai;
    public HttpServletRequest request;
    public Boolean bao_loi = false;

    public tblDiemLopHocPhan() {
    }

    public tblDiemLopHocPhan(HttpServletRequest req) {
        this.request = req;
    }

    public void them() {
        sql.themDiemLopHocPhan(maDiemLopHocPhan, maDangKyHocPhan, diemQuaTrinh, diemThi, diemTongKet, xepLoai);
    }

    public void them(tblDiemLopHocPhan d) {
        sql.themDiemLopHocPhan(d.maDiemLopHocPhan, d.maDangKyHocPhan, d.diemQuaTrinh, d.diemThi, d.diemTongKet,
                d.xepLoai);
    }

    public void sua() {
        sql.suaDiemLopHocPhan(maDiemLopHocPhan, maDangKyHocPhan, diemQuaTrinh, diemThi, diemTongKet, xepLoai);
    }

    public void sua(tblDiemLopHocPhan d) {
        sql.suaDiemLopHocPhan(d.maDiemLopHocPhan, d.maDangKyHocPhan, d.diemQuaTrinh, d.diemThi, d.diemTongKet,
                d.xepLoai);
    }

    public void xoa() {
        sql.xoaBanGhi("tblDiemLopHocPhan", "MaDiemLopHocPhan = '" + maDiemLopHocPhan + "'");
    }

    public void truyVanTheoMa(String ma) {
        if (ma == null || ma.trim().isEmpty()) {
            bao_loi = true;
            return;
        }

        this.maDiemLopHocPhan = ma;
        this.maDangKyHocPhan = sql.timKiem("MaDangKyHocPhan", "tblDiemLopHocPhan", "MaDiemLopHocPhan='" + ma + "'");

        try {
            String diemQuaTrinhStr = sql.timKiem("DiemQuaTrinh", "tblDiemLopHocPhan", "MaDiemLopHocPhan='" + ma + "'");
            this.diemQuaTrinh = (diemQuaTrinhStr != null && !diemQuaTrinhStr.isEmpty())
                    ? Double.valueOf(diemQuaTrinhStr)
                    : 0.0;

            String diemThiStr = sql.timKiem("DiemThi", "tblDiemLopHocPhan", "MaDiemLopHocPhan='" + ma + "'");
            this.diemThi = (diemThiStr != null && !diemThiStr.isEmpty()) ? Double.valueOf(diemThiStr) : 0.0;

            String diemTongKetStr = sql.timKiem("DiemTongKet", "tblDiemLopHocPhan", "MaDiemLopHocPhan='" + ma + "'");
            this.diemTongKet = (diemTongKetStr != null && !diemTongKetStr.isEmpty()) ? Double.valueOf(diemTongKetStr)
                    : 0.0;

            this.xepLoai = sql.timKiem("XepLoai", "tblDiemLopHocPhan", "MaDiemLopHocPhan='" + ma + "'");
        } catch (NumberFormatException e) {
            System.err.println("Lỗi chuyển đổi điểm thành số: " + e.getMessage());
            bao_loi = true;
        }
    }

    public void setMaDiemLopHocPhan(String ma) {
        if (ma == null || ma.trim().isEmpty()) {
            request.setAttribute("loiMaDiemLopHocPhan", "Mã điểm lớp học phần không được để trống");
            bao_loi = true;
        } else {
            this.maDiemLopHocPhan = ma;
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

    public void setDiemQuaTrinh(Double diem) {
        if (diem == null || diem < 0 || diem > 10) {
            request.getSession().setAttribute("loiDiemQuaTrinh", "Điểm quá trình phải từ 0 đến 10");
            bao_loi = true;
        } else {
            this.diemQuaTrinh = diem;
        }
    }

    public void setDiemThi(Double diem) {
        if (diem == null || diem < 0 || diem > 10) {
            request.getSession().setAttribute("loiDiemThi", "Điểm thi phải từ 0 đến 10");
            bao_loi = true;
        } else {
            this.diemThi = diem;
        }
    }

    public void setDiemTongKet() {
        if (this.diemQuaTrinh == null || this.diemThi == null) {
            return;
        }
        this.diemTongKet = this.diemQuaTrinh * 0.5 + this.diemThi * 0.5;
    }

    public void setXepLoai() {
        if (this.diemTongKet == null) {
            return;
        }
        if (this.diemTongKet >= 8.5) {
            this.xepLoai = "A";
        } else if (this.diemTongKet >= 7.5) {
            this.xepLoai = "B+";
        } else if (this.diemTongKet >= 6.5) {
            this.xepLoai = "B";
        } else if (this.diemTongKet >= 5.5) {
            this.xepLoai = "C+";
        } else if (this.diemTongKet >= 5.0) {
            this.xepLoai = "C";
        } else if (this.diemTongKet >= 4.0) {
            this.xepLoai = "D+";
        } else {
            this.xepLoai = "D";
        }
        System.out.println("Xếp loại: " + this.xepLoai);
    }

    // *get
    // public String getMaDangKyHocPhan() {
    // return maDangKyHocPhan;
    // }

    // * Lay tong the
    public String getTblDangKyHocPhan(String tenTruongCanLay) {
        String kq = sql.timKiem(tenTruongCanLay, "tblDangKyHocPhan",
                "MaDangKyHocPhan = (SELECT MaDangKyHocPhan FROM tblDiemLopHocPhan WHERE MaDiemLopHocPhan = '"
                        + maDiemLopHocPhan + "')");
        return kq;
    }

}

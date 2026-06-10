package com.example.model;

import java.io.IOException;

import com.example.data.ChucNangSQL;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class tblSinhVien {
    ChucNangSQL sql = new ChucNangSQL();

    public String mssv;
    public String hoTenSV;
    public String ngaySinhSV;
    public String gioiTinhSV;
    public String queQuanSV;
    public String emailSV;
    public String maLop;
    public String soDienThoaiSV;
    public String anhSV;
    public String trangThaiSV;
    public HttpServletRequest request;
    public Boolean bao_loi = false;

    public tblSinhVien() {
    }

    public tblSinhVien(String mssv, String hoTenSV, String ngaySinhSV, String gioiTinhSV, String queQuanSV,
            String emailSV, String maLop, String soDienThoaiSV, String anhSV, String trangThaiSV) {
        this.mssv = mssv;
        this.hoTenSV = hoTenSV;
        this.ngaySinhSV = ngaySinhSV;
        this.gioiTinhSV = gioiTinhSV;
        this.queQuanSV = queQuanSV;
        this.emailSV = emailSV;
        this.maLop = maLop;
        this.soDienThoaiSV = soDienThoaiSV;
        this.anhSV = anhSV;
        this.trangThaiSV = trangThaiSV;
    }

    public tblSinhVien(HttpServletRequest req) {
        this.request = req;
    }

    public void them() {
        sql.themSinhVien(mssv, hoTenSV, ngaySinhSV, gioiTinhSV, queQuanSV, emailSV, maLop, soDienThoaiSV, anhSV,
                trangThaiSV);
    }

    public void them(tblSinhVien s) {
        sql.themSinhVien(s.mssv, s.hoTenSV, s.ngaySinhSV, s.gioiTinhSV, s.queQuanSV, s.emailSV, s.maLop,
                s.soDienThoaiSV, s.anhSV, s.trangThaiSV);
    }

    public void sua() {
        sql.suaSinhVien(mssv, hoTenSV, ngaySinhSV, gioiTinhSV, queQuanSV, emailSV, maLop, soDienThoaiSV, anhSV,
                trangThaiSV);
    }

    public void sua(tblSinhVien s) {
        sql.suaSinhVien(s.mssv, s.hoTenSV, s.ngaySinhSV, s.gioiTinhSV, s.queQuanSV, s.emailSV, s.maLop, s.soDienThoaiSV,
                s.anhSV, s.trangThaiSV);
    }

    public void xoa() {
        sql.xoaBanGhi("tblSinhVien", "MSSV = '" + this.mssv + "'");
    }

    public void truyVanTheoMa(String id) {
        this.mssv = id;
        this.hoTenSV = sql.timKiem("HoTenSV", "tblSinhVien", "MSSV = '" + id + "'");
        this.ngaySinhSV = sql.timKiem("NgaySinhSV", "tblSinhVien", "MSSV = '" + id + "'");
        this.gioiTinhSV = sql.timKiem("GioiTinhSV", "tblSinhVien", "MSSV = '" + id + "'");
        this.queQuanSV = sql.timKiem("QueQuanSV", "tblSinhVien", "MSSV = '" + id + "'");
        this.emailSV = sql.timKiem("EmailSV", "tblSinhVien", "MSSV = '" + id + "'");
        this.maLop = sql.timKiem("MaLop", "tblSinhVien", "MSSV = '" + id + "'");
        this.soDienThoaiSV = sql.timKiem("SoDienThoaiSV", "tblSinhVien", "MSSV = '" + id + "'");
        this.anhSV = sql.timKiem("AnhSV", "tblSinhVien", "MSSV = '" + id + "'");
        this.trangThaiSV = sql.timKiem("TrangThaiSV", "tblSinhVien", "MSSV = '" + id + "'");
    }

    // * set
    public void setMSSV(String mssv) {
        if (sql.kiemTraKhoaChinh("tblSinhVien", "MSSV", mssv)) {
            request.setAttribute("loiMSSV", "MSSV đã tồn tại");
            bao_loi = true;
        } else if (mssv == null || mssv.trim().isEmpty()) {
            request.setAttribute("loiMSSV", "MSSV không được để trống");
            bao_loi = true;
        } else {
            this.mssv = mssv;
        }
    }

    public void setHoTenSV(String hoTen) {
        if (hoTen == null || hoTen.trim().isEmpty()) {
            request.setAttribute("loiHoTenSV", "Họ tên không được để trống");
            bao_loi = true;
        } else {
            this.hoTenSV = hoTen;
        }
    }

    public void setNgaySinhSV(String ngaySinh) {
        if (ngaySinh == null || ngaySinh.trim().isEmpty()) {
            request.setAttribute("loiNgaySinhSV", "Ngày sinh không được để trống");
            bao_loi = true;
        } else {
            this.ngaySinhSV = ngaySinh;
        }
    }

    public void setGioiTinhSV(String gioiTinh) {
        if (gioiTinh == null || gioiTinh.trim().isEmpty()) {
            request.setAttribute("loiGioiTinhSV", "Giới tính không được để trống");
            bao_loi = true;
        } else {
            this.gioiTinhSV = gioiTinh;
        }
    }

    public void setQueQuanSV(String queQuan) {
        if (queQuan == null || queQuan.trim().isEmpty()) {
            request.setAttribute("loiQueQuanSV", "Quê quán không được để trống");
            bao_loi = true;
        } else {
            this.queQuanSV = queQuan;
        }
    }

    public void setEmailSV(String email) {
        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("loiEmailSV", "Email không được để trống");
            bao_loi = true;
        } else {
            this.emailSV = email;
        }
    }

    public void setMaLop(String maLop) {
        if (maLop == null || maLop.trim().isEmpty()) {
            request.setAttribute("loiMaLop", "Mã lớp không được để trống");
            bao_loi = true;
        } else {
            this.maLop = maLop;
        }
    }

    public void setSoDienThoaiSV(String soDienThoai) {
        if (soDienThoai == null || soDienThoai.trim().isEmpty()) {
            request.setAttribute("loiSoDienThoaiSV", "Số điện thoại không được để trống");
            bao_loi = true;
        } else {
            this.soDienThoaiSV = soDienThoai;
        }
    }

    public void setAnhSV(Part anh) throws IOException {
        if (anh.getSubmittedFileName() == null || anh.getSubmittedFileName().isEmpty()) {
            // ? chiu
            return;
        }
        this.anhSV = sql.themFile_Ma(anh, request.getServletContext(), mssv);
    }

    public void setTrangThaiSV(String trangThai) {
        if (trangThai == null || trangThai.trim().isEmpty()) {
            this.trangThaiSV = "";
        } else {
            this.trangThaiSV = trangThai;
        }
    }

    // * get */
    public String getTenLop() {
        String tenLop = sql.timKiem("TenLop", "tblLop", "MaLop = '" + this.maLop + "'");
        return tenLop;
    }

    // * Lay tong the */
    public String getTblLop(String tenTruongCanLay) {
        String kq = sql.timKiem(tenTruongCanLay, "tblLop",
                "MaLop = (SELECT MaLop FROM tblSinhVien WHERE MSSV = '" + mssv + "')");
        return kq;
    }
}

package com.example.model;

import java.io.IOException;

import com.example.data.ChucNangSQL;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class tblGiangVien {
    ChucNangSQL sql = new ChucNangSQL();

    public String msgv;
    public String hoTenGV;
    public String ngaySinhGV;
    public String gioiTinhGV;
    public String queQuanGV;
    public String emailGV;
    public String maNganh;
    public String soDienThoaiGV;
    public String anhGV;
    public String trangThaiGV;
    public HttpServletRequest request;
    public Boolean bao_loi = false;

    public tblGiangVien() {
    }

    public tblGiangVien(String msgv, String hoTenGV, String ngaySinhGV, String gioiTinhGV, String queQuanGV,
            String emailGV, String maNganh, String soDienThoaiGV, String anhGV, String trangThaiGV) {
        this.msgv = msgv;
        this.hoTenGV = hoTenGV;
        this.ngaySinhGV = ngaySinhGV;
        this.gioiTinhGV = gioiTinhGV;
        this.queQuanGV = queQuanGV;
        this.emailGV = emailGV;
        this.maNganh = maNganh;
        this.soDienThoaiGV = soDienThoaiGV;
        this.anhGV = anhGV;
        this.trangThaiGV = trangThaiGV;
    }

    public tblGiangVien(HttpServletRequest req) {
        this.request = req;
    }

    public void them() {
        sql.themGiangVien(msgv, hoTenGV, ngaySinhGV, gioiTinhGV, queQuanGV, emailGV, maNganh, soDienThoaiGV, anhGV,
                trangThaiGV);
    }

    public void them(tblGiangVien gv) {
        sql.themGiangVien(gv.msgv, gv.hoTenGV, gv.ngaySinhGV, gv.gioiTinhGV, gv.queQuanGV, gv.emailGV, gv.maNganh,
                gv.soDienThoaiGV, gv.anhGV, gv.trangThaiGV);
    }

    public void sua() {
        sql.suaGiangVien(msgv, hoTenGV, ngaySinhGV, gioiTinhGV, queQuanGV, emailGV, maNganh, soDienThoaiGV, anhGV,
                trangThaiGV);
    }

    public void sua(tblGiangVien gv) {
        sql.suaGiangVien(gv.msgv, gv.hoTenGV, gv.ngaySinhGV, gv.gioiTinhGV, gv.queQuanGV, gv.emailGV, gv.maNganh,
                gv.soDienThoaiGV, gv.anhGV, gv.trangThaiGV);
    }

    public void xoa() {
        sql.xoaBanGhi("tblGiangVien", "MSGV = '" + this.msgv + "'");
    }

    public void truyVanTheoMa(String id) {
        this.msgv = id;
        this.hoTenGV = sql.timKiem("HoTenGV", "tblGiangVien", "MSGV = '" + id + "'");
        this.ngaySinhGV = sql.timKiem("NgaySinhGV", "tblGiangVien", "MSGV = '" + id + "'");
        this.gioiTinhGV = sql.timKiem("GioiTinhGV", "tblGiangVien", "MSGV = '" + id + "'");
        this.queQuanGV = sql.timKiem("QueQuanGV", "tblGiangVien", "MSGV = '" + id + "'");
        this.emailGV = sql.timKiem("EmailGV", "tblGiangVien", "MSGV = '" + id + "'");
        this.maNganh = sql.timKiem("MaNganh", "tblGiangVien", "MSGV = '" + id + "'");
        this.soDienThoaiGV = sql.timKiem("SoDienThoaiGV", "tblGiangVien", "MSGV = '" + id + "'");
        this.anhGV = sql.timKiem("AnhGV", "tblGiangVien", "MSGV = '" + id + "'");
        this.trangThaiGV = sql.timKiem("TrangThaiGV", "tblGiangVien", "MSGV = '" + id + "'");
    }

    // *set */
    public void setMSGV(String msgv) {
        if (sql.kiemTraKhoaChinh("tblGiangVien", "MSGV", msgv)) {
            request.setAttribute("loiMSGV", "Mã giảng viên đã tồn tại");
            bao_loi = true;
        } else if (msgv == null || msgv.trim().isEmpty()) {
            request.setAttribute("loiMSGV", "Mã giảng viên không được để trống");
            bao_loi = true;
        } else {
            this.msgv = msgv;
        }
    }

    public void setHoTenGV(String hoTen) {
        if (hoTen == null || hoTen.trim().isEmpty()) {
            request.setAttribute("loiHoTenGV", "Họ tên không được để trống");
            bao_loi = true;
        } else {
            this.hoTenGV = hoTen;
        }
    }

    public void setNgaySinhGV(String ngaySinh) {
        if (ngaySinh == null || ngaySinh.trim().isEmpty()) {
            request.setAttribute("loiNgaySinhGV", "Ngày sinh không được để trống");
            bao_loi = true;
        } else {
            this.ngaySinhGV = ngaySinh;
        }
    }

    public void setGioiTinhGV(String gioiTinh) {
        if (gioiTinh == null || gioiTinh.trim().isEmpty()) {
            request.setAttribute("loiGioiTinhGV", "Giới tính giảng viên không được để trống");
            bao_loi = true;
        } else {
            this.gioiTinhGV = gioiTinh;
        }
    }

    public void setEmailGV(String email) {
        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("loiEmailGV", "Email không được để trống");
            bao_loi = true;
        } else {
            this.emailGV = email;
        }
    }

    public void setQueQuanGV(String queQuan) {
        if (queQuan == null || queQuan.trim().isEmpty()) {
            request.setAttribute("loiQueQuanGV", "Quê quán giảng viên không được để trống");
            bao_loi = true;
        } else {
            this.queQuanGV = queQuan;
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

    public void setSoDienThoaiGV(String soDienThoai) {
        if (soDienThoai == null || soDienThoai.trim().isEmpty()) {
            request.setAttribute("loiSoDienThoaiGV", "Số điện thoại không được để trống");
            bao_loi = true;
        } else {
            this.soDienThoaiGV = soDienThoai;
        }
    }

    public void setTrangThaiGV(String trangThai) {
        if (trangThai == null || trangThai.trim().isEmpty()) {
            request.setAttribute("loiTrangThaiGV", "Trạng thái giảng viên không được để trống");
            bao_loi = true;
        } else {
            this.trangThaiGV = trangThai;
        }
    }

    public void setAnhGV(Part anh) throws IOException {
        if (anh.getSubmittedFileName() == null || anh.getSubmittedFileName().isEmpty()) {
            // ? chiu
            return;
        }
        this.anhGV = sql.themFile_Ma(anh, request.getServletContext(), msgv);
    }

    // *get */
    public String getTenNganh() {
        String tenNganh = sql.timKiem("TenNganh", "tblNganh", "MaNganh = '" + this.maNganh + "'");
        return tenNganh;
    }

    // * Lay tong the
    public String getTblNganh(String tenTruongCanLay) {
        String kq = sql.timKiem(tenTruongCanLay, "tblNganh",
                "MaNganh = (SELECT MaNganh FROM tblGiangVien WHERE MSGV = '" + this.msgv + "')");
        return kq;
    }

}

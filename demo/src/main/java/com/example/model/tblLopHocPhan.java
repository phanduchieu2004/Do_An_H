package com.example.model;

import com.example.data.ChucNangSQL;

import jakarta.servlet.http.HttpServletRequest;

public class tblLopHocPhan {

    ChucNangSQL sql = new ChucNangSQL();

    public String maLopHocPhan;
    public String tenLopHocPhan;
    public String maHocPhan;
    public String msgv;
    public Integer soBuoi;
    public Integer soTiet;
    public String soTuanHoc;
    public String thuTiet;
    public String phongHoc;
    public String thoiGianBatDau;
    public String thoiGianKetThuc;
    public String thoiGianHoc;
    public Integer soLuongToiDa;
    public String trangThaiLopHocPhan;
    public HttpServletRequest request;
    public Boolean bao_loi = false;

    public tblLopHocPhan() {
    }

    public tblLopHocPhan(String maLopHocPhan, String tenLopHocPhan, String maHocPhan, String msgv, Integer soBuoi,
            Integer soTiet, String soTuanHoc, String thuTiet, String phongHoc, String thoiGianBatDau,
            String thoiGianKetThuc,
            String thoiGianHoc, Integer soLuongToiDa, String trangThaiLopHocPhan) {
        this.maLopHocPhan = maLopHocPhan;
        this.tenLopHocPhan = tenLopHocPhan;
        this.maHocPhan = maHocPhan;
        this.msgv = msgv;
        this.soBuoi = soBuoi;
        this.soTiet = soTiet;
        this.soTuanHoc = soTuanHoc;
        this.thuTiet = thuTiet;
        this.phongHoc = phongHoc;
        this.thoiGianBatDau = thoiGianBatDau;
        this.thoiGianKetThuc = thoiGianKetThuc;
        this.thoiGianHoc = thoiGianHoc;
        this.soLuongToiDa = soLuongToiDa;
        this.trangThaiLopHocPhan = trangThaiLopHocPhan;
    }

    public tblLopHocPhan(HttpServletRequest req) {
        this.request = req;
    }

    public void them() {
        sql.themLopHocPhan(maLopHocPhan, tenLopHocPhan, maHocPhan, msgv, soBuoi, soTiet, soTuanHoc, thuTiet, phongHoc,
                thoiGianBatDau, thoiGianKetThuc, thoiGianHoc, soLuongToiDa, trangThaiLopHocPhan);
    }

    public void them(tblLopHocPhan l) {
        sql.themLopHocPhan(l.maLopHocPhan, l.tenLopHocPhan, l.maHocPhan, l.msgv, l.soBuoi, l.soTiet, l.soTuanHoc,
                l.thuTiet, l.phongHoc, l.thoiGianBatDau, l.thoiGianKetThuc, l.thoiGianHoc, l.soLuongToiDa,
                l.trangThaiLopHocPhan);
    }

    public void sua() {
        sql.suaLopHocPhan(maLopHocPhan, tenLopHocPhan, maHocPhan, msgv, soBuoi, soTiet, soTuanHoc, thuTiet, phongHoc,
                thoiGianBatDau, thoiGianKetThuc, thoiGianHoc, soLuongToiDa, trangThaiLopHocPhan);
    }

    public void sua(tblLopHocPhan l) {
        sql.suaLopHocPhan(l.maLopHocPhan, l.tenLopHocPhan, l.maHocPhan, l.msgv, l.soBuoi, l.soTiet, l.soTuanHoc,
                l.thuTiet, l.phongHoc, l.thoiGianBatDau, l.thoiGianKetThuc, l.thoiGianHoc, l.soLuongToiDa,
                l.trangThaiLopHocPhan);
    }

    public void xoa() {
        sql.xoaBanGhi("tblLopHocPhan", "MaLopHocPhan = '" + this.maLopHocPhan + "'");
    }

    public String truyVanTheoMa_1C(String tenCotCanLay) {
        return sql.timKiem(tenCotCanLay, "tblLopHocPhan", "MaLopHocPhan ='" + this.maLopHocPhan + "'");
    }

    public String truyVanTheoMa_1C(String maLopHocPhanString, String tenCotCanLay) {
        return sql.timKiem(tenCotCanLay, "tblLopHocPhan", "MaLopHocPhan ='" + maLopHocPhanString + "'");
    }

    public void truyVanTheoMa(String maLopHocPhanString) {
        this.maLopHocPhan = maLopHocPhanString;
        this.tenLopHocPhan = truyVanTheoMa_1C(this.maLopHocPhan, "TenLopHocPhan");
        this.maHocPhan = truyVanTheoMa_1C(this.maLopHocPhan, "MaHocPhan");
        this.msgv = truyVanTheoMa_1C(this.maLopHocPhan, "MSGV");
        String soBuoiStr = truyVanTheoMa_1C(this.maLopHocPhan, "SoBuoi");
        this.soBuoi = soBuoiStr == null || soBuoiStr.isEmpty() ? null : Integer.valueOf(soBuoiStr);
        String soTietStr = truyVanTheoMa_1C(this.maLopHocPhan, "SoTiet");
        this.soTiet = soTietStr == null || soTietStr.isEmpty() ? null : Integer.valueOf(soTietStr);
        this.soTuanHoc = truyVanTheoMa_1C(this.maLopHocPhan, "SoTuanHoc");
        this.thuTiet = truyVanTheoMa_1C(this.maLopHocPhan, "ThuTiet");
        this.phongHoc = truyVanTheoMa_1C(this.maLopHocPhan, "PhongHoc");
        this.thoiGianBatDau = truyVanTheoMa_1C(this.maLopHocPhan, "ThoiGianBatDau");
        this.thoiGianKetThuc = truyVanTheoMa_1C(this.maLopHocPhan, "ThoiGianKetThuc");
        this.thoiGianHoc = truyVanTheoMa_1C(this.maLopHocPhan, "ThoiGianHoc");
        String soLuongToiDaStr = truyVanTheoMa_1C(this.maLopHocPhan, "SoLuongToiDa");
        this.soLuongToiDa = soLuongToiDaStr == null || soLuongToiDaStr.isEmpty() ? null
                : Integer.valueOf(soLuongToiDaStr);
        this.trangThaiLopHocPhan = truyVanTheoMa_1C(this.maLopHocPhan, "TrangThaiLopHocPhan");
    }

    // *set
    public void setMaLopHocPhan(String maLopHocPhan) {
        if (sql.kiemTraKhoaChinh("tblLopHocPhan", "MaLopHocPhan", maLopHocPhan)) {
            request.setAttribute("loiMaLopHocPhan", "Mã lớp học phần đã tồn tại");
            bao_loi = true;
        } else if (maLopHocPhan == null || maLopHocPhan.trim().isEmpty()) {
            request.setAttribute("loiMaLopHocPhan", "Mã lớp học phần không được để trống");
            bao_loi = true;
        } else {
            this.maLopHocPhan = maLopHocPhan;
        }
    }

    public void setTenLopHocPhan(String tenLopHocPhan) {
        if (tenLopHocPhan == null || tenLopHocPhan.trim().isEmpty()) {
            request.setAttribute("loiTenLopHocPhan", "Tên lớp học phần không được để trống");
            bao_loi = true;
        } else {
            this.tenLopHocPhan = tenLopHocPhan;
        }
    }

    public void setMaHocPhan(String maHocPhan) {
        if (maHocPhan == null || maHocPhan.trim().isEmpty()) {
            request.setAttribute("loiMaHocPhan", "Mã học phần không được để trống");
            bao_loi = true;
        } else {
            this.maHocPhan = maHocPhan;
        }
    }

    public void setMSGV(String msgv) {
        if (msgv == null || msgv.trim().isEmpty()) {
            request.setAttribute("loiMSGV", "MSGV không được để trống");
            bao_loi = true;
        } else {
            this.msgv = msgv;
        }
    }

    public void setSoBuoi(Integer soBuoi) {
        if (soBuoi == null || soBuoi < 1) {
            request.setAttribute("loiSoBuoi", "Số buổi phải lớn hơn 0");
            bao_loi = true;
        } else {
            this.soBuoi = soBuoi;
        }
    }

    public void setSoTiet(Integer soTiet) {
        if (soTiet == null || soTiet < 1) {
            request.setAttribute("loiSoTiet", "Số tiết phải lớn hơn 0");
            bao_loi = true;
        } else {
            this.soTiet = soTiet;
        }
    }

    public void setSoTuanHoc(String soTuanHoc) {
        if (soTuanHoc == null || soTuanHoc.trim().isEmpty()) {
            request.setAttribute("loiSoTuanHoc", "Số tuần học không được để trống");
            bao_loi = true;
        } else {
            this.soTuanHoc = soTuanHoc;
        }
    }

    public void setThuTiet(String thuTiet) {
        if (thuTiet == null || thuTiet.trim().isEmpty()) {
            request.setAttribute("loiThuTiet", "Thứ tiết không được để trống");
            bao_loi = true;
        } else {
            this.thuTiet = thuTiet;
        }
    }

    public void setPhongHoc(String phongHoc) {
        if (phongHoc == null || phongHoc.trim().isEmpty()) {
            request.setAttribute("loiPhongHoc", "Phòng học không được để trống");
            bao_loi = true;
        } else {
            this.phongHoc = phongHoc;
        }
    }

    public void setThoiGianBatDau(String thoiGianBatDau) {
        if (thoiGianBatDau == null || thoiGianBatDau.trim().isEmpty()) {
            request.setAttribute("loiThoiGianBatDau", "Thời gian bắt đầu không được để trống");
            bao_loi = true;
        } else {
            this.thoiGianBatDau = thoiGianBatDau;
        }
    }

    public void setThoiGianKetThuc(String thoiGianKetThuc) {
        if (thoiGianKetThuc == null || thoiGianKetThuc.trim().isEmpty()) {
            request.setAttribute("loiThoiGianKetThuc", "Thời gian kết thúc không được để trống");
            bao_loi = true;
        } else {
            this.thoiGianKetThuc = thoiGianKetThuc;
        }
    }

    public void setThoiGianHoc(String thoiGianHoc) {
        if (thoiGianHoc == null || thoiGianHoc.trim().isEmpty()) {
            request.setAttribute("loiThoiGianHoc", "Thời gian học không được để trống");
            bao_loi = true;
        } else {
            this.thoiGianHoc = thoiGianHoc;
        }
    }

    public void setSoLuongToiDa(Integer soLuongToiDa) {
        if (soLuongToiDa == null || soLuongToiDa < 1) {
            request.setAttribute("loiSoLuongToiDa", "Số lượng tối đa phải lớn hơn 0");
            bao_loi = true;
        } else {
            this.soLuongToiDa = soLuongToiDa;
        }
    }

    public void setTrangThaiLopHocPhan(String trangThaiLopHocPhan) {
        if (trangThaiLopHocPhan == null || trangThaiLopHocPhan.trim().isEmpty()) {
            request.setAttribute("loiTrangThaiLopHocPhan", "Trạng thái lớp học phần không được để trống");
            bao_loi = true;
        } else {
            this.trangThaiLopHocPhan = trangThaiLopHocPhan;
        }
    }

    // *get
    public String getTenHocPhan() {
        String tenHocPhan = sql.timKiem("TenHocPhan", "tblHocPhan", "MaHocPhan = '" + this.maHocPhan + "'");
        return tenHocPhan;
    }

    public int getSoLuongDangKy() {
        int soLuongDangKy = sql.hienThi_DieuKien("tblDangKyHocPhan",
                "MaLopHocPhan = '" + this.maLopHocPhan + "'").size();
        return soLuongDangKy;
    }

    // * Lay tong the
    public String getTblHocPhan(String tenTruongCanLay) {
        String kq = sql.timKiem(tenTruongCanLay, "tblHocPhan",
                "MaHocPhan = (SELECT MaHocPhan FROM tblLopHocPhan WHERE MaLopHocPhan = '" + maLopHocPhan + "')");
        return kq;
    }

}

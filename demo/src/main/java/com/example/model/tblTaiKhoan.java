package com.example.model;

import com.example.data.ChucNangSQL;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class tblTaiKhoan {
    ChucNangSQL sql = new ChucNangSQL();

    public String maNguoiDung;
    public String matKhau;
    public String chucVu;
    public String trangThaiTaiKhoan;
    public HttpServletRequest request;
    public HttpServletResponse response;
    public Boolean bao_loi = false;

    public tblTaiKhoan() {
    }

    public void them() {
        sql.themTaiKhoan(maNguoiDung, matKhau, chucVu, trangThaiTaiKhoan);
    }

    public void them(tblTaiKhoan t) {
        sql.themTaiKhoan(t.maNguoiDung, t.matKhau, t.chucVu, t.trangThaiTaiKhoan);
    }

    public void sua() {
        sql.suaTaiKhoan(maNguoiDung, matKhau, chucVu, trangThaiTaiKhoan);
    }

    public void sua(tblTaiKhoan t) {
        sql.suaTaiKhoan(t.maNguoiDung, t.matKhau, t.chucVu, t.trangThaiTaiKhoan);
    }

    public void xoa() {
        sql.xoaBanGhi("tblTaiKhoan", "MaNguoiDung = '" + maNguoiDung + "'");
    }

    public void truyVanTheoMa(String ma) {
        this.maNguoiDung = ma;
        this.matKhau = sql.timKiem("MatKhau", "tblTaiKhoan", "MaNguoiDung='" + ma + "'");
        this.chucVu = sql.timKiem("ChucVu", "tblTaiKhoan", "MaNguoiDung='" + ma + "'");
        this.trangThaiTaiKhoan = sql.timKiem("TrangThaiTaiKhoan", "tblTaiKhoan", "MaNguoiDung='" + ma + "'");
    }

    public void layThongTinSession() {
        String maNguoiDungSession = (String) request.getSession().getAttribute("SS_MaNguoiDung");
        String chucVuSession = (String) request.getSession().getAttribute("SS_ChucVu");

        if (chucVuSession != null && maNguoiDungSession != null) {
            switch (chucVuSession.toLowerCase()) {
                case "admin" -> {
                }
                case "giangvien", "giảng viên" -> {
                    tblGiangVien gv = new tblGiangVien();
                    gv.truyVanTheoMa(maNguoiDungSession);
                    request.getSession().setAttribute("SS_HoTen", gv.hoTenGV);
                    request.getSession().setAttribute("SS_Email", gv.emailGV);
                    tblNganh nganh = new tblNganh();
                    nganh.truyVanTheoMa(gv.maNganh);
                    request.getSession().setAttribute("SS_Nganh", nganh.tenNganh);
                    request.getSession().setAttribute("SS_Anh", gv.anhGV);
                    request.getSession().setAttribute("SS_ChucVu", "Giảng viên");

                }
                case "sinhvien", "sinh viên" -> {
                    tblSinhVien sv = new tblSinhVien();
                    sv.truyVanTheoMa(maNguoiDungSession);
                    request.getSession().setAttribute("SS_HoTen", sv.hoTenSV);
                    request.getSession().setAttribute("SS_Email", sv.emailSV);
                    tblLop lop = new tblLop();
                    lop.truyVanTheoMa(sv.maLop);
                    tblNganh nganh = new tblNganh();
                    nganh.truyVanTheoMa(lop.maNganh);
                    request.getSession().setAttribute("SS_Nganh", nganh.tenNganh);
                    request.getSession().setAttribute("SS_ChucVu", "Sinh viên");
                    request.getSession().setAttribute("SS_Anh", sv.anhSV);
                }
                default -> System.out.println("Chức vụ không xác định: " + chucVuSession);
            }
        } else {
            System.out
                    .println("maNguoiDungSession hoặc chucVuSession = null");
        }

    }
    // * set

    public void setMaNguoiDung(String ma) {
        if (kiemTraMaNguoiDungTonTai(ma)) {
            request.setAttribute("loiMaNguoiDung", "Mã người dùng đã tồn tại");
            bao_loi = true;
        } else {
            this.maNguoiDung = ma;
        }
    }

    public void setMatKhau(String mk) {
        // if (mk.length() < 6) {
        // request.setAttribute("loiMatKhau", "Mật khẩu phải có ít nhất 6 ký tự");
        // bao_loi = true;
        // } else {
        this.matKhau = mk;
        // }

    }

    public void setChucVu(String cv) {
        this.chucVu = cv;
    }

    public void setTrangThaiTaiKhoan(String tt) {
        this.trangThaiTaiKhoan = tt;
    }

    // * Kiem tra
    public Boolean kiemTraMaNguoiDungTonTai(String maNguoiDungString) {
        String ma = sql.timKiem("MaNguoiDung", "tblTaiKhoan", "MaNguoiDung='" + maNguoiDungString + "'");
        // if (ma == null || ma.isEmpty()) {
        // return false;
        // } else {
        // return true;
        // }
        return !(ma == null || ma.isEmpty());
    }

    // ! chưa sử dụng
    public String kiemTraChucVu(String maNguoiDungString) {
        String kq = "";
        String dau = maNguoiDungString.trim().substring(0, 2);
        switch (dau) {
            case "00" -> kq = "Admin";
            case "10" -> kq = "GiangVien";
            case "20" -> kq = "SinhVien";
            default -> {
                System.out.println("không rõ chức vụ?");
            }
        }
        return kq;
    }

    public void kiemTraDangNhap(String maNguoiDungString, String matKhauString) {
        truyVanTheoMa(maNguoiDungString);
        if (!matKhau.isEmpty()) {
            if (matKhauString.equals(matKhau)) {
                // ? đúng thông tin
                request.getSession().setAttribute("SS_MaNguoiDung", maNguoiDung);
                request.getSession().setAttribute("SS_ChucVu", chucVu);

            } else {
                request.setAttribute("loiMatKhau", "Mật khẩu không đúng");
                bao_loi = true;
            }
        } else {
            request.setAttribute("loiMaNguoiDung", "Mã người dùng không tồn tại");
            System.out.println("Mã người dùng không tồn tại");
            bao_loi = true;
        }

    }

}
// public void get

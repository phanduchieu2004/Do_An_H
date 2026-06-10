package com.example.controller.sinhvien.quanlydangky;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.example.data.ChucNangSQL;
import com.example.model.tblGiangVien;
import com.example.model.tblHocPhan;
import com.example.model.tblLopHocPhan;
import com.example.model.tblNganh;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/sinhvien/dangkylophocphan", "/sinhvien/dangkylophocphan/index" })
public class Index extends HttpServlet {

    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {
        try {

            sql.kiemTraDangNhap(req, resp);
        } catch (Exception e) {
        }

        String maNguoiDung = (String) req.getSession().getAttribute("SS_MaNguoiDung");

        // Lấy danh sách các lớp học phần mà sinh viên đã đăng ký
        List<String> danhSachDaDangKy = sql.hienThi("tblDangKyHocPhan").stream()
                .filter(dk -> dk.get("MSSV").toString().equalsIgnoreCase(maNguoiDung))
                .map(dk -> dk.get("MaLopHocPhan").toString())
                .toList();

        // Lấy danh sách thứ tiết và thời gian học của các lớp học phần đã đăng ký
        List<tblLopHocPhan> danhSachLopDaDangKy = danhSachDaDangKy.stream()
                .map(maLHP -> {
                    tblLopHocPhan lhp = new tblLopHocPhan();
                    lhp.truyVanTheoMa(maLHP);
                    return lhp;
                })
                .toList();

        List<Map<String, Object>> danhsach = sql.hienThi("tblLopHocPhan");
        System.out.println("ma nguoi dung: " + maNguoiDung);
        for (Map<String, Object> i : danhsach) {
            tblLopHocPhan lhp = new tblLopHocPhan();
            lhp.truyVanTheoMa((String) i.get("MaLopHocPhan"));
            Integer soLuongDangKy = lhp.getSoLuongDangKy();
            i.put("SoLuongDangKy", soLuongDangKy);

            tblHocPhan hp = new tblHocPhan();
            hp.truyVanTheoMa((String) i.get("MaHocPhan"));
            i.put("TenHocPhan", hp.tenHocPhan);

            tblNganh nganh = new tblNganh();
            nganh.truyVanTheoMa(hp.maNganh);
            i.put("TenNganh", nganh.tenNganh);

            tblGiangVien gv = new tblGiangVien();
            gv.truyVanTheoMa((String) i.get("MSGV"));
            i.put("TenGiangVien", gv.hoTenGV);
        }
        //// ! co the dung
        // danhsach.removeIf(
        // i -> {
        // return i.get("TenNganh").equals((String)
        //// req.getSession().getAttribute("SS_Nganh"));
        // });

        // Ẩn các lớp học phần đã đầy
        danhsach.removeIf(
                i -> {
                    return (int) i.get("SoLuongDangKy") >= (int) i.get("SoLuongToiDa");
                });

        // Ẩn các lớp học phần mà sinh viên đã đăng ký
        danhsach.removeIf(
                i -> {
                    return danhSachDaDangKy.contains(i.get("MaLopHocPhan").toString());
                });

        // Ẩn các lớp học phần có thứ tiết VÀ thời gian học trùng với lớp đã đăng ký
        danhsach.removeIf(
                i -> {
                    String thuTiet = (String) i.get("ThuTiet");
                    String thoiGianHoc = (String) i.get("ThoiGianHoc");
                    if (thuTiet == null || thuTiet.isEmpty()) {
                        return false;
                    }
                    // Kiểm tra xem có lớp nào đã đăng ký trùng cả thứ tiết và thời gian học không
                    for (tblLopHocPhan lopDaDangKy : danhSachLopDaDangKy) {
                        if (lopDaDangKy.thuTiet != null && lopDaDangKy.thuTiet.equals(thuTiet)) {
                            // Nếu trùng thứ tiết, kiểm tra thời gian học
                            if (lopDaDangKy.thoiGianHoc != null && thoiGianHoc != null
                                    && lopDaDangKy.thoiGianHoc.equals(thoiGianHoc)) {
                                return true; // Trùng cả thứ tiết và thời gian học -> không cho đăng ký
                            }
                        }
                    }
                    return false; // Không trùng hoặc chỉ trùng thứ tiết nhưng khác thời gian học -> cho phép
                });
        String ssNganh = (String) req.getSession().getAttribute("SS_Nganh");
        if (ssNganh != null && !ssNganh.trim().isEmpty()) {
            danhsach.removeIf(
                    i -> {
                        Object tenNganhObj = i.get("TenNganh");
                        String tenNganh = tenNganhObj == null ? "" : tenNganhObj.toString();
                        return !ssNganh.equalsIgnoreCase(tenNganh);
                    });
        }
        req.setAttribute("danhSachLopHocPhan", danhsach);
        req.getRequestDispatcher("/sinhvien/dangkylophocphan/index.jsp").forward(req, resp);

    }

}

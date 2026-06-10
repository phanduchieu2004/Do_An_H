package com.example.controller.admin.quanlydiem;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.example.data.ChucNangSQL;
import com.example.model.tblGiangVien;
import com.example.model.tblHocPhan;
import com.example.model.tblNganh;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({ "/admin/danhsachketqua", "/admin/danhsachketqua/index" })
public class Index extends HttpServlet {
    ChucNangSQL sql = new ChucNangSQL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<Map<String, Object>> danhsach = sql.hienThi("tblLopHocPhan");
        for (Map<String, Object> i : danhsach) {
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
        req.setAttribute("danhSachLopHocPhan", danhsach);
        req.getRequestDispatcher("/admin/danhsachketqua/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String[] maLopHocPhan = req.getParameterValues("MaLopHocPhan");
        if (maLopHocPhan != null) {
            for (String ma : maLopHocPhan) {
                sql.xoaBanGhi("tblLopHocPhan", "MaLopHocPhan = '" + ma + "'");
            }
        }
        req.getSession().setAttribute("thongBao", "Xóa các lớp học phần đã chọn thành công");
        resp.sendRedirect(req.getContextPath() + "/admin/danhsachlophocphan");
    }
}

package com.example.controller.admin.quanlyhocphan;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.example.data.ChucNangSQL;
import com.example.model.tblHocPhan;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@MultipartConfig
@WebServlet({ "/admin/danhsachhocphan/sua" })
public class Sua extends HttpServlet {

        ChucNangSQL sql = new ChucNangSQL();

        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp)
                        throws ServletException, IOException {
                String maHocPhan = req.getParameter("MaHocPhan");
                List<Map<String, Object>> danhSach = sql.hienThi_DieuKien("tblHocPhan",
                                "MaHocPhan='" + maHocPhan + "'");
                for (Map<String, Object> i : danhSach) {
                        // Bổ sung tên ngành
                        com.example.model.tblNganh ng = new com.example.model.tblNganh();
                        ng.truyVanTheoMa(i.get("MaNganh").toString());
                        i.put("TenNganh", ng.tenNganh);
                }
                req.setAttribute("hp", danhSach.get(0));
                req.setAttribute("danhSachNganh", sql.hienThi("tblNganh"));
                req.getRequestDispatcher("/admin/danhsachhocphan/sua.jsp").forward(req, resp);
        }

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp)
                        throws ServletException, IOException {
                final String maHocPhan = req.getParameter("MaHocPhan").trim();
                final String tenHocPhan = req.getParameter("TenHocPhan").trim();
                final String soTinChiStr = req.getParameter("SoTinChi").trim();
                final String maNganh = req.getParameter("MaNganh").trim();
                final String moTaHocPhan = req.getParameter("MoTaHocPhan").trim();
                final String hocKyStr = req.getParameter("HocKy").trim();

                Integer soTinChi;
                Integer hocKy;

                soTinChi = Integer.valueOf(soTinChiStr);

                hocKy = Integer.valueOf(hocKyStr);

                tblHocPhan hp = new tblHocPhan(req);
                hp.maHocPhan = maHocPhan;
                hp.tenHocPhan = tenHocPhan;
                hp.soTinChi = soTinChi;
                hp.maNganh = maNganh;
                hp.moTaHocPhan = moTaHocPhan;
                hp.hocKy = hocKy;

                if (hp.bao_loi) {
                        req.setAttribute("hp", hp);
                        req.setAttribute("danhSachNganh", sql.hienThi("tblNganh"));
                        req.getRequestDispatcher("/admin/danhsachhocphan/sua.jsp").forward(req, resp);
                        return;
                } else {
                        hp.sua();
                }

                req.getSession().setAttribute("thongBao", "Sửa học phần thành công");
                resp.sendRedirect(req.getContextPath() + "/admin/danhsachhocphan");
        }

}

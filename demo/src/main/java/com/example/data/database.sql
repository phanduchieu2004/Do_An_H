-- !Mã số sinh viên bắt đầu bằng số: 20
-- !Mã số giảng viên bắt đầu bằng số: 10
-- !Mã số admin bắt đầu bằng số: 00



Drop TABLE IF EXISTS tblVien;
Drop TABLE IF EXISTS tblKhoa;
Drop TABLE IF EXISTS tblNganh;
Drop TABLE IF EXISTS tblLop;
Drop TABLE IF EXISTS tblGiangVien;
Drop TABLE IF EXISTS tblSinhVien;
Drop TABLE IF EXISTS tblHocPhan;
Drop TABLE IF EXISTS tblLopHocPhan;
Drop TABLE IF EXISTS tblDangKyHocPhan;
Drop TABLE IF EXISTS tblDiemLopHocPhan;
Drop TABLE IF EXISTS tblDiemDanh;
Drop TABLE IF EXISTS tblTaiKhoan;


-- Tạo bảng tblVien
CREATE TABLE IF NOT EXISTS tblVien (
    IDVien INTEGER PRIMARY KEY AUTOINCREMENT,
    MaVien TEXT NULL,
    TenVien TEXT NULL,
    TenTruongVien TEXT NULL,
    SoDienThoaiVien TEXT NULL,
    EmailVien TEXT NULL,
    NgayThanhLapVien TEXT NULL
);
--Tạo bảng tblKhoa
CREATE TABLE IF NOT EXISTS tblKhoa (
    IDKhoa INTEGER PRIMARY KEY AUTOINCREMENT,
    MaKhoa TEXT NULL,
    TenKhoa TEXT NULL,
    MaVien TEXT NULL,
    TenTruongKhoa TEXT NULL,
    SoDienThoaiKhoa TEXT NULL,
    EmailKhoa TEXT NULL,
    NgayThanhLapKhoa TEXT NULL,
    MoTaKhoa TEXT NULL,
    TrangThaiKhoa TEXT NULL
);
-- Tạo bảng tblNganh
CREATE TABLE IF NOT EXISTS tblNganh (
    IDNganh INTEGER PRIMARY KEY AUTOINCREMENT,
    MaNganh TEXT NULL,
    TenNganh TEXT NULL,
    MaKhoa TEXT NULL,
    MoTaNganh TEXT NULL,
    TrangThaiNganh TEXT NULL
);

-- Tạo bảng tblLop
CREATE TABLE IF NOT EXISTS tblLop (
    IDLop INTEGER PRIMARY KEY AUTOINCREMENT,
    MaLop TEXT NULL,
    KhoaHoc INTEGER NULL,
    TenLop TEXT NULL,
    MaNganh TEXT NULL
);

-- Tạo bảng tblGiangVien
CREATE TABLE IF NOT EXISTS tblGiangVien (
    IDGiangVien INTEGER PRIMARY KEY AUTOINCREMENT,
    MSGV TEXT NULL,
    HoTenGV TEXT NULL,
    NgaySinhGV TEXT NULL,
    GioiTinhGV TEXT NULL,
    QueQuanGV TEXT NULL,
    EmailGV TEXT NULL,
    MaNganh TEXT NULL,
    SoDienThoaiGV TEXT NULL,
    AnhGV TEXT NULL,
    TrangThaiGV TEXT NULL
);
--tblSinhVien
CREATE TABLE IF NOT EXISTS tblSinhVien (
    IDSinhVien INTEGER PRIMARY KEY AUTOINCREMENT,
    MSSV TEXT NULL,
    HoTenSV TEXT NULL,
    NgaySinhSV TEXT NULL,
    GioiTinhSV TEXT NULL,
    QueQuanSV TEXT NULL,
    EmailSV TEXT NULL,
    MaLop TEXT NULL,
    SoDienThoaiSV TEXT NULL,
    AnhSV TEXT NULL,
    TrangThaiSV TEXT NULL
);
--tblHocPhan
CREATE TABLE IF NOT EXISTS tblHocPhan (
    IDHocPhan INTEGER PRIMARY KEY AUTOINCREMENT,
    MaHocPhan TEXT NULL,
    TenHocPhan TEXT NULL,
    SoTinChi INTEGER NULL,
    HocKy INTEGER NULL,
    MaNganh TEXT NULL,
    MoTaHocPhan TEXT NULL
);
--tblLopHocPhan
CREATE TABLE IF NOT EXISTS tblLopHocPhan (
    IDLopHocPhan INTEGER PRIMARY KEY AUTOINCREMENT,
    MaLopHocPhan TEXT NULL,
    TenLopHocPhan TEXT NULL,
    MaHocPhan TEXT NULL,
    MSGV TEXT NULL,
    SoBuoi INTEGER NULL,
    SoTiet INTEGER NULL,
    SoTuanHoc TEXT NULL,
    ThuTiet TEXT NULL,
    PhongHoc TEXT NULL,
    ThoiGianBatDau TEXT NULL,
    ThoiGianKetThuc TEXT NULL,
    ThoiGianHoc TEXT NULL,
    SoLuongToiDa INTEGER NULL,
    TrangThaiLopHocPhan TEXT NULL
);
--tblDangKyHocPhan
CREATE TABLE IF NOT EXISTS tblDangKyHocPhan (
    IDDangKyHocPhan INTEGER PRIMARY KEY AUTOINCREMENT,
    MaDangKyHocPhan TEXT NULL,
    MSSV TEXT NULL,
    MaLopHocPhan TEXT NULL,
    NgayDangKy TEXT NULL,
    TrangThaiDangKyHocPhan TEXT NULL
);
--tblDiemLopHocPhan
CREATE TABLE IF NOT EXISTS tblDiemLopHocPhan (
    IDDiemLopHocPhan INTEGER PRIMARY KEY AUTOINCREMENT,
    MaDiemLopHocPhan TEXT NULL,
    MaDangKyHocPhan INTEGER NULL,
    DiemQuaTrinh REAL NULL,
    DiemThi REAL NULL,
    DiemTongKet REAL NULL,
    XepLoai TEXT NULL
);

--tblDiemDanh 
CREATE TABLE IF NOT EXISTS tblDiemDanh (
    IDDiemDanh INTEGER PRIMARY KEY AUTOINCREMENT,
    MaDiemDanh TEXT NULL,
    MaDangKyHocPhan INTEGER NULL,
    ChuoiDiemDanh TEXT NULL,
    GhiChu TEXT NULL
);
--tblTaiKhoan
CREATE TABLE IF NOT EXISTS tblTaiKhoan (
    IDTaiKhoan INTEGER PRIMARY KEY AUTOINCREMENT,
    MaNguoiDung TEXT NULL,
    MatKhau TEXT NULL,
    ChucVu TEXT NULL,
    TrangThaiTaiKhoan TEXT NULL
);
---- ! Them du lieu

-- =========================
-- 1) tblVien (giữ nguyên)
-- =========================
INSERT INTO tblVien (MaVien, TenVien, TenTruongVien, SoDienThoaiVien, EmailVien, NgayThanhLapVien) VALUES
('V01', 'Viện Công nghệ', 'Nguyễn Văn A', '0123456789', 'vien1@univ.edu', '01/01/2010'),
('V02', 'Viện Kinh tế', 'Trần Thị B', '0123456790', 'vien2@univ.edu', '02/02/2011'),
('V03', 'Viện Khoa học', 'Lê Văn C', '0123456791', 'vien3@univ.edu', '03/03/2012'),
('V04', 'Viện Ngoại ngữ', 'Phạm Thị D', '0123456792', 'vien4@univ.edu', '04/04/2013'),
('V05', 'Viện Môi trường', 'Hoàng Văn E', '0123456793', 'vien5@univ.edu', '05/05/2014');

-- =========================
-- 2) tblKhoa (giữ nguyên)
-- =========================
INSERT INTO tblKhoa (MaKhoa, TenKhoa, MaVien, TenTruongKhoa, SoDienThoaiKhoa, EmailKhoa, NgayThanhLapKhoa, MoTaKhoa, TrangThaiKhoa) VALUES
('K01', 'Khoa CNTT', 'V01', 'Nguyễn Văn F', '0987654321', 'khoa1@univ.edu', '01/01/2015', 'Công nghệ thông tin', 'Hoạt động'),
('K02', 'Khoa Kinh tế', 'V02', 'Trần Thị G', '0987654322', 'khoa2@univ.edu', '02/02/2016', 'Kinh tế học', 'Hoạt động'),
('K03', 'Khoa Sinh học', 'V03', 'Lê Văn H', '0987654323', 'khoa3@univ.edu', '03/03/2017', 'Sinh học', 'Hoạt động'),
('K04', 'Khoa Tiếng Anh', 'V04', 'Phạm Thị I', '0987654324', 'khoa4@univ.edu', '04/04/2018', 'Tiếng Anh', 'Hoạt động'),
('K05', 'Khoa Môi trường', 'V05', 'Hoàng Văn J', '0987654325', 'khoa5@univ.edu', '05/05/2019', 'Môi trường', 'Hoạt động');

-- =========================
-- 3) tblNganh (giữ nguyên)
-- =========================
INSERT INTO tblNganh (MaNganh, TenNganh, MaKhoa, MoTaNganh, TrangThaiNganh) VALUES
('N01', 'Công nghệ phần mềm', 'K01', 'Phần mềm', 'Hoạt động'),
('N02', 'Kinh tế quốc tế', 'K02', 'Kinh tế', 'Hoạt động'),
('N03', 'Sinh học phân tử', 'K03', 'Sinh học', 'Hoạt động'),
('N04', 'Ngôn ngữ Anh', 'K04', 'Tiếng Anh', 'Hoạt động'),
('N05', 'Quản lý môi trường', 'K05', 'Môi trường', 'Hoạt động');

-- ======================================
-- 4) tblLop (đổi KhoaHoc sang 63/64)
-- ======================================
INSERT INTO tblLop (MaLop, KhoaHoc, TenLop, MaNganh) VALUES
('L01', 63, '19CNTT1', 'N01'),
('L02', 63, '19KT1',   'N02'),
('L03', 64, '19SH1',   'N03'),
('L04', 64, '19TA1',   'N04'),
('L05', 63, '19MT1',   'N05');

-- ======================================
-- 5) tblGiangVien (giữ nguyên)
-- ======================================
INSERT INTO tblGiangVien (MSGV, HoTenGV, NgaySinhGV, GioiTinhGV, QueQuanGV, EmailGV, MaNganh, SoDienThoaiGV, AnhGV, TrangThaiGV) VALUES
('10000001', 'Nguyễn Văn Giáo', '01/01/1980', 'Nam', 'Hà Nội', 'gv1@univ.edu', 'N01', '0901111111', '', 'Hoạt động'),
('10000002', 'Trần Thị Giáo',   '02/02/1981', 'Nữ',  'Hải Phòng', 'gv2@univ.edu', 'N02', '0902222222', '', 'Hoạt động'),
('10000003', 'Lê Văn Giáo',     '03/03/1982', 'Nam', 'Nam Định',  'gv3@univ.edu', 'N03', '0903333333', '', 'Hoạt động'),
('10000004', 'Phạm Thị Giáo',   '04/04/1983', 'Nữ',  'Thái Bình', 'gv4@univ.edu', 'N04', '0904444444', '', 'Hoạt động'),
('10000005', 'Hoàng Văn Giáo',  '05/05/1984', 'Nam', 'Nghệ An',   'gv5@univ.edu', 'N05', '0905555555', '', 'Hoạt động');

-- ====================================================
-- 6) tblSinhVien
--    - Giữ 5 SV mẫu ban đầu
--    - Thêm 10 SV cho N01 (CNTT) vào L01: 20000006..20000015
--    - Thêm mỗi ngành N02..N05: 2 SV (tổng 8 SV): 20000016..20000023
-- ====================================================
INSERT INTO tblSinhVien (MSSV, HoTenSV, NgaySinhSV, GioiTinhSV, QueQuanSV, EmailSV, MaLop, SoDienThoaiSV, AnhSV, TrangThaiSV) VALUES
('20000001', 'Nguyễn Văn Sinh',  '01/01/2002', 'Nam', 'Hà Nội',      'sv1@univ.edu',  'L01', '0911111111', '', 'Hoạt động'),
('20000002', 'Trần Thị Sinh',    '02/02/2002', 'Nữ',  'Hải Phòng',    'sv2@univ.edu',  'L02', '0922222222', '', 'Hoạt động'),
('20000003', 'Lê Văn Sinh',      '03/03/2002', 'Nam', 'Nam Định',     'sv3@univ.edu',  'L03', '0933333333', '', 'Hoạt động'),
('20000004', 'Phạm Thị Sinh',    '04/04/2002', 'Nữ',  'Thái Bình',    'sv4@univ.edu',  'L04', '0944444444', '', 'Hoạt động'),
('20000005', 'Hoàng Văn Sinh',   '05/05/2002', 'Nam', 'Nghệ An',      'sv5@univ.edu',  'L05', '0955555555', '', 'Hoạt động'),

-- 10 SV mới cho N01 (CNTT) - L01
('20000006', 'CNTT Sinh 06', '06/06/2002', 'Nam', 'Hà Nội',   'sv6@univ.edu',  'L01', '0960000006', '', 'Hoạt động'),
('20000007', 'CNTT Sinh 07', '07/06/2002', 'Nữ',  'Hà Nội',   'sv7@univ.edu',  'L01', '0960000007', '', 'Hoạt động'),
('20000008', 'CNTT Sinh 08', '08/06/2002', 'Nam', 'Hà Nội',   'sv8@univ.edu',  'L01', '0960000008', '', 'Hoạt động'),
('20000009', 'CNTT Sinh 09', '09/06/2002', 'Nữ',  'Hà Nội',   'sv9@univ.edu',  'L01', '0960000009', '', 'Hoạt động'),
('20000010', 'CNTT Sinh 10', '10/06/2002', 'Nam', 'Hà Nội',   'sv10@univ.edu', 'L01', '0960000010', '', 'Hoạt động'),
('20000011', 'CNTT Sinh 11', '11/06/2002', 'Nữ',  'Hà Nội',   'sv11@univ.edu', 'L01', '0960000011', '', 'Hoạt động'),
('20000012', 'CNTT Sinh 12', '12/06/2002', 'Nam', 'Hà Nội',   'sv12@univ.edu', 'L01', '0960000012', '', 'Hoạt động'),
('20000013', 'CNTT Sinh 13', '13/06/2002', 'Nữ',  'Hà Nội',   'sv13@univ.edu', 'L01', '0960000013', '', 'Hoạt động'),
('20000014', 'CNTT Sinh 14', '14/06/2002', 'Nam', 'Hà Nội',   'sv14@univ.edu', 'L01', '0960000014', '', 'Hoạt động'),
('20000015', 'CNTT Sinh 15', '15/06/2002', 'Nữ',  'Hà Nội',   'sv15@univ.edu', 'L01', '0960000015', '', 'Hoạt động'),

-- Mỗi ngành khác (N02..N05) thêm 2 SV
('20000016', 'Kinh tế Sinh 01', '16/06/2002', 'Nam', 'Hải Phòng', 'sv16@univ.edu', 'L02', '0970000016', '', 'Hoạt động'),
('20000017', 'Kinh tế Sinh 02', '17/06/2002', 'Nữ',  'Hải Phòng', 'sv17@univ.edu', 'L02', '0970000017', '', 'Hoạt động'),

('20000018', 'Sinh học Sinh 01','18/06/2002', 'Nam', 'Nam Định',  'sv18@univ.edu', 'L03', '0970000018', '', 'Hoạt động'),
('20000019', 'Sinh học Sinh 02','19/06/2002', 'Nữ',  'Nam Định',  'sv19@univ.edu', 'L03', '0970000019', '', 'Hoạt động'),

('20000020', 'TA Sinh 01',      '20/06/2002', 'Nam', 'Thái Bình', 'sv20@univ.edu', 'L04', '0970000020', '', 'Hoạt động'),
('20000021', 'TA Sinh 02',      '21/06/2002', 'Nữ',  'Thái Bình', 'sv21@univ.edu', 'L04', '0970000021', '', 'Hoạt động'),

('20000022', 'MT Sinh 01',      '22/06/2002', 'Nam', 'Nghệ An',   'sv22@univ.edu', 'L05', '0970000022', '', 'Hoạt động'),
('20000023', 'MT Sinh 02',      '23/06/2002', 'Nữ',  'Nghệ An',   'sv23@univ.edu', 'L05', '0970000023', '', 'Hoạt động');

-- ====================================================
-- 7) tblHocPhan
--    - Giữ 5 học phần cũ
--    - Thêm 3 học phần mới cho N01: HP06, HP07, HP08
-- ====================================================
INSERT INTO tblHocPhan (MaHocPhan, TenHocPhan, SoTinChi, HocKy, MaNganh, MoTaHocPhan) VALUES
('HP01', 'Lập trình Java',     3, 1, 'N01', 'Học phần Java'),
('HP02', 'Kinh tế vi mô',      3, 1, 'N02', 'Học phần Kinh tế'),
('HP03', 'Sinh học đại cương', 3, 1, 'N03', 'Học phần Sinh học'),
('HP04', 'Tiếng Anh cơ bản',   3, 1, 'N04', 'Học phần Tiếng Anh'),
('HP05', 'Quản lý môi trường', 3, 1, 'N05', 'Học phần Môi trường'),
-- 3 học phần mới cho CNTT (N01)
('HP06', 'Cấu trúc dữ liệu',   3, 2, 'N01', 'Cấu trúc dữ liệu & giải thuật'),
('HP07', 'Cơ sở dữ liệu',      3, 2, 'N01', 'Thiết kế & truy vấn CSDL'),
('HP08', 'Mạng máy tính',      3, 3, 'N01', 'Nguyên lý mạng máy tính');

-- ====================================================
-- 8) tblLopHocPhan
--    - Giữ 5 lớp học phần cũ
--    - Thêm 3 lớp học phần mới cho HP06..HP08 (N01)
-- ====================================================
INSERT INTO tblLopHocPhan (MaLopHocPhan, TenLopHocPhan, MaHocPhan, MSGV, SoBuoi, SoTiet, SoTuanHoc, ThuTiet, PhongHoc, ThoiGianBatDau, ThoiGianKetThuc, ThoiGianHoc, SoLuongToiDa, TrangThaiLopHocPhan) VALUES
('LHP01', 'Lớp Java 1',       'HP01', '10000001', 15, 45, '15', '2-4-6', 'A101', '01/09/2023', '15/12/2023', '7:00-9:00',   50, 'Đang mở'),
('LHP02', 'Lớp Kinh tế 1',    'HP02', '10000002', 15, 45, '15', '3-5-7', 'B201', '02/09/2023', '16/12/2023', '9:00-11:00',  50, 'Đang mở'),
('LHP03', 'Lớp Sinh học 1',   'HP03', '10000003', 15, 45, '15', '2-4-6', 'C301', '03/09/2023', '17/12/2023', '13:00-15:00', 50, 'Đang mở'),
('LHP04', 'Lớp Tiếng Anh 1',  'HP04', '10000004', 15, 45, '15', '3-5-7', 'D401', '04/09/2023', '18/12/2023', '15:00-17:00', 50, 'Đang mở'),
('LHP05', 'Lớp Môi trường 1', 'HP05', '10000005', 15, 45, '15', '2-4-6', 'E501', '05/09/2023', '19/12/2023', '17:00-19:00', 50, 'Đang mở'),
-- 3 lớp học phần mới cho CNTT (N01)
('LHP06', 'Lớp CTDL 1',       'HP06', '10000001', 15, 45, '15', '2-4-6', 'A102', '06/09/2023', '20/12/2023', '7:00-9:00',   60, 'Đang mở'),
('LHP07', 'Lớp CSDL 1',       'HP07', '10000001', 15, 45, '15', '3-5-7', 'A103', '07/09/2023', '21/12/2023', '9:00-11:00',  60, 'Đang mở'),
('LHP08', 'Lớp Mạng MT 1',    'HP08', '10000001', 15, 45, '15', '2-4-6', 'A104', '08/09/2023', '22/12/2023', '13:00-15:00', 60, 'Đang mở');

-- ====================================================
-- 9) tblDangKyHocPhan (giữ nguyên 5 mẫu ban đầu)
--    (Nếu cần DKHP cho SV mới, mình sẽ thêm theo yêu cầu)
-- ====================================================
INSERT INTO tblDangKyHocPhan (MaDangKyHocPhan, MSSV, MaLopHocPhan, NgayDangKy, TrangThaiDangKyHocPhan) VALUES
('DKHP01', '20000001', 'LHP01', '01/09/2023', 'Đã đăng ký'),
('DKHP02', '20000002', 'LHP02', '02/09/2023', 'Đã đăng ký'),
('DKHP03', '20000003', 'LHP03', '03/09/2023', 'Đã đăng ký'),
('DKHP04', '20000004', 'LHP04', '04/09/2023', 'Đã đăng ký'),
('DKHP05', '20000005', 'LHP05', '05/09/2023', 'Đã đăng ký');

-- ====================================================
-- 10) tblDiemLopHocPhan (giữ nguyên)
-- ====================================================
INSERT INTO tblDiemLopHocPhan (MaDiemLopHocPhan, MaDangKyHocPhan, DiemQuaTrinh, DiemThi, DiemTongKet, XepLoai) VALUES
('DLP01', 1, 8.0, 7.5, 7.8, 'Giỏi'),
('DLP02', 2, 7.0, 6.5, 6.8, 'Khá'),
('DLP03', 3, 9.0, 8.5, 8.8, 'Giỏi'),
('DLP04', 4, 6.0, 5.5, 5.8, 'Trung bình'),
('DLP05', 5, 5.0, 4.5, 4.8, 'Yếu');

-- ====================================================
-- 11) tblDiemDanh (giữ nguyên)
-- ====================================================
INSERT INTO tblDiemDanh (MaDiemDanh, MaDangKyHocPhan, ChuoiDiemDanh, GhiChu) VALUES
('DD01', 1, '11011', 'Đủ'),
('DD02', 2, '11101', 'Đủ'),
('DD03', 3, '10111', 'Đủ'),
('DD04', 4, '11110', 'Thiếu 1 buổi'),
('DD05', 5, '11111', 'Đủ');

-- ====================================================
-- 12) tblTaiKhoan
--     - Rút ngắn MaNguoiDung còn 3 số
--     - Mỗi sinh viên có 1 tài khoản (23 SV)
--     - GV & Admin cũng có tài khoản
--     - Mật khẩu mặc định '1'
-- ====================================================

-- Admin
INSERT INTO tblTaiKhoan (MaNguoiDung, MatKhau, ChucVu, TrangThaiTaiKhoan) VALUES
('00000001', '1', 'admin', 'Hoạt động');

-- Giảng viên (giữ nguyên 3 số cuối như trước)
INSERT INTO tblTaiKhoan (MaNguoiDung, MatKhau, ChucVu, TrangThaiTaiKhoan) VALUES
('10000001', '1', 'giangvien', 'Hoạt động'), -- 10000001
('10000002', '1', 'giangvien', 'Hoạt động'), -- 10000002
('10000003', '1', 'giangvien', 'Hoạt động'), -- 10000003
('10000004', '1', 'giangvien', 'Hoạt động'), -- 10000004
('10000005', '1', 'giangvien', 'Hoạt động'); -- 10000005

-- Sinh viên (MaNguoiDung = MSSV đầy đủ)
INSERT INTO tblTaiKhoan (MaNguoiDung, MatKhau, ChucVu, TrangThaiTaiKhoan) VALUES
('20000001', '1', 'sinhvien', 'Hoạt động'),
('20000002', '1', 'sinhvien', 'Hoạt động'),
('20000003', '1', 'sinhvien', 'Hoạt động'),
('20000004', '1', 'sinhvien', 'Hoạt động'),
('20000005', '1', 'sinhvien', 'Hoạt động'),
('20000006', '1', 'sinhvien', 'Hoạt động'),
('20000007', '1', 'sinhvien', 'Hoạt động'),
('20000008', '1', 'sinhvien', 'Hoạt động'),
('20000009', '1', 'sinhvien', 'Hoạt động'),
('20000010', '1', 'sinhvien', 'Hoạt động'),
('20000011', '1', 'sinhvien', 'Hoạt động'),
('20000012', '1', 'sinhvien', 'Hoạt động'),
('20000013', '1', 'sinhvien', 'Hoạt động'),
('20000014', '1', 'sinhvien', 'Hoạt động'),
('20000015', '1', 'sinhvien', 'Hoạt động'),
('20000016', '1', 'sinhvien', 'Hoạt động'),
('20000017', '1', 'sinhvien', 'Hoạt động'),
('20000018', '1', 'sinhvien', 'Hoạt động'),
('20000019', '1', 'sinhvien', 'Hoạt động'),
('20000020', '1', 'sinhvien', 'Hoạt động'),
('20000021', '1', 'sinhvien', 'Hoạt động'),
('20000022', '1', 'sinhvien', 'Hoạt động'),
('20000023', '1', 'sinhvien', 'Hoạt động');


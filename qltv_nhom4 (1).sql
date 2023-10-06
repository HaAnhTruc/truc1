-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 15, 2023 lúc 06:03 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qltv_nhom4`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietmuontra`
--

CREATE TABLE `chitietmuontra` (
  `SoPM` varchar(20) NOT NULL,
  `MaSach` varchar(20) NOT NULL,
  `SoLuong` int(11) NOT NULL,
  `TinhTrang` int(11) NOT NULL,
  `NgayTra` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietmuontra`
--

INSERT INTO `chitietmuontra` (`SoPM`, `MaSach`, `SoLuong`, `TinhTrang`, `NgayTra`) VALUES
('PM001', 'S001', 2, 0, NULL),
('PM001', 'S002', 1, 1, '2022-05-15'),
('PM002', 'S001', 1, 0, NULL),
('PM002', 'S003', 3, 1, '2022-05-15'),
('PM002', 'S005', 1, 2, '2022-06-01'),
('PM003', 'S004', 2, 31, '2022-06-01'),
('PM004', 'S002', 1, 0, NULL),
('PM005', 'S006', 3, 1, '2022-05-25'),
('PM006', 'S007', 1, 2, '2022-06-21'),
('PM007', 'S005', 2, 0, NULL),
('PM008', 'S008', 1, 1, '2022-05-29'),
('PM009', 'S002', 1, 1, '2022-04-15'),
('PM010', 'S009', 2, 0, NULL),
('PM010', 'S010', 1, 0, NULL),
('PM010', 'S011', 3, 32, '2022-03-15'),
('PM010', 'S012', 1, 1, '2022-03-15'),
('PM010', 'S013', 2, 0, NULL),
('PM010', 'S014', 1, 1, '2022-04-01'),
('PM010', 'S015', 3, 2, '2022-04-01'),
('PM010', 'S016', 1, 1, '2022-04-01'),
('PM011', 'S001', 2, 0, NULL),
('PM011', 'S003', 3, 0, NULL),
('PM011', 'S007', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietnhapsach`
--

CREATE TABLE `chitietnhapsach` (
  `MaNhap` varchar(20) NOT NULL,
  `MaSach` varchar(20) NOT NULL,
  `SoLuong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietnhapsach`
--

INSERT INTO `chitietnhapsach` (`MaNhap`, `MaSach`, `SoLuong`) VALUES
('N002', 'S001', 12),
('N002', 'S002', 34),
('N002', 'S003', 23),
('N003', 'S001', 24),
('N003', 'S002', 199),
('N003', 'S003', 234),
('N003', 'S004', 786),
('N003', 'S005', 234),
('N004', 'S001', 300),
('N004', 'S002', 199),
('N004', 'S003', 234),
('N004', 'S004', 786),
('N004', 'S005', 234);

--
-- Bẫy `chitietnhapsach`
--
DELIMITER $$
CREATE TRIGGER `update_soluong` AFTER INSERT ON `chitietnhapsach` FOR EACH ROW BEGIN
    UPDATE sach
    SET soluong = soluong + NEW.soluong
    WHERE masach = NEW.masach;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `docgia`
--

CREATE TABLE `docgia` (
  `MaDG` varchar(20) NOT NULL,
  `TenDG` varchar(100) NOT NULL,
  `NgaySinh` date NOT NULL,
  `GioiTinh` varchar(5) NOT NULL,
  `DienThoai` varchar(15) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `HanDung` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `docgia`
--

INSERT INTO `docgia` (`MaDG`, `TenDG`, `NgaySinh`, `GioiTinh`, `DienThoai`, `Email`, `HanDung`) VALUES
('DG001', 'Nguyễn Thị Hương', '1996-05-22', 'Nữ', '0905123456', 'huongnguyen@gmail.com', '2022-12-31'),
('DG002', 'Trần Văn Nam', '1994-11-15', 'Nam', '0987654321', 'namtran@gmail.com', '2023-06-30'),
('DG003', 'Lê Thị Tuyết', '1982-02-12', 'Nữ', '0912345678', 'tuyetle@gmail.com', '2024-03-31'),
('DG004', 'Phạm Văn Đức', '1999-07-05', 'Nam', '0978123456', 'ducpv@gmail.com', '2025-01-31'),
('DG005', 'Nguyễn Đình Tuấ', '1986-12-30', 'Nam', '0908888888', 'tuandn@gmail.com', '2022-12-31'),
('DG006', 'Trần Thị Thanh', '1991-11-20', 'Nữ', '0912345678', 'thanhttran@gmail.com', '2022-10-31'),
('DG007', 'Phạm Đức Anh', '1987-04-25', 'Nam', '0987654321', 'anhpd@gmail.com', '2023-09-30'),
('DG008', 'Lê Thị Minh A', '1998-06-30', 'Nữ', '0978123456', 'anhltm@gmail.com', '2025-05-31'),
('DG009', 'Nguyễn Văn Trường', '1989-08-15', 'Nam', '0908888888', 'truongnv@gmail.com', '2024-04-30'),
('DG010', 'Lê Thị Hồng', '1995-03-10', 'Nữ', '0912345678', 'honglt@gmail.com', '2023-05-30'),
('DG011', 'Nguyễn Văn Hoàng', '1992-09-07', 'Nam', '0987654321', 'hoangnv@gmail.com', '2023-07-30'),
('DG012', 'Trần Thị Minh Nguyệt', '2000-01-01', 'Nữ', '0978123456', 'nguyetttm@gmail.com', '2023-08-30'),
('DG013', 'Phạm Văn Thành', '1985-05-15', 'Nam', '0908888888', 'thanhpv@gmail.com', '2024-05-31'),
('DG014', 'Nguyễn Thị Phương Anh', '1999-10-20', 'Nữ', '0912345678', 'anhntp@gmail.com', '2025-03-31'),
('DG015', 'Lê Văn Tùng', '1993-06-12', 'Nam', '0987654321', 'tunglv@gmail.com', '2023-09-30'),
('DG016', 'Phan Thị Thu Hương', '1990-03-27', 'Nữ', '0978123456', 'huongptt@gmail.com', '2024-01-31'),
('DG017', 'Nguyễn Văn Đức', '1988-12-01', 'Nam', '0908888888', 'ducnv@gmail.com', '2023-11-30'),
('DG018', 'Lê Thị Hạnh', '1996-01-10', 'Nữ', '0912345678', 'hanhlt@gmail.com', '2025-04-30'),
('DG019', 'Phạm Văn Hùng', '1994-08-05', 'Nam', '0987654321', 'hungpv@gmail.com', '2022-10-31'),
('DG020', 'Nguyễn Thị Mai', '1997-05-18', 'Nữ', '0978123456', 'maint@gmail.com', '2023-12-31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MaNV` varchar(20) NOT NULL,
  `HoTen` varchar(100) NOT NULL,
  `GioiTinh` varchar(5) NOT NULL,
  `NgaySinh` date NOT NULL,
  `DiaChi` varchar(200) NOT NULL,
  `DienThoai` varchar(15) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `ChucVu` varchar(50) NOT NULL,
  `NgayVaoLam` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`MaNV`, `HoTen`, `GioiTinh`, `NgaySinh`, `DiaChi`, `DienThoai`, `Email`, `ChucVu`, `NgayVaoLam`) VALUES
('NV001', 'Nguyễn Thị Minh Hạnh', 'Nữ', '1990-08-12', 'Hà Nội', '0987654321', 'hanhntm@gmail.com', 'Thủ Thư', '2023-03-20'),
('NV0010', 'Lê Thị Hạnhfwef2323', 'Nam', '1996-01-04', 'Hưng Yê', '09123456783r', 'hanhlt@gmail.com', 'Thủ Thư', '2023-03-01'),
('NV002', 'Lê Văn Quâ', 'Nam', '1993-01-21', 'Hà Nam', '0978123456', 'quanlv@gmail.com', 'Quản Lý', '2023-01-12'),
('NV003', 'Phạm Văn Đức', 'Nam', '1988-07-01', 'Hưng Yê', '0908888888', 'ducpv@gmail.com', 'Thủ Thư', '2023-03-19'),
('NV004', 'Trần Thị Mai', 'Nữ', '1995-05-18', 'Hà Nội', '0912345678', 'maitt@gmail.com', 'Thủ Thư', '2023-03-20'),
('NV005', 'Nguyễn Văn Hùng', 'Nam', '1994-08-05', 'Nam Định', '0987654321', 'hungnv@gmail.com', 'Quản Lý', '2023-01-12'),
('NV006', 'Phan Thị Thu Hương', 'Nữ', '1990-03-27', 'Hà Nam', '0978123456', 'huongptt@gmail.com', 'Thủ Thư', '2023-02-01'),
('NV007', 'Lê Thị Hạnh', 'Nữ', '1996-01-10', 'Hưng Yê', '09123456786', 'hanhlt@gmail.com', 'Thủ Thư', '2023-03-01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhapsach`
--

CREATE TABLE `nhapsach` (
  `MaNhap` varchar(20) NOT NULL,
  `MaNV` varchar(20) NOT NULL,
  `NgayNhap` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhapsach`
--

INSERT INTO `nhapsach` (`MaNhap`, `MaNV`, `NgayNhap`) VALUES
('N001', 'NV001', '2023-04-20'),
('N002', 'NV001', '2023-06-14'),
('N003', 'NV001', '2023-06-14'),
('N004', 'NV001', '2023-06-14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhaxuatban`
--

CREATE TABLE `nhaxuatban` (
  `MaNXB` varchar(20) NOT NULL,
  `TenNXB` varchar(200) NOT NULL,
  `DiaChi` varchar(150) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `DienThoai` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `nhaxuatban`
--

INSERT INTO `nhaxuatban` (`MaNXB`, `TenNXB`, `DiaChi`, `Email`, `DienThoai`) VALUES
('NXB001', 'Nhà xuất bản Kim Đồng', 'Hà Nội', 'info@kimdong.com.v', '024.3791.2020'),
('NXB002', 'Nhà xuất bản Trẻ', 'Hồ Chí Minh', 'info@nxbtre.com.v', '028.3838.6161'),
('NXB003', 'Nhà xuất bản Đại Học Quốc Gia', 'Hà Nội', 'info@nhaxuatbandhqg.com.v', '024.3754.7454'),
('NXB004', 'Nhà xuất bản Văn Học', 'Hồ Chí Minh', 'info@nxbvanhoc.com.v', '028.3837.5717'),
('NXB005', 'Nhà xuất bản Phụ Nữ', 'Hà Nội', 'info@nxbphunu.com.v', '024.3851.8106'),
('NXB006', 'Nhà xuất bản Tri Thức', 'Hồ Chí Minh', 'info@nxbtrithuc.com.v', '028.3848.5333'),
('NXB007', 'Nhà xuất bản Nhân Vă', 'Hà Nội', 'info@nxbnhanvan.com.v', '024.3733.8342'),
('NXB008', 'Nhà xuất bản Thanh Niê', 'Hồ Chí Minh', 'info@nxbthanhnien.com.v', '028.3933.3030'),
('NXB009', 'Nhà xuất bản Hội Nhà Vă', 'Hà Nội', 'info@hoinghavan.v', '024.3822.3549'),
('NXB010', 'Nhà xuất bản Tổng hợp TP.HCM', 'Hồ Chí Minh', 'info@nxbthanhphohcm.com.v', '028.3822.4615'),
('NXB011', 'Nhà xuất bản Triệu Yếu', 'Hà Nội', 'info@nxbtrieuyeu.com.v', '024.3928.3193'),
('NXB012', 'Nhà xuất bản Văn Lang', 'Hồ Chí Minh', 'info@nxbvanlang.com.v', '028.3824.5271'),
('NXB013', 'Nhà xuất bản Thái Hà', 'Hà Nội', 'info@nxbthaiha.com.v', '024.3733.1777'),
('NXB014', 'Nhà xuất bản Văn Mới', 'Hồ Chí Minh', 'info@nxbvanmoi.com.v', '028.3849.2231'),
('NXB015', 'Nhà xuất bản Dân Trí', 'Hà Nội', 'info@nxbdantri.com.v', '024.3759.1315'),
('NXB016', 'Nhà xuất bản Tri Thức Trẻ', 'Hồ Chí Minh', 'info@nxbtrithuctre.com.v', '028.3847.6789'),
('NXB017', 'Nhà xuất bản Chính Trị Quốc Gia', 'Hà Nội', 'info@nxbchinhtri.com.v', '024.3836.2049'),
('NXB018', 'Nhà xuất bản Văn Hóa - Văn Nghệ', 'Hồ Chí Minh', 'info@nxbvanhoavannghemtp.com.v', '028.3847.1677'),
('NXB019', 'Nhà xuất bản Thanh Niên TP.HCM', 'Hồ Chí Minh', 'info@nxbthanhnientphcm.com.v', '028.3930.0240'),
('NXB020', 'Nhà xuất bản Giáo Dục', 'Hà Nội', 'info@nxbgiaoduc.com.v', '024.3834.2562');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieumuon`
--

CREATE TABLE `phieumuon` (
  `SoPM` varchar(20) NOT NULL,
  `MaDG` varchar(20) NOT NULL,
  `MaNV` varchar(20) NOT NULL,
  `NgayMuon` date NOT NULL,
  `HanTra` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `phieumuon`
--

INSERT INTO `phieumuon` (`SoPM`, `MaDG`, `MaNV`, `NgayMuon`, `HanTra`) VALUES
('PM001', 'DG001', 'NV001', '2023-05-15', '2023-05-29'),
('PM002', 'DG002', 'NV002', '2023-05-16', '2023-05-30'),
('PM003', 'DG003', 'NV003', '2023-05-17', '2023-05-31'),
('PM004', 'DG004', 'NV004', '2023-05-18', '2023-06-01'),
('PM005', 'DG001', 'NV005', '2023-05-19', '2023-06-02'),
('PM006', 'DG006', 'NV006', '2023-05-20', '2023-06-03'),
('PM007', 'DG001', 'NV007', '2023-05-21', '2023-06-04'),
('PM008', 'DG008', 'NV003', '2023-05-22', '2023-06-05'),
('PM009', 'DG009', 'NV005', '2023-05-23', '2023-06-06'),
('PM010', 'DG010', 'NV001', '2023-05-24', '2023-06-07'),
('PM011', 'DG001', 'NV001', '2023-06-15', '2023-06-30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sach`
--

CREATE TABLE `sach` (
  `MaSach` varchar(20) NOT NULL,
  `TenSach` varchar(200) NOT NULL,
  `MaTL` varchar(50) NOT NULL,
  `TacGia` varchar(150) DEFAULT NULL,
  `MaNXB` varchar(20) NOT NULL,
  `NamXB` varchar(5) DEFAULT NULL,
  `SoLuong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sach`
--

INSERT INTO `sach` (`MaSach`, `TenSach`, `MaTL`, `TacGia`, `MaNXB`, `NamXB`, `SoLuong`) VALUES
('S001', 'Dế Mèn Phiêu Lưu Ký', 'TL006', 'Tô Hoài', 'NXB001', '2020', 0),
('S002', 'Tôi Thấy Hoa Vàng Trên Cỏ Xanh', 'TL016', 'Nguyễn Nhật Ánh', 'NXB002', '2005', 279),
('S003', 'Đắc Nhân Tâm', 'TL013', 'Dale Carnegie', 'NXB003', '1936', 354),
('S004', 'Nhà Giả Kim', 'TL014', 'Paulo Coelho', 'NXB004', '1988', 876),
('S005', 'Harry Potter và Hòn Đá Phù Thủy', 'TL014', 'J.K. Rowling', 'NXB005', '1997', 384),
('S006', 'Sống Để Hưởng Thụ', 'TL012', 'Robert Kiyosaki', 'NXB006', '2013', 110),
('S007', 'Tiếng Gọi Nơi Hoang Dã', 'TL016', 'Jack Londo', 'NXB007', '1903', 70),
('S008', 'Người Mẹ Của Chúng Ta', 'TL010', 'Nguyễn Ngọc Tư', 'NXB008', '2015', 100),
('S009', 'Bí Mật Của Sự Thành Công', 'TL013', 'T. Harv Eker', 'NXB009', '2005', 85),
('S010', 'Đại Cương Về Hạt Nhân Vật Lý', 'TL014', 'David J. Griffiths', 'NXB010', '1987', 60),
('S011', 'Đường Xưa Mây Trắng', 'TL016', 'Nguyễn Nhật Ánh', 'NXB011', '2003', 75),
('S012', 'Sức Mạnh Tiềm Thức', 'TL013', 'Joseph Murphy', 'NXB012', '1963', 95),
('S013', 'Đàn Bà Là Số Một', 'TL010', 'Nancy Friday', 'NXB013', '1973', 110),
('S014', 'Tuổi Trẻ Đáng Giá Bao Nhiêu', 'TL012', 'Rosie Nguyễ', 'NXB014', '2018', 80),
('S015', 'Hai số phậ', 'TL016', 'Phan Việt', 'NXB015', '2011', 90),
('S016', 'Nắng Và Đất', 'TL016', 'Nguyễn Ngọc Thuầ', 'NXB016', '2008', 70),
('S017', 'Con Chim Xanh Biếc Bay Về', 'TL006', 'Edward van de Vendel', 'NXB017', '2005', 85),
('S018', 'Những Điều Kỳ Diệu Của Sự Bình Thường', 'TL009', 'R.J. Palacio', 'NXB018', '2012', 100),
('S019', 'Bí Mật Tư Duy Triệu Phú', 'TL013', 'T. Harv Eker', 'NXB019', '2005', 120),
('S020', 'Toán Học Vui', 'TL014', 'Vũ Dinh Hổ', 'NXB020', '2000', 80),
('S021', 'werwerfef', 'TL010', 'ihafhowf', 'NXB018', '2045', 0),
('S022', 'werwerfeff2r3', 'TL010', 'ihafhowf', 'NXB018', '2045', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `TaiKhoan` varchar(50) NOT NULL,
  `MatKhau` varchar(50) NOT NULL,
  `MaNV` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`TaiKhoan`, `MatKhau`, `MaNV`) VALUES
('aaa', '123', 'NV002'),
('admin', '123', 'NV001'),
('TKNV003', 'MKNV003', 'NV003'),
('TKNV004', 'MKNV004', 'NV004'),
('TKNV005', 'MKNV005', 'NV005'),
('TKNV006', 'MKNV006', 'NV006'),
('TKNV007', 'MKNV007', 'NV007');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `theloai`
--

CREATE TABLE `theloai` (
  `MaTL` varchar(5) NOT NULL,
  `TenTL` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `theloai`
--

INSERT INTO `theloai` (`MaTL`, `TenTL`) VALUES
('TL001', 'Giáo trình'),
('TL002', 'Sách nghiệp vụ Giáo viê'),
('TL003', 'Sách tham khảo'),
('TL004', 'Khoa học tự nhiê'),
('TL005', 'Khoa học xã hội'),
('TL006', 'Văn học - nghệ thuật'),
('TL007', 'Kỹ thuật'),
('TL008', 'Báo, tạp chí'),
('TL009', 'Chính trị'),
('TL010', 'Giáo dục'),
('TL011', 'Văn hóa - Lịch sử'),
('TL012', 'Kinh tế'),
('TL013', 'Chính trị - Pháp luật'),
('TL014', 'Tâm lý học'),
('TL015', 'Khoa học - công nghệ'),
('TL016', 'Văn học'),
('TL017', 'afwefw');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `docgia`
--
ALTER TABLE `docgia`
  ADD PRIMARY KEY (`MaDG`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MaNV`);

--
-- Chỉ mục cho bảng `nhapsach`
--
ALTER TABLE `nhapsach`
  ADD PRIMARY KEY (`MaNhap`);

--
-- Chỉ mục cho bảng `nhaxuatban`
--
ALTER TABLE `nhaxuatban`
  ADD PRIMARY KEY (`MaNXB`);

--
-- Chỉ mục cho bảng `phieumuon`
--
ALTER TABLE `phieumuon`
  ADD PRIMARY KEY (`SoPM`);

--
-- Chỉ mục cho bảng `sach`
--
ALTER TABLE `sach`
  ADD PRIMARY KEY (`MaSach`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`TaiKhoan`);

--
-- Chỉ mục cho bảng `theloai`
--
ALTER TABLE `theloai`
  ADD PRIMARY KEY (`MaTL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

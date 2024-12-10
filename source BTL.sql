/*-----------------------------------------Tạo các bảng cơ sở dữ liệu academic_management-----------------*/
CREATE DATABASE academic_management;
--@block

-- Sử dụng cơ sở dữ liệu academic_management
USE academic_management;
--@block

-- Tạo bảng Khoa
CREATE TABLE Khoa (
    MaKhoa INT PRIMARY KEY,
    TenKhoa VARCHAR(100)
);
--@block

-- Tạo bảng Giảng viên
CREATE TABLE GiangVien (
    MaGiangVien INT PRIMARY KEY,
    HoTen VARCHAR(100),
    ChucDanh VARCHAR(50),
    TrinhDo VARCHAR(50),
    SoDienThoai VARCHAR(15),
    MaKhoa INT,
    FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa)
);
--@block

-- Tạo bảng Chương trình học
CREATE TABLE ChuongTrinhHoc (
    MaChuongTrinh VARCHAR(2) PRIMARY KEY,
    TongSoTinChi INT,
    ChuanNgoaiNguTotNghiep VARCHAR(100),
    ChuanCongTacXaHoi VARCHAR(100)
);
--@block

-- Tạo bảng Sinh viên
CREATE TABLE SinhVien (
    MaSinhVien INT PRIMARY KEY,
    HoVaTen VARCHAR(100),
    NgaySinh DATE,
    SoDienThoai VARCHAR(15),
    Khoa INT,
    GioiTinh VARCHAR(10),
    Email VARCHAR(100),
    MaKhoa INT,
    MaChuongTrinh VARCHAR(2),
    FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa),
    FOREIGN KEY (MaChuongTrinh) REFERENCES ChuongTrinhHoc(MaChuongTrinh)
);
--@block

-- Tạo bảng Môn học
CREATE TABLE MonHoc (
    MaMonHoc VARCHAR(20) PRIMARY KEY,
    TenMonHoc VARCHAR(100),
    MoTa TEXT,
    SoTinChi INT,
    GiangVienPhuTrach VARCHAR(100),
    Loai VARCHAR(50)   
);
--@block

-- Tạo bảng Gồm (Mối quan hệ giữa Chương trình học và Môn học)
CREATE TABLE Gom (
    MaChuongTrinh VARCHAR(2),
    MaMonHoc VARCHAR(20),
    PRIMARY KEY (MaChuongTrinh, MaMonHoc),
    FOREIGN KEY (MaChuongTrinh) REFERENCES ChuongTrinhHoc(MaChuongTrinh),
    FOREIGN KEY (MaMonHoc) REFERENCES MonHoc(MaMonHoc)
);
--@block

-- Tạo bảng Đăng ký
CREATE TABLE DangKy (
    MaSinhVien INT,
    MaMonHoc VARCHAR(20),
    MaHocKi VARCHAR(10),
    TrangThai VARCHAR(50),
    Diem FLOAT,
    PRIMARY KEY (MaSinhVien, MaMonHoc),
    FOREIGN KEY (MaSinhVien) REFERENCES SinhVien(MaSinhVien),
    FOREIGN KEY (MaMonHoc) REFERENCES MonHoc(MaMonHoc)
);
--@block

-- Tạo bảng Phụ trách
CREATE TABLE PhuTrach (
    MaGiangVien INT,
    MaMonHoc VARCHAR(20),
    ThoiGianDay TIME,
    DiaDiemDay VARCHAR(100),
    HocKi VARCHAR(10),
    PRIMARY KEY (MaGiangVien, MaMonHoc),
    FOREIGN KEY (MaGiangVien) REFERENCES GiangVien(MaGiangVien),
    FOREIGN KEY (MaMonHoc) REFERENCES MonHoc(MaMonHoc)
);

--@block
/*-----------------------------------------------------------Thêm dummy ----------------------------------*/
-- Thêm dữ liệu mẫu vào bảng Khoa
INSERT INTO Khoa (MaKhoa, TenKhoa) VALUES
(1, 'Khoa Cơ khí'),
(2, 'Khoa Công nghệ Vật liệu'),
(3, 'Khoa Điện,Điện tử'),
(4, 'Khoa Khoa học Ứng dụng'),
(5, 'Khoa Khoa học và Kỹ thuật Máy tính'),
(6, 'Khoa Kỹ thuật Địa chất và Dầu khí'),
(7, 'Khoa Kỹ thuật Giao thông'),
(8, 'Khoa Kỹ thuật Hóa học'),
(9, 'Khoa Kỹ thuật Xây dựng'),
(10, 'Khoa Môi trường và Tài nguyên'),
(11, 'Khoa Quản lý Công nghiệp');

--@block

-- Thêm dữ liệu mẫu vào bảng Giảng viên
INSERT INTO GiangVien (MaGiangVien, HoTen, ChucDanh, TrinhDo, SoDienThoai, MaKhoa) VALUES
(3353123, 'Nguyễn Văn Hùng', 'Giảng viên', 'Tiến sĩ', '0987654321', 1),
(3353789, 'Trần Thị Lan', 'Phó Khoa', 'Thạc sĩ', '0912345678', 2),
(3354123, 'Phạm Minh Tuấn', 'Trưởng Khoa', 'Giáo sư', '0981234567', 3),
(3354892, 'Lê Thị Thu', 'Giảng viên', 'Tiến sĩ', '0977654321', 4),
(3355321, 'Vũ Văn Bình', 'Phó Khoa', 'Thạc sĩ', '0965432109', 5),
(3356322, 'Nguyễn Thị Hòa', 'Trưởng Khoa', 'Tiến sĩ', '0932156789', 6),
(3357213, 'Đỗ Minh Khang', 'Giảng viên', 'Thạc sĩ', '0913456789', 7),
(3358314, 'Trịnh Thị Vân', 'Phó Khoa', 'Giáo sư', '0909876543', 8),
(3359132, 'Lý Văn Nam', 'Trưởng Khoa', 'Thạc sĩ', '0923456781', 9),
(3360214, 'Nguyễn Văn Khánh', 'Giảng viên', 'Tiến sĩ', '0977654312', 10),
(3361315, 'Hoàng Thị Ngọc', 'Phó Khoa', 'Thạc sĩ', '0934789123', 11),
(3362431, 'Trần Văn Hoàng', 'Trưởng Khoa', 'Tiến sĩ', '0923451234', 1),
(3363123, 'Lê Minh Đức', 'Giảng viên', 'Giáo sư', '0967891234', 2),
(3364892, 'Phạm Thị Dung', 'Phó Khoa', 'Tiến sĩ', '0912348765', 3),
(3365321, 'Đào Văn Hùng', 'Trưởng Khoa', 'Thạc sĩ', '0903459876', 4),
(3366322, 'Võ Thị Hằng', 'Giảng viên', 'Tiến sĩ', '0985432109', 5),
(3367213, 'Trương Minh Quân', 'Phó Khoa', 'Giáo sư', '0978765432', 6),
(3368314, 'Mai Thị Hoa', 'Trưởng Khoa', 'Tiến sĩ', '0967893452', 7),
(3369132, 'Lê Văn Sơn', 'Giảng viên', 'Thạc sĩ', '0943128765', 8),
(3370214, 'Ngô Minh Hiếu', 'Phó Khoa', 'Tiến sĩ', '0921346578', 9),
(3371315, 'Nguyễn Thị Phương', 'Trưởng Khoa', 'Giáo sư', '0919876543', 10),
(3372431, 'Phan Văn Đạt', 'Giảng viên', 'Tiến sĩ', '0908765432', 11),
(3373123, 'Đặng Thị Trang', 'Phó Khoa', 'Thạc sĩ', '0921345789', 1),
(3374892, 'Hoàng Minh Thái', 'Trưởng Khoa', 'Tiến sĩ', '0987654312', 2),
(3375321, 'Lý Văn Hải', 'Giảng viên', 'Giáo sư', '0934876543', 3),
(3376322, 'Trần Thị Ánh', 'Phó Khoa', 'Thạc sĩ', '0912349876', 4),
(3377213, 'Vũ Văn Trung', 'Trưởng Khoa', 'Tiến sĩ', '0923476512', 5),
(3378314, 'Nguyễn Thị Hồng', 'Giảng viên', 'Giáo sư', '0972345876', 6),
(3379132, 'Hoàng Văn Phúc', 'Phó Khoa', 'Tiến sĩ', '0961346578', 7);



--@block

-- Thêm dữ liệu mẫu vào bảng Chương trình học
INSERT INTO ChuongTrinhHoc (MaChuongTrinh, TongSoTinChi, ChuanNgoaiNguTotNghiep, ChuanCongTacXaHoi) VALUES
('CC', 128, 'IELTS> 6.5', '15 NGÀY CỘNG TÁC XÃ HỘI'),
('CN', 128, 'IELTS >6.0 Và JLPT>N3', '15 NGÀY CỘNG TÁC XÃ HỘI'),
('L', 128, 'Toeic > 600 Hoặc Ielts> 6.0', '15 NGÀY CỘNG TÁC XÃ HỘI');
--@block

-- Thêm dữ liệu mẫu vào bảng Môn học
INSERT INTO MonHoc (MaMonHoc, TenMonHoc, MoTa, SoTinChi, GiangVienPhuTrach, Loai) VALUES
('CO2001', 'Nhập môn Công nghệ thông tin', 'Giới thiệu về CNTT và các ứng dụng', 2, 'Nguyễn Văn Hùng, Trần Thị Lan', 'Đại Cương'),
('CO2002', 'Toán rời rạc', 'Cung cấp kiến thức cơ bản về toán học rời rạc', 3, 'Phạm Minh Tuấn, Lê Thị Thu', 'Cơ Sở Ngành'),
('CO2003', 'Lập trình Java', 'Môn học về lập trình Java căn bản', 3, 'Nguyễn Văn Hùng, Trần Thị Lan', 'Chuyên Ngành'),
('CO2004', 'Cơ sở dữ liệu', 'Cung cấp kiến thức cơ bản về hệ quản trị cơ sở dữ liệu', 2, 'Nguyễn Thị Hòa, Đỗ Minh Khang', 'Cơ Sở Ngành'),
('CO2005', 'Mạng máy tính', 'Giới thiệu về mạng máy tính và giao thức', 3, 'Vũ Văn Bình, Mai Thị Hoa', 'Chuyên Ngành'),
('CO2006', 'Kỹ thuật số', 'Học các khái niệm cơ bản về kỹ thuật số', 2, 'Ngô Minh Hiếu, Hoàng Thị Ngọc', 'Cơ Sở Ngành'),
('CO2007', 'Hệ điều hành', 'Nắm vững các khái niệm và cấu trúc hệ điều hành', 3, 'Trần Văn Hoàng, Lê Minh Đức', 'Chuyên Ngành'),
('CO2008', 'An toàn thông tin', 'Cung cấp kiến thức về bảo mật thông tin', 3, 'Phạm Thị Dung, Đào Văn Hùng', 'Chuyên Ngành'),
('CO2009', 'Lập trình Python', 'Học lập trình cơ bản với ngôn ngữ Python', 2, 'Võ Thị Hằng, Trương Minh Quân', 'Cơ Sở Ngành'),
('CO2010', 'Phát triển phần mềm', 'Giới thiệu quy trình phát triển phần mềm', 3, 'Nguyễn Văn Khánh, Mai Thị Hoa', 'Chuyên Ngành'),
('CO2011', 'Xác suất thống kê', 'Cung cấp kiến thức cơ bản về xác suất', 2, 'Ngô Minh U, Lê Thị Thu', 'Đại Cương'),
('CO2012', 'Kiến trúc máy tính', 'Tìm hiểu cấu trúc và thiết kế máy tính', 3, 'Phan Văn Đạt, Đặng Thị Trang', 'Cơ Sở Ngành'),
('CO2013', 'Lập trình hướng đối tượng', 'Nắm vững kiến thức về lập trình OOP', 3, 'Hoàng Minh Yến, Nguyễn Thị Phương', 'Chuyên Ngành'),
('CO2014', 'Cơ sở lập trình', 'Những khái niệm lập trình cơ bản', 2, 'Trần Thị Ánh, Lý Văn Hải', 'Đại Cương'),
('CO2015', 'Nhập môn AI', 'Cơ bản về trí tuệ nhân tạo', 3, 'Nguyễn Văn Hùng, Hoàng Thị Ngọc', 'Chuyên Ngành'),
('CO2016', 'Học máy', 'Cung cấp kiến thức cơ bản về học máy', 3, 'Lý Văn Nam, Trần Thị Lan', 'Chuyên Ngành'),
('CO2017', 'Thiết kế giao diện', 'Các khái niệm cơ bản về thiết kế giao diện', 2, 'Nguyễn Thị Hòa, Phạm Thị Dung', 'Cơ Sở Ngành'),
('CO2018', 'Khoa học dữ liệu', 'Giới thiệu các khái niệm cơ bản về dữ liệu', 3, 'Nguyễn Văn Khánh, Lê Minh Đức', 'Chuyên Ngành'),
('CO2019', 'Phát triển Web', 'Cung cấp kỹ năng phát triển web cơ bản', 2, 'Ngô Minh Hiếu, Nguyễn Thị Hòa', 'Chuyên Ngành'),
('CO2020', 'Điện toán đám mây', 'Khái niệm và ứng dụng điện toán đám mây', 3, 'Hoàng Văn Phúc, Nguyễn Văn Khánh', 'Chuyên Ngành'),
('CO2021', 'Xử lý tín hiệu', 'Giới thiệu các kỹ thuật xử lý tín hiệu', 2, 'Lê Minh Đức, Trần Văn Hoàng', 'Cơ Sở Ngành'),
('CO2022', 'Phân tích dữ liệu', 'Tìm hiểu phương pháp phân tích dữ liệu', 3, 'Đỗ Minh Khang, Phạm Minh Tuấn', 'Chuyên Ngành'),
('CO2023', 'Lập trình C', 'Học lập trình cơ bản với ngôn ngữ C', 3, 'Nguyễn Thị Hòa, Vũ Văn Bình', 'Cơ Sở Ngành'),
('CO2024', 'Nhập môn Blockchain', 'Giới thiệu công nghệ Blockchain', 2, 'Nguyễn Văn Hùng, Trần Thị Lan', 'Chuyên Ngành'),
('CO2025', 'Điện toán lượng tử', 'Tìm hiểu các khái niệm cơ bản', 3, 'Nguyễn Văn Khánh, Mai Thị Hoa', 'Chuyên Ngành'),
('CO2026', 'Xây dựng hệ thống lớn', 'Cung cấp kiến thức về hệ thống', 3, 'Nguyễn Văn Hùng, Lê Văn Sơn', 'Chuyên Ngành'),
('CO2027', 'Quản trị dự án', 'Giới thiệu các kỹ năng quản lý dự án', 2, 'Ngô Minh Hiếu, Nguyễn Văn Khánh', 'Đại Cương'),
('CO2028', 'Học sâu', 'Tìm hiểu các kỹ thuật học sâu', 3, 'Phạm Thị Dung, Nguyễn Thị Hòa', 'Chuyên Ngành'),
('CO2029', 'Ứng dụng AI', 'Các ứng dụng của trí tuệ nhân tạo', 3, 'Trần Văn Hoàng, Trần Thị Lan', 'Chuyên Ngành'),
('CO2030', 'Kinh tế học', 'Cung cấp kiến thức kinh tế cơ bản', 2, 'Lý Văn Hải, Mai Thị Hoa', 'Đại Cương'),
('CO2031', 'Tài chính doanh nghiệp', 'Tìm hiểu tài chính cơ bản', 2, 'Nguyễn Thị Hòa, Lý Văn Hải', 'Đại Cương'),
('CO2032', 'Quản lý dữ liệu', 'Khái niệm và quản lý dữ liệu', 3, 'Trần Thị Lan, Hoàng Văn Phúc', 'Chuyên Ngành'),
('CO2033', 'Nhập môn Vật lý', 'Kiến thức cơ bản về vật lý', 2, 'Nguyễn Văn Hùng, Nguyễn Thị Phương', 'Đại Cương'),
('CO2034', 'Lập trình C++', 'Học lập trình cơ bản với ngôn ngữ C++', 3, 'Phạm Minh Tuấn, Nguyễn Văn Khánh', 'Cơ Sở Ngành'),
('CO2035', 'Xử lý dữ liệu lớn', 'Tìm hiểu cách xử lý dữ liệu lớn', 3, 'Nguyễn Thị Hòa, Lê Minh Đức', 'Chuyên Ngành'),
('CO2036', 'Nhập môn IoT', 'Giới thiệu các khái niệm cơ bản về IoT', 2, 'Ngô Minh Hiếu, Phan Văn Đạt', 'Cơ Sở Ngành'),
('CO2037', 'Nhập môn Kỹ thuật số', 'Các kỹ thuật số cơ bản', 2, 'Lý Văn Nam, Lê Văn Sơn', 'Cơ Sở Ngành'),
('CO2038', 'Nhập môn Robotics', 'Cơ bản về Robotics', 3, 'Hoàng Văn Phúc, Nguyễn Văn Khánh', 'Chuyên Ngành'),
('CO2039', 'Thương mại điện tử', 'Giới thiệu về thương mại điện tử', 2, 'Nguyễn Thị Hòa, Trần Văn Hoàng', 'Chuyên Ngành'),
('CO2040', 'Học máy nâng cao', 'Tìm hiểu các khái niệm nâng cao', 3, 'Nguyễn Văn Khánh, Hoàng Thị Ngọc', 'Chuyên Ngành'),
('CO2041', 'Quản lý mạng', 'Cung cấp kiến thức quản trị mạng', 2, 'Nguyễn Văn Hùng, Trần Thị Lan', 'Chuyên Ngành'),
('CO2042', 'Công nghệ thực tế ảo', 'Tìm hiểu công nghệ VR và AR', 3, 'Phạm Thị Dung, Mai Thị Hoa', 'Chuyên Ngành'),
('CO2043', 'Phát triển Mobile App', 'Học cách phát triển ứng dụng di động', 3, 'Ngô Minh Hiếu, Nguyễn Thị Hòa', 'Chuyên Ngành'),
('CO2044', 'Học máy ứng dụng', 'Ứng dụng thực tiễn của học máy', 3, 'Trần Thị Lan, Nguyễn Văn Khánh', 'Chuyên Ngành'),
('CO2045', 'Quản lý tài nguyên', 'Cung cấp các khái niệm cơ bản', 2, 'Phạm Minh Tuấn, Trần Văn Hoàng', 'Đại Cương'),
('CO2046', 'Tối ưu hóa thuật toán', 'Các kỹ thuật tối ưu hóa', 3, 'Mai Thị Hoa, Lý Văn Nam', 'Cơ Sở Ngành'),
('CO2047', 'Kỹ năng làm việc nhóm', 'Phát triển kỹ năng mềm', 2, 'Nguyễn Thị Hòa, Hoàng Thị Ngọc', 'Đại Cương'),
('CO2048', 'Thực tập công nghiệp', 'Kinh nghiệm thực tế trong ngành', 3, 'Ngô Minh Hiếu, Lê Minh Đức', 'Chuyên Ngành'),
('CO2049', 'Hệ thống nhúng', 'Tìm hiểu các hệ thống nhúng', 3, 'Nguyễn Văn Khánh, Nguyễn Văn Hùng', 'Chuyên Ngành'),
('CO2050', 'Ngôn ngữ lập trình', 'Tìm hiểu các ngôn ngữ lập trình khác nhau', 3, 'Lý Văn Nam, Nguyễn Thị Hòa', 'Cơ Sở Ngành');

-- Thêm dữ liệu mẫu vào bảng Gồm
INSERT INTO Gom (MaChuongTrinh, MaMonHoc) VALUES
('CC', 'CO2001'),
('CN', 'CO2002'),
('CC', 'CO2003'),
('CN', 'CO2004'),
('CC', 'CO2005'),
('CN', 'CO2006'),
('CC', 'CO2007'),
('CC', 'CO2008'),
('CN', 'CO2009'),
('CC', 'CO2010'),
('L', 'CO2011'),
('CN', 'CO2012'),
('CC', 'CO2013'),
('L', 'CO2014'),
('CC', 'CO2015'),
('CC', 'CO2016'),
('CN', 'CO2017'),
('CC', 'CO2018'),
('CC', 'CO2019'),
('CC', 'CO2020'),
('CN', 'CO2021'),
('CC', 'CO2022'),
('CN', 'CO2023'),
('CC', 'CO2024'),
('CC', 'CO2025'),
('CC', 'CO2026'),
('L', 'CO2027'),
('CC', 'CO2028'),
('CC', 'CO2029'),
('L', 'CO2030'),
('L', 'CO2031'),
('CC', 'CO2032'),
('L', 'CO2033'),
('CN', 'CO2034'),
('CC', 'CO2035'),
('CN', 'CO2036'),
('CN', 'CO2037'),
('CC', 'CO2038'),
('CC', 'CO2039'),
('CC', 'CO2040'),
('CC', 'CO2041'),
('CC', 'CO2042'),
('CC', 'CO2043'),
('CC', 'CO2044'),
('L', 'CO2045'),
('CN', 'CO2046'),
('L', 'CO2047'),
('CC', 'CO2048'),
('CC', 'CO2049'),
('CN', 'CO2050');
--@block
-- Thêm dữ liệu mẫu vào bảng Phụ trách
INSERT INTO PhuTrach (MaGiangVien, MaMonHoc, ThoiGianDay, DiaDiemDay, HocKi) VALUES
(3353123, 'CO2001', '08:00:00', 'Phòng A1', 'HK201'),
(3353789, 'CO2002', '09:00:00', 'Phòng B2', 'HK211'),
(3354123, 'CO2003', '10:30:00', 'Phòng C1', 'HK222'),
(3354892, 'CO2004', '13:00:00', 'Phòng D3', 'HK223'),
(3355321, 'CO2005', '15:30:00', 'Phòng E2', 'HK231'),
(3356322, 'CO2006', '08:00:00', 'Phòng F1', 'HK241'),
(3357213, 'CO2007', '09:30:00', 'Phòng G2', 'HK201'),
(3358314, 'CO2008', '11:00:00', 'Phòng H3', 'HK211'),
(3359132, 'CO2009', '13:30:00', 'Phòng A2', 'HK222'),
(3360214, 'CO2010', '14:00:00', 'Phòng B1', 'HK223'),
(3361315, 'CO2011', '08:00:00', 'Phòng C2', 'HK231'),
(3362431, 'CO2012', '10:00:00', 'Phòng D1', 'HK241'),
(3363123, 'CO2013', '13:30:00', 'Phòng E3', 'HK211'),
(3364892, 'CO2014', '15:00:00', 'Phòng F2', 'HK222'),
(3365321, 'CO2015', '08:30:00', 'Phòng G1', 'HK223'),
(3366322, 'CO2016', '09:00:00', 'Phòng H2', 'HK231'),
(3367213, 'CO2017', '11:30:00', 'Phòng A3', 'HK241'),
(3368314, 'CO2018', '14:00:00', 'Phòng B2', 'HK201'),
(3369132, 'CO2019', '15:00:00', 'Phòng C1', 'HK211'),
(3370214, 'CO2020', '08:00:00', 'Phòng D3', 'HK222');
--@block
--Thêm dữ liệu đăng ký môn học với điểm ngẫu nhiên
INSERT INTO DangKy (MaSinhVien, MaMonHoc, MaHocKi, TrangThai, Diem)
SELECT 
    sv.MaSinhVien, 
    mh.MaMonHoc, 
    CONCAT('HK', FLOOR(200 + RAND() * 50)),  -- Random học kỳ
    CASE 
        WHEN RAND() < 0.8 THEN 'Thành Công'  -- 80% thành công
        ELSE 'Thất Bại'                     -- 20% thất bại
    END AS TrangThai,
    CASE 
        WHEN RAND() < 0.7 THEN ROUND(RAND() * 9 + 1, 1)  -- Điểm từ 1 đến 10 nếu thành công
        ELSE NULL                                       -- Điểm NULL nếu thất bại
    END AS Diem
FROM 
    SinhVien sv
JOIN 
    MonHoc mh
WHERE 
    NOT EXISTS (
        SELECT 1 
        FROM DangKy dk 
        WHERE dk.MaSinhVien = sv.MaSinhVien 
        AND dk.MaMonHoc = mh.MaMonHoc
    )
AND 
    (SELECT COUNT(*) 
     FROM DangKy 
     WHERE DangKy.MaSinhVien = sv.MaSinhVien) < 10; -- Đảm bảo sinh viên có tối đa 10 môn học
--@block
CREATE PROCEDURE TaoSinhVien()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE Ho VARCHAR(50);
    DECLARE TenDem VARCHAR(50);
    DECLARE Ten VARCHAR(50);
    DECLARE Email VARCHAR(100);

    WHILE i <= 100 DO
        -- Tạo họ, tên đệm và tên ngẫu nhiên
        SET Ho = ELT(FLOOR(1 + RAND() * 10), 
                     'Nguyên', 'Trân', 'Lê', 'Phạm', 'Hoàng', 'Vũ', 'Đỗ', 'Đặng', 'Bùi', 'Võ');
        SET TenDem = ELT(FLOOR(1 + RAND() * 5), 
                         'Vân', 'Thị', 'Minh', 'Quốc', 'Thanh');
        SET Ten = ELT(FLOOR(1 + RAND() * 10), 
                      'Anh', 'Bình', 'Châu', 'Đức', 'Hòa', 'Khánh', 'Lâm', 'Phúc', 'Sơn', 'Trang');

        -- Tạo email từ họ và tên
        SET Email = LOWER(CONCAT(Ho, TenDem, Ten, '@hcmut.edu.vn'));

        -- Chèn dữ liệu vào bảng SinhVien
        INSERT INTO SinhVien (
            MaSinhVien, 
            HoVaTen, 
            NgaySinh, 
            SoDienThoai, 
            Khoa, 
            GioiTinh, 
            Email, 
            MaKhoa, 
            MaChuongTrinh
        )
        VALUES (
            CONCAT('22', FLOOR(10000 + RAND() * 90000)), -- Random MaSinhVien dạng 22*****
            CONCAT(Ho, ' ', TenDem, ' ', Ten),            -- Tên đầy đủ
            DATE_ADD('1995-01-01', INTERVAL FLOOR(RAND() * 3650) DAY), -- Random ngày sinh (1995-2004)
            CONCAT('09', FLOOR(100000000 + RAND() * 900000000)),       -- Random số điện thoại
            2020 + FLOOR(RAND() * 5),                    -- Random khóa (2020-2025)
            IF(RAND() > 0.5, 'Nam', 'Nữ'),              -- Random giới tính
            Email,                                       -- Email từ họ và tên
            FLOOR(1 + RAND() * 11),                     -- Random MaKhoa (1-11)
            CASE FLOOR(1 + RAND() * 3)                  -- Random MaChuongTrinh (CC, CN, L)
                WHEN 1 THEN 'CC'
                WHEN 2 THEN 'CN'
                ELSE 'L'
            END
        );

        -- Tăng bộ đếm
        SET i = i + 1;
    END WHILE;
END;
CALL TaoSinhVien();

/*-------------------------------------Các hàm test trường dữ liệu*/-------------------------------------*/
--@block
SELECT * FROM GiangVien;
SELECT *FRom chuongtrinhhoc;
SELECT* FROM dangky;
SELECT*FROM khoa;
SELECT*FROM sinhvien;
SELECT*FRom gom;
SELECT*FROM monhoc;
SELECT*FROM phutrach;
/*-------------------------------------------Delete dữ liệu và reset --------------------------------------*/
--@block
drop database academic_management;
create database academic_management;
/*-------------------------------------------CRU( TRUY VẤN DỮ LIỆU)----------------------------------------*/
--Create
--@block
INSERT INTO SinhVien (MaSinhVien, HoVaTen, NgaySinh, SoDienThoai, Khoa, GioiTinh, Email, MaKhoa, MaChuongTrinh)
VALUES (2219999, 'Nguyễn Văn An', '2001-12-12', '0912345678', 2023, 'Nam', 'an.nguyen@hcmut.edu.vn', 5, 'CC');
/*--------------------------Retrieve--------*/
/*-----------Tổng số sinh viên từng khoa---*/
--@block
SELECT K.MaKhoa, K.TenKhoa, COUNT(S.MaSinhVien) AS TongSoSinhVien
FROM Khoa K
LEFT JOIN SinhVien S ON K.MaKhoa = S.MaKhoa
GROUP BY K.MaKhoa, K.TenKhoa;
/*-----------Tổng số giảng viên từng khoa---*/
--@block
SELECT K.MaKhoa, K.TenKhoa, COUNT(G.MaGiangVien) AS TongSoGiangVien
FROM Khoa K
LEFT JOIN GiangVien G ON K.MaKhoa = G.MaKhoa
GROUP BY K.MaKhoa, K.TenKhoa;
/*-----------Tổng số sinh viên từng trường---*/
--@block
SELECT COUNT(*) AS TongSoSinhVien
FROM SinhVien;
/*-----------Tổng số sinh viên nữ---*/
--@block
SELECT COUNT(*) AS TongSoSinhVienNu
FROM SinhVien
WHERE GioiTinh = 'Nữ';
/*-----------Tỷ lệ giảng viên có trình độ thạc sĩ---*/
--@block
SELECT 
    COUNT(*) AS SoGiangVienThacSi,
    (COUNT(*) * 100 / (SELECT COUNT(*) FROM GiangVien)) AS TyLeThacSi
FROM GiangVien
WHERE TrinhDo = 'Thạc sĩ';
/*--------------------------Update--------*/
/*-----------Sửa mã số sinh viên từ 2214547 thành 1111111---*/
UPDATE SinhVien
SET MaSinhVien = 1111111
WHERE MaSinhVien = 2214547;
/*-------------------------------------------Thống kê---------------------------------------*/
--@block
SELECT 
    (SELECT COUNT(*) FROM SinhVien) AS TongSoSinhVienToanTruong,
    (SELECT COUNT(*) FROM SinhVien WHERE GioiTinh = 'Nam') AS TongSoSinhVienNam,
    (SELECT COUNT(*) FROM SinhVien WHERE GioiTinh = 'Nữ') AS TongSoSinhVienNu,
    (SELECT COUNT(*) FROM GiangVien WHERE TrinhDo = 'Thạc sĩ') AS TongSoGiangVienThacSi,
    (SELECT COUNT(*) FROM GiangVien) AS TongSoGiangVien,
    (SELECT COUNT(*) FROM GiangVien WHERE TrinhDo = 'Thạc sĩ') * 100 / (SELECT COUNT(*) FROM GiangVien) AS TyLeThacSi;



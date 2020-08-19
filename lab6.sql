CREATE TABLE Buyer
(
MaKH varchar(10) PRIMARY KEY,
NguoiDatHang nvarchar(50),
DiaChi nvarchar(50),
DienThoai char(9),
CONSTRAINT fk_DienThoai CHECK (DienThoai NOT LIKE '%[^0-9]%')
)
CREATE TABLE SanPham(
MaSP varchar(10) PRIMARY KEY,
TenSP nvarchar(30),
MoTa nvarchar(50),
GiaBan money CHECK (GiaBan > 0)
)
CREATE TABLE DonDatHang
(
MaDatHang int PRIMARY KEY,
MaKH varchar(10),
NgayDatHang datetime,
SoLuong int CHECK (SoLuong > 0)
TongTien money,
CONSTRAINT fk_NguoiMua FOREIGN KEY (MaKH) REGERENCES NgouiMua(MaKH)
)
CREATE TABLE DonHangChiTiet
(
MaKH varchar(10),
MaDonHang int PRIMARY KEY,
MaSP varchar(10),
GiaBan money CHECK (GiaBan > 0),
SoLuong int,
CONSTRAINT fk_SanPham FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP),
CONSTRAINT fk_KhachHang FOREIGN KEY (MaKH) REFERENCES NguoiMua(MaKH)
)
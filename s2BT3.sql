create database s3bt3;
use s3bt3;
create table if not exists vattu(
maVT int primary key auto_increment,
tenVT varchar(255)
);
create table if not exists PhieuXuat(
soPx int primary key auto_increment,
ngayXuat datetime
);
create table if not exists PhieuXuatChiTiet(
soPx int,
constraint lk_01 foreign key(soPx) references PhieuXuat(soPx),
maVT int,
constraint lk_02 foreign key(maVT) references vattu(maVT),
donGiaXuat double,
soLuongXuat int
);
create table if not exists PhieuNhap(
soPN int primary key auto_increment,
ngayNhap datetime
);
create table if not exists PhieuNhapChiTiet(
soPN int,
constraint lk_pnct foreign key(soPN) references PhieuNhap(soPN),
maVt int,
constraint lk_pnct_vt foreign key(maVt) references vattu(maVT)
);
create table if not exists NgayCungCap(
maNCC int primary key auto_increment,
tenNCC varchar(255),
diaChi varchar(255),
soDienThoai varchar(11)
);
create table if not exists ChiTietDonHang(
maVT int,
constraint lk_ctdh_mVT foreign key(maVT) references vattu(maVT),
soDH int primary key auto_increment
);
create table if not exists DonDatHang(
soDH int,
constraint lk_ddh_sdh foreign key(soDH) references ChiTietDonHang(soDH),
maNCC int,
constraint lk_ddh_ncc foreign key(maNCC) references NgayCungCap(maNCC)
)





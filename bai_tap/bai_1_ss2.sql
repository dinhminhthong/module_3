create database bai_tap_erd;
use bai_tap_erd;

create table so_dien_thoai(
ma_so_dien_thoai int primary key
);
create table nha_cung_cap(
ma_nha_cung_cap int primary key,
ten_nha_cung_cap varchar (45),
dia_chi varchar(45),
ma_so_dien_thoai int,
foreign key(ma_so_dien_thoai) references so_dien_thoai (ma_so_dien_thoai)
);
create table don_dat_hang(
so_don_hang int primary key,
ngay_dat_hang date
);

create table vat_tu(
ma_vat_tu int primary key,
ten_vat_tu varchar(45)
);

create table chi_tiet_don_dat_hang(
so_don_hang int,
ma_vat_tu int,
primary key(so_don_hang,ma_vat_tu),
foreign key(so_don_hang) references don_dat_hang(so_don_hang),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table phieu_xuat(
so_phieu_xuat int primary key,
ngay_xuat date
);

create table chi_tiet_phieu_xuat(
ma_vat_tu int,
so_phieu_xuat int,
primary key (ma_vat_tu,so_phieu_xuat),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key (so_phieu_xuat) references phieu_xuat(so_phieu_xuat)
);
create table phieu_nhap(
so_phieu_nhap int primary key,
ngay_nhap date
);
create table chi_tiet_phieu_nhap(
ma_vat_tu int,
so_phieu_nhap int,
primary key (ma_vat_tu,so_phieu_nhap),
foreign key(ma_vat_tu)references vat_tu(ma_vat_tu),
foreign key(so_phieu_nhap) references phieu_nhap(so_phieu_nhap)
);







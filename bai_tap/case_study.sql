create database case_study_module_3;
use case_study_module_3;
create table vi_tri(
ma_vi_tri int primary key not null,
name_vi_tri varchar(45)
);

create table trinh_do(
ma_trinh_do int primary key not null,
ten_trinh_do varchar(45)
);

create table bo_phan(
ma_bo_phan int primary key not null,
ten_bo_phan varchar(45)
);

create table nhan_vien(
ma_nhan_vien int primary key ,
ho_ten varchar (45),
ngay_sinh date,
so_cmnd varchar (45) unique,
luong double,
so_dien_thoai varchar(45),
email varchar(45) unique,
dia_chi varchar(45),
ma_vi_tri int,
foreign key(ma_vi_tri) references ten_vi_tri(ma_vi_tri) on delete set null,
ma_trinh_do int,
foreign key (ma_trinh_do) references ten_trinh_do(ma_trinh_do) on delete set null,
ma_bo_phan int,
foreign key (ma_bo_phan) references ten_bo_phan(ma_bo_phan) on delete set null
);

create table loai_khach(
ma_loai_khach int primary key not null,
ten_loai_khach varchar (45)
);

create table khach_hang(
ma_khach_hang  int primary key not null,
ma_loai_khach int,
foreign key (ma_loai_khac) references ten_loai_khach(ma_loai_khach) on delete set null,
ho_ten varchar(45),
ngay_sinh date,
gioi_tinh Bit(1),
so_cnmd varchar (45),
so_dien_thoai varchar(45),
email varchar(45),  
dia_chi varchar (45)
);

create table loai_dich_vu(
ma_loai_dich_vu int primary key not null,
ten_loai_dich_vu varchar (45)

);

create table kieu_thue(
ma_kieu_thue int primary key not null,
ten_kieu_thue  varchar(45)
);

create table dich_vu(
ma_dich_vu int primary key not null,
ten_dich_vu varchar(45),
dien_tich int,
chi_phi_thue double,
so_nguoi_toi_da int,
ma_kieu_thue int,
foreign key(ma_kieu_thue) references kieu_thue(ma_kieu_thue) on delete set null,
ma_loai_dich_vu int,
foreign key (ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu) on delete set null,
tieu_chuan_phong varchar(45) ,
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int,
dich_vu_mien_phi_di_kem text
);

create table dic_vu_di_kem(
ma_dich_vu_di_kem int primary key not null,
ten_dich_vu_di_kem varchar(45),
gia double,
don_vi varchar(10),
trang_thai varchar (45)
);

create table hop_dong(
ma_hop_dong int primary key not null,
ngay_lam_hop_dong datetime,
ngay_ket_thuc datetime,
tien_dat_coc double,
ma_nhan_vien int,
foreign key (ma_nhan_vien) references ma_nhan_vien(ma_nhan_vien) on delete set null,
ma_khach_hang int,
foreign key (ma_khach_hang) references ma_khach_hang(ma_khach_hang) on delete set null,
ma_dich_vu int,
foreign key (ma_dich_vu) references ma_dich_vu(ma_dich_vu) on delete set null
);

create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int primary key not null,
ma_hop_dong int,
foreign key (ma_hop_dong) references ma_hop_dong(ma_hop_dong) on delete set null,
ma_dich_vu_di_kem int,
foreign key (ma_dich_vu_di_kem) references ma_hop_dong_dich_vu(ma_hop_dong_dich_vu_di_kem) on delete set null
);
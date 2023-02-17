create database cua_hang_iphone;
use cua_hang_iphone;
create table user (
id int primary key auto_increment,
ten varchar(50),
ten_dang_nhap varchar(50),
mat_khau varchar(50)
);
create table loai_san_pham(
id_loai_san_pham int primary key auto_increment,
ten_loai_san_pham varchar(50)
);
create table san_pham(
id int primary key auto_increment,
id_loai_san_pham int,
ten_san_pham varchar(50) ,
nha_cung_cap varchar(50),
hinh_anh varchar(500),
gia double,
so_luong int,
foreign key(id_loai_san_pham) references loai_san_pham(id_loai_san_pham)
 );
create table don_dat_hang(
id_ddh int primary key auto_increment,
id_khach_hang int,
id_dien_thoai int,
ngay_lam_don_hang date,
foreign key(id_khach_hang) references user(id),
foreign key(id_dien_thoai) references san_pham(id)
);
 insert into loai_san_pham values(1,'Điện thoại'),
 (2,'Phụ kiện'),
 (3,'Macbook')
 ;
 -------------------------------------------------------- Điện thoại với id =1 ----------------------------------------------------------------------------------------------------
 insert into san_pham(id_loai_san_pham,ten_san_pham,nha_cung_cap,hinh_anh,gia,so_luong) value (1,'Iphone 7','Apple','https://ihubdanang.vn/uploads/product/0cwarums4w9dprc-1522-ip-7-128gb-likenew-99-4-650-000.jpg','4000000','10');
 insert into san_pham(id_loai_san_pham,ten_san_pham,nha_cung_cap,hinh_anh,gia,so_luong) value (1,'Iphone 8','Apple','https://ihubdanang.vn/uploads/product/sp_gglpz1xz17qzu9x-1479-ip-8-plus-likenew-99-7-390-000.jpg','5000000','20');
 insert into san_pham(id_loai_san_pham,ten_san_pham,nha_cung_cap,hinh_anh,gia,so_luong) value (1,'Iphone x','Apple','https://www.neway.mobi/images/products/ipx.png','6000000','30');
 insert into san_pham(id_loai_san_pham,ten_san_pham,nha_cung_cap,hinh_anh,gia,so_luong) value (1,'Iphone 11','Apple','https://tse4.mm.bing.net/th?id=OIP.TVpQWo_6pyHUay4jELMb4gHaHa&pid=Api&P=0','7000000','40');
 insert into san_pham(id_loai_san_pham,ten_san_pham,nha_cung_cap,hinh_anh,gia,so_luong) value (1,'Iphone 12','Apple','https://s4.nhattao.com/data/attachment-files/2020/11/16015719_123619943_378585886722624_125866327356166600_n.jpg','8000000','50');
 insert into san_pham(id_loai_san_pham,ten_san_pham,nha_cung_cap,hinh_anh,gia,so_luong) value (1,'Iphone 13','Apple','https://tse4.mm.bing.net/th?id=OIP.SlWVsliPRl8uDfaFuH0LggHaHa&pid=Api&P=0','9000000','60');
 insert into san_pham(id_loai_san_pham,ten_san_pham,nha_cung_cap,hinh_anh,gia,so_luong) value (1,'Iphone 14','Apple','https://lh3.googleusercontent.com/-UdPjy9Ijrmw/YCAO_N7qxMI/AAAAAAAAJdI/VS5p2K1BF2E0ywIVs929xd2zA_9pMfU9gCLcBGAsYHQ/s16000/2.jpg','10000000','70');
 
 -------------------------------------------------------- Phụ kiện với id =1 ----------------------------------------------------------------------------------------------------
 insert into san_pham(id_loai_san_pham, ten_san_pham,nha_cung_cap,hinh_anh,gia,so_luong)value(2,'tai nghe','apple','https://product.hstatic.net/200000079075/product/33741_dareu_eh416_rgb_cd08a60c834848919d314cc7e7fd75f8_master.png','1000000','100');
 insert into san_pham(id_loai_san_pham, ten_san_pham,nha_cung_cap,hinh_anh,gia,so_luong)value(2,'tai nghe','apple','https://tse4.mm.bing.net/th?id=OIP.pjrrUmsZLLFOrs6wx6oveQHaHa&pid=Api&P=0','1000000','100');
 insert into san_pham(id_loai_san_pham, ten_san_pham,nha_cung_cap,hinh_anh,gia,so_luong)value(2,'tai nghe','apple','http://smartnew.vn/wp-content/uploads/2018/12/tai-nghe-bluetooth-5-1024x1024.jpg','1000000','100');
 
 -------------------------------------------------------- Macbook với id =3 ----------------------------------------------------------------------------------------------------
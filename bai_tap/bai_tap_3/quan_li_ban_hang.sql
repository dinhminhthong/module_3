create database if not exists quan_ly_ban_hang;
use quan_ly_ban_hang;
create table if not exists customer(
c_id int primary key auto_increment,
c_name varchar(25),
c_age tinyint
);

-- bảng order
create table if not exists `order`(
o_id int primary key auto_increment,
c_id int,
o_date datetime,
o_total_price int,
foreign key (c_id) references customer(c_id)
);

-- bảng product
create table if not exists product(
p_id int primary key auto_increment,
p_name varchar (25),
p_price int
);

-- bảng order detail
create table if not exists order_detail(
o_id int,
p_id int,
order_detail_qty int,
foreign key (o_id) references `order`(o_id),
foreign key (p_id) references product(p_id)
);

-- thêm dữ liệu vào các bảng
insert into customer(c_name, c_age) values
("Minh Quan", 10),
("Ngoc Oanh", 20),
("Hong Ha", 50);
insert into customer(c_name, c_age) values ("Thanh Thang", 60);

insert into `order`(o_date, c_id) values
("2006-3-21",1),
("2006-3-23",2),
("2006-3-16",1);

insert into product(p_name, p_price) values
("May Giat", 3),
("Tu Lanh", 5),
("Dieu Hoa", 7),
("Quat", 1),
("Bep Dien",2);

insert into order_detail (o_id, p_id, order_detail_qty ) values 
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice(tổng tiền hoá đơn từ p_price của tất cả các hóa đơn trong bảng Order
-- sắp xếp bảng MM-dd-yyyy
SET SQL_SAFE_UPDATES = 0;


select `order`.o_id, date_format(`order`.o_date, "%m/%d/%Y") as o_date, o_total_price
from `order` 
join order_detail on order_detail.o_id = `order`.o_id
join product on order_detail.p_id = product.p_id
group by o_id
;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select * from customer
join `order` on `order`.c_id = customer.c_id
order by  customer.c_id
;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select * from customer
left join `order` on `order`.c_id = customer.c_id
group by `order`.c_id having count(`order`.c_id) = 0
;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
-- Giá bán của từng loại được tính = odQTY*pPrice)
select `order`.o_id, date_format(`order`.o_date, "%m/%d/%Y") as o_date, 
sum((product.p_price) * (order_detail.order_detail_qty)) as o_price
from `order` 
join order_detail on order_detail.o_id = `order`.o_id
join product on order_detail.p_id = product.p_id
group by o_id;
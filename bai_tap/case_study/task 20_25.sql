use furama_management;
 
-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Gia Lai” và
-- đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là "08/12/2020".
create index i_dia_chi on nhan_vien (dia_chi);
create view v_nhan_vien as
select * from nhan_vien
where dia_chi like '%Gia Lai'
  and ma_nhan_vien in (select ma_nhan_vien
  from (select hd.ma_nhan_vien
  from hop_dong hd
  where ngay_lam_hop_dong = '2020-12-08'
  group by hd.ma_nhan_vien
  having count(hd.ma_hop_dong) > 0) b);
  
  -- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” 
-- đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.

set
sql_safe_updates = 0;
update v_nhan_vien
set dia_chi = 'Liên Chiểu'
where dia_chi in (select * from (select v.dia_chi from v_nhan_vien v) v_dia_chi);
select *
from v_nhan_vien;
set
sql_safe_updates = 1;

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang 
-- được truyền vào như là 1 tham số của sp_xoa_khach_hang.

delimiter //
create procedure delete_ma_khach_hang(IN id_delete int)
begin
if
id_delete not in(select kh.ma_khach_hang from khach_hang kh) then
signal sqlstate "45000" set message_text = " Id không tồn tại";
else
delete
from khach_hang kh
where kh.ma_khach_hang = id_delete;
end if;
end
//
delimiter ;

select *
from khach_hang;
call delete_ma_khach_hang(20);

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu 
-- sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc
-- không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.

delimiter //
create procedure sp_them_moi_hop_dong(new_ma_hop_dong int, new_ngay_lam_hop_dong datetime,
 new_ngay_ket_thuc datetime,new_tien_dat_coc double,
new_ma_nhan_vien int, new_ma_khach_hang int, new_ma_dich_vu int)
begin
 if
(new_ma_hop_dong not in (select hd.ma_hop_dong from hop_dong hd)
 and new_ma_nhan_vien in ( select nv.ma_nhan_vien from nhan_vien nv)
 and new_ma_khach_hang in  (select kh.ma_khach_hang from khach_hang kh)
 and new_ma_dich_vu in (select dv. ma_dich_vu from dich_vu dv))
 then insert into hop_dong
 values 
 (ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang,ma_dich_vu) ;
else
 signal sqlstate "5000"
 set message_text = " Id đã tồn tại hoặc trùng khoá chính và không đảm bảo toàn vẹn tham chiếu đến các bảng liên quan";
end if;
end
//
 delimiter ;
call sp_them_moi_hop_dong (
  1, '2020-12-22', '2020-12-23', 100000, 1, 
  1, 1
);


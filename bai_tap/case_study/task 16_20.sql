use furama_management;
   -- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
set
sql_safe_updates= 0;
delete
from nhan_vien nv
where nv.ma_nhan_vien not in (select hd.ma_nhan_vien
    from hop_dong hd
    where year (
    ngay_lam_hop_dong) in (2019, 2020 , 2021));
select *
from nhan_vien;
set
sql_safe_updates= 1;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ

set
sql_safe_updates= 0;
update khach_hang
set ma_loai_khach = 1
where khach_hang.ma_loai_khach = 2
      and khach_hang.ma_khach_hang in (select *
      from (select kh.ma_khach_hang
      from khach_hang kh
      left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
      left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
      left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
      left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
      left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
      where year (ngay_lam_hop_dong) =2021
      group by kh.ma_khach_hang
      having sum(chi_phi_thue + so_luong * gia) >1000000) chi_tiet_khach_hang);
select *
from khach_hang;
set
sql_safe_updates= 1;

 -- 18.Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
  
 set
sql_safe_updates= 0;

delete
from khach_hang kh
where kh.ma_khach_hang in (select *
    from (select hd.ma_khach_hang
    from hop_dong hd
    where year (ngay_lam_hop_dong) < 2021)a);
select *
from khach_hang;
set
sql_safe_updates= 1;

  
  -- 19.Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
  
  set
sql_safe_updates= 0;
update dich_vu_di_kem
set gia = gia * 2
where dich_vu_di_kem.ma_dich_vu_di_kem in (select *
         from (select dvdk.ma_dich_vu_di_kem
         from dich_vu_di_kem dvdk
         join hop_dong_chi_tiet hdct
         on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
         join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
         where year (ngay_lam_hop_dong) = 2020
         group by dvdk.ma_dich_vu_di_kem
         having sum( so_luong) >10) a);
select *
from dich_vu_di_kem;
set
sql_safe_updates= 1;

  -- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
  -- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select ma_nhan_vien, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien
union
select ma_khach_hang, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang;

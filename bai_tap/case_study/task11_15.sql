use furama_management;
-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng 
-- có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dvdk.* from dich_vu_di_kem dvdk
	left join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
    left join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
        left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
         left join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where lk.ten_loai_khach like "Diamond"
  and (kh.dia_chi like "% Vinh" or kh.dia_chi like "% Quảng Ngãi");
  
  -- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu,
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng
-- được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select hop_dong.ma_hop_dong, nhan_vien.ho_ten as ho_ten_nhan_vien, khach_hang.ho_ten as ho_ten_khach_hang, khach_hang.so_dien_thoai, dich_vu.ten_dich_vu
, hop_dong.tien_dat_coc
from hop_dong
left join nhan_vien on hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
left join khach_hang on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
-- của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
where quarter(hop_dong.ngay_lam_hop_dong) = 4 and year(hop_dong.ngay_lam_hop_dong) = 2020
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
and hop_dong.ngay_lam_hop_dong not in (
select hop_dong.ngay_lam_hop_dong
from hop_dong
join dich_vu on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu

where quarter(hop_dong.ngay_lam_hop_dong) in (1,2) and year(hop_dong.ngay_lam_hop_dong) = "2021" 
)
group by hop_dong.ma_hop_dong
;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from dich_vu_di_kem dvdk
         join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having so_luong_dich_vu_di_kem = (select max(so_luong) from hop_dong_chi_tiet);


-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
-- (được tính dựa trên việc count các ma_dich_vu_di_kem).

select hdct.ma_hop_dong,
       ldv.ten_loai_dich_vu,
       dvdk.ten_dich_vu_di_kem,
       count(hdct.so_luong) as so_luong_dich_vu_di_kem
from dich_vu_di_kem dvdk
         join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
         join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
         join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
         join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
group by dvdk.ma_dich_vu_di_kem, hd.ma_hop_dong
having so_luong_dich_vu_di_kem = 1
order by hd.ma_hop_dong;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai,
-- dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select nv.ma_nhan_vien,
       nv.ho_ten,
       td.ten_trinh_do,
       bp.ten_bo_phan,
       nv.so_dien_thoai,
       nv.dia_chi,
       count(hd.ma_hop_dong)
from nhan_vien nv
         join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
         join trinh_do td on td.ma_trinh_do = nv.ma_trinh_do
         join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where nv.ma_nhan_vien in (select hd.ma_nhan_vien
                          from hop_dong hd
                          where year (
    ngay_lam_hop_dong) = 2020
   or year (ngay_lam_hop_dong) = 2021
    )
group by nv.ma_nhan_vien
having count(hd.ma_hop_dong) <=3;

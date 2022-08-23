use case_study_1;

-- task 2
select *
from nhan_vien nv 
where (nv.ho_ten like 'H%' or nv.ho_ten like 'T%' or nv.ho_ten like 'K%') and (char_length(ho_ten) <= 15);

-- task 3
select *
from khach_hang 
where year(curdate())-year(ngay_sinh) between 18 and 50
and dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị';

-- task 4
select kh.ma_khach_hang , kh.ho_ten , count(ifnull(hd.ma_khach_hang,0)) as so_lan_dat_phong
from khach_hang kh 
join hop_dong hd  on hd.ma_khach_hang = kh.ma_khach_hang
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where lk.ten_loai_khach = 'Diamond'
group by kh.ma_khach_hang
order by so_lan_dat_phong;

-- task 5
create view v_tong_tien as
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong,
dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,  
( ifnull(dv.chi_phi_thue,0)+sum(ifnull(hdct.so_luong,0)*ifnull(dvdk.gia,0))) as tong_tien
from khach_hang kh 
left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong =hd.ma_hop_dong
left join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong
order by kh.ma_khach_hang;

-- task 6
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue,ldv.ten_loai_dich_vu
from hop_dong hd
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
where hd.ma_dich_vu not in (
select hd.ma_dich_vu
from hop_dong hd 
where hd.ngay_lam_hop_dong between '2021-01-01' and '2021-03-31')
group by hd.ma_dich_vu;

select * from hop_dong;

-- task 7
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich,dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv 
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
where year(hd.ngay_lam_hop_dong) ='2020' and dv.ma_dich_vu not in(
select hd.ma_dich_vu
from hop_dong hd
where year(hd.ngay_lam_hop_dong) ='2021')
group by ma_dich_vu;

-- task 8
select  distinct  ho_ten 
from khach_hang;

select * 
from khach_hang
group by ho_ten;

select ho_ten
from khach_hang
union 
select ho_ten
from khach_hang;

-- task 9
select month(hd.ngay_lam_hop_dong) as thang , count(hd.ma_khach_hang) as so_lan_dat_phong
from hop_dong hd 
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
where year(hd.ngay_lam_hop_dong) ='2021'
group by thang
order by thang;

-- task 10
select hd.ma_hop_dong,hd.ngay_lam_hop_dong, 
hd.ngay_ket_thuc, hd.tien_dat_coc, sum(ifnull(hdct.so_luong,0)) as so_luong_dich_vu_di_kem
from hop_dong hd
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong =hd.ma_hop_dong
left join dich_vu_di_kem dvdk on  dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong;

-- task 11
select dvdk.ma_dich_vu_di_kem , dvdk.ten_dich_vu_di_kem
from dich_vu_di_kem dvdk 
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where lk.ten_loai_khach ='Diamond' and (kh.dia_chi like '%Vinh' or kh.dia_chi like '%Quảng Ngãi');

-- task 12 
select hd.ma_hop_dong, nv.ho_ten as ten_nhan_vien ,kh.ho_ten as ten_khach_hang,kh.so_dien_thoai,
dv.ten_dich_vu ,sum(ifnull(hdct.so_luong,0)) as so_luong_dich_vu_di_kem,
hd.tien_dat_coc
from hop_dong hd
left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
left join nhan_vien nv  on nv.ma_nhan_vien = hd.ma_nhan_vien
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
where hd.ngay_lam_hop_dong between '2020-01-01' and '2021-03-31' and hd.ma_dich_vu not in(
select hd.ma_dich_vu
from hop_dong hd 
where hd.ngay_lam_hop_dong between '2021-01-01' and '2021-06-30')
group by ma_hop_dong;

-- task 13
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem , sum(ifnull(hdct.so_luong,0)) as so_lan_su_dung
from hop_dong hd
 join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
 join nhan_vien nv  on nv.ma_nhan_vien = hd.ma_nhan_vien
 join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
 join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
 join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
 group by ma_dich_vu_di_kem
 having so_lan_su_dung = (
 select sum(ifnull(hdct.so_luong,0)) as s
 from hop_dong_chi_tiet hdct
 group by ma_dich_vu_di_kem 
 order by s desc
 limit 1);


-- create view v_so_luong_dich_vu as
-- select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem , sum(ifnull(hdct.so_luong,0)) as so_lan_su_dung
-- from hop_dong hd
--  join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
--  join nhan_vien nv  on nv.ma_nhan_vien = hd.ma_nhan_vien
--  join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
--  join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
--  join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
--  group by ma_dich_vu_di_kem;
--  
--  select ma_dich_vu_di_kem,max(so_lan_su_dung),ten_dich_vu_di_kem 
--  from v_so_luong_dich_vu 
--  group by max(so_lan_su_dung);
--  
--  drop view v_so_luong_dich_vu;

--  task 14
select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(ifnull(hdct.ma_dich_vu_di_kem,0)) as so_lan_su_dung
from hop_dong hd
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem= hdct.ma_dich_vu_di_kem
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
group by ma_hop_dong
having so_lan_su_dung = (
select count(ifnull(hdct.ma_dich_vu_di_kem,0)) as s
from hop_dong_chi_tiet hdct
group by ma_dich_vu_di_kem
order by s
limit 1);

-- task 15
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
from nhan_vien nv 
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
join trinh_do td on td.ma_trinh_do = nv.ma_trinh_do
join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
group by hd.ma_nhan_vien 
having count(ifnull(hd.ma_nhan_vien ,0)) <=3;

-- task 16

-- update nhan_vien
-- set is_deleted = 1
-- where ma_nhan_vien not in (
-- select nv.ma_nhan_vien
-- from nhan_vien nv 
-- join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
-- where ngay_lam_hop_dong between '2019-01-01'  and '2021-12-31'
-- group by ma_nhan_vien
-- );

update nhan_vien
set is_deleted = 1
where ma_nhan_vien not in (
select mnv.ma_nhan_vien from ( 
select nv.ma_nhan_vien
from nhan_vien nv 
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where ngay_lam_hop_dong between '2019-01-01'  and '2021-12-31' ) as mnv
group by ma_nhan_vien
);
select * from khach_hang;

-- -- task 17 

-- update khach_hang
-- set ma_hop_dong = (
-- select ma_khach_hang 
-- from khach_hang kh
-- join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
-- where lk.ten_loai_khach ='Diamond')

-- where ( select sum(ifnull(v.tong_tien,0)) 
--  from v_tong_tien v
--  where v.tong_tien <1000000
--  group by ma_khach_hang);

-- select * from v_tong_tien;


-- task 18
update khach_hang 
set is_deleted = 1
where ma_khach_hang  in (
select mhd.ma_khach_hang from (
select hd.ma_khach_hang
from hop_dong hd 
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
where year(hd.ngay_lam_hop_dong) < 2021 ) as mhd );

select * from khach_hang ;

-- task 19
-- update hop_dong hd
-- set gia = gia*2
-- where gia in (
-- select ct.gia from (
-- select  
-- from hop_dong hd
-- join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
-- where year(hd.ngay_lam_hop_dong) = '2020')  as a);

-- task 20
select ma_nhan_vien , ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien
union
select  ma_khach_hang , ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang;








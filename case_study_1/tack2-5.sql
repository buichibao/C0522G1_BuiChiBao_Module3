use case_study_1;

-- task 2
select * 
from nhan_vien 
where (ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like 'K%') and (char_length(ho_ten)<=15);

-- task 3
select *
from khach_hang 
where ((year(curdate())-year(ngay_sinh)) between 18 and 50) and (dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị');

-- task 4
select k.ma_khach_hang , k.ho_ten , l.ten_loai_khach , h.ma_hop_dong , count(h.ma_khach_hang) as so_lan_dat_phong
from khach_hang k 
join loai_khach l on k.ma_loai_khach = l.ma_loai_khach
join hop_dong h on k.ma_khach_hang =h.ma_khach_hang
where l.ten_loai_khach ='Diamond'
group by h.ma_khach_hang
order by so_lan_dat_phong;

-- task 5
create view w_tinh_tien as 
select k.ma_khach_hang, k.ho_ten , lk.ten_loai_khach ,hd.ma_hop_dong ,dv.ten_dich_vu, lk.ma_loai_khach,
hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,( ifnull(dv.chi_phi_thue,0)+sum(ifnull(hdct.so_luong,0)*ifnull(dvdk.gia,0))) as tong_tien
from khach_hang k 
left join loai_khach lk on k.ma_loai_khach = lk.ma_loai_khach
left join hop_dong hd on hd.ma_khach_hang = k.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on  hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong
order by k.ma_khach_hang;

select * 
from w_tinh_tien;




-- task 6
select dv.ma_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.chi_phi_thue ,ldv.ten_loai_dich_vu
from dich_vu dv 
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where hd.ma_dich_vu not in(
select hd.ma_dich_vu
from hop_dong hd
where  (year(hd.ngay_lam_hop_dong) =2021) and month(hd.ngay_lam_hop_dong) in(1,2,3))
group by dv.dien_tich;

-- task 7
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich,
dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where year(hd.ngay_lam_hop_dong)= 2020
and  hd.ma_dich_vu not in(
select hd.ma_dich_vu
from hop_dong hd 
where year(hd.ngay_lam_hop_dong)=2021)
group by hd.ma_dich_vu;

-- task 8 

select distinct k.ho_ten 
from khach_hang k;

select k.ho_ten
from khach_hang k
group by k.ho_ten;

select k.ho_ten
from khach_hang k
union
select k.ho_ten
from khach_hang k;

-- task 9
select month(ngay_lam_hop_dong) as thang ,count(ma_khach_hang) as so_luong_dat_phong
from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by thang;

-- task 10
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc,
ifnull(sum(hdct.so_luong),0) as so_luong
from hop_dong hd 
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem  dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong
order by hd.ma_hop_dong;

-- task 11
select dvdk.ma_dich_vu_di_kem,dvdk.ten_dich_vu_di_kem
from dich_vu_di_kem dvdk 
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where kh.ma_loai_khach = 1 and (kh.dia_chi like '%Vinh' or kh.dia_chi like '%Quảng Ngãi');

-- task 12. tại sao phải dùng left join
select  hd.ma_hop_dong , nv.ho_ten as ten_nhan_vien, kh.ho_ten as ten_khach_hang ,kh.so_dien_thoai ,dv.ma_dich_vu, dv.ten_dich_vu ,
sum(ifnull(hdct.so_luong,0)) as so_luong_dich_vu_di_kem, hd.tien_dat_coc
from hop_dong hd 
left join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
where (year(hd.ngay_lam_hop_dong) =2020 and (month(hd.ngay_lam_hop_dong) in (10,11,12)))
and hd.ma_hop_dong not in (
select hd.ma_hop_dong
from hop_dong hd 
where year(hd.ngay_lam_hop_dong) =2021 and (month(hd.ngay_lam_hop_dong) between 1 and 6))
group by hd.ma_hop_dong;

-- task 13
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem ,sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from hop_dong_chi_tiet hdct 
inner  join dich_vu_di_kem dvdk on
       dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having so_luong_dich_vu_di_kem >= all (
select sum(hdct.so_luong)
from hop_dong_chi_tiet hdct 
group by hdct.so_luong );

-- task 14 
select hd.ma_hop_dong,ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(dvdk.ma_dich_vu_di_kem) as so_lan_su_dung
from hop_dong hd 
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ten_dich_vu_di_kem
having so_lan_su_dung = 1 
order by hd.ma_hop_dong;
-- task 15 
select nv.ma_nhan_vien , nv.ho_ten , td.ten_trinh_do ,bp.ten_bo_phan ,nv.so_dien_thoai,nv.dia_chi
from hop_dong hd 
join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
join trinh_do td on td.ma_trinh_do = nv.ma_trinh_do
join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
group by hd.ma_nhan_vien
having count(hd.ma_nhan_vien) <= 3;

-- task 16
select * from nhan_vien;

delete from nhan_vien nv
where nv.ma_nhan_vien not in (
select ma_nhan_vien
from hop_dong hd
where year(hd.ngay_lam_hop_dong) between 2019 and 2021
group by nv.ma_nhan_vien
);

-- task 17
update khach_hang
set ma_loai_khach = 1
where ma_loai_khach in (select mlk.ma_loai_khach from (
select ma_khach_hang,  ten_loai_khach, ma_loai_khach,
sum(ifnull(tong_tien,0)) as tong_tien_2021
from w_tinh_tien 
where year(ngay_lam_hop_dong) = '2021' 
and ten_loai_khach= 'Platinium'
group by ma_khach_hang
having tong_tien_2021 > 1000000) as mlk);

-- task 18
update khach_hang
set is_deleted = 1
where ma_khach_hang in (
select mk.ma_khach_hang 
from (
select kh.ma_khach_hang,kh.ho_ten
from khach_hang kh
left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where year(hd.ngay_lam_hop_dong) < 2021) as mk );

-- task 19
update dich_vu_di_kem
set gia = gia * 2
where gia in (select ct.gia from(
select dvdk.ten_dich_vu_di_kem, dvdk.gia, sum(hdct.so_luong) as so_lan_su_dung
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct  on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
where year(hd.ngay_lam_hop_dong) = '2020'
group by dvdk.ma_dich_vu_di_kem
having sum(hdct.so_luong) > 10
order by dvdk.ma_dich_vu_di_kem) as ct);

select*
from dich_vu_di_kem;

-- task 20
select ma_nhan_vien,ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien 
union
select ma_khach_hang,ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang;

-- task 21 
insert into nhan_vien(ma_nhan_vien,ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)
values (11,'Lê Văn Hoa','1997-06-09','755432343','15000000','0934215314','hoalv@gmail.com','22 Hải Châu, Đà Nẵng',1, 1, 2);
insert into hop_dong(ma_hop_dong,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
values
(13,'2019-12-12','2020-12-08',0,11,1,3);

create view v_nhan_vien as
select nv.ma_nhan_vien ,nv.ho_ten ,nv.dia_chi
from nhan_vien nv
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where hd.ngay_lam_hop_dong ='2019-12-12' and nv.dia_chi like '%Hải Châu%';
select * from v_nhan_vien;


-- task 22 
update v_nhan_vien
set dia_chi ='Liên Chiểu';

-- task 23























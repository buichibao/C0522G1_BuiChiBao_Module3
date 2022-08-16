use case_study_1;

-- task 2
select *
from nhan_vien nv 
where (nv.ho_ten like 'H%' or nv.ho_ten like 'T%' or nv.ho_ten like 'K%') and (char_length(ho_ten) <= 15);

-- task 3

use ss3_demo_chanh_tv;

-- 1. đếm toàn bộ học viên của trung tâm
select count(*) as so_luong_hoc_vien 
from student;
-- * đếm theo cái gì cũng được => đếm số cột student

-- 1.1	Hiện thị danh sách các lớp có học viên theo học và số lượng học viên của mỗi lớp

select c.name as class_name , count(s.class_id) as so_luong
from student s 
join class c on c.id =s.class_id
group by c.id
order by so_luong;

select c.name as class_name, count(c.name) as so_luong
from student s 
join class c on s.class_id = c.id
group by c.name;

-- count đến những cái giống nhau trong 1 cột
-- sum tổng những cái giống nhau trong 1 cột

-- 1.2.	 Tính điểm lớn nhất của mỗi các lớp
select * from student;

select c.name as class_name , max(s.`point`) as point_max
from class c 
join student s on s.class_id = c.id
group by c.name;

-- 1.3	 Tình điểm trung bình  của từng lớp 

select c.name as class_name , avg(s.`point`) as poitnt_avg
from class c
join student s on s.class_id = c.id
group by c.name;

select c.name as class_name, avg(s.point) as diem_tb
from student s 
join class c on s.class_id = c.id
group by c.name;


 -- 2 Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym.
 select s.id, s.name , s.birthday
 from student s
 union
  select i.id, i.name , i.birthday
 from instructor i;
 
 -- union là gộp hàng còn join là gộp cột
 
   -- 4 Lấy ra 3 học viên có điểm cao nhất của trung tâm.
   
 select s.id,s.name , s.`point`
 from student s
 group by s.id
 order by s.`point` desc
 limit 3;
 -- lấy 3 cái đầu tiên
 select *
from student s
order by s.point desc
limit 2,3;
-- lấy 3 cái từ index thứ 2 trở đi

 -- 5. Lấy ra các học viên có điểm số là cao nhất của trung tâm.
 
 select s.id,s.name, s.`point` 
 from student s
 where s.`point` = ( select max(point) from student);
 
-- 6 tìm những gv chưa từng tham gia giảng dạy;
select * 
from instructor_class ic
right join instructor i on ic.instructor_id = i.id
where  ic.instructor_id is null;

select * from instructor i where i.id not in(select distinct instructor_id
from instructor_class );



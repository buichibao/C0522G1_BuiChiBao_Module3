use thuc_hanh_quan_ly_sinh_vien;

-- hiển thị tất cả sinh viên có tên bắt đầu là h
select * from student
where `name` like 'h%';

select * from class
where month(start_date)=12;

select * from `subject`
where credit between 3 and 5;

update student set class_id =2
where `name` ='Hung';

select s.`name`,sub.`name`,m.mark
from student s join mark m 
on s.id = m.student_id
join `subject` sub 
on sub.id = m.sub_id
order by mark desc, s.`name`;





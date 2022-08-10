use thuc_hanh_quan_ly_sinh_vien;

-- hiển thị tất cả các học viên
select * from student;

-- hiển thị tất cả các học viên đang học

select * from student
where `status` = true;

-- hiển thị các môn học có thời gian học bé thua 10
select * from `subject`
where credit <10;

select s.id, s.`name`, c.`name`
from student s join class c
on s.class_id = c.id
where c.`name` ='A1';

select s.id,s.`name`,sub.`name`,m.mark
from student s join mark m on s.id = M.student_id join `subject` sub on m.sub_id=sub.id
where sub.`name` ='CF';

use thuc_hanh_quan_ly_sinh_vien;

select * from `subject` 
where credit = (select max(credit) from `subject`);

select s.id,s.name ,sub.`name`,max(m.mark) as diem_max
from student s
join mark m on m.student_id = s.id
join `subject` sub on m.sub_id = sub.id;

select s.id , s.name ,s.address ,s.phone ,s.`status` ,s.class_id  ,avg(m.mark) as dtb
from student s
join mark m on m.student_id = s.id
group by id
order by dtb,s.name desc;



use thuc_hanh_quan_ly_sinh_vien;

select s.address ,count(s.address) as so_luong
from student s
group by address;

select s.id , s.name , agv(m.mark) điểm_tb
from student s
join mark m on s.id = m.student_id
group by s.id,s.name;

select s.id ,s.name, avg(m.mark) as điểm_tb
from student s
join mark m on s.id = m.student_id
group by s.id,s.name
having điểm_tb > 15;








drop database if exists c05;
create database c05;
use c05;
create table student(
id int,
`name` varchar(45),
age int
);
-- Thêm mới dữ liệu cho bảng
insert into student
values
(1,'Bảo',21),
(2,'Thắm',21),
(3,'Nam',21);
-- Đọc dữ liệu từ bảng
select * from student;
select id from student;
select name from student;
-- update dữ liệu ,thay đổi tên học viên của học viên có id = 3 =>Hương
update student set `name` ='Hương' where id=3;
-- xóa dữ liệu
delete from student where `name`='Bảo';
-- Thêm cột point cho bảng
alter table student add column `point` int;
-- Xóa cột
alter table student drop column `point`;
-- xóa bảng
drop table student;
-- xóa database
drop database c05;





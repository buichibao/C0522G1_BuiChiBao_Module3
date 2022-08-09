drop database if exists demo;
create database demo;
use demo;
create table student(
id int,
`name` varchar(45),
age int);
-- thêm mới dữ liệu
insert into student
values
(1,'bao',21),
(2,'tham',21),
(3,'nam',21);
-- Đọc dữ liệu từ bảng
select * from student;
-- update dữ liệu
update student set `name`='huong' where id=3;
-- xóa dữ liệu
delete from student where `name`='bao';
-- thêm cột point
alter table student add `point` int;
-- xóa cột point
alter table student drop `point`;
-- xóa bảng
-- drop table student;
-- xóa database
-- drop database demo;




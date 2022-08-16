drop database if exists le_vu_nguyen_cac_toan_tu;
create database le_vu_nguyen_cac_toan_tu;
use le_vu_nguyen_cac_toan_tu;

create table student(
id int primary key,
name varchar(50),
address varchar(50),
salary double
);
-- thêm dữ liệu vào bảng
insert into student
values
(1,'bao','ha tinh',20),
(2,'an','ha tinh',10),
(3,'huong','hue',5),
(4,'oduc','ha noi',15),
(5,'thuy','ha noi',19);

select * from student;

-- toán tử like
select * 
from student
where name not like '%o%';


select * 
from student
where name  like '%o%';

-- toán tử in 

select *
from student
where salary in (1,5,25,19);

select *
from student
where salary not in (10);

-- toán tử between
select *
from student
where id between 2 and 4;


select *
from student
where id not between 2 and 4;

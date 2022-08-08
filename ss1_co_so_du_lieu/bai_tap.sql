use ss1_co_so_du_lieu;
create table class (
id int,
name varchar(45)
);

create table teacher (
id int,
name varchar(45),
age int,
country varchar(45)
);
insert into class
values 
(1,'C0522G1'),
(2,'A0322I1');
insert into teacher
values
(1,'Trung DC',32,'Đà nẵng'),
(2,'Công NT',31,'Đà nẵng'),
(3,'Chánh TV',31,'Đà nẵng');

select * from teacher;

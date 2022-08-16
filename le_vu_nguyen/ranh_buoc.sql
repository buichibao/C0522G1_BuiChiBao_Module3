drop database if exists le_vu_nguyen_cac_ranh_buoc;
create database le_vu_nguyen_cac_ranh_buoc;
use le_vu_nguyen_cac_ranh_buoc;

create table class (
id_class int primary key, 
name_class varchar(50)
);
create table student(
id int primary key,
name varchar(50) not null,
email varchar(50) unique,
age int ,
check (age >18),

class_id int,
foreign key (class_id) references class(id_class),
gender varchar(50) default 'nam'
);
insert into class
values
(1,'C05'),
(2,'C04');

insert into student(student.id,student.name,student.email,student.age,student.class_id)
values
(1,'bao','bao@123',20,1),
(2,'nam','bao@1232',19,1); -- null sẽ = nam vì có defautl
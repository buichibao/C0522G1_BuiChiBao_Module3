drop database if exists thuc_hanh_quan_ly_sinh_vien;
create database  thuc_hanh_quan_ly_sinh_vien;
use thuc_hanh_quan_ly_sinh_vien;

create table class(
id int auto_increment primary key,
`name` varchar(45),
start_date date,
`status` bit
);

create table student (
id int auto_increment primary key,
`name` varchar(45),
address varchar(45),
phone varchar(45),
`status` bit,
class_id int,
foreign key (class_id) references class(id)
);

create table `subject`(
id int auto_increment primary key,
`name` varchar(45),
credit int,
status bit
);
create table mark(

id_mark int auto_increment primary key,
sub_id int ,
student_id int,
mark int,
exams_times int,

foreign key (sub_id)  references `subject`(id),
foreign key (student_id) references student(id)
);
insert into class 
values
(1,'A1','2008-12-20',1),
(2,'A2','2008-12-22',1),
(3,'B3',current_date(),0);

insert into student
values
(1,'Hung','Ha noi','0912113113',1,1),
(2,'Hoa','Hai phong',null,1,1),
(3,'Manh','HCM','0123123123',0,2);

insert into `subject`
values
(1,'CF',5,1),
(2,'C',6,1),
(3,'HDJ',5,1),
(4,'RDBMS',10,1);


insert into mark
values
(1,1,1,8,1),
(2,1,2,10,2),
(3,2,1,12,1);






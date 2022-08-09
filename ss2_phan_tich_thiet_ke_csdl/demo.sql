drop database if exists quan_ly_codegym;
create database quan_ly_codegym;
use quan_ly_codegym;

create table class_type(
id int auto_increment primary key,
`name` varchar(45)
);

create table class(
id int auto_increment primary key,
`name` varchar(45),
id_class_type int,
foreign key(id_class_type) references class_type(id)
);
create table jame(
`account` varchar(45) primary key,
password varchar(45)
);
create table student(
id int primary key,
`name` varchar(45),
gender boolean,
birthday date,
email varchar(45),
`point` double,
id_class int,
acount_jame varchar(45),
foreign key(id_class) references class(id),
foreign key(acount_jame) references jame(`account`)
);

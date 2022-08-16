drop database if exists le_vu_nguyen_cac_ham;
create database le_vu_nguyen_cac_ham;
use le_vu_nguyen_cac_ham;

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
(3,'an','ha tinh',5),
(4,'duc','ha noi',15),
(5,'thuy','ha noi',19);

select * from student;

-- hàm limit lấy ra số hàng mà mình muốn lấy (limit A) từ vị trí 0 đến A-1;
-- lấy ra từ địa chỉ số lượng mà mình muốn lấy (limit A,B) từ vị trí A , số lượng B

-- lấy ra 3 dòng đầu
select * from student
limit 3;

-- lấy ra 3 dòng từ vị trí số 2
select * from student
limit 2,3;

-- limit kết hợp với where
select * from student
where address = 'ha tinh'
limit 1;

-- hàm min và max để tìm giá trị lớn nhất và bé nhất của 1 cột

select max(salary) from student;
select min(salary) from student;

-- min max kết hợp với điều kiện where
select max(salary) from student
where address = 'ha tinh';

select min(salary) from student
where address = 'ha noi';

-- hàm count đếm số lượng của 1 cái gì đó theo điều kiện
-- có bao nhiêu người sống ở hà tĩnh 
select count(id) as so_luong -- có thể thay id = address
from student
where address='ha tinh';

-- tính agv tính trung bình công theo 1 điều kiện
select avg(salary) as luong_tb
from student;

select avg(salary) as luong_tb_hn
from student
where address ='ha noi';

-- hàm sum tính tổng theo 1 điều kiện gì đó

select sum(id) as tong_id 
from student;

select sum(id) as tong_id_ha_tinh
from student
where address ='ha tinh';


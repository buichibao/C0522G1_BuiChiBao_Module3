drop database if exists le_vu_nguyen_dml;
create database le_vu_nguyen_dml;
use le_vu_nguyen_dml;

create table student(
id int primary key,
name varchar(50),
address varchar(50)
);
-- thêm dữ liệu vào bảng
insert into student
values
(1,'bao','ha tinh'),
(2,'an','ha tinh'),
(3,'an','vinh'),
(4,'duc','ha noi'),
(5,'an','ha noi');
-- câu lệnh truy vấn select
select * from student;

-- câu lệnh distinct gom các giá trị giống nhau (thường thấy để hiển thị 1 record)

select distinct address
from student;

-- câu lệnh where xét điều kiện để hiển thị  (dùng với các loại toán tử AND ,OR ,NOT , ALL ,ANY , LIKE ,BETWEEN)

select * 
from student
where id not in (1);

-- câu lệnh and
select *
from student
where name = 'an' and address ='vinh';

-- câu lệnh or
select *
from student
where name ='an' or address ='ha tinh';

-- câu lệnh not 
select *
from student
where not id = 1;

select *
from student
where not address = 'vinh';

-- kết hợp and , or , not

select * 
from student
where name = 'an' and ( address = 'vinh' or not address ='ha tinh');

-- order by (asc : tăng dần ) và (desc : giảm dần );

select * 
from student
order by address desc;

-- câu lệnh update cập nhập dữ liệu của db 
-- update nếu không có điều kiện thì tất cả các tên sẽ là hương
-- nếu có đk thì chỉ mỗi record có id là 5 sẽ bị đổi tên thành hương
update student 
set name = 'huong ' 
where id =5;

-- câu lệnh delete
-- xóa hết dữ liệu trong bảng nhưng không xóa bảng
delete from student;

-- câu lệnh delete có điều kiện chỉ xóa những record có điều kiện thõa mãn
delete from student
where address = 'vinh';
















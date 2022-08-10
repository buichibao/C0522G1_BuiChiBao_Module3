drop database if exists ss3_quan_ly_ban_hang;
create database ss3_quan_ly_ban_hang;
use ss3_quan_ly_ban_hang;

create table customers(
id_customer int primary key,
`name` varchar(45),
age int
);

create table orders(
id_order int primary key,
date_order datetime,
total_price int,
id_customer int,
foreign key (id_customer) references customers(id_customer)
);

create table product(
id_product int primary key,
`name` varchar(45),
price int
);
create table order_detail(
id_order int,
id_product int,
od_QTY int,
primary key(id_order,id_product ),
foreign key (id_order) references orders(id_order),
foreign key (id_product) references product(id_product)
);

insert into customers
values 
(1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',30);

insert into orders
values
(1,'2006-3-21',null,1),
(2,'2006-3-23',null,2),
(3,'2006-3-16',null,1);

insert into product
values
(1,'May Giat',3),
(2,'Tu lạnh',5),
(3,'Dieu hoa',7),
(4,'Quat',1),
(5,'Bep dien',2);

insert into order_detail
values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

select id_order,date_order,total_price  
from orders;

select c.`name`,p.`name` 
from customers c
join orders o on c.id_customer = o.id_customer
join order_detail od on o.id_order = od.id_order
join product p on od.id_product = p.id_product;

select c.`name` 
from customers c 
where c.id_customer not in (
select c.id_customer
from customers c
join  orders o on c.id_customer = o.id_customer);

select o.id_order,o.date_order,sum(ifnull(od.od_QTY,0)*ifnull(p.price,0)) as  totalPrice
from orders o 
join order_detail od on o.id_order= od.id_order
join product p on p.id_product = od.id_product 
group by o.id_order;




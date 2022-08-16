-- Bước 1 
drop database if exists demo;
create database demo;
use demo;

-- Bước 2
create table products (
id int auto_increment primary key,
product_code varchar(45),
product_name varchar(50),
product_price double,
product_amount int,
product_description varchar(60),
product_status varchar(60)
);
insert into products(product_code,product_name,product_price,product_amount,product_description,product_status) values
('Milk-01','TH True Milk',8000,150,'Viet Nam','New'),
('Milk-02','Vina Milk',7000,50,'Viet Nam','New'),
('Beer-01','Heniken',20000,200,'American','Import'),
('Beer-02','Budweiser',22000,210,'Germany','import'),
('Biscuit-01','Candy cake',12000,150,'Viet Nam','New');
-- Bước 3



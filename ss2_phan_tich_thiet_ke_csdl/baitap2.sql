	drop database if exists ss2_quan_ly_ban_hang;
    create database ss2_quan_ly_ban_hang;
    use ss2_quan_ly_ban_hang;
    
    create table customer(
    c_id int primary key,
    `name` varchar(45),
    age int
    );
    
    create table orderr (
    o_id int primary key,
    date_order date,
    total_price double,
    id_customer int,
    foreign key (id_customer) references customer(c_id)
    );
    create table product(
    p_id int primary key,
    `name` varchar(45),
    price double
    );
    create table order_detail(
    od_qty int,
    p_id int,
    o_id int,
    primary key(p_id,o_id),
    foreign key (p_id) references product(p_id),
    foreign key (o_id) references orderr(o_id)
    );
    
    
create database bt5s2;
use bt5s2;
create table if not exists users(
id int primary key auto_increment,
fullname varchar(100),
email varchar(100),
phone varchar(11),
permission bit,
status bit
);
create table if not exists address(
id int primary key auto_increment,
user_id int,
constraint lk_address_user foreign key(user_id) references users(id),
receiveAddress varchar(100),
receiveName varchar(100),
receivePhone varchar(11),
isDefault bit
);
create table if not exists order1(
id int primary key auto_increment,
orderAt datetime,
totals double,
user_id int,
constraint lk_order_user foreign key(user_id) references users(id),
status bit
);
create table if not exists book(
id int primary key auto_increment,
name varchar(100),
price double,
stock int,
status bit
);
create table if not exists order_detail(
id int primary key auto_increment,
order_id int,
constraint lk_orderdetail_user foreign key(order_id) references order1(id),
book_id int,
constraint lk_od_book foreign key(book_id ) references book(id),
quantity int,
unit_price double
);
create table if not exists catalog (
id int primary key auto_increment,
name varchar(100),
status bit
);
create table if not exists book_catalog(
catalog_id int,
constraint lk_bc_c foreign key(catalog_id) references catalog(id),
book_id int,
constraint lk_end foreign key(book_id) references book(id)
)
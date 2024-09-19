create database bt6s2;
use bt6s2;
create table if not exists users(
id int primary key auto_increment,
fullName varchar(100),
email  varchar(255),
password varchar(255),
phone varchar(11),
permission bit,
status bit
);
create table if not exists catalog(
id int primary key auto_increment,
name varchar(100),
status bit
);
create table if not exists product(
id int primary key auto_increment,
name varchar(100),
price double,
stock int,
catalog_id int,
status bit
);
create table if not exists wishlist(
user_id int,
constraint lk_wishlist1 foreign key(user_id ) references users(id)
);
create table if not exists shopping_cart(
id int primary key auto_increment,
user_id int,
constraint lk_sp1 foreign key(user_id ) references users(id),
product_id int,
constraint lk_p foreign key(product_id) references product(id), 
quantity int
);
create table if not exists order1(
id int primary key auto_increment,
orderAt datetime,
totals double,
user_id int,
constraint lk_order foreign key(user_id ) references users(id),
status bit
);
create table if not exists order_detail(
id int primary key auto_increment,
order_id int,
constraint lk_od foreign key(order_id) references order1(id),
product_id int,
constraint lk_od2 foreign key(product_id) references product(id), 
quantity int,
unit_price double
);
create table if not exists address(
id int primary key auto_increment,
user_id int,
constraint lk_a foreign key(user_id ) references users(id),
receiveAddress varchar(100),
receiveName varchar(100),
receivePhone varchar(11),
isDefault bit


)
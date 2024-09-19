create database bt1s2;
use bt1s2;

create table if not exists color(
id int primary key auto_increment,
name varchar(100),
status bit
);
create table if not exists product(
id int primary key auto_increment,
name varchar(100),
created date
);
create table if not exists size(
id int primary key auto_increment,
name varchar(100),
status bit
);
create table if not exists product_detail(
id int primary key auto_increment,
product_id int,
constraint lienket_01 foreign key(product_id) references product(id),
color_id int,
constraint lienket_02 foreign key(color_id) references color(id),
size_id int,
constraint lienket_03 foreign key(size_id) references size(id),
price double,
stock int,
status bit
)
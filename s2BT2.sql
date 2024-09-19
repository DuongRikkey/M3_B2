create database bt2s2;
use bt2s2;
create table if not exists customers(
cid int primary key auto_increment,
cName varchar(255),
cAge int
);
create table if not exists orders(
old int primary key auto_increment,
cid int, 
constraint lk_01 foreign key(cid) references customers(cid)
);
create table if not exists products(
pid int primary key auto_increment,
pName varchar(255),
pPrice double
);
create table if not exists orderDetail(
old int,
constraint lk_02 foreign key(old) references orders(old),
pid int,
constraint lk_03 foreign key(pid) references products(pid)

)

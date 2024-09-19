#Session 2 -Thiết kế CSDL
#Các Ràng buộc(Constraint)
-- Not Null
create database session2;
use session2;
create table if not exists Person(
-- id int not null unique,
id int primary key auto_increment,
-- auto_increment (muốn dùng phải khai báo primary key)
-- ID tự tăng không cần nhập
name varchar(100),
age int,
sex bit
);
-- Thêm dữ liệu vào mảng 
insert into Person(id,name,age,sex) values(null,'Dương',23,1);
-- Lỗi: Error Code: 1048 Column 'id' cannot be null
-- lấy dữ liệu của 1 bảng
select*from person;
-- * ở đây là all chọn tất
-- chọn ít trường hơn
-- select id,name from person 
insert into Person(name,age,sex) values('Dương',23,1),
('Dinh',2,0);

insert into Person(id,name,age,sex) values(1,'Dương',23,1);
-- Sinh ra lỗi Error Code: 1062. Duplicate entry '1' for key 'person.PRIMARY'
-- Trên thì not null mà cho giá trị null thì nó sẽ lỗi person ID, đây thì primary key autoIncrement mà cố tính cho ID vào thì lỗi Primary
insert into Person(id,name,age,sex) values(null,'Dương',23,1);
-- vì để tự tăng rồi nên để giá trị null thì nó vẫn tự tăng còn không để autoIncrement thì nó sẽ sinh ra lỗi không thể null tại PrimaryKey vì đơn giản Primary key=not null+unique
-- Error Code: 1062. Duplicate entry '1' for key 'person.id'
-- Nếu sử dụng unique sẽ xảy ra lỗi 1062
-- Primary Key răng buộc khóa chính, dùng để phân biệt bản ghi này với bản ghi khác , nó bao gồm 2 ràng buộc unique và not null
-- PrimaryKey=not null+unique

-- --PRIMARY KEY
-- --Foregin key
-- Catalog (1) và Product (n)
-- Khóa ngoại ở bảng nhiều  
-- Chèn thăng không chứ khóa ngoại trước
-- 1 danh mục có nhiều sản phẩm Quan hệ 1 nhiều (1->n)
-- 1 sản phẩm thuộc mấy  danh mục  (1->1)

create table Catalog (
id int primary key auto_increment,
name varchar(100) unique not null,
description text
);
create table Product(
id int auto_increment,
name varchar(100) unique not null,
description text,
price double check (price>0),
stock int,
status bit default 1,
Catalog_id int not null, -- là khóa ngoại tham chiếu tới khóa chính của bảng catalog
constraint lien_ket1 foreign key(Catalog_id) references Catalog(id),-- tăng tính 
-- --references tham chiếu
constraint check_stock check(stock>0),
-- Khóa phực hợp 
primary key(id,name,stock)

);
insert into Catalog(name,description) values ( 'áo','áo hàng 2nd '),('quần','quần 2nde');
insert into Product(name,description,price,stock,status,Catalog_id) values ('Quần âu','Không nói',30,2,1,1);
-- --thêm/xóa ràng buộc
alter table Product
drop constraint lien_ket1;
-- --Thêm lại
alter table Product
add constraint lienket2 foreign key(Catalog_id) references Catalog(id);


-- Cập nhật danh mục số 2 thành giày
update  Catalog set name='Duong',description='Khongcc' where id=1;
insert into Catalog(name,description) value('HIHI','bÌNH CHUẨN');
select*from Catalog;
-- Example
update Product set description='kkkkk',price=200 where id=1;
-- Lý do cập nhập theo ID vì ID là khóa chính kbh thay đổi
delete from Catalog where id=2;
-- nếu mà danh mục được sử dụng trong Product rồi phải xóa sp trước
-- delete from Product where id=..

-- lấy ra select
select name from product
create database bt4s2;
use bt4s2;

create table if not exists users(
id int primary key auto_increment,
fullName varchar(100),
email varchar(255),
password varchar(255),
phone varchar(11),
permissiton bit,
status bit
);
create table if not exists history(
id int primary key auto_increment,
user_id int,
constraint lk_history_users foreign key(user_id) references users(id),
point int,
examDate datetime
);
create table if not exists exams (
id int primary key auto_increment,
name varchar(255),
duration int,
status bit
);
create table if not exists questions(
id int primary key auto_increment,
content varchar(255),
exam_id int,
constraint lk_q_e foreign key(exam_id) references exams(id),
status bit
);
create table if not exists answer (
id int primary key auto_increment,
content varchar(255),
question_id int,
constraint lk_a_q foreign key(question_id) references questions(id),
answerTrue bit
);
create table if not exists history_detail(
id int primary key auto_increment,
history_id int,
constraint lk_hd_h foreign key(history_id) references history(id),
result bit
)




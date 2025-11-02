CREATE DATABASE dbstudents;

Create table tblstudents(
id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
age int not null,
course varchar(50) not null,
gwa float not null
);
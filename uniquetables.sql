create table employee (
employee_id serial primary key,
number int not null,
company varchar(10) not null,
date_hire date
); 

create table infoemployee(
employee_id serial primary key,
name varchar(50) not null,
last_name varchar(50) not null,
salary decimal (10, 2) not null,
age int,
date_hire date default current_date,
location varchar(50) null,
username varchar(50) unique not null,
password varchar(50) unique not null,
foreign key (employee_id) references employee (employee_id)
);



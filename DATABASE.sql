USE DBconcentrix;

Create table tblemployees(
id int primary key auto_increment,
name varchar(50) not null,
last_name varchar(50) not null,
age int not null,
address varchar(50) not null
);

CREATE table tblinfo(
job_id int primary key auto_increment,
employee_id int,
salary int not null,
prog_language varchar(50) not null,
foreign key (employee_id) references tblemployees(id)
);

/*I have 20 employers*/
SELECT count(id) from tblemployees;

SELECT * FROM tblemployees
JOIN tblinfo as info on  id = info.employee_id;

SELECT name, age from tblemployees
join tblinfo as info on id = info.employee_id;

SELECT e.name, e.last_name, e.age, info.salary, info.prog_language FROM tblemployees e
INNER JOIN tblinfo as info on id = info.employee_id
where lower(prog_language) = "java" and e.age <25;

SELECT * FROM tblemployees
LEFT JOIN tblinfo as info on id = info.employee_id
where info.employee_id is null;

SELECT * FROM tblemployees
INNER JOIN tblinfo as info on id = info.employee_id
where salary > 500000;

SELECT any_value (name), city as city, count(*) FROM tblemployees
FULL JOIN tblinfo as info on id = info.employee_id
group by city
order by city;

SELECT city, count(*) from tblemployees
group by city
order by city;

ALTER TABLE tblemployees
rename column address to City;

SELECT city, count(*) 
from tblemployees e
join tblinfo as info on id = info.employee_id
group by city;

SELECT city, count(*) AS TOTAL
from tblemployees
group by city;

SELECT * FROM tblemployees;

DESCRIBE tblinfo;

INSERT INTO tblemployees(name,last_name,age,address)
VALUES
("Rodrigo","Duterty",78,"Davao"),
("Olivia", "Rodrigo", 31, "Manchester City"),
("George", "Forman", 52, "Chicago");
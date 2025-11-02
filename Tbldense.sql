USE record_company;

CREATE TABLE departments (
  department_id int primary key auto_increment,
  department_name varchar(50) not null,
  location varchar(50) not null
);

INSERT INTO departments (department_id, department_name, location)
VALUES
(1, 'IT', 'Manila'),
(2, 'Sales', 'Cebu'),
(3, 'HR', 'Davao'),
(4, 'Finance', 'Manila'),
(5, 'Marketing', 'Cebu');

CREATE TABLE employees (
  employee_id int primary key auto_increment,
  first_name varchar(50) not null,
  last_name varchar(50) not null,
  department_id int,
  salary float,
  hire_date date,
  FOREIGN KEY (department_id) references departments(department_id)
);

INSERT INTO employees (employee_id, first_name, last_name, department_id, salary, hire_date)
VALUES
(101, 'Juan', 'Dela Cruz', 1, 50000, '2020-01-15'),
(102, 'Maria', 'Santos', 2, 60000, '2019-05-20'),
(103, 'James', 'Reyes', 1, 55000, '2021-03-10'),
(104, 'Ana', 'Lopez', 3, 75000, '2018-11-30'),
(105, 'Michael', 'Garcia', 2, 48000, '2022-02-22'),
(106, 'Sarah', 'Lim', 4, 82000, '2017-08-12'),
(107, 'Carlos', 'Torres', 1, 52000, '2020-07-01'),
(108, 'Elena', 'Rivera', 5, 68000, '2019-12-05'),
(109, 'Patrick', 'Ong', 4, 90000, '2016-04-18'),
(110, 'Grace', 'Tan', 3, 65000, '2021-09-25'),
(111, 'Daniel', 'Sy', 2, 53000, '2020-11-08'),
(112, 'Rosa', 'Diaz', 5, 71000, '2018-03-14'),
(113, 'Paul', 'Chua', 1, 58000, '2022-01-30'),
(114, 'Liza', 'Gonzales', 3, 62000, '2019-07-22'),
(115, 'Anthony', 'Lee', 4, 85000, '2017-02-10'),
(116, 'Megan', 'Wong', 2, 49000, '2021-05-15'),
(117, 'Francis', 'Ng', 5, 73000, '2020-09-11'),
(118, 'Irene', 'Chen', 1, 56000, '2018-06-27'),
(119, 'Victor', 'Lim', 3, 69000, '2019-10-03'),
(120, 'Stephanie', 'Yu', 4, 88000, '2016-11-19'),
(121, 'Aaron', 'Ramos', 2, 51000, '2022-03-08'),
(122, 'Jasmine', 'Lao', 5, 67000, '2021-01-12'),
(123, 'Brian', 'Uy', 1, 54000, '2020-04-05'),
(124, 'Chloe', 'Koh', 3, 64000, '2018-08-20'),
(125, 'Edwin', 'Ocampo', 4, 91000, '2015-12-25'),
(126, 'Tina', 'Aquino', 2, 47000, '2022-06-14'),
(127, 'Raymond', 'Sison', 5, 76000, '2017-09-09'),
(128, 'Janet', 'Lim', 1, 59000, '2019-02-28'),
(129, 'Mark', 'Teo', 3, 71000, '2020-10-17'),
(130, 'Cynthia', 'Ortiz', 4, 87000, '2016-07-07');
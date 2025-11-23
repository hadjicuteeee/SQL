\c project2 postgres;

CREATE TABLE customers (
  customerNumber SERIAL PRIMARY KEY,
  customerName VARCHAR(100),
  addressLine2 VARCHAR(100),
  state VARCHAR(50)
);

INSERT INTO customers (customerNumber, customerName, addressLine2, state) VALUES
(101, 'Juan Dela Cruz', NULL, 'Metro Manila'),
(102, 'Maria Santos', 'Blk 12 Lot 4', NULL),
(103, 'Pedro Reyes', NULL, NULL),
(104, 'Ana Cruz', 'Apt. 5B', 'Cebu'),
(105, 'Lito Ramos', 'Unit 201', 'Davao');


CREATE TABLE orders (
  orderNumber SERIAL PRIMARY KEY,
  orderDate DATE,
  requiredDate DATE,
  shippedDate DATE,
  status VARCHAR(50),
  comments VARCHAR(100)
);

INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, status, comments) VALUES
(5001, '2024-10-01', '2024-10-05', '2024-10-04', 'Shipped', 'Delivered early'),
(5002, '2024-10-02', '2024-10-06', NULL, 'In Process', 'Still preparing'),
(5003, '2024-10-03', '2024-10-07', NULL, NULL, NULL),
(5004, '2024-10-04', '2024-10-08', '2024-10-07', 'Shipped', NULL);


CREATE TABLE employees (
  employeeNumber SERIAL PRIMARY KEY,
  firstName VARCHAR(50),
  lastName VARCHAR(50),
  jobTitle VARCHAR(50)
);

INSERT INTO employees (employeeNumber, firstName, lastName, jobTitle) VALUES
(1, 'Carlos', 'Solis', 'Manager'),
(2, 'Ramon', 'Rosario', 'Sales Rep'),
(3, 'Liza', 'Dionisio', 'HR'),
(4, 'Mark', 'Santos', 'Developer'),
(5, 'Ella', 'Villanueva', 'Analyst');


CREATE TABLE employees_copy (
  employeeNumber SERIAL PRIMARY KEY,
  firstName VARCHAR(50),
  lastName VARCHAR(50),
  jobTitle VARCHAR(50)
);

INSERT INTO employees_copy (employeeNumber, firstName, lastName, jobTitle) VALUES
(10, 'Carlo', 'Soberano', 'Assistant'),
(11, 'Ramon', 'Solito', 'Technician'),
(12, 'Liza', 'Miranda', 'Analyst'),
(13, 'Marco', 'Sion', 'Support'),
(14, 'Ella', 'Jimenez', 'Intern');






--TASK 1
SELECT customerNumber, 
       customerName, 
       COALESCE(addressline2, 'No Address'),
       COALESCE(state, 'No State') 
FROM customers;

--TASK 2
SELECT orderNumber, orderDate, requiredDate, status,
       COALESCE(shippedDate::text, comments) AS "Ship Result",
       COALESCE(comments, 'No Ship Information') AS "Comment Result"
FROM orders;

--TASK 3
SELECT employeeNumber, firstName, lastName, jobTitle
FROM employees
  
UNION
SELECT employeeNumber, firstName, lastName, jobTitle
FROM employees_copy;

--TASK 4
SELECT employeeNumber, firstName, lastName, jobTitle
FROM employees
UNION ALL
SELECT employeeNumber, firstName, lastName, jobTitle
FROM employees_copy;




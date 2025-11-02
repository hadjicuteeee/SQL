CREATE DATABASE amploy;

create table employee_salary(
employee_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
occupation VARCHAR(50),
salary DECIMAL(10,2),
dept_id INT
);	

INSERT INTO employee_salary (first_name, last_name, occupation, salary, dept_id)  
VALUES 
    ('Leslie', 'Knope', 'Government Official', 75000.00, 1),
    ('Tom', 'Rodriguez', 'Marketing Manager', 60000.00, 2),
    ('Maria', 'Santos', 'Software Engineer', 80000.00, 3),
    ('Carlos', 'Reyes', 'Sales Executive', 55000.00, 4),
    ('Anna', 'Garcia', 'HR Specialist', 50000.00, 5),
    ('Miguel', 'Torres', 'Data Analyst', 70000.00, 3),
    ('Sophia', 'Lopez', 'Graphic Designer', 45000.00, 2),
    ('David', 'Cruz', 'IT Support', 48000.00, 3),
    ('Elena', 'Rodriguez', 'Project Manager', 85000.00, 1),
    ('Javier', 'Fernandez', 'Accountant', 65000.00, 4);
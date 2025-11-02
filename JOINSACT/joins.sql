-- 1. Joins

SELECT * FROM employee_demographics;

SELECT * FROM employee_salary;

SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id +1 = sal.employee_id 
;


-- 2. Outer Joins

SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id 
;


-- SELF JOIN

SELECT * FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id = emp2.employee_id


;
SELECT * FROM employees e
inner join departments d  on e.department_id = d.department_id;

-- Query 1: Ranking of employees by salary within department
WITH total_salary as (
	select e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name,
    e.salary,
    dense_rank() over (
    partition by department_name
    order by salary desc) as salary_rank
    from employees e
    inner join departments d on e.department_id = d.department_id
    )
    SELECT * from total_salary;
    

    
-- Query 2: Compute total years of employees hired since 2020
WITH total_years as (
	select employee_id,
    first_name,
    last_name,
    hire_date,
    timestampdiff(YEAR, hire_date, curdate()) as total_years
    from employees
	 WHERE hire_date >= '2020-01-01'
    )
    select * from total_years;	
    
 -- Query 3: Combine employee details with department ranking and years of service   
	with total_years as (
    select e.employee_id,
    e.first_name,
    e.last_name,
    e.hire_date,
    timestampdiff(year, hire_date, curdate()) as total_years,
    d.department_name,
    e.salary,
    dense_rank()
    over (
    partition by department_name order by salary desc) total_ranking
    from employees e
    inner join departments d on e.department_id = d.department_id
	)
    select * from total_years;
    
-- Query 4: Department summary with top employee per department
with department as (
		select department_name,
        count(e.employee_id) total_employees,
		truncate (avg(salary),0) as avg_salary
        from departments d
        inner join employees e on d.department_id = e.department_id
        group by department_name
        ),
        
ranking as (
		select e.first_name as top_employee,
        salary,
        department_name,
        dense_rank()
		over (partition by department_name order by e.salary desc) as highest_paid_employee
		from employees e
        inner join departments d on e.department_id = d.department_id 
        )
  SELECT 
    dept.department_name,
    dept.total_employees,
    dept.avg_salary,
    r.top_employee,
    r.salary
    from department as dept
    inner join ranking as r on dept.department_name = r.department_name
    where highest_paid_employee = 1;
        

  
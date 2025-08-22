# SQL Activities – Employee & Department Analysis  

This repository contains a series of SQL queries demonstrating the use of **Common Table Expressions (CTEs)**, **aggregate functions**, and **window functions** in analyzing employee and department data.  

The dataset used assumes a structure similar to the **HR database** (commonly used in SQL practice).  

---

## 📌 Queries Included  

### 1. Employee Salary Ranking  
- Ranks employees within each department based on salary.  
- Uses `DENSE_RANK()` with `PARTITION BY`.  
```sql
WITH total_salary AS (
    SELECT e.employee_id, e.first_name, e.last_name, d.department_name, e.salary,
           DENSE_RANK() OVER (PARTITION BY department_name ORDER BY salary DESC) AS salary_rank
    FROM employees e
    INNER JOIN departments d ON e.department_id = d.department_id
)
SELECT * FROM total_salary;

# 🧾 Employee Management Database (PostgreSQL)

This project contains SQL scripts for creating and modifying an **Employee Management System** database using **PostgreSQL** (pgAdmin).

---

## 🏗️ Database Structure

### 🧩 `employee` Table
```sql
CREATE TABLE employee (
  employee_id SERIAL PRIMARY KEY,
  number INT NOT NULL,
  company VARCHAR(10) NOT NULL,
  date_hire DATE
);


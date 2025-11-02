USE dbproject1;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10, 2),
    transaction_date DATETIME,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customers (customer_id, name, city) VALUES
(1, 'Anna', 'Manila'),
(2, 'Ben', 'Quezon City'),
(3, 'Carl', 'Cebu'),
(4, 'Dana', 'Davao'),
(5, 'Ella', 'Manila'),
(6, 'Finn', 'Cebu'),
(7, 'Grace', 'Baguio'),
(8, 'Hugo', 'Manila'),
(9, 'Ivy', 'Cebu'),
(10, 'Jake', 'Davao');

INSERT INTO Transactions (transaction_id, customer_id, amount, transaction_date) VALUES
(1, 1, 1200.00, '2025-07-01 10:30:00'),
(2, 2, 850.00, '2025-07-01 14:20:00'),
(3, 3, 2000.00, '2025-07-02 09:00:00'),
(4, 4, 950.00, '2025-07-02 16:30:00'),
(5, 5, 300.00, '2025-07-03 11:00:00'),
(6, 6, 1100.00, '2025-07-03 13:45:00'),
(7, 7, 1500.00, '2025-07-04 08:00:00'),
(8, 8, 2750.00, '2025-07-05 17:10:00'),
(9, 9, 500.00, '2025-07-05 09:45:00'),
(10, 10, 1300.00, '2025-07-06 14:00:00'),
(11, 1, 600.00, '2025-07-06 10:15:00'),
(12, 2, 450.00, '2025-07-07 12:25:00'),
(13, 3, 100.00, '2025-07-08 08:00:00'),
(14, 4, 3000.00, '2025-07-08 19:00:00'),
(15, 5, 200.00, '2025-07-09 15:00:00'),
(16, 6, 900.00, '2025-07-09 16:10:00'),
(17, 7, 1250.00, '2025-07-10 11:45:00'),
(18, 8, 1800.00, '2025-07-10 09:30:00'),
(19, 9, 750.00, '2025-07-11 13:00:00'),
(20, 10, 1950.00, '2025-07-12 10:00:00');


-- Weekly total sales per customer for July 2025
SELECT week(transaction_date) as week_number,
    c.name,
    sum(t.amount) as total_sales
	FROM transactions t
    INNER JOIN customers as c on t.customer_id = c.customer_id
    where month(transaction_date) = 7 and year (transaction_date) = 2025
    group by week(t.transaction_date), c.name;

-- CTE: Top customer per week using ROW_NUMBER()
WITH WeekLy_sales as (
    -- Get weekly total per customer
    SELECT week(transaction_date) as week_number,
    c.name,
    sum(t.amount) as total_sales
	FROM transactions t
    INNER JOIN customers as c on t.customer_id = c.customer_id
    where month(transaction_date) = 7 and year (transaction_date) = 2025
    group by week(t.transaction_date), c.name),
    
    RankedSales AS(
    -- Add row number per week based on highest sales
    SELECT *,
    ROW_NUMBER() OVER (
    PARTITION BY week_number
    order by total_sales desc )
    AS rank_per_week 
    FROM WeekLy_sales
    )
    
-- Final result: top 1 customer per week
SELECT 
    week_number,
    name as top_customer,
    total_sales
    from RankedSales
    Where rank_per_week = 1;

-- Join customers and transactions (full records)
SELECT * FROM CUSTOMERS c
    INNER JOIN transactions o on c.customer_id = o.customer_id;

-- Total sales per city in July 2025 (ranked)
SELECT c.city,
		   sum(t.amount) as total_sales 
           from customers as c
		INNER JOIN transactions t on c.customer_id = t.customer_id
        where month(transaction_date) = 7 and year(transaction_date) = 2025
        group by city
        order by total_sales desc;

-- Weekly sales totals in July 2025
SELECT week(transaction_date) as week_number,
		sum(amount) as total_sales
		from transactions
		where month(transaction_date) = 7 and year(transaction_date) = 2025
        group by week(transaction_date)
        order by week_number;

-- Least number of purchases by customer in July 2025
SELECT c.name,
	   c.city,
       count(transaction_id) as TOTAL_PURCHASED from
       transactions as t
		JOIN customers c on t.customer_id = c.customer_id
        where month(t.transaction_date) = 7 and year(t.transaction_date) = 2025
       group by c.customer_id, c.name, c.city
       order by total_purchased
       limit 1; 	

-- ✅ Notes on sorting
-- DESC - highest to lowest
-- ASC - lowest to highest

-- Top 3 highest transaction amounts (regardless of customer)
SELECT 
	c.name, 
    t.amount 
	FROM customers as c
	INNER JOIN transactions as t
    on c.customer_id = t.customer_id
	order by t.amount desc
	limit 3;

-- Daily sales totals with ROLLUP for July 2025
SELECT
	DATE(transaction_date) as sales_perday,
    sum(amount) as total_amount
	FROM customers as c
	INNER JOIN transactions as t
    on c.customer_id = t.customer_id
    group by transaction_date with ROLLUP;

-- Using CTE to get daily sales with total row (ROLLUP)
WITH TOTAL_PRICE as (
	SELECT DATE(transaction_date) as daily_sales,
    sum(amount) as total_sales
    from customers as c
    INNER JOIN transactions as t
    on c.customer_id = t.customer_id
    group by transaction_date with ROLLUP
    )
    
    SELECT daily_sales, total_sales from TOTAL_PRICE;

-- Customer with most purchases (counted by transactions)
SELECT c.name,
    count(c.customer_id) as total_purchases,
    c.city
    FROM transactions t
    inner join customers c on t.customer_id = c.customer_id
    where month(transaction_date) = 7 and year(transaction_date) = 2025
    group by c.customer_id
    order by c.customer_id desc
    limit 1;

    
    
    
    
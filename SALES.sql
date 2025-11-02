USE DBsales;

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    category VARCHAR(50),
    amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sales (sale_id, customer_name, category, amount, sale_date) VALUES
(1, 'Anna', 'Clothing', 500, '2025-08-01'),
(2, 'Anna', 'Clothing', 700, '2025-08-03'),
(3, 'Anna', 'Electronics', 1000, '2025-08-05'),
(4, 'Ben', 'Clothing', 300, '2025-08-02'),
(5, 'Ben', 'Electronics', 2000, '2025-08-04'),
(6, 'Ben', 'Electronics', 1500, '2025-08-06'),
(7, 'Cara', 'Clothing', 900, '2025-08-01'),
(8, 'Cara', 'Clothing', 600, '2025-08-04'),
(9, 'Cara', 'Electronics', 2500, '2025-08-07');

SELECT sale_id, 
			customer_name, 
			category, 
			amount, 
			sale_date,
		sum(amount)
		 over (partition by customer_name)
		 as total_amount_per_customer
		 from sales;

SELECT *,
	max(amount) over(partition by category)	
    as max_per_category
		FROM sales;
        
SELECT *,
	 sum(amount) over(partition by customer_name) 
     as total_amount_per_customer,
    avg(amount) over(partition by category) 
    as avg_amount_per_category
		from sales
		order by customer_name;

SELECT*,
	SUM(amount) over (partition by customer_name) 
    as total_amount_per_customer,
    AVG(amount) over (partition by category) 
    as total_avg_per_category,
    RANK() over(partition by category order by amount desc) 
    as rank_per_category
    from sales
	order by category, rank_per_category;

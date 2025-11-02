SELECT * FROM customerss c
INNER JOIN orderss o on c.customer_id = o.customer_id;

SELECT o.customer_id, customer_name,
	sum(amount) over(partition by customer_name) 
    as total_amount_by_customer
		FROM customerss c
		INNER JOIN orderss o
		on c.customer_id = o.customer_id
		order by customer_id asc; 
        
SELECT o.order_id, 
	c.customer_name, 
	c.city, 
	o.amount,
	avg(amount) over(partition by city)
    as average_amount_per_city
	FROM customerss c
	INNER JOIN orderss o on c.customer_id = o.customer_id
	order by c.city ASC, o.amount desc;


SELECT *,
	sum(amount) over(partition by customer_name) as total_sales,
    avg(amount) over(partition by city) as total_sales_per_city,
    RANK() over(partition by city order by amount desc) ranking,
    count(order_id) over(partition by customer_name) as total_orders_by_customer
	FROM customerss c
		INNER JOIN orderss o on c.customer_id = o.customer_id
	order by city ASC, ranking ASC;
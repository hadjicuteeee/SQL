SELECT * FROM customers c 
inner join sales s on c.customer_id = s.customer_id;

With total_sales as (
	select country,
    sum(sale_amount) as total_sales_per_country
    from customers c
    inner join sales s on c.customer_id = s.customer_id
    group by country
   )
    select country,
    total_sales_per_country,
    dense_rank() over (order by cast(total_sales_per_country as SIGNED) DESC) as per_rankning
    from total_sales;
    
WITH top_customer as (
	select c.customer_id,
    c.customer_name,
    sum(s.sale_amount) total_spent,
    dense_rank()
    over(order by sum(s.sale_amount)desc) as ranked
    from customers c
    inner join sales s on c.customer_id = s.customer_id
    group by c.customer_id, c.customer_name
    )
	select * from top_customer
    where ranked <= 5
    order by total_spent desc;


WITH total_sales as (
	select s.product,
    sum(s.sale_amount) as total_sales
    from sales s
    inner join customers c on s.customer_id = c.customer_id
    group by s.product),

 overall_sales as (
	select
    sum(s.sale_amount) as overall_sales
    FROM sales s
	inner join customers c on s.customer_id = c.customer_id
    )
    select 
    t.product,
    t.total_sales,
    o.overall_sales,
    concat(round((t.total_sales / o.overall_sales) *100, 2 ),'%') as percentage_shares
    from total_sales t 
    CROSS JOIN overall_sales o;
    
select c.customer_name as `customer name`,
		count(c.customer_id) as `number of transaction`
        from customers c 
inner join sales s on c.customer_id = s.customer_id
group by c.customer_id;

with country_sales as (
	select country,
    sum(sale_amount) as `Sales per Country`
    from customers c
    inner join sales s on c.customer_id = s.customer_id
    group by country
    ),
	
 percentage as (
	select 
    sum(s.sale_amount) as overall
    from customers c
    inner join sales s on c.customer_id = s.customer_id
    )
    select country,
    `Sales per country`,
    dense_rank() over(order by `Sales per country` desc) as Ranking,
    concat(round((`Sales per Country`/ overall) *100, 2),'%') as contribution
    from country_sales
    cross join percentage;
    

SELECT c.customer_id,
       c.customer_name,
       c.country,
       s.sale_id,
       s.product,
       s.sale_amount,
       s.sale_date
FROM customers c
INNER JOIN sales s 
    ON c.customer_id = s.customer_id;

    
    
    
	


    

    
    
 
      
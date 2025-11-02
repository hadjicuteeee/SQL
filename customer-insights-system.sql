select * 
	from customers
	where location in ("laguna", "manila");
    

select product_name, price from products
order by price desc;


select p.product_id, 
product_name, 
sum(total_price) as total_revenue 
from products as p 
inner join sales as s on p.product_id = s.product_id
group by product_name, p.product_id;

with high_customer as (
	select 
    name as Name,
    sum(total_price) as `Total Spent`
    from customers as c
    inner join sales as s on c.customer_id = s.customer_id
    group by name)
    select name, 
    `Total Spent`,
    row_number() over(order by `Total Spent` desc) as `RANKING`
    from high_customer
    limit 3;
   
    

with area_places as (
select  
		location,
        sum(total_price) as `Area Sales`
        from customers c
        inner join sales s on c.customer_id = s.customer_id
        group by location)
        select Location,
        `Area Sales`,
        dense_rank() over(order by `Area Sales` desc) as `Rank`
        from area_places;


with sale_Dates as (
select 	
	sum(total_price) as total_revenue,
	sale_date
    from sales 
    group by rollup(sale_date)
    
    ) select * from sale_Dates
    order by sale_date desc;
    
    
select name, age,
case 
		WHEN age < 18 THEN 'Minor Buyer'
        When age BETWEEN 18 and 59 THEN 'Adult  Buyer'
        When age >= 59 THEN 'Senior Buyer'
        ELSE 'NOT FOUND'
        END as Age_group
 from customers;
 
 
 with ctecategory as (
 select product_name,
		price,
        case 
        when price >= 1000 THEN 'high price'
        when price >= 100 THEN 'budget price'
        when price >= 50 THEN 'low price'
        end as priceCategory
        from products)
        select * from ctecategory
        order by price asc;





	with productRanking as (
		select product_name,
		name,
		sum(s.total_price) as total_spent,
		row_number() over (partition by p.product_id order by sum(s.total_price) desc) as ranking
		from customers c
		inner join sales s on c.customer_id = s.customer_id
		inner join products p on s.product_id = p.product_id
		group by p.product_id, p.product_name, c.name)
		select product_name,
        name as top_buyer
        from productRanking
		where ranking = 1;
 
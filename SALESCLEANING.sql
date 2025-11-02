select * from customers 
where customer_name is null or country is null;

select * from sales
where sale_amount is null or sale_date is null;

select * from customers 
group by customer_id
having count(*) >1;

select * from sales
group by sale_id
having count(*) >1;

select * from sales 
where sale_amount > curdate();	

select * from customers 
where customer_name = '' or  country = '';

select * from sales
where sale_amount < 0;
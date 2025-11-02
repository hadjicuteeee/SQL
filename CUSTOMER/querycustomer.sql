

SELECT items, sum(qty), sum(price * qty) as total_price
FROM tblcustomer
GROUP BY items;

SELECT first_name, last_name, SUM(qty), SUM(price * qty) as total_qty
FROM tblcustomer
GROUP BY first_name, last_name
ORDER BY total_qty DESC
LIMIT 5;
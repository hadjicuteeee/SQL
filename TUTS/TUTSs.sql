SELECT saledate, amount from sales
where amount > 10000 and year(SaleDate) = 2022
order by amount desc;

SELECT * FROM SALES
where boxes <= 50
order by boxes;

SELECT * FROM SALES
where boxes between 0 and 50
order by boxes;
USE dbproject1;

CREATE TABLE brands (
brand_id int auto_increment primary key,
brand_name varchar(50) not null
);

CREATE TABLE categories (
category_id int auto_increment primary key,
category_name varchar(50) not null
);

CREATE table products(
product_id int auto_increment primary key,
product_name varchar(50) not null,
brand_id int,
category_id int,
model_year int,
list_price DECIMAL(10,2),
FOREIGN KEY (category_id) references categories (category_id),
FOREIGN KEY (brand_id) references brands (brand_id)
);

-- Show the number of products for each brand and category combination
SELECT b.brand_name, 
       c.category_name,
       COUNT(*) AS total_product
FROM PRODUCTS AS p
JOIN brands AS b ON p.brand_id = b.brand_id
JOIN categories AS c ON p.category_id = c.category_id
GROUP BY b.brand_name, c.category_name
ORDER BY total_product DESC;

--  Show the total number of products for each model year
SELECT p.model_year,
       COUNT(*) AS total_product
FROM products AS p
JOIN brands AS b ON p.brand_id = b.brand_id
GROUP BY model_year;

-- Show all products along with their category and brand details
SELECT * FROM products
LEFT JOIN categories AS cat ON products.category_id = cat.category_id
LEFT JOIN brands AS bra ON products.brand_id = bra.brand_id;

-- Show all products with brand information only
SELECT * FROM products
LEFT JOIN brands AS bra ON products.brand_id = bra.brand_id;


SELECT * FROM categories;

-- List all product names in alphabetical order
SELECT product_name FROM products
ORDER BY product_name;

-- Show top 5 most expensive products with brand and category names
SELECT p.product_name,
       p.list_price,
       bra.brand_name,
       cat.category_name
FROM products AS p
JOIN brands AS bra ON p.brand_id = bra.brand_id
JOIN categories AS cat ON p.category_id = cat.category_id
ORDER BY list_price DESC
LIMIT 5;

-- Show the average list price per brand
SELECT b.brand_name,
       b.brand_id,
       AVG(list_price) AS average_price
FROM PRODUCTS AS p
JOIN brands AS b ON p.brand_id = b.brand_id
GROUP BY brand_id;

-- Show products from year 2016 or newer with brand and category
SELECT b.brand_name,
       c.category_name,
       p.model_year
FROM products AS p
LEFT JOIN categories AS c ON p.category_id = c.category_id
LEFT JOIN brands AS b ON p.brand_id = b.brand_id
WHERE model_year >= 2016;

-- Show the total number of products in each category
SELECT c.category_name AS Product_Name, 
       COUNT(*) AS Total_Product
FROM products AS p 
LEFT JOIN categories AS c ON p.category_id = c.category_id
GROUP BY category_name;

-- Show the average price of all products
SELECT AVG(list_price) AS average_value
FROM products;





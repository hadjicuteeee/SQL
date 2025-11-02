use inventory;

-- Create tables
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    location VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    sale_date DATE,
    total_price DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert customers
INSERT INTO customers (customer_id, name, age, location) VALUES
(1, 'Jihad', 21, 'Manila'),
(2, 'Olivia', 31, 'Quezon City'),
(3, 'Abel', 33, 'Cebu'),
(4, 'Jinggoy', 28, 'Davao'),
(5, 'Jojo', 40, 'Taguig'),
(6, 'Mia', 25, 'Pasig'),
(7, 'Carlo', 22, 'Makati'),
(8, 'Samantha', 30, 'Cavite'),
(9, 'Diego', 35, 'Laguna'),
(10, 'Lara', 26, 'Baguio'),
(11, 'Marcus', 29, 'Caloocan'),
(12, 'Althea', 32, 'Manila'),
(13, 'Roberto', 45, 'Cebu'),
(14, 'Grace', 23, 'Quezon City'),
(15, 'Daniel', 27, 'Iloilo'),
(16, 'Sophia', 24, 'Makati'),
(17, 'Enzo', 36, 'Davao'),
(18, 'Clara', 28, 'Pasay'),
(19, 'Felix', 31, 'Laguna'),
(20, 'Hannah', 22, 'Manila');

-- Insert products
INSERT INTO products (product_id, product_name, price) VALUES
(1, 'Burger', 120.00),
(2, 'Fries', 60.00),
(3, 'Fried Chicken', 150.00),
(4, 'Pizza', 250.00),
(5, 'Pasta', 180.00),
(6, 'Milk Tea', 90.00),
(7, 'Iced Coffee', 100.00),
(8, 'Hotdog Sandwich', 75.00),
(9, 'Taco', 110.00),
(10, 'Salad', 130.00);

-- Insert sales
INSERT INTO sales (sale_id, customer_id, product_id, quantity, sale_date, total_price) VALUES
(1, 1, 1, 2, '2025-09-01', 240.00),
(2, 2, 2, 1, '2025-09-01', 60.00),
(3, 3, 3, 3, '2025-09-02', 450.00),
(4, 4, 4, 1, '2025-09-02', 250.00),
(5, 5, 5, 2, '2025-09-02', 360.00),
(6, 6, 6, 1, '2025-09-03', 90.00),
(7, 7, 7, 2, '2025-09-03', 200.00),
(8, 8, 8, 3, '2025-09-04', 225.00),
(9, 9, 9, 2, '2025-09-04', 220.00),
(10, 10, 10, 1, '2025-09-05', 130.00),
(11, 11, 1, 1, '2025-09-05', 120.00),
(12, 12, 4, 2, '2025-09-06', 500.00),
(13, 13, 5, 1, '2025-09-06', 180.00),
(14, 14, 6, 3, '2025-09-07', 270.00),
(15, 15, 7, 2, '2025-09-07', 200.00),
(16, 16, 2, 4, '2025-09-08', 240.00),
(17, 17, 3, 2, '2025-09-08', 300.00),
(18, 18, 9, 1, '2025-09-08', 110.00),
(19, 19, 8, 2, '2025-09-09', 150.00),
(20, 20, 10, 3, '2025-09-09', 390.00),
(21, 1, 6, 2, '2025-09-10', 180.00),
(22, 2, 7, 1, '2025-09-10', 100.00),
(23, 3, 4, 1, '2025-09-11', 250.00),
(24, 4, 2, 2, '2025-09-11', 120.00),
(25, 5, 3, 1, '2025-09-12', 150.00),
(26, 6, 1, 3, '2025-09-12', 360.00),
(27, 7, 5, 2, '2025-09-13', 360.00),
(28, 8, 8, 1, '2025-09-13', 75.00),
(29, 9, 9, 4, '2025-09-14', 440.00),
(30, 10, 10, 2, '2025-09-14', 260.00);

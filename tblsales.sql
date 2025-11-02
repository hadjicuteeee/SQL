USE record_company;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    country VARCHAR(50)
);

INSERT INTO customers (customer_id, customer_name, country) VALUES
(1, 'Juan Dela Cruz', 'Philippines'),
(2, 'Maria Santos', 'Philippines'),
(3, 'John Smith', 'USA'),
(4, 'Anna Lee', 'South Korea'),
(5, 'Carlos Ramirez', 'Mexico'),
(6, 'Sophia Tan', 'Singapore'),
(7, 'Ahmed Ali', 'UAE'),
(8, 'Liu Wei', 'China'),
(9, 'Emma Brown', 'UK'),
(10, 'Hiroshi Sato', 'Japan'),
(11, 'Olga Ivanova', 'Russia'),
(12, 'Diego Martinez', 'Argentina'),
(13, 'Fatima Khan', 'Pakistan'),
(14, 'George Miller', 'Canada'),
(15, 'Hans Müller', 'Germany'),
(16, 'Isabella Rossi', 'Italy'),
(17, 'David Kim', 'South Korea'),
(18, 'William Johnson', 'USA'),
(19, 'Chloe Dubois', 'France'),
(20, 'Pedro Silva', 'Brazil'),
(21, 'Nguyen Van An', 'Vietnam'),
(22, 'Sarah Wilson', 'Australia');


CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(100),
    sale_amount DECIMAL(10,2),
    sale_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO sales (sale_id, customer_id, product, sale_amount, sale_date) VALUES
(101, 1, 'Laptop', 55000.00, '2024-01-15'),
(102, 2, 'Smartphone', 25000.00, '2024-01-20'),
(103, 3, 'Headphones', 3000.00, '2024-02-05'),
(104, 4, 'Tablet', 15000.00, '2024-02-10'),
(105, 5, 'Monitor', 12000.00, '2024-02-15'),
(106, 6, 'Keyboard', 2000.00, '2024-03-01'),
(107, 7, 'Laptop', 60000.00, '2024-03-12'),
(108, 8, 'Smartwatch', 8000.00, '2024-03-20'),
(109, 9, 'Printer', 7000.00, '2024-04-05'),
(110, 10, 'Mouse', 1500.00, '2024-04-15'),
(111, 11, 'Desktop PC', 40000.00, '2024-04-20'),
(112, 12, 'Laptop', 58000.00, '2024-05-05'),
(113, 13, 'Headphones', 3500.00, '2024-05-12'),
(114, 14, 'Smartphone', 27000.00, '2024-05-18'),
(115, 15, 'Tablet', 18000.00, '2024-05-25'),
(116, 16, 'Laptop', 65000.00, '2024-06-01'),
(117, 17, 'Monitor', 14000.00, '2024-06-08'),
(118, 18, 'Smartwatch', 10000.00, '2024-06-15'),
(119, 19, 'Printer', 8500.00, '2024-06-22'),
(120, 20, 'Keyboard', 2200.00, '2024-07-01'),
(121, 21, 'Laptop', 70000.00, '2024-07-10'),
(122, 22, 'Smartphone', 30000.00, '2024-07-18'),
(123, 1, 'Mouse', 1800.00, '2024-07-25'),
(124, 2, 'Tablet', 16000.00, '2024-08-02'),
(125, 3, 'Desktop PC', 45000.00, '2024-08-10'),
(126, 4, 'Laptop', 59000.00, '2024-08-15'),
(127, 5, 'Smartwatch', 9500.00, '2024-08-20'),
(128, 6, 'Monitor', 13000.00, '2024-08-28'),
(129, 7, 'Printer', 7800.00, '2024-09-05'),
(130, 8, 'Smartphone', 28000.00, '2024-09-12');

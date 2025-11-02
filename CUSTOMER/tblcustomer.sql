CREATE DATABASE customerDB;

CREATE TABLE tblcustomer(
id int PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(20),
last_name VARCHAR(20),
items VARCHAR(20),
price int,
qty int);

INSERT INTO tblcustomer(first_name,last_name,items,price,qty) VALUES
('Juan', 'Dela Cruz', 'Keyboard', 800, 2),
('Maria', 'Santos', 'Mouse', 500, 1),
('Pedro', 'Reyes', 'Speaker', 1200, 1),
('Ana', 'Gonzales', 'Keyboard', 750, 1),
('Carlos', 'Lopez', 'Mouse', 600, 2),
('Sofia', 'Martinez', 'Speaker', 1300, 1),
('Luis', 'Torres', 'Keyboard', 850, 3),
('Elena', 'Gutierrez', 'Mouse', 550, 1),
('Daniel', 'Fernandez', 'Speaker', 1400, 2),
('Isabel', 'Morales', 'Keyboard', 900, 1),
('Rafael', 'Ortega', 'Mouse', 650, 3),
('Camila', 'Navarro', 'Speaker', 1250, 1),
('Miguel', 'Hernandez', 'Keyboard', 800, 2),
('Andrea', 'Castro', 'Mouse', 600, 1),
('Gabriel', 'Vargas', 'Speaker', 1100, 2),
('Patricia', 'Mendoza', 'Keyboard', 870, 1),
('Francisco', 'Jimenez', 'Mouse', 500, 2),
('Valentina', 'Ramirez', 'Speaker', 1450, 1),
('Javier', 'Delgado', 'Keyboard', 950, 1),
('Natalia', 'Rojas', 'Mouse', 700, 2);
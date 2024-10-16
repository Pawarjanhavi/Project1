--Case Study on Ecommerce Application
create database Ecommerce
go
use Ecommerce
go 
-- Creating customers table


CREATE TABLE Customers (
    Customer_id INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Password VARCHAR(255)
);

-- Creating products table
CREATE TABLE Products (
    Product_id INT PRIMARY KEY,
    Name VARCHAR(255),
    Price DECIMAL(10, 2),
    Description TEXT,
    StockQuantity INT
);

-- Creating cart table
CREATE TABLE Cart (
    Cart_id INT PRIMARY KEY,
    Customer_id INT,
    Product_id INT,
    Quantity INT,
    FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id),
    FOREIGN KEY (Product_id) REFERENCES Products(Product_id)
);

-- Creating orders table
CREATE TABLE Orders (
    Order_id INT PRIMARY KEY,
    Customer_id INT,
    Order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    Total_price DECIMAL(10, 2),
    Shipping_address VARCHAR(255),
    FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
);

-- Creating order_items table
CREATE TABLE Order_items (
    Order_item_id INT PRIMARY KEY,
    Order_id INT ,
    Product_id INT,
    Quantity INT,
    FOREIGN KEY (Order_id) REFERENCES Orders(Order_id),
    FOREIGN KEY (Product_id) REFERENCES Products(Product_id)
);

--inserting values into the customers table
INSERT INTO customers (customer_id,name, email, password) 
VALUES
(1,'Rohan Sharma', 'rohan.sharma@example.com', 'password123'),
(2,'Sara Khan', 'sara.khan@example.com', 'password234'),
(3,'Meera Patel', 'meera.patel@example.com', 'password345'),
(4,'John Smith', 'john.smith@example.com', 'password456'),
(5,'Amit Gupta', 'amit.gupta@example.com', 'password567'),
(6,'Sophia Lee', 'sophia.lee@example.com', 'password678'),
(7,'Rahul Verma', 'rahul.verma@example.com', 'password789'),
(8,'Maya Roy', 'maya.roy@example.com', 'password890'),
(9,'Kabir Rao', 'kabir.rao@example.com', 'password901'),
(10,'Ananya Singh', 'ananya.singh@example.com', 'password012');

--inserting values into the products table
INSERT INTO products (product_id,name, price, description, stockQuantity) 
VALUES
(101,'Laptop', 50000.00, 'A high-performance laptop', 20),
(102,'Smartphone', 20000.00, 'A latest generation smartphone', 50),
(103,'Headphones', 1500.00, 'Wireless noise-canceling headphones', 100),
(104,'Keyboard', 1000.00, 'Mechanical keyboard', 30),
(105,'Mouse', 800.00, 'Wireless mouse', 40),
(106,'Monitor', 15000.00, '27-inch 4K monitor', 25),
(107,'Printer', 7000.00, 'All-in-one printer', 10),
(108,'Tablet', 25000.00, 'Latest tablet with stylus support', 15),
(109,'Camera', 40000.00, 'DSLR camera with high resolution', 10),
(110,'Smartwatch', 10000.00, 'Smartwatch with fitness tracking', 60);

--inserting values into the cart table
INSERT INTO cart (cart_id,customer_id, product_id, quantity) 
VALUES
(1001,1, 101, 1), -- Rohan buys Laptop
(1002,2, 102, 2), -- Sara buys 2 Smartphones
(1003,3, 103, 1), -- Meera buys Headphones
(1004,4, 104, 2), -- John buys 2 Keyboards
(1005,5, 105, 1), -- Amit buys Mouse
(1006,6, 106, 1), -- Sophia buys Monitor
(1007,7, 107, 1), -- Rahul buys Printer
(1008,8, 108, 1), -- Maya buys Tablet
(1009,9, 109, 1), -- Kabir buys Camera
(1010,10, 110, 2); -- Ananya buys 2 Smartwatches

--inserting values into the orders table
INSERT INTO orders (order_id,customer_id, order_date, total_price, shipping_address) 
VALUES
(401,1, '2024-10-01', 50000.00, '123 Main St, Raipur'),
(402,2, '2024-10-02', 40000.00, '456 Elm St, Mumbai'),
(403,3, '2024-10-03', 1500.00, '789 Oak St, Delhi'),
(404,4, '2024-10-03', 2000.00, '101 Pine St, Kolkata'),
(405,5, '2024-10-04', 800.00, '202 Birch St, Bangalore'),
(406,6, '2024-10-04', 15000.00, '303 Cedar St, Chennai'),
(407,7, '2024-10-05', 7000.00, '404 Maple St, Hyderabad'),
(408,8, '2024-10-06', 25000.00, '505 Walnut St, Pune'),
(409,9, '2024-10-06', 40000.00, '606 Ash St, Ahmedabad'),
(410,10, '2024-10-07', 20000.00, '707 Fir St, Jaipur');

--inserting values into the order_items table
INSERT INTO order_items (order_item_id,order_id, product_id, quantity) 
VALUES
(4001,401, 101, 1), -- Order 1 includes 1 Laptop
(4002,402, 102, 2), -- Order 2 includes 2 Smartphones
(4003,403, 103, 1), -- Order 3 includes 1 Headphone
(4004,404, 104, 2), -- Order 4 includes 2 Keyboards
(4005,405, 105, 1), -- Order 5 includes 1 Mouse
(4006,406, 106, 1), -- Order 6 includes 1 Monitor
(4007,407, 107, 1), -- Order 7 includes 1 Printer
(4008,408, 108, 1), -- Order 8 includes 1 Tablet
(4009,409, 109, 1), -- Order 9 includes 1 Camera
(4010,410, 110, 2); -- Order 10 includes 2 Smartwatches
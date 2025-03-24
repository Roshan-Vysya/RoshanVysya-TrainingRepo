--creating database
CREATE DATABASE TechShop

USE TechShop
--creating Customers table
CREATE TABLE Customers(
CustomerID INT IDENTITY(1000,1) PRIMARY KEY NOT NULL,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(50),
Phone BIGINT,
Address VARCHAR(MAX)
)

--creating Products table
CREATE TABLE Products(
ProductID INT IDENTITY(2000,1) PRIMARY KEY NOT NULL,
ProductName VARCHAR(50),
Description VARCHAR(MAX),
Price BIGINT
)

--creating Orders table
CREATE TABLE Orders(
OrderID INT IDENTITY(3000,1) PRIMARY KEY NOT NULL,
CustomerID INT,
OrderDate DATE,
TotalAmount BIGINT,
CONSTRAINT CO_Fk FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
)

--creating OrdersDetails table
CREATE TABLE OrderDetails(
OrderDetailID INT IDENTITY(4000,1) PRIMARY KEY NOT NULL,
OrderID INT,
ProductID INT,
Quantity INT,
CONSTRAINT OOD_Fk FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
CONSTRAINT POD_Fk FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
)

--creating Inventory table
CREATE TABLE Inventory(
InventoryID INT IDENTITY(5000,1) PRIMARY KEY NOT NULL,
QuantityInStock INT,
ProductID INT,
LastStockUpdate DATE,
CONSTRAINT PI_Fk FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
)

--inserting values in Customers table
INSERT INTO Customers VALUES('Arjun', 'Sharma', 'arjun.sharma@example.com', 9876543210, '123 MG Road, Delhi'),
('Priya', 'Verma', 'priya.verma@example.com', 8765432109, '456 Residency Road, Bengaluru'),
('Rajesh', 'Gupta', 'rajesh.gupta@example.com', 7654321098, '789 Park Street, Kolkata'),
('Anjali', 'Mehta', 'anjali.mehta@example.com', 6543210987, '101 Juhu Lane, Mumbai'),
('Vikram', 'Reddy', 'vikram.reddy@example.com', 5432109876, '202 Jubilee Hills, Hyderabad'),
('Sneha', 'Patel', 'sneha.patel@example.com', 4321098765, '303 Ashram Road, Ahmedabad'),
('Rohan', 'Kumar', 'rohan.kumar@example.com', 3210987654, '404 Anna Salai, Chennai'),
('Neha', 'Joshi', 'neha.joshi@example.com', 2109876543, '505 FC Road, Pune'),
('Amit', 'Singh', 'amit.singh@example.com', 1098765432, '606 Rajendra Nagar, Patna'),
('Kavya', 'Iyer', 'kavya.iyer@example.com', 1987654321, '707 Brigade Road, Bengaluru');

--inserting values in Products table
INSERT INTO Products VALUES('Sony Headphones', 'Wireless over-ear headphones with noise-canceling feature.', 5000),
('Apple MacBook Air', '13-inch laptop with M1 chip and 256GB SSD.', 85000),
('Samsung Smart TV', '32-inch Full HD Smart TV with built-in apps.', 18000),
('Dell Inspiron Laptop', '15.6-inch laptop with 8GB RAM and 1TB HDD.', 45000),
('Philips LED Bulb', '10W cool daylight bulb with energy-saving technology.', 200),
('Mi Band 6', 'Smart fitness tracker with AMOLED display and 14-day battery life.', 3500),
('Canon DSLR Camera', 'EOS 1500D with 24.1MP resolution and Wi-Fi connectivity.', 35000),
('Logitech Wireless Mouse', 'Ergonomic wireless mouse with long battery life.', 1000),
('JBL Bluetooth Speaker', 'Portable speaker with powerful bass and waterproof design.', 4000),
('HP Inkjet Printer', 'All-in-one wireless printer with scanning and copying.', 7500);



--inserting values in Orders table
INSERT INTO Orders VALUES(1000, '2025-03-01', 1500),
(1001, '2025-03-02', 2300),
(1002, '2025-03-03', 3200),
(1003, '2025-03-04', 4500),
(1004, '2025-03-05', 1200),
(1005, '2025-03-06', 3000),
(1006, '2025-03-07', 2100),
(1007, '2025-03-08', 4000),
(1008, '2025-03-09', 1800),
(1009, '2025-03-10', 3500);

--inserting values in OrderDetails table
INSERT INTO OrderDetails VALUES
(3000, 2000, 2),
(3000, 2001, 1),
(3001, 2002, 4),
(3001, 2003, 3),
(3002, 2004, 1),
(3002, 2005, 2),
(3003, 2006, 5),
(3003, 2007, 3),
(3004, 2008, 1),
(3004, 2009, 6);


--inserting values in Inventory table
INSERT INTO Inventory VALUES(100, 2000, '2025-03-01'),
(50, 2001, '2025-03-02'),
(200, 2002, '2025-03-03'),
(75, 2003, '2025-03-04'),
(120, 2004, '2025-03-05'),
(60, 2005, '2025-03-06'),
(90, 2006, '2025-03-07'),
(30, 2007, '2025-03-08'),
(150, 2008, '2025-03-09'),
(80, 2009, '2025-03-10');

SELECT * FROM Customers
SELECT * FROM Products
SELECT * FROM Orders
SELECT * FROM OrderDetails
SELECT * FROM Inventory


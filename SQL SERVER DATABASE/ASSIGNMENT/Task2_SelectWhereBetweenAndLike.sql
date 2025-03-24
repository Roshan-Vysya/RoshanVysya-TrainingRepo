-- 1)Write an SQL query to retrieve the names and emails of all customers.  
SELECT FirstName, LastName, Email from Customers

-- 2)Write an SQL query to list all orders with their order dates and corresponding customer names.
SELECT O.OrderID, O.OrderDate, C.FirstName, C.LastName 
FROM Orders as O
INNER JOIN Customers as C
ON O.CustomerID=C.CustomerID

-- by using select statement
SELECT OrderId,OrderDate,FirstName,LastName FROM Orders AS O,Customers as C WHERE O.CustomerID=C.CustomerID

-- 3)Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.
INSERT INTO Customers VALUES ('Roshan','Vysya','mailbox@gmail.com',0987656709,'123,abc road,Trichy')
SELECT * FROM Customers

-- 4)Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.
UPDATE Products SET Price= Price+(Price*0.1)
SELECT * FROM Products

-- 5) Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter. 
DELETE FROM OrderDetails WHERE OrderID=(SELECT OrderID FROM Orders WHERE OrderID=3000)
DELETE FROM Orders WHERE OrderID=3000
SELECT * FROM Orders
SELECT * FROM OrderDetails

-- 6)Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information. 
INSERT INTO Orders VALUES(1001,'2025-03-01',5400)
SELECT * FROM Orders

-- 7)Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact information. 
UPDATE Customers SET Phone=098789099, Email='wer@gmail.com' WHERE CustomerID=1000
SELECT * FROM Customers

-- 8)Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table. 
UPDATE Orders
SET TotalAmount = (
    SELECT SUM(OD.Quantity * P.Price)
    FROM OrderDetails OD, Products P
    WHERE OD.ProductID = P.ProductID
      AND OD.OrderID = Orders.OrderID)
SELECT *FROM Orders
Select * from OrderDetails
--9)Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter. 
DELETE FROM OrderDetails WHERE OrderID=(SELECT OrderID FROM Orders WHERE CustomerID=1003 )
DELETE FROM Orders	WHERE CustomerID=1003
SELECT * FROM Orders
SELECT * FROM OrderDetails
--10) Write an SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details. 
INSERT INTO Products VALUES ('SD Card','For mobile phones 128GB',500)
SELECT * FROM Products
--11) Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status.
--first we have to add new column named status in orders table
ALTER TABLE Orders ADD Status VARCHAR(20) 
UPDATE Orders SET Status = 'Pending'
--now to update any order status using orderID
UPDATE Orders SET Status='Shipped' WHERE OrderID = 3001
SELECT * FROM Orders
--12) Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table.
SELECT CustomerID,COUNT(OrderID) as OrderCount FROM Orders GROUP BY CustomerID

DROP TABLE Orders
DROP TABLE Products
DROP TABLE Customers
DROP TABLE Inventory
DROP TABLE OrderDetails

SELECT * FROM Customers
SELECT * FROM Products
SELECT * FROM Orders
SELECT * FROM OrderDetails
SELECT * FROM Inventory

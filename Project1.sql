create database Online_Retail_Sales_Database_Design;
use Online_Retail_Sales_Database_Design;

-- Products Table
-- ---------------------------------------------
CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(255),
  Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price)
VALUES
  (1, 'Apple iPhone 13', 599.99),
  (2, 'Samsung Galaxy S22', 799.99),
  (3, 'Google Pixel 6', 499.99),
  (4, 'OnePlus 9 Pro', 699.99),
  (5, 'Huawei P30 Pro', 599.99),
  (6, 'Apple MacBook Air', 999.99),
  (7, 'Dell XPS 13', 899.99),
  (8, 'HP Envy x360', 699.99),
  (9, 'Lenovo ThinkPad X1', 1299.99),
  (10, 'Asus ZenBook 14', 799.99),
  (11, 'Sony WH-1000XM4', 349.99),
  (12, 'Bose QuietComfort 35 II', 299.99),
  (13, 'Beats Solo Pro', 299.99),
  (14, 'Sennheiser HD 4.50 BT', 199.99),
  (15, 'JBL Charge 4', 149.99),
  (16, 'Anker PowerCore 20000', 69.99),
  (17, 'Apple Watch Series 7', 399.99),
  (18, 'Fitbit Charge 4', 149.99),
  (19, 'Garmin Forerunner 945', 649.99),
  (20, 'Samsung Galaxy Watch', 299.99),
  (21, 'Google Pixel Buds', 179.99),
  (22, 'Apple AirPods Pro', 249.99),
  (23, 'Sennheiser Momentum Wireless', 299.99),
  (24, 'Bose SoundLink Color II', 129.99),
  (25, 'JBL Flip 5', 99.99);


-- Customers Table
-- ---------------------------------------------
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(255),
  Email VARCHAR(255) unique
);

INSERT INTO Customers (CustomerID, CustomerName, Email)
VALUES
  (1, 'John Doe', 'john.doe@example.com'),
  (2, 'Jane Smith', 'jane.smith@example.com'),
  (3, 'Bob Johnson', 'bob.johnson@example.com'),
  (4, 'Alice Brown', 'alice.brown@example.com'),
  (5, 'Mike Davis', 'mike.davis@example.com'),
  (6, 'Emily Taylor', 'emily.taylor@example.com'),
  (7, 'David Lee', 'david.lee@example.com'),
  (8, 'Sophia Kim', 'sophia.kim@example.com'),
  (9, 'Oliver Martin', 'oliver.martin@example.com'),
  (10, 'Ava White', 'ava.white@example.com'),
  (11, 'Isabella Harris', 'isabella.harris@example.com'),
  (12, 'Jackson Thompson', 'jackson.thompson@example.com'),
  (13, 'Mia Garcia', 'mia.garcia@example.com'),
  (14, 'Alexander Hall', 'alexander.hall@example.com'),
  (15, 'Charlotte Brown', 'charlotte.brown@example.com'),
  (16, 'Ethan Walker', 'ethan.walker@example.com'),
  (17, 'Harper Lewis', 'harper.lewis@example.com'),
  (18, 'Logan Jenkins', 'logan.jenkins@example.com'),
  (19, 'Amelia Scott', 'amelia.scott@example.com'),
  (20, 'Noah Russell', 'noah.russell@example.com'),
  (21, 'Evelyn Turner', 'evelyn.turner@example.com'),
  (22, 'Liam Brooks', 'liam.brooks@example.com'),
  (23, 'Aria Walker', 'aria.walker@example.com'),
  (24, 'Caleb Martin', 'caleb.martin@example.com'),
  (25, 'Zoey Patel', 'zoey.patel@example.com');


-- Orders Table
-- ---------------------------------------------
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  OrderDate DATE,
  TotalAmount DECIMAL(10, 2),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
  (1, 1, '2022-01-01', 599.99),
  (2, 2, '2022-01-05', 799.99),
  (3, 3, '2022-01-10', 499.99),
  (4, 4, '2022-01-15', 699.99),
  (5, 5, '2022-01-20', 999.99),
  (6, 6, '2022-02-01', 899.99),
  (7, 7, '2022-02-05', 1299.99),
  (8, 8, '2022-02-10', 799.99),
  (9, 9, '2022-02-15', 349.99),
  (10, 10, '2022-02-20', 299.99),
  (11, 11, '2022-03-01', 149.99),
  (12, 12, '2022-03-05', 199.99),
  (13, 13, '2022-03-10', 599.99),
  (14, 14, '2022-03-15', 499.99),
  (15, 15, '2022-03-20', 699.99),
  (16, 16, '2022-04-01', 99.99),
  (17, 17, '2022-04-05', 179.99),
  (18, 18, '2022-04-10', 249.99),
  (19, 19, '2022-04-15', 299.99),
  (20, 20, '2022-04-20', 349.99),
  (21, 21, '2022-05-01', 399.99),
  (22, 22, '2022-05-05', 449.99),
  (23, 23, '2022-05-10', 499.99),
  (24, 24, '2022-05-15', 549.99),
  (25, 25, '2022-05-20', 599.99);


-- Payments Table
-- ---------------------------------------------
CREATE TABLE Payments (
  PaymentID INT PRIMARY KEY,
  OrderID INT,
  ProductID INT,
  PaymentMethod VARCHAR(255),
  PaymentDate DATE,
  Amount DECIMAL(10, 2),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Payments (PaymentID, OrderID, ProductID, PaymentMethod, PaymentDate, Amount)
VALUES
  (1, 1, 1,'Credit Card', '2022-01-01', 599.99),
  (2, 2, 2,'PayPal', '2022-01-05', 799.99),
  (3, 3, 3,'Bank Transfer', '2022-01-10', 499.99),
  (4, 4, 4,'Credit Card', '2022-01-15', 699.99),
  (5, 5, 6,'PayPal', '2022-01-20', 999.99),
  (6, 6, 7,'Bank Transfer', '2022-02-01', 899.99),
  (7, 7, 9,'Credit Card', '2022-02-05', 1299.99),
  (8, 8, 10,'PayPal', '2022-02-10', 799.99),
  (9, 9, 11,'Bank Transfer', '2022-02-15', 349.99),
  (10, 10, 12,'Credit Card', '2022-02-20', 299.99),
  (11, 11, 15,'PayPal', '2022-03-01', 149.99),
  (12, 12, 14,'Bank Transfer', '2022-03-05', 199.99),
  (13, 13, 1,'Credit Card', '2022-03-10', 599.99),
  (14, 14, 3,'PayPal', '2022-03-15', 499.99),
  (15, 15, 4,'Bank Transfer', '2022-03-20', 699.99),
  (16, 16, 25,'Credit Card', '2022-04-01', 99.99),
  (17, 17, 21,'PayPal', '2022-04-05', 179.99),
  (18, 18, 22,'Bank Transfer', '2022-04-10', 249.99),
  (19, 19, 20,'Credit Card', '2022-04-15', 299.99),
  (20, 20, 11,'PayPal', '2022-04-20', 349.99),
  (21, 21, 17,'Bank Transfer', '2022-05-01', 399.99),
  (22, 22, 8,'Credit Card', '2022-05-05', 449.99),
  (23, 23, 5,'PayPal', '2022-05-10', 499.99),
  (24, 24, 9,'Bank Transfer', '2022-05-15', 549.99),
  (25, 25, 10,'Credit Card', '2022-05-20', 599.99);
  
  -- 1. List all customer names along with their order IDs and total amounts.
  -- 2. Show all orders with their corresponding payment methods and payment dates.
  -- 3. Display customer names, product names, and payment amounts (assume each payment corresponds to a product).
  -- 4. Find all customers who made purchases in February 2022, along with their payment methods.
  -- 5. Retrieve the total amount spent by each customer (sum of all their orders).
  -- 6. Show all payment details along with the corresponding customer name and product name.
  -- 7. Find the customers who used “PayPal” as a payment method.
  -- 8. List all products that have been purchased, along with their prices and payment dates.
  -- 9. Show customers and their orders, including customers who haven’t placed any orders (use LEFT JOIN).
  -- 10. Get the total payment amount grouped by payment method.
  
  
  
-- 1. List all customer names along with their order IDs and total amounts.
  create view Customer_OrderID_TotalAmounts as
  select C.CustomerName, O.OrderID, O.TotalAmount
  from Customers C
  Join Orders O
	on C.CustomerID = O.CustomerID;
  
  
-- 2. Show all orders with their corresponding payment methods and payment dates.
  create view Orders_PaymentMethods_PaymentDates as
  Select O.OrderID, O.TotalAmount, P.PaymentMethod, P.PaymentDate
  from Orders O
  join Payments P
	on O.OrderID = P.OrderID;
  
  
-- 3. Display customer names, product names, and payment amounts (assume each payment corresponds to a product).
  create view CustomerNames_ProductNames_PaymentAmount as
  select C.CustomerName, Pr.ProductName, P.Amount
  FROM Payments P
  join Orders O 
	on P.OrderID = O.OrderID
  join Customers C 
	on O.CustomerID = C.CustomerID 
  join Products Pr 
	on P.ProductID = Pr.ProductID; 
    
    
-- 4. Find all customers who made purchases in February 2022, along with their payment methods.
  create view February2022sales_customerNames as
  select C.CustomerName, O.OrderDate, P.PaymentMethod
  From Customers C
  join Orders O
	on C.CustomerID = O.CustomerID
  join Payments P
	on O.OrderID = P.OrderID
  where month(O.OrderDate) = 2 and year(O.OrderDate) = 2022;
  

-- 5. Retrieve the total amount spent by each customer (sum of all their orders).
  create view CustomerNames_TotalAmount as
  select C.CustomerName, sum(O.TotalAmount) as Total_amount
  from Customers C
  join Orders O
	on C.CustomerID = O.CustomerID
  group by C.CustomerName;
  
  
-- 6. Show all payment details along with the corresponding customer name and product name.
  create view CustomerNames_ProductNames_PaymentMethod as
  select P.PaymentID, C.CustomerName, Pr.ProductName, P.PaymentMethod, P.Amount
  from Customers C
  join Orders O
	on C.CustomerID = O.CustomerID
  join Payments P
	on O.OrderID = P.OrderID
  join Products Pr
    on P.ProductID = Pr.ProductID;
    

-- 7. Find the customers who used “PayPal” as a payment method.
  create view PayPalCustomers as
  select distinct C.CustomerName, P.PaymentMethod
  from Customers C
  join Orders O
	on C.CustomerID = O.CustomerID
  join Payments P
	on O.OrderID = P.OrderID
  where P.PaymentMethod = 'PayPal';
  
  
-- 8. List all products that have been purchased, along with their prices and payment dates.
  create view ProductsName_Price_PaymentDates as
  select Pr.ProductName, Pr.Price, P.PaymentDate
  from Products Pr
  join Payments P
	on Pr.ProductID = P.ProductID;
    

-- 9. Show customers and their orders, including customers who haven’t placed any orders (use LEFT JOIN).
  create view CustomerNames_Orders as
  select C.CustomerName, O.OrderID, O.TotalAmount
  from Customers C
  left join Orders O
	on C.CustomerID = O.CustomerID;
    
    
-- 10. Get the total payment amount grouped by payment method.
create view PaymentMethod_TotalAmount as
select PaymentMethod, sum(Amount) as TotalAmount
from Payments P
group by PaymentMethod;
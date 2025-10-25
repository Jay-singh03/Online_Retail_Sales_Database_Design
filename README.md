# Online_Retail_Sales_Database_Design

📘 Overview

The Online Retail Sales Database Design project is a structured SQL-based database that models a small-scale online retail system.
It includes Products, Customers, Orders, and Payments tables to simulate real-world online sales operations.
This project also demonstrates the use of joins, views, and aggregate functions for generating meaningful sales reports.


🗂️ Database Structure
Database Name: Online_Retail_Sales_Database_Design

The database contains the following tables:

Table Name	                Description
Products	                  Stores details of all available products (name, price, etc.)
Customers	                  Contains customer information such as name and email
Orders	                    Tracks customer orders with total amounts and order dates
Payments	                  Records payments made for each order, including payment methods



🧱 Database Schema

1. Products Table
CREATE TABLE Products (
  ProductID INT PRIMARY KEY,
  ProductName VARCHAR(255),
  Price DECIMAL(10, 2)
);

2. Customers Table
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(255),
  Email VARCHAR(255) UNIQUE
);

3. Orders Table
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  OrderDate DATE,
  TotalAmount DECIMAL(10, 2),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

4. Payments Table
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



# ER Diagram Model through dbdiagram.io
https://github.com/Jay-singh03/Online_Retail_Sales_Database_Design/blob/main/ER%20Diagram.pdf


🧩 Data Population

Each table is pre-populated with 25 sample records to represent real-world data such as:
Product catalog (e.g., smartphones, laptops, wearables)
Customer profiles
Purchase orders
Payments made through different methods (Credit Card, PayPal, Bank Transfer)



🔍 SQL Views for Reporting
The project defines 10 SQL views for common retail reporting tasks:

View Name	                                                  Description
Customer_OrderID_TotalAmounts	                              Lists customer names, order IDs, and total amounts
Orders_PaymentMethods_PaymentDates	                        Shows orders with payment methods and dates
CustomerNames_ProductNames_PaymentAmount	                  Displays customers, products, and payment amounts
February2022sales_customerNames	                            Finds customers who made purchases in Feb 2022
CustomerNames_TotalAmount	                                  Summarizes total spending per customer
CustomerNames_ProductNames_PaymentMethod	                  Shows detailed payment info with customer & product
PayPalCustomers	                                            Lists customers who paid via PayPal
ProductsName_Price_PaymentDates	Displays purchased products with prices and dates
CustomerNames_Orders	Lists all customers and their orders (including none)
PaymentMethod_TotalAmount	Groups total payments by payment method

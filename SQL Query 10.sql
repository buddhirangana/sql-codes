create database WS6;
use WS6;

create table customer(
	CusID INTEGER PRIMARY KEY,
	Name VARCHAR (50) NOT NULL,
	City  VARCHAR (50),
	Age INTEGER CHECK (Age>18),
	NIC VARCHAR (10) CHECK (NIC LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]V'),
	Email VARCHAR (100),
	UNIQUE (Email));

create table Product(
	ProductID VARCHAR (50) PRIMARY KEY,
	ProductName VARCHAR (50) NOT NULL,
	UnitPrice INTEGER CHECK (UnitPrice > 0),
	Quantity INTEGER,
	Category VARCHAR (50));

insert into customer values
(100, 'Kamal', 'Galle', 25, '191447852V', 'kamal@yahoo.com'),
(101, 'Janani ', 'Matara', 22, '191444552V', 'janai@gamil.com'),
(102, 'Namal', 'Colombo', 24, '191747852V', 'nam1@gmail.com'),
(105, 'Jayantha', 'Kandy', 20, '201852852V', 'jayan@hotmail.com'),
(107, 'Janith', 'Gampaha', 29, '202144782V', 'janith@yahoo.com'),
(110, 'Amali', 'Kandy', 30, '199614478V', 'ama@gmail.com'),
(115, 'Kusal', 'Colombo', 34, '199847742V', 'kusa@hotmail.com'),
(117, 'Piyal', 'Jaffna', 28, '200144442V', 'piya@gmail.com');

insert into Product values
('P1', 'Chais', 100, 100, 'A'),
('P3', 'Chang', 150, 200, 'B'),
('P4', 'Aniseed Syrup', 250, 1000, 'C'),
('P7', 'Queso Cabrales', 120, 500, 'B'),
('P8', 'Genen Shouyu', 400, 250, 'B'),
('P10', 'Vegie-spread', 300, 1500, 'A');

-- ADD NEW COLUM
ALTER TABLE Product
ADD SupID INTEGER;

UPDATE Product SET SupID = 1 WHERE ProductID IN ('P1','P3','P7');
UPDATE Product SET SupID = 3 WHERE ProductID IN ('P8','P10');
UPDATE Product SET SupID = 2 WHERE ProductID IN ('P4');

-- DROP COLUMN
ALTER TABLE Product
DROP COLUMN SupplierID

-- List all customers’ details.
SELECT * FROM customer;

-- Select the ProductID, ProductName and category of all the products.
SELECT ProductID, ProductName, Category FROM Product;

-- List the unique cities.
SELECT DISTINCT City
FROM customer;

-- Find names of the customers who are older than 25 years.
SELECT Name FROM customer WHERE Age>25;

-- Find the details of customers whose names starts with ‘S’
SELECT * FROM customer WHERE Name LIKE 'S%';

-- Find the details of customers whose names contains ‘mal’. (anywhere in the name)
SELECT * FROM customer WHERE Name LIKE '%mal%';

-- Find the details of customers whose city starts with any character and followed by ‘andy’
SELECT * FROM customer WHERE City LIKE '%andy%';

-- List all customers who have an e-mail address that ends with ‘gmail.com’
SELECT * FROM customer WHERE Email LIKE '%gmail.com';

-- List all customers who are from a city starting with ‘M’ or ’K’
SELECT * FROM customer WHERE City LIKE '[M - K]%';

-- Find the details of customers whose city does not starts with ‘G’ or ‘K’.
SELECT * FROM customer WHERE City NOT LIKE '[G - K]%';

-- List the details of the products those name starts with character between A and C. 
SELECT * FROM Product WHERE ProductName LIKE '[A - C]%';

-- List all customers who are from ‘Kandy’, ‘Galle’ or ‘Colombo.
SELECT * FROM customer WHERE City IN ('Kandy','Galle','Colombo');

-- List the customer number and name of customers who are from Kandy and the e-mail address ends with ‘hotmail.com’
SELECT CusID, Name FROM customer WHERE City = 'Kandy' LIKE '%hotmail.com';

-- List details of products of those with a price between 50 and 100.

-- List the details of the customers whose age is not between 25 and 30.





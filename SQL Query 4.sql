CREATE DATABASE SMART_PC_SHOP;

USE SMART_PC_SHOP;

CREATE TABLE Customer(
	Cust_ID INTEGER PRIMARY KEY,
	FirstName VARCHAR (20),
	LastName VARCHAR (20),
	Address VARCHAR (40),
	District VARCHAR (20),
	Telephone VARCHAR (20));

CREATE TABLE Item(
	Item_No INTEGER PRIMARY KEY,
	Description VARCHAR (20),
	Available_Quantity INTEGER,
	Cost INTEGER);

INSERT INTO Customer VALUES
	(1001, 'John', 'Edwards', '123 1st Street','Seattle','(123)555-0100'),
	(1002, 'Griio', 'Carlos', '123 2nd Street','Boston','(123)555-0101'),
	(1003, 'Lee', 'Christina', '123 3rd Street','Los Angeles','(123)555-0102'),
	(1004, 'Romos', 'Luciana', '123 4th Street','New York','(123)555-0103'),
	(1005, 'Entino', 'Michael', '123 5th Street','Minneapolis','(123)555-0104');

INSERT INTO Item VALUES
	(1101, 'CPU Core i5', 45, 250),
	(1202, 'CPU Core i3', 24, 200),
	(1303, 'VGA NVidia', 50, 100),
	(1404, 'Pen Drive 32GB',72, 80),
	(1405, 'DVD Pack', 60, 45);

SELECT * FROM Customer;
SELECT Available_Quantity, Description FROM Item;
SELECT * FROM Customer WHERE District = 'Boston';
SELECT FirstName, LastName, Cust_ID, Telephone  FROM Customer WHERE District IN ('Seattle', 'Minneapolis');
SELECT * FROM Item WHERE Available_Quantity > 100;
ALTER TABLE Customer ADD DOB VARCHAR (50);

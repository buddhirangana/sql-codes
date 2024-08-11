 ------------------------------------------------------------------------------------------------
SQL Constraints
------------------------------------------------------------------------------------------------

SQL constraints are used to specify rules for the data in a table.

Constraints are used to limit the type of data that can go into a table. 
This ensures the accuracy and reliability of the data in the table. 
If there is any violation between the constraint and the data action, the action is aborted.

Constraints can be column level or table level. Column level constraints apply to a column, 
and table level constraints apply to the whole table.

The following constraints are commonly used in SQL:

NOT NULL - Ensures that a column cannot have a NULL value
UNIQUE - Ensures that all values in a column are different
PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
FOREIGN KEY - Prevents actions that would destroy links between tables
CHECK - Ensures that the values in a column satisfies a specific condition
DEFAULT - Sets a default value for a column if no value is specified


--------------------------------------------------------------------------------------------------
				SQL NOT NULL Constraint
---------------------------------------------------------------------------------------------------

By default, a column can hold NULL values.

The NOT NULL constraint enforces a column to NOT accept NULL values.

This enforces a field to always contain a value, which means that you cannot insert a new record, 
or update a record without adding a value to this field.



CREATE TABLE Employee (
	Empno integer, 
	Empname varchar (20), 
	Job varchar (20),
	Gender_ID integer ); 

INSERT INTO Employee VALUES (100,	'Nimal'	,	'HR Assistant',			2)
INSERT INTO Employee VALUES (101,	'amini'	,	'IT Manager',			1)
INSERT INTO Employee VALUES (102,	'Supipi',	'Software Engineer',	1)
INSERT INTO Employee VALUES (110,	'Dev',		'Project Manager',		2)
INSERT INTO Employee VALUES (121,	'Sahani',	'Admin Manager',		1)

INSERT INTO Employee (Empno,Empname,Gender_ID) VALUES (122,	'Madara',	1)

Select * from Employee


CREATE TABLE Emp (
	Empno integer, 
	Empname varchar (20), 
	Job varchar (20) NOT NULL,
	Gender_ID integer ); 

INSERT INTO Emp VALUES (100,	'Nimal'	,	'HR Assistant',			2)
INSERT INTO Emp VALUES (101,	'amini'	,	'IT Manager',			1)
INSERT INTO Emp VALUES (102,	'Supipi',	'Software Engineer',	1)
INSERT INTO Emp VALUES (110,	'Dev',		'Project Manager',		2)
INSERT INTO Emp VALUES (121,	'Sahani',	'Admin Manager',		1)

select * from Emp

INSERT INTO Emp (Empno,Empname,Gender_ID) VALUES (122,	'Madara',	1)

ALTER TABLE Emp
ALTER COLUMN Gender_ID integer NOT NULL;

INSERT INTO Emp (Empno,Empname,Job) VALUES (122,	'Madara',	'Managment Assistant')

-----------------------------------------------------------------------------------------------------------
						SQL DEFAULT Constraint
-----------------------------------------------------------------------------------------------------------
The DEFAULT constraint is used to set a default value for a column.

The default value will be added to all new records, if no other value is specified.

CREATE TABLE Person (
	ID integer, 
	Name varchar (20), 
	City varchar (20) DEFAULT 'Colombo' NOT NULL,
	Gender_ID integer ); 

INSERT INTO Person VALUES (1,	'Nimal'	,	'Kandy',			2)
INSERT INTO Person VALUES (2,	'amini'	,	'Mathale',			1)
INSERT INTO Person VALUES (3,	'Supipi',	'Kandy',		1)
INSERT INTO Person VALUES (4,	'Dev',		'Kurunagala',			2)
INSERT INTO Person VALUES (5,	'Sahani',	'Galle',			1)

select * from Person 
drop table Person

INSERT INTO Person (id,name,Gender_ID) VALUES (6,	'Malani', 1)
INSERT INTO Person (id,name,Gender_ID) VALUES (7,	'Soniya', 1)
INSERT INTO Person (id,name,Gender_ID) VALUES (8,	'Chathura',2)

ALTER TABLE Person
ADD CONSTRAINT df_Gender
DEFAULT 3 FOR Gender_ID;

INSERT INTO Person (id,name) VALUES (9,	 'Kasun' )
INSERT INTO Person (id,name) VALUES (10, 'Anne')
INSERT INTO Person (id,name) VALUES (11, 'Jhone')


----------------------------------------------------------------------------------------------------------------
					SQL UNIQUE Constraint
----------------------------------------------------------------------------------------------------------------
The UNIQUE constraint ensures that all values in a column are different.

Both the UNIQUE and PRIMARY KEY constraints provide a guarantee for uniqueness for a column or set of columns.

A PRIMARY KEY constraint automatically has a UNIQUE constraint.

However, you can have many UNIQUE constraints per table, but only one PRIMARY KEY constraint per table.

CREATE TABLE Emp2 (
    ID int NOT NULL,
    FirstName varchar(255),
	LastName varchar(255) NOT NULL,
    Age int,
    CONSTRAINT Unique_emp UNIQUE (LastName, FirstName)
);

INSERT INTO Emp2 VALUES (100,	'Nimal'	,	'Silva',		20)
INSERT INTO Emp2 VALUES (101,	'amini'	,	'Jayewardene',	19)
INSERT INTO Emp2 VALUES (102,	'Supipi',	'Karunanayake',	38)
INSERT INTO Emp2 VALUES (110,	'Dev',		'Dissanayake',	32)
INSERT INTO Emp2 VALUES (121,	'Sahani',	'Soyza',		23)

drop table Emp2
select * from Emp2

INSERT INTO Emp2 VALUES (140,	'Dev'	,	'Dissanayake',		27)

ALTER TABLE Emp2
ADD CONSTRAINT Unique_emp UNIQUE ( Age);

INSERT INTO Emp2 VALUES (150,	'Shalika',	'Gunawardene',		23)


----------------------------------------------------------------------------------------------------------
					SQL CHECK Constraint
----------------------------------------------------------------------------------------------------------
Alt+f1

The CHECK constraint is used to limit the value range that can be placed in a column.

If you define a CHECK constraint on a column it will allow only certain values for this column.

If you define a CHECK constraint on a table it can limit the values in certain columns based on values in other columns in the row.


CREATE TABLE Emp3 (
    ID int NOT NULL,
    FirstName varchar(255),
	LastName varchar(255) ,
    Age int,
    
);

INSERT INTO Emp3 VALUES (100,	'Nimal'	,	'Silva',		20)
INSERT INTO Emp3 VALUES (101,	'amini'	,	'Jayewardene',	19)
INSERT INTO Emp3 VALUES (102,	'Supipi',	'Karunanayake',	38)
INSERT INTO Emp3 VALUES (110,	'Dev',		'Dissanayake',	32)
INSERT INTO Emp3 VALUES (121,	'Sahani',	'Soyza',		-25)

select * from Emp3

delete from Emp3 
where ID = 121 

ALTER TABLE Emp3
ADD CONSTRAINT CHK_EMPAge CHECK (Age>0 AND Age <120);

INSERT INTO Emp3 VALUES (140,	'Anne',	'Soyza',		-45)


CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);

------------------------------------------------------------------------------------------------------
					WS 5
------------------------------------------------------------------------------------------------------
create table Musician 
(	MuscianID integer PRIMARY KEY, 
	MuscianName varchar (50) NOT NULL, 
	Category varchar (50), 
	Rank integer DEFAULT 4, 
	Instrument varchar (50),
	CONSTRAINT Music_cat CHECK (Category in ('Pop','Rock', 'Reggae','Classical')));  

insert into Musician values (12,	'Selena',	'Pop',			4,	'Guitar')
insert into Musician values (14,	'Davis',	'Rock'	,		4,	'Piano')
insert into Musician values (15,	'Keanu',	'Reggae',		3,	'Guitar')
insert into Musician values (17,	'Ravi',		'Classical',	5,	'Flute')
insert into Musician values (24,	'Neela',	'Classical',	5,	'Piano')
insert into Musician values (25,	'Kevin',	'Pop',			2,	'Guitar')
insert into Musician values (27,	'Lucas',	'Reggae',		5,	'Flute')
insert into Musician values (29,	'Aiden',	'Classical',	3,	'Guitar')

insert into Musician values (30,	null,	'Pop'	,4,	'Guitar')
insert into Musician values (32,	'Oliver','Hiphop',	5,	'Piano')

Alter table Musician 
Add Country varchar (50);

Select * from Musician  
UPDATE Musician SET Country = 'SriLanka' where MuscianID in (12, 17) ;
UPDATE Musician SET Country = 'America' where MuscianID in (14, 25 ,29) ;
UPDATE Musician SET Country = 'Bazil' where MuscianID in (15,27) ;
UPDATE Musician SET Country = 'America' where MuscianID in (14, 25 ,29) ;
UPDATE Musician SET Country = 'India' where MuscianID in (24) ;
UPDATE Musician SET Rank = default  where MuscianID = 24 ;

--a)	List the unique countries of musicians.  
		select distinct Country
		from Musician

--b)	List musician ID and name of musicians from Sri Lanka with a rank above 3. 
		select MuscianID, MuscianName
		from Musician
		where Country = 'SriLanka';

--c)	List all musicians those who have a rank less than to 4 or category is “Classical’.
		select * 
		from Musician
		where rank < 4 AND Category ='Classical'; 

--d)	List the details of the musicians whose name ends with n.
		select * 
		from Musician
		where MuscianName LIKE '%n'

--e)	List the name of all musicians who name start with a character between G and S
		select * 
		from Musician
		where MuscianName LIKE '[G-S]%'

--f)	List the details of the musicians whose musician IDs are between 20 and 30.
		select * 
		from Musician 
		where MuscianID between 20 AND 30

--g)	List musician ID and name of those play piano or guitar. 
		select MuscianID, MuscianName
		from Musician
		where Instrument  in  ('piano' , 'guitar') 
		                                     
--h)	What is the average rank of a musician?
		select AVG(rank)
		from Musician 

--i)	List the maximum rank of an American musician.
		select MAX(rank)
		from Musician 

--j)	How many unique categories are in the musician relation? 
		select COUNT(distinct Category)
		from Musician
--k)	List the musician ID, name, and country. Sort the output using the country.
		select MuscianID, MuscianName, Country
		from Musician
		ORDER BY Country 

--l)	List the Category and the number of musicians in each category. 
		--List only the categories which have more than one such musicians. 
		--sort the output in descending order of category.
		select Category, COUNT(*)
		from Musician
		GROUP BY Category
		ORDER BY category desc 

		select Category, COUNT(*)
		from Musician
		GROUP BY Category
		Having COUNT(*)> 1
		ORDER BY category DESC
		
--m)	List the Instrument and number of musicians who play a particular instrument. 
--sort the output in descending order of Instrument.
		select instrument ,COUNT(*)
		from Musician
		GROUP BY Instrument
		ORDER BY Instrument DESC

--7.	Delete all musicians whose rank is below 3.
		delete from Musician
		where rank <3 

		select * from Musician


----------------------------------------------------------------------------------------------------------------
						SQL ALTER TABLE Statement
----------------------------------------------------------------------------------------------------------------
The ALTER TABLE statement is used to add, delete, or modify columns in an existing table.

The ALTER TABLE statement is also used to add and drop various constraints on an existing table.

-----------------------------------------------------------------------------------------------------------------
ALTER TABLE - ADD Column
-----------------------------------------------------------------------------------------------------------------
To add a column in a table, use the following syntax:

ALTER TABLE table_name
ADD column_name datatype;

Eg : 	ALTER TABLE Customers
	ADD Email varchar(255);

-----------------------------------------------------------------------------------------------------------------
ALTER TABLE - DROP COLUMN
------------------------------------------------------------------------------------------------------------------
To delete a column in a table, use the following syntax 
(notice that some database systems don't allow deleting a column):

Syntax :ALTER TABLE table_name
	DROP COLUMN column_name;

Eg :	ALTER TABLE Customers
	DROP COLUMN Email;

-----------------------------------------------------------------------------------------------------------------
ALTER TABLE - RENAME COLUMN
-----------------------------------------------------------------------------------------------------------------
To rename a column in a table, use the following syntax:

Syntax: ALTER TABLE table_name
	RENAME COLUMN old_name to new_name;

Eg :	ALTER TABLE table_name
	MODIFY COLUMN column_name datatype;

------------------------------------------------------------------------------------------------------------------
Change Data Type Example
------------------------------------------------------------------------------------------------------------------
Now we want to change the data type of the column named "DateOfBirth" in the "Persons" table.

We use the following SQL statement:

ALTER TABLE Persons
ALTER COLUMN DateOfBirth year;
------------------------------------------------------------------------------------------------------------------
DROP COLUMN Example
------------------------------------------------------------------------------------------------------------------
Next, we want to delete the column named "DateOfBirth" in the "Persons" table.

We use the following SQL statement:

ALTER TABLE Persons
DROP COLUMN DateOfBirth;

-------------------------------------------------------------------------------------------------------------------
							SQL IN Operator
--------------------------------------------------------------------------------------------------------------------
The IN operator allows you to specify multiple values in a WHERE clause.

The IN operator is a shorthand for multiple OR conditions.

Syntax: SELECT column_name(s)
	FROM table_name
	WHERE column_name IN (value1, value2, ...);

Eg :	SELECT * FROM Customers
	WHERE Country IN ('Germany', 'France', 'UK');

--------------------------------------------------------------------------------------------------------------------
NOT IN
--------------------------------------------------------------------------------------------------------------------
By using the NOT keyword in front of the IN operator, you return all records that are NOT any of the values in the list.

SELECT * FROM Customers
WHERE Country NOT IN ('Germany', 'France', 'UK');
------------------------------------------------------------------------------------------------------------------------
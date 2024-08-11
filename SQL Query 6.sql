CREATE DATABASE schl;
USE schl;

CREATE TABLE tblDepartment(
	ID int PRIMARY KEY,
	DepartmentName nvarchar (50),
	Location nvarchar (50),
	DepartmentHead nvarchar (50)
);

CREATE TABLE tblEmployee(
	ID int PRIMARY KEY,
	Name nvarchar (50),
	Gender nvarchar (50),
	Salary int,
	DepartmentId int,
	CONSTRAINT FK_DepartmentID FOREIGN KEY (DepartmentId) REFERENCES tblDepartment(ID)
);

insert into tblDepartment values (1, 'IT', 'London', 'Rick');
insert into tblDepartment values (2, 'Payroll', 'Delhi', 'Ron');
insert into tblDepartment values (3, 'HR', 'New York', 'Christia');
insert into tblDepartment values (4, 'Other Department', 'Sydney', 'Cindrella');

insert into tblEmployee values (1, 'Tom', 'Male', 4000, 1);
insert into tblEmployee values (2, 'Pam', 'Female', 3000, 3);
insert into tblEmployee values (3, 'John', 'Male', 3500, 1);
insert into tblEmployee values (4, 'Sam', 'Male', 4500, 2);
insert into tblEmployee values (5, 'Todd', 'Male', 2800, 2);
insert into tblEmployee values (6, 'Ben', 'Male', 7000, 1);
insert into tblEmployee values (7, 'Sara', 'Female', 4800, 3);
insert into tblEmployee values (8, 'Valarie', 'Female', 5500, 1);
insert into tblEmployee values (9, 'James', 'Male', 6500, NULL);
insert into tblEmployee values (10, 'Russell', 'Male', 8800, NULL);

select * from tblDepartment;
select * from tblEmployee;

SELECT Name, Gender, Salary, DepartmentName
FROM tblEmployee
INNER JOIN tblDepartment
ON tblEmployee.DepartmentID = tblDepartment.ID;

SELECT tblEmployee.*, tblDepartment.*
FROM tblEmployee
INNER JOIN tblDepartment
ON tblEmployee.DepartmentID = tblDepartment.ID;  

--Left Join
SELECT tblEmployee.Name, tblEmployee.Gender, tblEmployee.Salary, tblDepartment.DepartmentName
FROM tblEmployee
LEFT JOIN tblDepartment
ON tblEmployee.DepartmentID = tblDepartment.ID;

--Right Join
SELECT tblEmployee.Name, tblEmployee.Gender, tblEmployee.Salary, tblDepartment.DepartmentName
FROM tblEmployee
RIGHT JOIN tblDepartment
ON tblEmployee.DepartmentID = tblDepartment.ID;

--Full Join
SELECT tblEmployee.Name, tblEmployee.Gender, tblEmployee.Salary, tblDepartment.DepartmentName
FROM tblEmployee
FULL JOIN tblDepartment
ON tblEmployee.DepartmentID = tblDepartment.ID;

-- SQL View
CREATE VIEW Empinfo AS
SELECT ID, Name, Salary
FROM tblEmployee
WHERE Salary > 5000;

SELECT * FROM Empinfo;

CREATE VIEW EmpDept AS
SELECT tblEmployee.ID, tblEmployee.Name, tblEmployee.Salary, tblDepartment.DepartmentName 
FROM tblEmployee
INNER JOIN tblDepartment
ON tblEmployee.DepartmentID = tblDepartment.ID;

SELECT * FROM EmpDept;

CREATE VIEW TotalSalary AS
SELECT SUM(Salary) AS Employee_count
FROM tblEmployee;

SELECT * FROM TotalSalary;

CREATE VIEW vWEmpDetails AS
SELECT ID, Name, Gender, DepartmentID
FROM tblEmployee;

Update vWEmpDetails
set Name

CREATE DATABASE abc;

USE abc;

CREATE TABLE Employee(
	Eno INTEGER PRIMARY KEY,
	Empname VARCHAR (20),
	Job VARCHAR (20),
	Dno INTEGER,
	Salary FLOAT);

INSERT INTO Employee Values
	(100, 'Nimal', 'HR Assistant', 1, 25000),
	(101, 'Gamini', 'IT Manager', 2, 80000),
	(102, 'Supipi', 'Software Engineer', 2, 60000),
	(110, 'Dev', 'Project Manager', 2, 85000),
	(121, 'Sahani', 'Admin Manager', 1, 70000),
	(107, 'Dev', 'Software Engineer', 2, 68000),
	(108, 'Anuki', 'Finance Manager', 3, 70000),
	(114, 'Supipi', 'Software Engineer', 2, 42000),
	(122, 'Janani', 'Finance Executive', 2, 32000);

INSERT INTO Employee Values
	(124, 'Danuki', 'Finance Executive', 3, 32000),
	(125, 'Methumi', 'Admin Support', 1, 22000),
	(127, 'Malik', 'Research Assistant', 4, 56000),
	(134, 'Chathuri', 'Software Engineer', 3, 56000);

SELECT * FROM Employee;

SELECT COUNT(*) AS 'Count of Employee' FROM Employee;
SELECT MAX(Eno) AS 'Maximum Eno' FROM Employee;
SELECT MAX(Salary) AS 'Salary' FROM Employee;
SELECT MIN(Salary) AS 'Minimum Salary' FROM Employee;
SELECT AVG(Salary) AS 'Average Salary' FROM Employee;
SELECT COUNT(Job) AS 'Count of Software Engineer' FROM Employee WHERE Job = 'Software Engineer';
SELECT COUNT(*) AS 'Working on Department 2' FROM Employee WHERE Dno = 2;
SELECT COUNT(Salary) AS 'Salary Between 50000 - 100000' FROM Employee WHERE Salary BETWEEN 50000 AND 100000;
SELECT COUNT(Empname) AS 'Name start with D,M & S' FROM Employee WHERE Empname LIKE '[D M S]%';
SELECT MAX(Salary) AS 'Highest salary of a manager' FROM Employee WHERE Job LIKE '%Manager%';
SELECT ROUND(AVG(Salary),2) AS 'Average salary of Software Engineer' FROM Employee WHERE Job = 'Software Engineer';
SELECT SUM(Salary) AS 'Total salary on Department 3' FROM Employee WHERE Dno = 3;

SELECT COUNT(DISTINCT Job) FROM Employee;
SELECT DISTINCT Job FROM Employee ORDER BY Job DESC;
SELECT Eno, Empname AS 'Employee Name' FROM Employee ORDER BY 'Employee Name';
SELECT Eno, Empname FROM Employee WHERE Empname LIKE '[C M]%' ORDER BY Empname DESC;
SELECT Job, Salary FROM Employee ORDER BY Job DESC, Salary ASC;


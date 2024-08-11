CREATE DATABASE campus;

USE campus;

CREATE TABLE student(
	Sno VARCHAR (10) PRIMARY KEY,
	Stu_name VARCHAR (30),
	BDate DATE,
	Address VARCHAR (10),
	Telephone VARCHAR (10));

INSERT INTO student VALUES
	('100', 'Nethu', '1990-6-12', 'Kandy', 1234567890),
	('101', 'Kevin', '1994-7-2', 'Colombo', 3456789012),
	('102', 'Kithmi', '1992-1-23', 'Colombo', 3466768789),
	('103', 'Kevin', '1995-8-5', 'Negombo', 1233454656),
	('104', 'Saman', '1992-2-28', 'Kandy', 6879889564),
	('120', 'Saman', '1998-6-6', 'Wattala', 2441231245);


CREATE TABLE course(
	CourseNo VARCHAR (10) PRIMARY KEY,
	Course_Name VARCHAR (20),
	Credits INTEGER);

INSERT INTO course VALUES
	('C10', 'Java', 4),
	('C12', 'Database', 4),
	('C14', 'System Design', 4),
	('C16', 'Web Design', 5),
	('C20', 'Project', 6);

SELECT * FROM student;
SELECT * FROM course;

--This is single line comment
/*
This is multi line comment
*/

INSERT INTO student (Sno, Stu_name, BDate, Address, Telephone) VALUES ('105', 'Denuwan', NULL, 'Colombo', NULL);
INSERT INTO student (Sno, Stu_name, BDate, Address, Telephone) VALUES ('107', 'Kalum', NULL, 'Colombo', 1276534222);
INSERT INTO student (Sno, Stu_name, BDate, Address, Telephone) VALUES ('108', NULL, '1998-03-05', NULL, NULL);

-- Section A

SELECT * 
FROM student 
WHERE Address = 'Colombo';

SELECT * 
FROM student 
WHERE Address != 'Colombo';

SELECT * 
FROM course 
WHERE Credits > 4;

SELECT Stu_name, Address 
FROM student 
WHERE Sno > 103;

SELECT Telephone, Stu_name 
FROM student 
WHERE Stu_name = 'Nethu';

-- Section B

SELECT CourseNo, Course_Name FROM course WHERE Course_Name LIKE 'D%';
SELECT Stu_name FROM student WHERE Stu_name LIKE '%n';
SELECT * FROM student WHERE Stu_name LIKE '%an%';
SELECT * FROM course WHERE Course_Name LIKE '%design%';
SELECT * FROM student WHERE Address LIKE 'C%O';
SELECT * FROM student WHERE Stu_name LIKE '[A B C D]%';
SELECT * FROM student WHERE Stu_name LIKE '[B - N]%';
SELECT * FROM course WHERE Course_Name LIKE '[A - J]%';
SELECT Course_Name FROM course WHERE Course_Name LIKE '__s%';

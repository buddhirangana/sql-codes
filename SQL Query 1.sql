CREATE DATABASE school;
DROP DATABASE school;

CREATE DATABASE university;

USE university;

CREATE TABLE student(
	regno VARCHAR (10) PRIMARY KEY,
	fname VARCHAR (20),
	age INTEGER);

DROP TABLE student;

INSERT INTO student VALUES
	('100', 'Kamal', 19),
	('101', 'Ruwan', 20),
	('102', 'Ann', 45),
	('103', 'Mark', 25);

SELECT * FROM student;

SELECT fname, age
FROM student;
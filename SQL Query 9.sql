CREATE DATABASE ABCDE
USE abcDe;

-- Create Manager table
CREATE TABLE Manager (
    MgrID INTEGER PRIMARY KEY,
    MgrName VARCHAR(20),
    Experience INTEGER
);

-- Create Project table
CREATE TABLE Project (
    ProjNo VARCHAR(5) PRIMARY KEY,
    MgrID INTEGER DEFAULT 1,
    Budget FLOAT,
    StartDate DATE,
    Country VARCHAR(20),
    FOREIGN KEY (MgrID) REFERENCES Manager(MgrID)
);

insert into Manager values
	(3,	'Sapumal',	8),
	(4,	'Ravi',	4),
	(1,	'Nethmi',	4),
	(6,	'Sarah',	6),
	(8,	'Janith',	5);

insert into Project values
('P9',	3,	420000.40,	'2019-07-12',	'USA'),
('P6',	4,	650000.50,	'2018-01-02',	'USA'),
('P4',	1,	230000.20,	'2017-08-06',	'UK'),
('P5',	3,	790000.50,	'2019-10-06',	'Australia'),
('P2',	6,	520000.40,	'2017-01-23',	'Australia'),
('P1',	1,	420000.40,	'2017-02-23',	'UK'),
('P3',	4,	820000.40,	'2018-03-21',	'USA');

select * from Manager;
select * from Project;

DELETE FROM Manager WHERE MgrID = 10;
DELETE FROM Manager WHERE MgrID = 3;

/*
ON DELETE CASCADE
------------------
ON DELETE CASCADE is a referential action in SQL that is specified as part of a 
foreign key constraint. When a foreign key constraint is defined with ON DELETE CASCADE, it means 
that if a row in the parent table (referenced table) is deleted, 
then all matching rows in the child table (referencing table) will also be automatically deleted.
*/
CREATE TABLE Parent (
    ParentID INT PRIMARY KEY
);

CREATE TABLE Child (
    ChildID INT PRIMARY KEY,
    ParentID INT,
    FOREIGN KEY (ParentID) REFERENCES Parent(ParentID) ON DELETE CASCADE
);

/*
In this schema, the Child table has a foreign key constraint referencing the Parent table, 
with ON DELETE CASCADE specified. If a row in the Parent table is deleted, 
any rows in the Child table that have a matching ParentID will also be deleted automatically.*/

/*
ON UPDATE CASCADE
------------------
ON UPDATE CASCADE is another referential action in SQL that is specified as part of a 
foreign key constraint. When a foreign key constraint is defined with ON UPDATE CASCADE, 
it means that if a referenced column in the parent table (referenced table) is updated, 
then all matching columns in the child table (referencing table) 
will also be automatically updated to reflect the change. */
CREATE TABLE Parent (
    ParentID INT PRIMARY KEY
);

CREATE TABLE Child (
    ChildID INT PRIMARY KEY,
    ParentID INT,
    FOREIGN KEY (ParentID) REFERENCES Parent(ParentID) ON UPDATE CASCADE
);
/*
In this schema, the Child table has a foreign key constraint referencing the Parent
table, with ON UPDATE CASCADE specified. If a ParentID in the Parent table is updated, 
any corresponding ParentID values in the Child table will also be updated automatically.*/

-- Create Manager table
CREATE TABLE Manager (
    MgrID INTEGER PRIMARY KEY,
    MgrName VARCHAR(20),
    Experience INTEGER
);

-- Create Project table
CREATE TABLE Project (
    ProjNo VARCHAR(5) PRIMARY KEY,
    MgrID INTEGER DEFAULT 1,
    Budget FLOAT,
    StartDate DATE,
    Country VARCHAR(20),
    CONSTRAINT manager_fk FOREIGN KEY (MgrID) REFERENCES Manager (MgrID) ON DELETE CASCADE
);

DROP TABLE PROJECT;
DROP TABLE Manager;



ALTER TABLE Project 
drop constraint manager_fk;


ALTER TABLE Project 
ADD CONSTRAINT manager_fk FOREIGN KEY (MgrID) REFERENCES Manager (MgrID) ON DELETE CASCADE



SELECT * from  PROJECT;
SELECT * from Manager;

ALTER TABLE Project 
drop constraint manager_fk

ALTER TABLE Project 
ADD CONSTRAINT manager_fk FOREIGN KEY (MgrID) REFERENCES Manager (MgrID) ON DELETE SET NULL

ALTER TABLE Project 
ADD CONSTRAINT manager_fk FOREIGN KEY (MgrID) REFERENCES Manager (MgrID) ON DELETE SET DEFAULT

ALTER TABLE Project 
ADD CONSTRAINT manager_fk FOREIGN KEY (MgrID) REFERENCES Manager (MgrID) ON UPDATE CASCADE

UPDATE Manager
SET MgrID = 100
WHERE MgrID = 4;

ALTER TABLE Project 
drop constraint manager_fk

ALTER TABLE Project 
ADD CONSTRAINT manager_fk FOREIGN KEY (MgrID) REFERENCES Manager (MgrID) ON UPDATE CASCADE

select * from Manager;
select * from Project;

-- Section B

--a)
select MgrID, ProjNo
from Project;

--b)
select ProjNo, MgrName, Country
from Project
inner join Manager
on Project.MgrID = Manager.MgrID
where MgrName like '[A - S]%';

--c)
select ProjNo, Budget, Experience
from Project
inner join Manager
on Project.MgrID = Manager.MgrID
where Experience = 5;

--d)
select ProjNo, Budget, MgrName
from Project
inner join Manager
on Project.MgrID = Manager.MgrID
where Budget not between 500000 and 1000000;

--e)
select MgrName, Experience, Budget
from Project
inner join Manager
on Project.MgrID = Manager.MgrID
order by MgrName asc, Budget desc;

-- Section C

--a)
select MgrID, count(ProjNo) as NumProjects
from Project
group by MgrID
order by NumProjects desc;

--b)
select Project.MgrID, count(Project.ProjNo) as NumProjects
from Project
inner join Manager
on Project.MgrID = Manager.MgrID
where Manager.Experience < 5
group by Project.MgrID;

--c)
select MgrID, round(avg(Budget),0) as AvgBudget
from Project
group by MgrID;

--d)
select MgrID, round(avg(Budget),-4) as AvgBudget
from Project
group by MgrID;

--e)
select MgrID, avg(Budget) as 'AvgBudget'
from Project
group by MgrID
having 'AvgBudget' < 600000;




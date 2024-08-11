CREATE DATABASE Company;

USE Company;

DROP DATABASE Company;

CREATE TABLE Manager(
MgID INTEGER PRIMARY KEY,
MgrName VARCHAR(20),
Experience INTEGER);

CREATE TABLE Projects(
ProjNo VARCHAR(5) PRIMARY KEY,
MgrID INTEGER DEFAULT 1,
Budget FLOAT,
StartDate DATE,
Country VARCHAR (20)
CONSTRAINT manager_fk FOREIGN KEY (MgrID) REFERENCES Manager(MgID));

DROP TABLE Projects;

ALTER TABLE Projects
DROP CONSTRAINT manager_fk;

ALTER TABLE Projects
ADD CONSTRAINT manager_fk FOREIGN KEY (MgrID) REFERENCES Manager(MgID) ON DELETE CASCADE;

ALTER TABLE Projects
ADD CONSTRAINT manager_fk FOREIGN KEY (MgrID) REFERENCES Manager(MgID) ON DELETE SET NULL;

ALTER TABLE Projects
ADD CONSTRAINT manager_fk FOREIGN KEY (MgrID) REFERENCES Manager(MgID) ON DELETE SET DEFAULT;

INSERT INTO Manager VALUES
(3, 'Sapumal', 8),
(4, 'Ravi', 4),
(1, 'Nethmi', 4),
(6, 'Sarah', 6),
(8, 'Janith', 5);

INSERT INTO Projects VALUES
('P9', 3, 420000.40, '2019-7-12', 'USA'),
('P6', 4, 650000.50, '2018-1-2', 'USA'),
('P4', 1, 230000.20, '2017-8-6', 'UK'),
('P5', 3, 790000.50, '2019-9-6', 'Australia'),
('P2', 6, 520000.40, '2017-1-23', 'Australia'),
('P1', 1, 420000.40, '2017-2-23', 'UK'),
('P3', 4, 820000.40, '2018-3-21', 'USA');

SELECT * FROM Manager;
SELECT * FROM Projects;
 
DELETE FROM Manager WHERE MgID = 8;
DELETE FROM Manager WHERE MgID = 4;
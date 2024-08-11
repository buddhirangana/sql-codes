CREATE DATABASE MYDB;

USE MYDB;

CREATE TABLE Player(
	ID INTEGER PRIMARY KEY,
	Name VARCHAR (20),
	Age INTEGER,
	School VARCHAR (50)
);

CREATE TABLE Activity(
	AID VARCHAR (50) PRIMARY KEY,
	Cost FLOAT
);

CREATE TABLE Participate(
	ID INTEGER,
	AID VARCHAR (50),
	CONSTRAINT FK_ID FOREIGN KEY (ID) REFERENCES Player(ID),
	CONSTRAINT FK_AID FOREIGN KEY (AID) REFERENCES Activity(AID),
	CONSTRAINT PK_ID PRIMARY KEY (ID, AID)
);

INSERT INTO Player VALUES
(100, 'Ran', 5, 'Museaus Collage'),
(101, 'Ruwan', 5, 'Royal Collage'),
(102, 'Methmi', 12, 'Museaus Collage'),
(107, 'Ran', 6, 'Royal Collage'),
(108, 'Ruwan', 18, 'Thurstan Collage'),
(110, 'Kevin', 17, 'Royal Collage'),
(114, 'Ridi', 12, 'Museaus Collage'),
(121, 'Dev', 14, 'Royal Collage'),
(122, 'Dev', 12, 'Thurstan Collage');

INSERT INTO Activity VALUES
('Swimming', 3000),
('Golf', 5000),
('Sailing', 6000),
('Tennis', 5000),
('Cricket', 3000),
('Badminton', 3500);

INSERT INTO Participate VALUES
(122, 'Tennis'),
(100, 'Swimming'),
(102, 'Tennis'),
(110, 'Swimming'),
(108, 'Sailing'),
(122, 'Swimming'),
(102, 'Swimming'),
(121, 'Swimming'),
(107, 'Sailing'),
(121, 'Golf'),
(114, 'Tennis'),
(121, 'Tennis'),
(102, 'Sailing');

SELECT Name, MIN(Age)
FROM Player
GROUP BY Name;
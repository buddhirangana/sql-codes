create database MSC;
use MSC;

create table Musician 
(	MuscianID integer PRIMARY KEY, 
	MuscianName varchar (50) NOT NULL, 
	Category varchar (50), 
	Rank integer DEFAULT 4, 
	Instrument varchar (50),
	CONSTRAINT Music_cat CHECK (Category in ('Pop','Rock', 'Reggae','Classical')));  

insert into Musician values (12,'Selena','Pop',4,'Guitar')
insert into Musician values (14,'Davis','Rock',4,'Piano')
insert into Musician values (15,'Keanu','Reggae',3,'Guitar')
insert into Musician values (17,'Ravi',	'Classical',5,'Flute')
insert into Musician values (24,'Neela','Classical',5,'Piano')
insert into Musician values (25,'Kevin','Pop',2,'Guitar')
insert into Musician values (27,'Lucas','Reggae',5,'Flute')
insert into Musician values (29,'Aiden','Classical',3,'Guitar')
USE MYDREAMHOME;
create table client(clientNo varchar(10)  not null unique,fName varchar(40),lname varchar(20),
telNo varchar(20),prefType varchar(20),maxRent int(10),email varchar(20));

select * from client;
INSERT INTO client VALUES('CR76','John','Kay','0207-774-5632','Flat',425,'john.kay@gmail.com');
INSERT INTO  client VALUES('CR56','Aline','Stewart','0141-848-1825','Flat',350,'astewart@gmail.com');
INSERT INTO client VALUES('CR74','Mike','Ritchie','01475-392178','Flat',750,'mritchie01@gmail.com');
INSERT INTO client VALUES('CR62','Mary','Tregear','01224-196720','Flat',600,'maryt@gmail.com');


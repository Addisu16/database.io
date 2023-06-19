use myhome;
create table branch(branchNo VARCHAR(10) NOT NULL UNIQUE ,
STREET VARCHAR(25),CITY VARCHAR(30),POSTCODE VARCHAR(30));
select * from Branch;
INSERT INTO branch values ('B005','22 Deer Rd','London','SW14EH');
INSERT INTO branch values ('B007','16 ARGYLL ST ','ABERDEEN','AB23SU');
INSERT INTO branch values ('B003','163 MAIN ST ','GLASGOW','G119QX');
INSERT INTO branch values ('B004','32 MANSE RD ','BRISTOL','B591NprivateownerZ');
select * from branch;
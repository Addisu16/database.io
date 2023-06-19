use myhome;
create table STAFF(STAFFNO VARCHAR(10) NOT NULL UNIQUE ,
FNAME VARCHAR(25),
LNAME VARCHAR(30),
POSITION VARCHAR(10),
SEX ENUM('M','F')NOT NULL,
DOB VARCHAR(30)NOT NULL,
SALARY VARCHAR(10),
branchNo VARCHAR(10),
FOREIGN KEY (branchNo) REFERENCES branch(branchNo));

 
select * from STAFF;

INSERT INTO STAFF VALUES('SL21','JOHN','WHITE','MANAGER','M','1-OCT-45','30000','B005');
INSERT INTO STAFF VALUES('SG37','ANN','BEECH','ASSISTANT','F','10-NOV-60','12000','B003');
INSERT INTO STAFF VALUES('SG14','David','FORD','SUPERVISOR','M','24-MAR-58','18000','B003');
INSERT INTO STAFF VALUES('SA9','MARY','HOWE','ASSISTANT','F','19-FEB-70','9000','B007');
INSERT INTO STAFF VALUES('SG5','SUSAN','BRAND','MANAGER','F','3-JUN-40','24000','B003');
INSERT INTO STAFF VALUES('SL41','JULIE','LEE','ASSISTANT','F','13-OCT-65','9000','B005');
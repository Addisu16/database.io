use myhome;
CREATE TABLE REGISTRATION (
 ClientNo VARCHAR(10),
FOREIGN KEY (CLIENTNO) REFERENCES CLIENTS(CLIENTNO),
branchNo VARCHAR(10),
FOREIGN KEY (branchNo) REFERENCES branch(branchNo),
STAFFNO VARCHAR(10),
FOREIGN KEY (STAFFNO) REFERENCES STAFF(STAFFNO),
DATEJOINED VARCHAR(10)
);
 select * from registration;
INSERT INTO REGISTRATION VALUES('CR76','B005','SL41','2-JAN-13');
INSERT INTO REGISTRATION VALUES('CR56','B003','SG37','11-APR-12');
INSERT INTO REGISTRATION VALUES('CR74','B003','SG37','16-NOV-11');
INSERT INTO REGISTRATION VALUES('CR62','B007','SA9','7-MAR-12');

 




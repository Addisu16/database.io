use myhome;
CREATE TABLE Viewing(
    ClientNo VARCHAR(10) ,
    FOREIGN KEY (CLIENTNO) REFERENCES CLIENTS(CLIENTNO),
    PrpertyNo VARCHAR(10),
    FOREIGN KEY (prpertyNo ) REFERENCES propertyForRent(prpertyNo),
    ViewDate VARCHAR(20),
    Comments TEXT
);

 

select * from Viewing;
INSERT INTO VIEWING values('CR56','PA14','24-MAY-13','TOO SMALL');
INSERT INTO VIEWING values('CR76','PG4','20-APL-13','TOO REMOTE');
INSERT INTO VIEWING values('CR56','PG4','26-MAY-13',NULL);
INSERT INTO VIEWING VALUES('CR62','PA14','14-MAY-13','NO DINING ROOM');
INSERT INTO VIEWING values('CR56','PG36','28-APR-13', NULL);

 
use mydreamhome;
CREATE TABLE Viewing(ClientNo VARCHAR(10),propertyNo VARCHAR(10),
    ViewDate varchar(25),
    Comments TEXT,
    foreign key (clientNo) references client(clientNo), 
    foreign key (propertyNo) references propertyForRent(propertyNo)
);

 describe Viewing;
 select * from Viewing;
drop table Viewing;

INSERT INTO VIEWING values('CR56','PA14','24-MAY-13','TOO SMALL');
INSERT INTO VIEWING values('CR76','PG4','20-APL-13','TOO REMOTE');
INSERT INTO VIEWING values('CR56','PG4','26-MAY-13',NULL);
INSERT INTO VIEWING VALUES('CR62','PA14','14-MAY-13','NO DINING ROOM');
INSERT INTO VIEWING values('CR56','PG36','28-APR-13', NULL);
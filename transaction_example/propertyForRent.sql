use myhome;
CREATE TABLE propertyForRent (
    prpertyNo VARCHAR(10) NOT NULL UNIQUE,
    street VARCHAR(40),
    city VARCHAR(40),
    postCode VARCHAR(40),
    typePROP VARCHAR(20),
    rooms VARCHAR(10),
    rent VARCHAR(20),
    ownerNo VARCHAR(20),
    STAFFNO VARCHAR(10),
    FOREIGN KEY (STAFFNO) REFERENCES STAFF(STAFFNO),
    branchNo VARCHAR(10),
    FOREIGN KEY (branchNo) REFERENCES branch(branchNo)
);

INSERT INTO propertyForRent VALUES('PA14', '16 Holhead', 'Aberden', 'AB75SU', 'House', '6', '650', 'CO46', 'SA9', 'B007');
INSERT INTO propertyForRent VALUES('PL94', '6 Argyil St', 'London', 'NW2', 'Flat', '4', '400', 'CO87', 'SL41', 'B005');
INSERT INTO propertyForRent VALUES('PG4', '6 Lawrence St', 'Glasgow', 'G11 9QX', 'Flat', '3', '350', 'CO40', 'SA9', 'B003');
INSERT INTO propertyForRent VALUES('PG36', '16 Holhead', 'Glasgow', 'G32 4QX', 'Flat', '3', '375', 'CO93', 'SG37', 'B003');
INSERT INTO propertyForRent VALUES('PG21', '16 Holhead', 'Glasgow', 'G12', 'House', '5', '600', 'CO87', 'SG37', 'B003');
INSERT INTO propertyForRent VALUES('PG16', '16 Holhead', 'Glasgow', 'G12 9AX', 'Flat', '4', '450', 'CO93', 'SG14', 'B003');

select * from propertyForRent;

 
use mydreamhome;
create table privateOwner(ownerNumber int(10) not null unique,
fname varchar(20),lname varchar(20),address varchar(20),
telNo int(20),email varchar(20),password varchar(20));


INSERT INTO privateOwner values('CO46','Joe','Keogh','2 Fergus Dr,Aberdeen AB2 7SX','01224-861212','jkeogh@llh.com','******');
INSERT INTO privateOwner values('CO87','Carol','Farrel','6 Achray St,Glasgow G32 9DX','0141-357-7419','jkeogh@llh.com','******');
INSERT INTO privateOwner values('CO40','Tina','Nurphy','63 Well St,Glasgow G42 ','0141-943-1728','tinam@hotmail.com','******');
INSERT INTO privateOwner values('CO93','Tony','Shaw','12 Park Pl,Glasgow G4 0QR','0141-225-7025','tony.shaw@ark.com','******');

use hotels;
set sql_safe_updates=OFF;
CREATE TABLE hotel(hotelNo INT primary key,hotelName varchar(40),City varchar(40));

select * from hotel;


INSERT INTO hotel (hotelNo, hotelname, city)

VALUES(101, 'marriott', 'fairfield'),(102, 'radisson', 'chicago'),(103,'hilton','london'),(100,'marriott','chicago');

drop table hotel;


create table room(roomNo INT ,hotelNo INT, foreign key (hotelNo) references hotel(hotelNo),
typeR varchar(20),price DECIMAL(10,2));

select * from room;
insert into room values(1,101,'Execuitive',120);
insert into room values(2,101,'Standard',100);
insert into room values(1,102,'Standard',100);
insert into room values(1,100,'Execuitive',150);
insert into room values(3,103,'Standard',125);
insert into room values(2,100,'Standard',115);


drop table room;

create table guest(guestNo int primary key,guestName varchar(30),guestAddress varchar(30));

insert into guest(guestNo,guestName,guestAddress)
values(1,'Ana','12,john st'),(2,'Bob',Null),
(3,'Carlos','1000 N Courst st'),(4,'David','6 S Circle 	Dr'),
(5,'Elaine','19 Western Blvd'),(6,'Filmon','90 Addis Way,chicago');

drop table guest;

select * from guest;
create table booking(hotelNo INT,foreign key (hotelNo) references hotel(hotelNo),
guestNo INT,foreign key (guestNo) references guest(guestNo),dateFrom varchar(20),dateTo varchar(20),roomNo INT);

insert into booking values(101,3,'2021-1-16','2021-2-4',2);
insert into booking values(101,2,'2021-1-13','2021-1-16',1);
insert into booking values(103,1,'2021-2-19','2021-3-25',3);
insert into booking values(101,2,'2021-2-10','2021-2-15',1);
insert into booking values(102,4,'2021-3-4','2021-3-9',1);
select * from booking;

drop table booking;

-- 1. List the names and addresses of all guests living in Chicago, sorted
-- alphabetically by their name, in descending order.

SELECT guestName,guestAddress From guest where guestAddress='CHICAGO' ORDER BY guestName DESC;


select guest.guestName,guest.guestAddress from ((booking join hotel on booking.hotelNo=hotel.hotelNo) 
join guest on guest.guestNo=booking.guestNo)  where hotel.city='chicago' order by guestName desc;

-- Display List of all Standard rooms with a price of below $130.00 per
-- night, including the room number, room type, price, hotel name and
-- city; Have the list be sorted in order of the prices, from cheapest to most
-- expensive.

select room.roomNo,room.typeR,room.price,hotel.hotelName,hotel.city from room 
join hotel on room.hotelNo=hotel.hotelNo
where room.typeR='Standard' and room.price<130 order by room.price ASC;

-- C.List the bookings for which no dateTo has been specified

select * from booking where not dateTo;

-- D.Display How many hotels are there?

select count(*) as theNumberOfHotels from hotel;


-- E.What is the average price of a room?
   select avg(price) from room;
   
   
-- f. Display a list of all hotels that have been booked at least once with details
-- including hotel number, hotel name, and city. Also show how many bookings
-- have been made.
select hotel.hotelNo,hotel.hotelName,hotel.city,count(*) as numberOfBookings from hotel 
join booking on booking.hotelNo=hotel.hotelNo group by hotel.hotelNo,hotel.hotelName;


-- g. Display How many total bookings have been made?

select count(*) as numberOfBookingsMade from booking;

-- h. Display list of all guests in the database including both those who have
-- booked a hotel room before and those who have not yet booked a hotel
-- room and for each guest, include how many bookings they have made
-- and show the guest number, guest name and address.
select guest.guestNo,guest.guestName,guest.guestAddress from guest left join booking on booking.guestNo=guest.guestNo; 

-- i. Assume the Hotel guest named, Bob, has now provided his address as,
-- "1490 Jersey Village Road". Write SQL DML code to update his
-- information.
update guest 
set
guestAddress='1490 Jersey Village Road' where guestNo=2;
select * from booking;

-- j. Delete every booking that has been made by the guest named, Bob, if it
-- is scheduled after the month of January 2021.
Delete from booking where guestNo in (select guestNo from guest where guestName='BOB') AND dateFrom >'2021-02-01';
rollback;
Delete from booking where guestNo=2 AND dateFrom >'2021-02-01';

-- k. Due to the annual cost of inflation, the hotel needs to increase the prices
-- of all Executive rooms by 5% and the prices of all Standard rooms by
-- 3%. Write SQL DML code to do this.

update room set price=
case 
when typeR='Standard' then price*1.03
when typeR='Execuitive' then price*1.05
else price
end;
select * from room;
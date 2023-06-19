create database customerList;
use customerList;
create table customers(customerID int,customerName varchar(250),contactName varchar(50),address varchar(50),city varchar(40),
postalCode varchar(40),country varchar(40));

insert into customers(customerID,customerName,contactName,address,city,postalCode,country)
 values(1,'Alfreds Futterkiste','Maria Anders','Obere Str.57','Berlin','12209','German'),(2,'Ana Trujillo Emparedados y helados','Ana Trujillo',
'Avda. de la Constitución 2222','México D.F.','05021','Mexico'),(3,'Antonio Moreno Taquería','Antonio Moreno','Mataderos 2312','México D.F.','05023','Mexico');


select count(customerID),country
from customers group by country
having count(customerId)>5
create database custometTable;
use custometTable;

create table Customers(customerId int primary key,customerName varchar(40),contactName varchar(40),Address varchar(40),city varchar(50),postalCode int,country varchar(40));	

insert into Customers(customerId,customerName,contactName,Address,city,postalCode,country)
values(1,'Alfreds Futterkiste','Maria Anders','	Obere Str. 57','Berlin',12009,'Germany'),
      (2,'Ana Trujillo Emparedados y helados','Ana Trujillo','Avda. de la Constitución 2222','Mexico',05021,'Mexico'),
      (3,'Antonio Moreno Taquería','Antonio Moreno','Mataderos 2312','México D.F.',05023,'Mexico');
drop table customer;
select * from customer;

create table orders(orderID int PRIMARY KEY,customerId INT,EmployeeID int,orderDate varchar(30),shipperId int);
insert into orders(orderID,customerId,EmployeeID,orderDate,shipperId)
values(10308,2,7,'1996-09-18',3),
      (10309,37,3,'1996-09-19',1),
      (10310,77,8,'1996-09-20',2);









drop table orders;
-- inner join
select orders.orderID,customer.customerName from 
orders inner join customer on 
orders.orderID=customer.customerId;

-- join three tables



-- left join examples

select Customers.customerName,orders.orderID from customers left join orders on Customers.customerID=orders.customerId
order by customers.customerName;


-- Full join
use custometTable;
select Customers.customerName,orders.orderID
From customers
Full join orders on Customers.customerID=orders.customerId
order by customers.customerName;

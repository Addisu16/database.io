create database Employee;

use employee;

create table Orders(OrderID INT,CustomerID int,EmployeeID int,OrderDate varchar(40),ShipperID int);
insert into Orders(OrderID,CustomerID,EmployeeID,OrderDate,ShipperID)
values(10308,2,7,'1996-09-18',3),(10309,37,3,'1996-09-19',1),
(10310,77,8,'1996-09-20',2);

create table Employees(EmployeeID int,LastName varchar(40),FirstName varchar(40),BirthDate varchar(40));
insert into Employees(EmployeeID,LastName,FirstName,BirthDate)
values(1,'Davolio','Nancy','12/8/1968'),(2,'Fuller','Andrew','2/19/1952'),(3,'Leverling','Janet','8/30/1963');


-- Right joins

select Orders.OrderID,employees.lastname,employees.firstname
from orders
right join employees on orders.EmployeeID=Employees.EmployeeID
ORDER BY ORDERS.ORDERID;







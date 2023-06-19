create database shop;

use shop;
create table brand(brandNo int,brandName varchar(40),location varchar(40),
primary key(brandNo));

create table item(itemNo int,brandNo int,brandName varchar(40),quantity int,price double,
primary key(itemNo),foreign key (brandNo)references brand(brandNo));


create table orders(orderNo int,itemNo int,customerNo int,orderDate varchar(40),
primary key(orderNo),foreign key (itemNo)references item(itemNo),
foreign key (customerNo)references orders(customerNo));

create table Customer(customerNo int,customerName varchar(40),address varchar(40),primary key(customerNo));

INSERT INTO brand (brandNo, brandName, location)
VALUES (1, 'Brand A', 'Location A'),
       (2, 'Brand B', 'Location B'),
       (3, 'Brand C', 'Location C'),
       (4, 'Brand D', 'Location D');

select* from brand,item,orders,customer;

INSERT INTO item (itemNo, brandNo, brandName, quantity, price)
VALUES (1, 1, 'Brand A', 10, 9.99),
       (2, 1, 'Brand A', 5, 4.99),
       (3, 2, 'Brand B', 20, 14.99),
       (4, 3, 'Brand C', 8, 12.99);
       
INSERT INTO orders (orderNo, itemNo, customerNo, orderDate)
VALUES (1, 1, 1001, '2023-06-01'),
       (2, 2, 1002, '2023-06-02'),
       (3, 3, 1003, '2023-06-03'),
       (4, 4, 1004, '2023-06-04');


INSERT INTO Customer (customerNo, customerName, address)
VALUES (1001, 'Customer A', 'Address A'),
       (1002, 'Customer B', 'Address B'),
       (1003, 'Customer C', 'Address C'),
       (1004, 'Customer D', 'Address D');


-- Total items by the brand, whose name is 'kuumba Made':
select count(*)as total_items
from item
where brandName='Brand A';
-- Most popular item sold:
SELECT itemNo, COUNT(*) AS total_sales
FROM orders
GROUP BY itemNo
ORDER BY total_sales DESC
LIMIT 1;

-- Customer details (who bought more items):
SELECT customerNo, customerName
FROM Customer
WHERE customerNo = (
    SELECT customerNo
    FROM orders
    GROUP BY customerNo
    ORDER BY COUNT(*) DESC
    LIMIT 1
);
-- How many orders for an item whose name is 'Essential Oil':
SELECT COUNT(*) AS total_orders
FROM orders
WHERE itemNo = (
    SELECT itemNo
    FROM item
    WHERE itemName = 'Essential Oil'
);
-- Generate (select) an invoice that has item, order, and customer details:

SELECT o.orderNo, i.itemNo, i.itemName, i.price, c.customerNo, c.customerName
FROM orders o
JOIN item i ON o.itemNo = i.itemNo
JOIN Customer c ON o.customerNo = c.customerNo;


-- Select all items in the price range 100 to 200:

SELECT *
FROM item
WHERE price BETWEEN 100 AND 200;
-- Get all customers who made an order on February 20, 2022:
SELECT c.customerNo, c.customerName
FROM Customer c
JOIN orders o ON c.customerNo = o.customerNo
WHERE o.orderDate = '2023-06-03';

-- Select all items whose name is not 'Brand C':
select * from item where brandName !='Brand C';
-- Get all items and their brand details that are out of stock (whose quantity is 0 or less):
select item.*,brand.brandName from item join 
brand on item.brandNo=brand.brandNo
where item.quantity<0;
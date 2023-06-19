USE mydbb;
set autocommit=OFF;
SET SQL_SAFE_UPDATES=0;
select *from orders;
-- 1. START A NEW TRANSACTION
START TRANSACTION;
-- 2. Get the latest order number
SELECT @orderNumber:= MAX(orderNumber)+1 From orders;

-- 3. insert a new order from customer 10425

INSERT INTO orders(orderNumber,orderDate,requiredDate,shippedDate,status,customerNumber)
VALUES(@orderNumber,'2023-06-06','2023-07-07','2023-07-09','In Process',120);
SELECT @orderNumber1:= MAX(orderNumber)+1 From orders;
INSERT INTO orders(orderNumber,orderDate,requiredDate,shippedDate,status,customerNumber)
VALUES(@orderNumber1,'2023-06-06','2023-07-07','2023-07-09','In Process',121);

-- 4. Insert order line items
select * from orderdetails where priceEach=55.09;

SELECT @orderNumber:=MAX(orderNumber)+1 FROM orderdetails;

INSERT INTO orderdetails(orderNumber,productCode,quantityOrdered,priceEach,orderLineNumber)
VALUES(@orderNumber,'S18_1749', 30, '136', 1),
      (@orderNumber,'S18_2248', 50, '55.09', 2); 
      
-- 5. COMMIT CHANGES
 COMMIT;
      
      -- TO GET THE NEWLY CREATED SALES ORDER, YOU USE THE FOLLOWING QUERY:
      
   SELECT 
    c.orderNumber,
	orderDate,
	requiredDate,
     shippedDate,
      status,
    comments,
      customerNumber,
      orderLineNumber,
     productCode,
   quantityOrdered,
     priceEach
     
    FROM
    orders c
    INNER JOIN
orderdetails b USING(orderNumber)
  where
  c.orderNumber=10426;
START TRANSACTION;

DELETE FROM  orderdetails WHERE orderNumber=10426;
 DELETE FROM  orders WHERE orderNumber=10426;
 SELECT COUNT(*)FROM orders;
 rollback;
 
 -- distinct filtered the unique value
 select * from orders;
SELECT DISTINCT orderDate From orders;
SELECT DISTINCT customerNumber From orders;
-- greater than practice
SELECT * FROM orders where customerNumber >146;

-- BETWEEN some range x and y practice
SELECT * FROM orders where customerNumber BETWEEN 146 AND 148;


-- LIKE PRACTICE
-- 1.starts with a ends with o
SELECT * FROM customers where customerName LIKE 'a%o';
-- 1.starts with a 
SELECT * FROM customers where customerName LIKE 'a%';
-- 2.Ends with a
SELECT * FROM customers where customerName LIKE '%a';
-- 3.in between a
SELECT * FROM customers where customerName LIKE '%a%';

-- 4. find values that have r in the second position
SELECT * FROM customers where customerName LIKE '%_r%';

SELECT * FROM customers where city IN('Madrid','NYC');

-- AND/OR USIG WHERE
SELECT * FROM customers where city='NYC' AND state='NY';

-- ORDER BY PRACTICE
SELECT * FROM customers ORDER BY city,customerName;

-- TOP
select * from customers limit 15;


-- NULL filter
SELECT * FROM customers where state is Null;

-- MAX practice
SELECT MAX(creditLimit) AS largestCredits FROM customers;
-- inner join
SELECT orders.orderNumber,customers.customerNumber From orders INNER Join customers ON orders.customerNumber=customers.customerNumber;

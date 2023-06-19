create database myCarRental;
use myCarRental;

CREATE TABLE `car` (
  `carNo` varchar(20) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `fuelType` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `mileage` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`carNo`)
) ;

CREATE TABLE `Car_Rental` (
  `carNo` varchar(20) NOT NULL,
  `customer_id` int NOT NULL,
  `dateFrom` date DEFAULT NULL,
  `dateTo` date DEFAULT NULL,
  PRIMARY KEY (`carNo`,`customer_id`),
  KEY `vin_idx` (`carNo`),
  KEY `customerNo_idx` (`customer_id`),
  CONSTRAINT `customerNo` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vin` FOREIGN KEY (`carNo`) REFERENCES `car` (`carNo`) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `customer` (
  `customer_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
);
INSERT INTO `customer` VALUES (1,'Mark','Fairfield'),(2,'Sally',NULL);
INSERT INTO `car` VALUES ('1MEBP88U0GG643233','Lamborghini Diablo','VT','5-speed manual','black',50000,1000),('1MEBP88U0GG643234','Lamborghini Diablo','SV-R','6-sped Manual','grey',70000,2000);
INSERT INTO `Car_Rental` VALUES ('1MEBP88U0GG643233',1,'2021-11-11','2021-11-11'),('1MEBP88U0GG643233',2,'2021-11-11','2021-11-11'),('1MEBP88U0GG643234',2,'2021-11-11','2021-11-12');


select * from car;
select * from customer;
select*from Car_Rental;

-- 1 delete red cars
set sql_safe_updates=0;
delete from car where car.color='red';

--  List the details of customer who rented cars.
select distinct customer.* from customer,car_rental where customer.customer_id=car_rental.customer_id;

-- update the rental price of car to 200 if the car is of color black or car name is ford
update car set car.price=200 where car.color='black' or car.name='ford';
-- How many Lamborgio cars are rented.
select count(distinct car.carNo) from car_rentals,car where car_rental.carno=car.carNo and car.name='lamborghni';
-- List the details of customers who rented the 'black' cars after 'Jan 2020' 
select distinct cutsomer.* from customer,car_rentals,car where customer.customerid=car_rentals.customerid and car.carno=car_rentals.carno and car.color='black' and dateFrom>'2020-01-01';
-- Display the list of cars rented by name whose average mileage is above 40,000 

select car.name,avg(car.mileage)from car_rental, car where car.carNo=car_rental.carNo
group by car.name
having avg(car.mileage>40000);

-- Display the list of cars rented whose prices are more than minimum price(car)
select distinct car.* from  car_rental,car where car.carNo=car_rental.carNo and car.price > (select min(car.price)from car);


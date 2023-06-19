use myhome;

-- 1. Write and execute appropriate queries on the DreamHome for the following:

-- d. Produce a list of monthly salaries for all staff, showing the staff number, the first and
-- last names, and the monthly_salary. Note: Include some necessary SQL code in your
-- query to make the monthly_salary data be displayed under a column-heading named,
-- monthly_salary.
-- e. List all staff whose salary is more than 10,000. Display the list sorted, beginning from
-- the highest earner to the lowest.
-- f. List the data of all branch offices which are located in either London or Bristol
-- 2. Query on your project what you committed to query on the first assignment, plus other
-- interesting reports using DML.
-- a. There must be at least one GROUP BY
-- b. There must be at least one IN inside there must be another SELECT statement


-- a. List the full details of all Staff, sorted by their firstName in ascending order.
select * from STAFF order by fName asc;

-- b. Produce a list of salaries for all staff, showing only the staff number, the first and last
-- names, and the salary.

select staff.STAFFNO,staff.FNAME,staff.LNAME,staff.SALARY FROM staff;

-- c. Produce a list of all properties that have been viewed (at least once), showing only the
-- property number.
select * from Viewing;
select PrpertyNo from 
viewing where ViewDate is not NULL;
;
select * from staff;

-- d. Produce a list of monthly salaries for all staff, showing the staff number, the first and
-- last names, and the monthly_salary. Note: Include some necessary SQL code in your
-- query to make the monthly_salary data be displayed under a column-heading named,
-- monthly_salary.

select staff.STAFFNO,staff.FNAME,staff.LNAME,staff.SALARY as monthly_salary from staff ;

-- e. List all staff whose salary is more than 10,000. Display the list sorted, beginning from
-- the highest earner to the lowest.
select *  from staff where SALARY>10000 order by salary desc; 

-- f. List the data of all branch offices which are located in either London or Bristol
select * from branch where city='London' or city='Bristol';



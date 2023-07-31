/*==================================================
	Section 6: Handling & Manipulating Data
    
    Querying, Sorting , Filtering and Grouping Data
======================================================*/
use retail;
-- select all columns and rows employees table
select * from employees;


-- selecting specific column
select firstName, lastName, employeeNumber
from employees;


-- giving alias to columns ( count functions )

select count(*) as total_count
from employees;


-- select the motocycle products only
select * from products;

select * from products
where productLine = 'Motorcycles';

select productCode, productName, MSRP
from products
where productLine = 'Motorcycles';


-- how many motorcycles we have?
select count(*) as count_motorcycle from products
where productline= 'Motorcycles';


-- average of MSRP in products
select * from products;


select round(avg(MSRP), 2) 
from products ;

-- DISTINCT: retrieve the unique values 
/*
SELECT DISTINCT col_name
FROM tabe_name;
*/

-- What are the unique products we have?
select * from products;

select distinct productLine
from products;


-- what is the number of unique products we have?
select count(distinct productLine) as unique_no_prod
from products;




/*==================
     WHERE CLAUSE
==================*/
select * from customers;
-- select only those customers who are from USA
select * from customers
where country = 'USA';


-- count of those customers who are from USA
select count(*) as cust_count from customers
where country = 'USA';



-- select all the sales repersentatives
select * from employees;

select * from employees
where jobTitle = 'Sales Rep';





/*
clauses: where
operators:
logical operator:
1. IN/NOT IN
2. AND/OR
3. BETWEEN
4. LIKE/NOT LIKE
*/


/*============
-- IN/ NOT IN
===============*/

-- select all those employees with the office code of 1,3,4,6
select * from employees;

select * from employees
where officeCode IN (1,3,6);


-- select all those employees with the office code of other than 2 and 4
select * from employees
where officeCode NOT IN (2,4);



-- select product code and price only for the 4,10 and 15 orderlinenumber in 
-- orderdetails table
select * from orderdetails;

select productCode,priceEach, orderLineNumber from orderdetails
where orderLineNumber in (4,10,15);


/*============
    BETWEEN
===============*/

-- SELECT all the customers who have made payment between 10,000 to 20,000 from payments
select * from payments;

select *
from payments
where amount between 10000 and 20000;

-- select only those orders which have been made in june of 2003
select * from orders;

select * from orders
where orderDate between '2003-06-01' and '2003-06-30';



/*
-- LIKE operator / NOT LIKE
*/
select * from products;
-- select those products which product name stars with 'T'
select * from products
where productName like 'T%';


-- select those name ends with 'r'
select * from products
where productName like '%r';


-- select those products name which contains 'son' in them
select * from products
where productName like '%son%';




-- "se_en"
-- seven
-- se7en
-- sewen

-- who are the employees whose firstname have 4 characters and starts with 'Ma'
select * from employees
where firstName like 'Ma__';

/*========================
IS NULL / NOT NULL operator 
=========================*/

select * from customers;
-- select those rows where state is null in customers table.

select * from customers
where state IS NULL;


-- in orders table select those rows where comment is not null
select * from orders
where comments is NOT Null;


/*==========
  COALESCE() - allows you to substitute NULL values.
  COALESCE(col_name, 'value')
=========*/
-- 'n/a'
-- state column in customers
select * from customers;
select *, coalesce(state, 'N/A') as state
from customers;



/*===========
    AND/OR
=============*/

-- select those products where the quantity is less than 8000 and price is greater than 30



-- select those customers who are from USA or there sales representative id is 1323



/*===========
    group by 
=============*/

-- what is the count of each product we have?



-- select only those prducts which count is greater than 10


-- average msrp of each product which is greater than 100




-- in the orders table how many orders are in each status



/*============
   order by 
==============*/

-- sort msrp to hightest to lowest

-- sort msrp to lowest to highest


/*=============
	 limit
============*/

-- get the top 5 highest msrp products


-- get the 6th heighest msrp product 



-- get the least 3 msrp products



-- questions
-- show average msrp of product order by heighest to lowest and show top 3




-- total sum of amount in each year in payments table.



/*===========
	 case
=============*/
-- Syntax
/*
SELECT col_name,
 CASE
  WHEN (condition) THEN 'value'
  WHEN (condition) THEN 'value'
  ELSE 'value'
 END
FROM table;
*/

-- where quantity in stock is less than 5000 then refill stock
-- where stock is less than 8000 then order stock
-- rest enough stock




-- where paymenet above 50000 then 'high value'
-- else 'low value' in payments table





-- museum assignment








/*==================================================
	Section 6: Handling & Manipulating Data
    
    Querying, Sorting , Filtering and Grouping Data
======================================================*/
use retail;
-- select all columns and rows employees table

select*from employees;



-- selecting specific column
select employeeNumber,firstName,lastName from employees;


select count(*) as total_count from employees;

-- where filter the rows


-- giving alias to columns ( count functions )





-- select the motocycle products only

select*from products;
select* from products  where ProductLine='Motorcycles';

select productCode,productName,MSRP from products  where ProductLine='Motorcycles';

select count(*) as count_motorcycle from products  where ProductLine='Motorcycles';

-- average of MSRP in products
select round(avg(MSRP),2) from PRODUCTS;



-- DISTINCT: retrieve the unique values 
/*
SELECT DISTINCT col_name
FROM tabe_name;
*/

-- What are the unique products we have?
select distinct(productLine) from productS;


-- what is the number of unique products we have?

select COUNT(distinct productLine) AS UNIQUE_NO_OF_PRODUCTS from productS;

/*==================
     WHERE CLAUSE
==================*/

-- select only those customers who are from USA
select*FROM customerS where country='USA';
-- count of those customers who are from USA
select count(*)FROM customerS where country='USA';






-- select all the sales repersentatives
select*from employees where jobTitle='Sales Rep';
select count(*)from employees where jobTitle='Sales Rep';

-- logical and/or,between,like,not like,in,not in


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
select*from employees where officeCode in (1,3,4,6);


-- select all those employees with the office code of not 2 and 4
select*from employees where officeCode not in (2,4);


-- select product code and price only for the 4,10 and 15 orderlinenumber in orderdetails table

select productCode,priceEach,orderLineNumber from orderdetails where orderLineNumber in(4,10,15) ;



/*============
    BETWEEN
===============*/

-- SELECT all the customers who have made payment between 10,000 to 20,000 from payments
select*from payments where amount between 10000 and 20000;


-- select only those orders which have been made in june of 2003
select*from orders where orderDate between '2003-06-01' and '2003-06-30';



/* 
-- LIKE operator / NOT LIKE
*/

-- select those products which product name stars with 'T'

select*from products where productName like 'T%';

-- select those name ends with 'r'
select*from products where productName like '%r';


-- select those products name which contains 'son' in them
select*from products where productName like '%son%';




-- "se_en"
-- seven
-- se7en
-- sewen

-- who are the employees whose firstname have 4 characters and starts with 'Ma'


select*from employees where firstname like 'Ma__';
-- is null and not null also operator

/*========================
IS NULL / NOT NULL operator 
=========================*/


-- select those rows where state is null in customers table.
select* from customers 
where state is null;
-- in orders table select those rows where comment is not null
select*from orders where comments is not null;


/*==========
  COALESCE() - allows you to substitute NULL values.
  COALESCE(col_name, 'value')
=========*/
-- 'n/a'
-- state column in customers

select*from customers;

select customerName,coalesce(state,'N/A') as state from customers;






/*===========
    AND/OR
=============*/

-- select those products where the quantity is less than 8000 and price is greater than 30

select*from products where quantityInStock <8000 and buyPrice>30;


-- select those customers who are from USA or there sales representative id is 1323

select*from customers where country='USA' or salesRepEmployeeNumber=1323;

/*===========
    group by 
=============*/
-- those office code is 1 and also sales representative
 select*from employees where officeCode=1 and jobTitle='Sales Rep';
select*from employees;
-- what is the count of each product we have?
select productLine,count(*)from products group by productLine;
-- count of customer from each country
select customerName,country,count(*)from customers group by country;
-- avg price of each productline
select productLine,avg(MSRP) from products group by productLine;
-- select only those prducts which count is greater than 10
select productLine,count(*) as count_prod from products group by productLine having count_prod>10;

-- average msrp of each product which is greater than 100
SELECT 
    productLine, AVG(MSRP) AS count_prod
FROM
    products
GROUP BY productLine
HAVING count_prod > 100;









-- in the orders table how many orders are in each status
select status,count(*) from orders group by status;
select status, count(*) as count_status
from orders
group by status
order by count_status desc;







/*============
   order by 
==============*/

-- sort msrp to hightest to lowest
select*from products order by MSRP desc;
-- sort msrp to lowest to highest
select*from products order by MSRP asc;

/*=============
	 limit
============*/

-- get the top 5 highest msrp products
select*from products order by MSRP desc limit 5;
SELECT 
    *
FROM
    products
ORDER BY MSRP
LIMIT 5;
-- get the 6th heighest msrp product 
SELECT 
    *
FROM
    products
ORDER BY MSRP DESC
LIMIT 5,1;

SELECT 
    *
FROM
    products
ORDER BY MSRP DESC
LIMIT 7,2;


-- get the least 3 msrp products
SELECT 
    *
FROM
    products
ORDER BY MSRP asc
LIMIT 3;


-- questions
-- show average msrp of product order by heighest to lowest and show top 3

SELECT 
    productLine, AVG(MSRP)
FROM
    products
GROUP BY productLine
ORDER BY AVG(MSRP) DESC
LIMIT 3;

-- total sum of amount in each year in payments table.

select year(paymentDate),sum(amount) from payments
group by year(paymentDate)
order by sum(amount);



select year(paymentDate),sum(amount) from payments
group by 1
order by 2;
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

select*,
case when
quantityInStock <5000 then 'Refill stock'
when
quantityInStock <8000 then 'order stock' else 'enough stock' end as stock_update from products
;


-- where paymenet above 50000 then 'high value'
-- else 'low value' in payments table
select *,case when amount>50000 then 'high value' else 'low value' end as payment_status from payments;




-- museum assignment








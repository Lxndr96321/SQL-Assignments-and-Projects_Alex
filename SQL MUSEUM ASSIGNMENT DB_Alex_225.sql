


-- Creating the database called meauseum

create table met(
ID INT PRIMARY KEY,
Department varchar(100),
Category varchar(100),
Title varchar(100),
Artist varchar(100),
Date varchar(100),
Medium varchar(100),
Country varchar(100));

-- Select the top 10 rows in the met table:

SELECT *
FROM met
LIMIT 10;

-- Count how many pieces are in the American Metropolitan Art collection:

SELECT COUNT(*)
FROM met
WHERE Country = 'United States';

-- Count the number of pieces where the category includes 'celery':

SELECT COUNT(*)
FROM met
WHERE Category LIKE '%celery%';

-- Find the title and medium of the oldest piece(s) in the collection:

SELECT Title, Medium 
FROM met 
ORDER BY Date ASC 
LIMIT 1;

-- Find the top 10 countries with the most pieces in the collection:

SELECT Country, COUNT(*) AS PieceCount
FROM met 
GROUP BY Country 
ORDER BY PieceCount DESC 
LIMIT 10;

-- Find categories which have more than 100 pieces:

SELECT Category, COUNT(*) AS PieceCount 
FROM met 
GROUP BY Category HAVING PieceCount > 100;

-- Count how many pieces where medium contains 'gold' or 'silver' and sort them in descending order:

SELECT COUNT(*) AS GoldSilverPieceCount  
FROM met  
WHERE Medium LIKE '%gold%' OR Medium LIKE '%silver%'
ORDER BY GoldSilverPieceCount DESC;


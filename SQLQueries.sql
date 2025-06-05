USE MyDatabase  --telling SQL to use MyDatabase

--1.SELECT and FROM Clause
--Select everthing from table
--SELECT * FROM customers
--SELECT * FROM orders


--Select only specific rows
/*SELECT 
first_name,
country,
score FROM customers*/

--2.WHERE Clause (filter rows)
/*SELECT *
FROM customers
WHERE score != 0

SELECT 
	first_name,
	country
FROM customers
WHERE country = 'Germany'*/

--3.OrderBy 
/*SELECT *
FROM customers
ORDER BY score ASC

--Nested ORDER BY
SELECT *
FROM customers
ORDER BY 
	country ASC,
	score DESC*/

--4.GROUP BY
/*SELECT 
	country,
	SUM(score) AS total_score,
	COUNT(id) AS total_customers
FROM customers
GROUP BY country

SELECT 
	country,
	sum(score)
FROM customers
GROUP BY country
HAVING SUM(score) > 800*/

--5.HAVING
/*
SELECT 
	country,
	SUM(score)
FROM customers
WHERE score > 400
GROUP BY country
HAVING SUM(score) > 8008

SELECT 
	country,
	AVG(score)
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430 */

--6.Distinct
--SELECT DISTINCT country FROM customers

--7.TOP
/*SELECT TOP 2
* FROM customers
ORDER BY score ASC*/

SELECT * FROM orders
SELECT TOP 2*
FROM orders
ORDER BY order_date DESC
use MyDatabase

-- WHERE CONDITIONS 

--1.Comparison operators
--a.equal
SELECT * FROM customers WHERE country = 'Germany'

--b.not equal
SELECT * FROM customers WHERE country != 'Germany'
SELECT * FROM customers WHERE country <> 'Germany'

--c. greater than
SELECT * FROM customers WHERE score <= 500

--2.Logical Operator
--a.AND
SELECT * FROM customers WHERE country = 'USA' and score > 500 

--b.OR
SELECT * FROM customers WHERE country = 'USA' or score > 500

--c.NOT
SELECT * FROM customers WHERE NOT score < 500

--3.Range (BETWEEN)
SELECT * FROM customers WHERE score BETWEEN 100 and 500

--4.Membership 
--IN
SELECT * FROM customers WHERE country IN ('Germany','USA')

--5.Search
SELECT * FROM customers WHERE first_name LIKE 'M%'

SELECT * FROM customers WHERE first_name LIKE '%n'

SELECT * FROM customers WHERE first_name LIKE '%r%'

SELECT * FROM customers WHERE first_name LIKE '__r%'
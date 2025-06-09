use MyDatabase

--Advance joins

--1.Left anti join : unmatching data from left table
SELECT 
id,
first_name
FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id
WHERE orders.customer_id IS NULL

SELECT 
order_id,
customer_id,
order_date,
sales
FROM orders
LEFT JOIN customers
ON customers.id = orders.customer_id
WHERE customers.id IS NULL

--2.Right anti join : unmatching data from right table
SELECT 
order_id,
customer_id,
order_date,
sales
FROM customers
RIGHT JOIN orders
ON customers.id = orders.customer_id
WHERE customers.id IS NULL 

--3.Full anti join
SELECT * FROM customers
FULL JOIN orders
ON customers.id = orders.customer_id
WHERE customers.id IS NULL 
or
orders.customer_id IS NULL


--Challenge 
SELECT * FROM customers
FULL JOIN orders
ON customers.id = orders.customer_id
WHERE customers.id IS NOT NULL 
and
orders.customer_id IS NOT NULL

SELECT * FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id
WHERE orders.customer_id IS NOT NULL

--4.Cross join : All possible combinations
SELECT * FROM customers
CROSS JOIN orders

use MyDatabase

--JOINS

--1.No Join
SELECT * FROM customers; SELECT * FROM orders;

--2.INNER JOIN
SELECT 
id,
order_id,
first_name,
country,
sales
FROM customers
INNER JOIN orders
ON id = customer_id

--3.Left Join
SELECT 
id,
first_name,
order_id,
order_date,
sales
FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id
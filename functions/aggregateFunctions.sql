use MyDatabase

SELECT 
COUNT(*) as total_orders,
SUM(sales) as total_sales,
AVG(sales) as avg_sale,
MAX(sales) as higest_sales,
MIN(sales) as min_sales
FROM orders

SELECT 
country,
COUNT(*) as no_customers,
SUM(score) as total_core,
AVG(score) as avg_score,
MAX(score) as higest_score,
MIN(score) as min_score
FROM customers
GROUP BY country

SELECT * FROM customers






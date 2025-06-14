use SalesDB



SELECT 
OrderID,
OrderDate, --Date from column of table
ShipDate,
'2025-08-20' Hardcoded, --Hardcoded string
GETDATE() Today
FROM Sales.Orders


--a.Part extraction functions
SELECT 
OrderID,
CreationTime,
YEAR(CreationTime) as Year,
MONTH(CreationTime) as Month,
DAY(CreationTime) as Day
FROM Sales.Orders

SELECT 
OrderID,
CreationTime,
DATEPART(year,CreationTime) as Year,
DATEPART(month,CreationTime) as Month,
DATEPART(day,CreationTime) as Day,
DATEPART(hour,CreationTime) as Hour,
DATEPART(quarter,CreationTime) as Quarter,
DATEPART(week,CreationTime) as Week
FROM Sales.Orders

SELECT 
OrderID,
CreationTime,
DATENAME(year,CreationTime) as Year,
DATENAME(month,CreationTime) as Month,
DATENAME(day,CreationTime) as Day,  --stored as string 
DATENAME(weekday,CreationTime) as Week
FROM Sales.Orders

SELECT 
OrderID,
CreationTime,
DATETRUNC(minute,CreationTime) as minute,
DATETRUNC(day,CreationTime) as date
FROM Sales.Orders

--usecase of datetrunc
SELECT 
DATETRUNC(month,CreationTime) as minute,
COUNT(*)
FROM Sales.Orders
GROUP BY DATETRUNC(month,CreationTime)

SELECT
EOMONTH(CreationTime) as eomonth
FROM Sales.Orders

--How many orders are placed each year
SELECT
DATETRUNC(year,CreationTime) as year,
COUNT(*)
FROM Sales.Orders
GROUP BY DATETRUNC(year,CreationTime)

--How many orders where placed in each month
SELECT
DATENAME(month,CreationTime) as month,
COUNT(*) as no_of_orders
FROM Sales.Orders
GROUP BY DATENAME(month,CreationTime)

--Show all orders that were placed during the month of feb
SELECT
OrderID,
CreationTime
FROM Sales.Orders
WHERE DATEPART(month,CreationTime) = 2



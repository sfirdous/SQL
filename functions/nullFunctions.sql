use SalesDB


--use case of handling nulls
--1.data aggregation
SELECT 
CustomerID,
Score,
AVG(Score) OVER() AvgScores,
AVG(COALESCE(Score,0)) OVER()  AvgScores2
FROM Sales.Customers

--2.mathematical operations
SELECT
FirstName,
LastName,
FirstName + ' ' + COALESCE(LastName,'') as FullName ,
COALESCE(Score,0) + 10  as Bouns10
FROM Sales.Customers

--3.Sorting date
SELECT
CustomerID,
Score
From Sales.Customers
ORDER BY (COALESCE(Score,99999)) ASC  --lazy method	

--professional way
SELECT
CustomerID,
Score
FROM Sales.Customers
ORDER BY (CASE WHEN Score IS NULL THEN 1 ELSE 0 END ),Score

--prevent division by zero
--Find the sales price for each order by dividing sales by quantity
SELECT
OrderID,
Sales,
Quantity,
Sales / NULLIF(Quantity,0) as price
FROM Sales.Orders

--filtering data
--Identify customers who have no scores
SELECT 
*
FROM Sales.Customers
WHERE SCORE IS NOT NULL

--anti joins
SELECT
CustomerID
FROM Sales.Customers

SELECT
Sales.Customers.CustomerID,
FirstName
FROM Sales.Customers
LEFT JOIN Sales.Orders
ON Sales.Orders.CustomerID = Sales.Customers.CustomerID
WHERE Sales.Orders.OrderID IS NULL



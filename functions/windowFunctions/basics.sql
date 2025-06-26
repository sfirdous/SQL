use SalesDB


/*TASK : 1
Find total Sales for each product*/
SELECT
ProductID,
SUM(Sales) as productSales
FROM Sales.Orders
GROUP BY ProductID


--Partiton By Clause
/*TASK : 2
Find total Sales for each product additionally provide details such as order id  and order date*/

SELECT
OrderID,
OrderDate,
ProductID,
Sales,
SUM(Sales) OVER(PARTITION BY ProductID) as TotalProductSales,
SUM(Sales) OVER() as TotalSales
FROM Sales.Orders

/*Task : 3 Find the total sales for each combination of product and order status*/
SELECT 
OrderId,
ProductID,
Sales,
OrderStatus,
SUM(Sales) OVER (PARTITION BY ProductID,OrderStatus) as SalesByProductsAndStatus
FROM Sales.Orders


--Order By
/*TASK : 4
Rank each order based on their sales from highest to lowest*/
SELECT 
OrderID,
Sales,
RANK() OVER(ORDER BY Sales DESC ) as RankSales
FROM Sales.Orders

--Window Frame
SELECT
OrderId,
Sales,
SUM(SALES) OVER(PARTITION BY OrderStatus ORDER BY OrderDate ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING)  
FROM Sales.Orders

/*TASK :5
Find the total sales for each order status, only for two products 101 and 102*/
SELECT
OrderId,
Sales,
OrderStatus,
ProductID,
SUM(Sales) OVER (PARTITION BY OrderStatus) as TotalSales
FROM Sales.Orders
WHERE ProductID in (101,102)


/*TASK : 6 
Rank Customer Based on their Sales*/
SELECT
CustomerID,  
SUM(Sales) as IndividualSales ,
RANK() OVER(ORDER BY SUM(Sales) DESC) as RankCustomers
FROM Sales.Orders
Group BY CustomerID

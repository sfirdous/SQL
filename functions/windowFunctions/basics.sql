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
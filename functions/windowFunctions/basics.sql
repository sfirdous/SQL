use SalesDB


/*TASK : 1
Find total Sales for each product*/
SELECT
ProductID,
SUM(Sales) as productSales
FROM Sales.Orders
GROUP BY ProductID

/*TASK : 2
Find total Sales for each product additionally provide details such as order id  and order date*/

SELECT
OrderID,
OrderDate,
ProductID,
SUM(Sales) OVER(PARTITION BY ProductID) as totalProductSales
FROM Sales.Orders



use SalesDB

--Rank Orders based on their sales from highest to lowest
SELECT 
OrderID,
Sales,
ROW_NUMBER() OVER(order by sales DESC) as SalesRank_Row,
RANK() OVER(order by sales DESC) as SalesRank_Rank,
DENSE_RANK() OVER(order by sales DESC) as SalesRank_DENSE
FROM Sales.Orders

--Find the top highest sales for each product (Top n analysis)
SELECT * FROM(
SELECT
ProductID,
Sales,
ROW_NUMBER() OVER(PARTITION by ProductID Order by Sales DESC) as SalesRank_Product
FROM Sales.Orders)t WHERE SalesRank_Product = 1

--Find two lowest customers based on their total sales (Bottom m - analysis)
SELECT * FROM (
SELECT
CustomerID,
SUM(Sales) as TotalSales,
ROW_NUMBER() OVER( order by SUM(Sales)) as SalesByCustomer
FROM Sales.Orders
group by CustomerID)t where SalesByCustomer <= 2



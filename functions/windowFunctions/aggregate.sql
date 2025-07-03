use SalesDB

/*Find Total number of orders for each product*/

SELECT 
ProductID,
COUNT(*) OVER (PArtition by ProductID)  as count
FROM Sales.Orders

/*Find total number of orders provide orderid and orderdate for each customer*/
SELECT
OrderID,
OrderDate,
CustomerID,
COUNT(*) OVER (partition by CustomerID) as OrdersByCustomer
FROM Sales.Orders

/*Find total number of customers additionally provide all customer details*/
SELECT * ,
Count(*) OVER() as TotalCustomers
FROM Sales.Customers

/*Find total number of scores for customers*/
Select 
COUNT(Score) as ScoreCount From Sales.Customers

/*Check whether the table orders contains any duplicates*/
SELECT
OrderID,
COUNT(*) OVER (PARTITION BY OrderId) as CheckPK
FROM Sales.Orders


SELECT * FROM (
SELECT
OrderID,
COUNT(*) OVER(PARTITION BY OrderID) as CheckPK
FROM Sales.OrdersArchive
)t WHERE CheckPK > 1

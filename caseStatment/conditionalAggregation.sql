--Conditional Aggregation
use SalesDB
/* TASK 5: 
   Count how many orders each customer made with sales greater than 30 
*/

SELECT
CustomerID,
SUM(CASE
	WHEN Sales > 30 THEN 1
	ELSE 0
END) as totalOrdersHighSales,
COUNT(*) as totalOrders
FROM Sales.Orders
GROUP BY CustomerID
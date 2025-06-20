use SalesDB
--CASE STATMETS

--a.Data categorization
/* TASK 1: 
   Create a report showing total sales for each category:
	   - High: Sales over 50
	   - Medium: Sales between 20 and 50
	   - Low: Sales 20 or less
   The results are sorted from highest to lowest total sales.
*/
SELECT 
OrderID,
Sales,
CASE 
    WHEN Sales > 50 THEN 'High'
	WHEN 20 < Sales and Sales <= 50 THEN 'Medium'
	ELSE 'LOW'    
END Category
FROM Sales.Orders
ORDER BY Sales DESC


SELECT
Category,
SUM(Sales) as totalSales
FROM(
SELECT 
OrderID,
Sales,
CASE 
    WHEN Sales > 50 THEN 'High'
	WHEN 20 < Sales and Sales <= 50 THEN 'Medium'
	ELSE 'LOW'    
END Category
FROM Sales.Orders
)t
GROUP BY Category
ORDER BY totalSales DESC
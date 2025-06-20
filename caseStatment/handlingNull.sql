--handing nulls
use SalesDB
/* TASK 4: 
   Calculate the average score of customers, treating NULL as 0,
   and provide CustomerID and LastName details.
*/

SELECT 
CustomerID,
LastName,
AVG(CASE
	WHEN Score IS NULL THEN 0
	ELSE Score
END )  OVER()  avg_score --window function
FROM Sales.Customers
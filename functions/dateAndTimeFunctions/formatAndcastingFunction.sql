use SalesDB

SELECT 
OrderID,
CreationTime,
FORMAT(CreationTime,'MM-dd-yyyy') as usa_format,
FORMAT(CreationTime,'dd-MM-yyyy') as european_format,
FORMAT(CreationTime,'dd') as dd,
FORMAT(CreationTime,'ddd') as ddd,
FORMAT(CreationTime,'dddd') as dddd,
FORMAT(CreationTime,'MM') as MM,
FORMAT(CreationTime,'MMM') as MMM,
FORMAT(CreationTime,'MMMM') as MMMM
FROM Sales.Orders

SELECT
'Day ' + FORMAT(CreationTime,'ddd MMM') + ' Q' +DATENAME(quarter,CreationTime) + ' '+ 
FORMAT(CreationTime,'yyyy hh:mm:ss tt')  as CustomeFormat
FROM Sales.Orders

--Format use case
SELECT 
Format(OrderDate,'MMM yy') as month,
COUNT(*) as no_of_order
FROM Sales.Orders
GROUP BY Format(OrderDate,'MMM yy')

--Convert
SELECT
CONVERT(Date,CreationTime) as [Datetime to Date],
CONVERT(VARCHAR,CreationTime,32) as [USA Std. Style:32],
CONVERT(VARCHAR,CreationTime,34) as [Euro Std. Style:34]
FROM Sales.Orders

--Cast
SELECT
CAST('123' as INT) as [String to INT],
CAST(123 as VARCHAR) as [INT to String],
CAST('2025-06-14' as DATE) as [String to Date],
CAST('2025-06-14' as datetime) as [String to Datetime],
CAST(CreationTime as date) as [datetime to date]
FROM Sales.Orders 



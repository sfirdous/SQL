use SalesDB


--Date Calculation Functions
SELECT 
OrderId,
OrderDate,
DATEADD(month,3,OrderDate) as Three_months_later,
DATEADD(year,2,OrderDate) as Two_years_later,
DATEADD(day,-10,OrderDate) as ten_days_before

FROM Sales.Orders

SELECT * FROM Sales.Employees
--Find Age of Employees
SELECT
EmployeeID,
Birthdate,
DATEDIFF(year,BirthDate,GETDATE()) as age
FROM Sales.Employees

--Find the average shipping duration in days for each month
SELECT 
DATENAME(month,OrderDate) as month,
AVG(DATEDIFF(day,OrderDate,ShipDate)) as avg_shipping_duration
FROM Sales.Orders
GROUP BY DATENAME(month,OrderDate)

--Find the number of days between each order and previous order
SELECT
OrderID,
OrderDate as CurrentOrder,
LAG(OrderDate) OVER (ORDER BY OrderDate) as PreviousOrder,
DATEDIFF(day,LAG(OrderDate) OVER (ORDER BY OrderDate),OrderDate) as diff_between_orders
FROM Sales.Orders


--Date Validation Function
SELECT 
ISDATE('123') DateCheck1,
ISDATE('2025-08-20') DateCheck2,
ISDATE('20-08-2025') DateCheck3

--usecase ISDATE()
SELECT
OrderDate,
ISDATE(OrderDate),
CASE WHEN ISDATE(OrderDate) = 1 THEN CAST(OrderDate AS DATE)
END NewOrderDate
FROM
(
SELECT '2025-08-20' AS OrderDate UNION
SELECT '2025-08-21' UNION
SELECT '2025-08-23' UNION
SELECT '2025-08'
)t
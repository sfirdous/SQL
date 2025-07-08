use SalesDB


--COUNT()
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

--SUM()
/*Find the total sales across all orders and the total sales for each product.Additionally, provide details such as order ID and other details*/
select 
OrderID,
OrderDate,
ProductID,
Sales,
SUM(Sales) OVER() as TotalSales,
SUM(Sales) OVER(Partition by ProductID) as ProductSales
from Sales.Orders


/**Find the percentage contribution of each products sales to the total sales**/
select 
OrderID,
ProductId,
Sales,
SUM(Sales) over() as TotalSales,
ROUND(SUM(cast(Sales as float)) over(partition by ProductID) / SUM(Sales) over() * 100 ,2)as ProductPer
from Sales.Orders

--AVG()
/*Find the avg sales across all orders
And Find the avg sales for each product
Additionally provide details such order Id,oder date*/
select
OrderId,
OrderDate,
ProductId,
Sales,
AVG(coalesce(Sales,0)) OVER() as Average,
AVG(coalesce(Sales,0)) OVER(partition by ProductID) as ProductAvg
from Sales.Orders

/*Find the average scores  of customers
Additionally provide details such CustomerID and LastName*/
select 
CustomerID,
LastName,
AVG(COALESCE(Score,0)) OVER() as AverageScore
from Sales.Customers

/*Find all orders where sales are higher than the avg sales acoss all orders*/
Select * FROM (
select
OrderID,
Sales,
AVG(Sales) OVER() as AvgSales
from Sales.Orders
)t
where sales > AvgSales

--MIN() ans MAX()
/*Find the highest and lowest sales of all orders
find the highest and lowest sales for each product
additionally provide details such order id,order date
*/
select
OrderID,
ProductID,
OrderDate,
Sales,
MIN(Sales) OVER() as min,
MAX(Sales) OVER() as max,
MIN(Sales) OVER(Partition by ProductId) as ProductMin,
MAx(Sales) OVER(Partition by ProductId) as ProductMAx
from Sales.Orders

/*Show the employees who have highest salaries*/
select * from(
select
EmployeeId,
FirstName,
Salary,
MAX(Salary) OVER() as HighestSalary
from Sales.Employees)t 
where  Salary = HighestSalary

select
OrderID,
ProductID,
OrderDate,
Sales,
MIN(Sales) OVER() as min,
MAX(Sales) OVER() as max,
Sales - MIN(Sales) OVER() as DeviationFromMin,
MAX(Sales) OVER() - Sales  as DeviationFromMax
from Sales.Orders

--Running and Rolling Total
/*Calculate the moving average of sales for each product over time*/
SELECT 
ProductID,
Sales,
AVG(Sales) OVER(partition by ProductID order by OrderDate) as MovingAvg
FROM Sales.Orders

SELECT 
ProductID,
Sales,
AVG(Sales) OVER(partition by ProductID order by OrderDate Rows between  current row and 1 following)  as AvgSalesOverTime
FROM Sales.Orders
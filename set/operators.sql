use SalesDB

--1.Union
SELECT 
FirstName,
LastName
FROM Sales.Customers
UNION
SELECT 
FirstName,
LastName
FROM Sales.Employees

SELECT 
CustomerID as ID,
LastName
FROM Sales.Customers
UNION
SELECT 
EmployeeID,
LastName as last_name
FROM Sales.Employees

/*Combine the data from employees and customers into one table*/
SELECT 
CustomerID as ID,
FirstName,
LastName
FROM Sales.Customers
UNION
SELECT 
EmployeeID,
FirstName,
LastName
FROM Sales.Employees

--2.Union ALL
/*Combine the data from employees and customers into one table*/
SELECT 
CustomerID as ID,
FirstName,
LastName
FROM Sales.Customers
UNION ALL
SELECT 
EmployeeID,
FirstName,
LastName
FROM Sales.Employees

--3.Except(minus)
/*Find employees who are not customers at the same time*/
SELECT 
EmployeeID as ID,
FirstName,
LastName
FROM Sales.Employees
EXCEPT
SELECT 
CustomerID ,
FirstName,
LastName
FROM Sales.Customers

--4.Intersect
--Find employees who are also customers
SELECT 
EmployeeID as ID,
FirstName,
LastName
FROM Sales.Employees
INTERSECT
SELECT 
CustomerID ,
FirstName,
LastName
FROM Sales.Customers

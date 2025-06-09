use SalesDB

SELECT * FROM Sales.Orders
SELECT * FROM Sales.Customers
SELECT * FROM Sales.Products
SELECT * FROM Sales.Employees

SELECT 
Sales.Orders.OrderID,
Sales.Customers.FirstName AS customer_name,
Sales.Products.Product,
Sales.Customers.Score,
Sales.Products.Price,
Sales.Employees.FirstName AS employee_name
FROM Sales.Orders
LEFT JOIN Sales.Customers ON Sales.Orders.CustomerID = Sales.Customers.CustomerID
LEFT JOIN Sales.Products ON Sales.Orders.ProductID = Sales.Products.ProductID
LEFT JOIN Sales.Employees ON Sales.Orders.SalesPersonID = Sales.Employees.EmployeeID




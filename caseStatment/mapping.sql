--MAPPING 
use SalesDB
/* TASK 2: 
   Retrieve employee details with gender displayed as full text 
*/

SELECT 
EmployeeID,
FirstName + ' ' + COALESCE(LastName,'') as FullName,
CASE 
	WHEN Gender = 'M' THEN 'Male'
	WHEN Gender = 'F' THEN 'Female'
	ELSE 'Not Available'
END Gender
FROM Sales.Employees

/* TASK 3: 
   Retrieve customer details with abbreviated country codes 
*/

SELECT 
CustomerID,
FirstName + ' ' + COALESCE(LastName,'') as FullName,
CASE 
	WHEN Country = 'Germany' THEN 'DE'
	WHEN Country = 'USA' THEN 'US'
	ELSE 'n/a'
END country_abbrevation
FROM Sales.Customers

--quick form

SELECT 
CustomerID,
FirstName + ' ' + COALESCE(LastName,'') as FullName,
CASE Country
	WHEN 'Germany' THEN 'DE'
	WHEN 'USA' THEN 'US'
	ELSE 'n/a'
END country_abbrevation
FROM Sales.Customers
use MyDatabase


--a.String manipulation
--1.concat : combines multiple strings into one
SELECT 
concat(first_name,' ',country) as name_country
FROM customers

--2.lower() and upper()
SELECT 
lower(first_name) as firstname
FROM customers

SELECT 
upper(first_name) as firstname
FROM customers

--3.Detect firstname that has leading or trailing space: trim()
SELECT
first_name
FROM customers
WHERE first_name != trim(first_name)

--4.replace()
SELECT
'123-456-7890' as phone,
replace('123-456-7890','-','') as clean_phone

--b.String calculation
--1.len()
SELECT
first_name,
len(first_name) as len_name
FROM customers

--c.String extraction
--1.left(value,no of chars) and right(value,no of chars)
SELECT
first_name,
left(trim(first_name),2) as first_two_chars,
right(trim(first_name),2) as last_two_chars
FROM customers

--2.Substring
SELECT
first_name,
substring(trim(first_name),2,len(trim(first_name)))
FROM customers

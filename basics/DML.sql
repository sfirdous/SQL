--INSERT INTO customers (id,first_name,country,score)
--VALUES 
--	(6,'Anna','USA',NULL),
--	(7,'Sam',NULL,100)

CREATE TABLE persons(
id INT NOT NULL, --name of col datatype constraint
person_name VARCHAR(50) NOT NULL,
birth_data DATE,
phone VARCHAR(10) NOT NULL,
CONSTRAINT pk_persons PRIMARY KEY (id)
)



INSERT INTO persons (id,person_name,birth_data,phone)
SELECT 
id,
first_name,
NULL,
'Unknown'
FROM customers

SELECT * FROM persons

UPDATE customers
SET score = 0
WHERE id = 6

INSERT INTO customers (id,first_name,country,score)
VALUES 
	(8,'Saraha',NULL,NULL),
	(9,'Andreas','Germany',NULL),
	(10,'Max','USA',NULL)

SELECT * FROM customers
WHERE id = 10	

UPDATE customers
SET
	score = 0,
	country = 'UK'
WHERE id = 10

SELECT * FROM customers
WHERE score is NULL

UPDATE customers
SET score = 0
WHERE score is NULL

DELETE FROM customers
WHERE id > 5

DELETE FROM persons
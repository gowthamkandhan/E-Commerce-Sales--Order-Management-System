--  SQL QUERIES
USE ECommerce_DB;
-- 1. SELECT
-- Retrieve all columns from a table

SELECT *
FROM Customers;

-- 2. DISTINCT
-- Retrieve unique values without duplicates

SELECT DISTINCT city
FROM Customers;

-- 3. WHERE
-- Filter records based on a condition

SELECT product_name, price
FROM Products
WHERE price > 10000;

-- 4. ORDER BY
-- Sort records in ascending or descending order

SELECT product_name, price
FROM Products
ORDER BY price DESC;

-- 5. LIMIT
-- Restrict the number of returned rows

SELECT *
FROM Customers
LIMIT 5;

-- 6. OFFSET
-- Skip the first 5 rows and display the next 5

SELECT *
FROM Products
ORDER BY product_id
LIMIT 5 OFFSET 5;


-- 7. ALIAS (AS)
-- Give temporary names to columns or tables

SELECT
    customer_name AS Customer_Name,
    city AS Location
FROM Customers;


-- 8. IN
-- Match values from a specified list

SELECT customer_name, city
FROM Customers
WHERE city IN ('Chennai', 'Bangalore', 'Madurai');


-- 9. BETWEEN
-- Filter records within a specified range

SELECT product_name, price
FROM Products
WHERE price BETWEEN 1000 AND 5000;


-- 10. LIKE
-- Search records using patterns
-- % = Zero or more characters
-- _ = Exactly one character

SELECT customer_name
FROM Customers
WHERE customer_name LIKE 'A%';


-- 11. IS NULL / IS NOT NULL
-- Check whether a column contains NULL values

SELECT *
FROM Payments
WHERE payment_date IS NOT NULL;


-- 12. AND / OR / NOT
-- Combine multiple conditions

SELECT product_name, price, category_id
FROM Products
WHERE category_id = 1
AND price > 20000;

-- =====================================================

-- =====================================================
-- PROJECT : E-COMMERCE SALES & ORDER MANAGEMENT SYSTEM
--  DATA MANAGEMENT & TRANSACTION CONTROL
-- =====================================================

USE ECommerce_DB;


-- Create a temporary table for Phase 4 practice
-- Main project tables will not be affected

DROP TABLE IF EXISTS Phase4_Demo;

CREATE TABLE Phase4_Demo (
    demo_id INT PRIMARY KEY AUTO_INCREMENT,
    item_name VARCHAR(50),
    amount DECIMAL(10,2)
);


-- 1. INSERT
INSERT INTO Phase4_Demo (item_name, amount)
VALUES ('Laptop', 55000);
-- 2. UPDATE
-- Modify an existing record
UPDATE Phase4_Demo
SET amount = 60000
WHERE demo_id = 1;
-- 3. DELETE
-- Remove a specific record
DELETE FROM Phase4_Demo
WHERE demo_id = 1;
-- 4. ALTER
-- Modify the table structure
ALTER TABLE Phase4_Demo
ADD item_status VARCHAR(20);
-- 5. COMMIT
-- Permanently save transaction changes
START TRANSACTION;
INSERT INTO Phase4_Demo (item_name, amount, item_status)
VALUES ('Keyboard', 1200, 'Available');
COMMIT;
-- 6. ROLLBACK
-- Cancel uncommitted transaction changes
START TRANSACTION;
UPDATE Phase4_Demo
SET amount = 1500
WHERE demo_id = 2;

ROLLBACK;


-- 7. SAVEPOINT
-- Create a checkpoint inside a transaction

START TRANSACTION;

INSERT INTO Phase4_Demo (item_name, amount, item_status)
VALUES ('Mouse', 650, 'Available');

SAVEPOINT sp1;

UPDATE Phase4_Demo
SET amount = 800
WHERE demo_id = 3;
ROLLBACK TO SAVEPOINT sp1;
COMMIT;

-- 8. TRUNCATE
-- Remove all records but keep the table structure

TRUNCATE TABLE Phase4_Demo;
-- 9. DROP
-- Permanently remove the table
DROP TABLE Phase4_Demo;
-- =====================================================



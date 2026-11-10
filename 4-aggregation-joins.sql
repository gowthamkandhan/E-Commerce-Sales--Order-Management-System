
-- =====================================================
-- AGGREGATE FUNCTIONS & GROUPING

USE ECommerce_DB;

-- 1. COUNT
-- Count total customers

SELECT COUNT(*) AS total_customers
FROM Customers;


-- 2. SUM
-- Calculate total sales amount

SELECT SUM(quantity * unit_price) AS total_sales
FROM Order_Details;


-- 3. AVG
-- Calculate average product price

SELECT AVG(price) AS average_price
FROM Products;


-- 4. MIN
-- Find minimum product price

SELECT MIN(price) AS minimum_price
FROM Products;


-- 5. MAX
-- Find maximum product price

SELECT MAX(price) AS maximum_price
FROM Products;


-- 6. GROUP BY
-- Calculate total sales for each order

SELECT
    order_id,
    SUM(quantity * unit_price) AS order_total
FROM Order_Details
GROUP BY order_id;


-- 7. HAVING
-- Display orders whose total amount is above 10000

SELECT
    order_id,
    SUM(quantity * unit_price) AS order_total
FROM Order_Details
GROUP BY order_id
HAVING SUM(quantity * unit_price) > 10000;

-- =====================================================

--  SQL JOINS
-- =====================================================

-- 1. INNER JOIN
-- Return matching records from both tables

SELECT
    c.customer_name,
    o.order_id,
    o.order_status
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id;


-- 2. LEFT JOIN
-- Return all customers and their matching orders

SELECT
    c.customer_name,
    o.order_id
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id;


-- 3. RIGHT JOIN
-- Return all orders and matching customer details

SELECT
    c.customer_name,
    o.order_id
FROM Customers c
RIGHT JOIN Orders o
ON c.customer_id = o.customer_id;


-- 4. FULL OUTER JOIN
-- MySQL does not directly support FULL OUTER JOIN
-- Use LEFT JOIN + RIGHT JOIN with UNION

SELECT
    c.customer_name,
    o.order_id
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id

UNION

SELECT
    c.customer_name,
    o.order_id
FROM Customers c
RIGHT JOIN Orders o
ON c.customer_id = o.customer_id;


-- 5. CROSS JOIN
-- Return every possible combination

SELECT
    c.customer_name,
    cat.category_name
FROM Customers c
CROSS JOIN Categories cat;


-- 6. SELF JOIN
-- Join a table with itself
-- Find customers living in the same city

SELECT
    c1.customer_name AS customer_1,
    c2.customer_name AS customer_2,
    c1.city
FROM Customers c1
INNER JOIN Customers c2
ON c1.city = c2.city
AND c1.customer_id < c2.customer_id;

-- =====================================================

USE ECommerce_DB;
-- view
CREATE OR REPLACE VIEW Delivered_Orders AS
SELECT order_id, customer_id, order_date
FROM Orders
WHERE order_status = 'Delivered';
-- ctas
CREATE TABLE Order_Summary AS
SELECT
    order_id,
    SUM(quantity * unit_price) AS total_amount
FROM Order_Details
GROUP BY order_id;

-- case expression
SELECT
    product_name,
    price,
    CASE
        WHEN price >= 10000 THEN 'Expensive'
        WHEN price >= 1000 THEN 'Medium'
        ELSE 'Low'
    END AS price_category
FROM Products;

-- temp table

CREATE TEMPORARY TABLE Temp_Order_Summary AS
SELECT
    order_id,
    SUM(quantity * unit_price) AS total_amount
FROM Order_Details
GROUP BY order_id;


-- index
CREATE INDEX idx_customer_city
ON Customers(city);

-- dcl



-- 1. CREATE USER

CREATE USER 'u1'@'localhost'
IDENTIFIED BY 'p1';

-- 2. GRANT

GRANT SELECT, INSERT
ON ecommerce_db.*
TO 'u1'@'localhost';


-- 3. CHECK PERMISSIONS

SHOW GRANTS FOR 'project_user'@'localhost';


-- 4. REVOKE
-- Remove INSERT permission

--  REVOKE INSERT
-- ON ECommerce_DB.*
-- FROM 'u1'@'localhost';


-- 5. DROP USER
-- Remove the user account

-- DROP USER 'u1'@'localhost';

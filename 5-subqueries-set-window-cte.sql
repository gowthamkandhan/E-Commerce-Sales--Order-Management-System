
-- =====================================================
-- SUBQUERIES & SET OPERATIONS

USE ECommerce_DB;

-- 1. SUBQUERY
-- Find products whose price is above average price

SELECT product_name, price
FROM Products
WHERE price > (
    SELECT AVG(price)
    FROM Products
);


-- 2. CORRELATED SUBQUERY
-- Find customers who have placed more than one order

SELECT
    c.customer_id,
    c.customer_name
FROM Customers c
WHERE (
    SELECT COUNT(*)
    FROM Orders o
    WHERE o.customer_id = c.customer_id
) > 1;


-- 3. EXISTS
-- Find customers who have placed at least one order

SELECT customer_name
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customer_id = c.customer_id
);


-- 4. NOT EXISTS
-- Find customers who have not placed any orders

SELECT customer_name
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customer_id = c.customer_id
);


-- 5. ANY
-- Find products priced higher than at least one clothing product

SELECT product_name, price
FROM Products
WHERE price > ANY (
    SELECT price
    FROM Products
    WHERE category_id = 2
);


-- 6. ALL
-- Find products priced higher than every clothing product

SELECT product_name, price
FROM Products
WHERE price > ALL (
    SELECT price
    FROM Products
    WHERE category_id = 2
);


-- 7. UNION
-- Combine customer names and product names
-- UNION removes duplicate values

SELECT customer_name AS name
FROM Customers

UNION

SELECT product_name AS name
FROM Products;


-- 8. UNION ALL
-- Combine results without removing duplicates

SELECT customer_name AS name
FROM Customers

UNION ALL

SELECT product_name AS name
FROM Products;

-- =====================================================
-- END OF PHASE 7
-- =====================================================


-- =====================================================
-- PHASE 8 : WINDOW FUNCTIONS

-- 1. ROW_NUMBER
-- Give a unique sequential number to each product

SELECT
    product_name,
    price,
    ROW_NUMBER() OVER (ORDER BY price DESC) AS row_num
FROM Products;


-- 2. RANK
-- Rank products based on price
-- Equal values receive the same rank, with gaps

SELECT
    product_name,
    price,
    RANK() OVER (ORDER BY price DESC) AS product_rank
FROM Products;


-- 3. DENSE_RANK
-- Rank products without gaps between equal ranks

SELECT
    product_name,
    price,
    DENSE_RANK() OVER (ORDER BY price DESC) AS product_rank
FROM Products;


-- 4. PARTITION BY
-- Rank products separately within each category

SELECT
    product_name,
    category_id,
    price,
    RANK() OVER (
        PARTITION BY category_id
        ORDER BY price DESC
    ) AS category_rank
FROM Products;


-- 5. LAG
-- Compare current order amount with previous order amount

SELECT
    order_id,
    order_total,
    LAG(order_total) OVER (ORDER BY order_id) AS previous_order_total
FROM (
    SELECT
        order_id,
        SUM(quantity * unit_price) AS order_total
    FROM Order_Details
    GROUP BY order_id
) AS order_summary;


-- 6. LEAD
-- Display the next order amount

SELECT
    order_id,
    order_total,
    LEAD(order_total) OVER (ORDER BY order_id) AS next_order_total
FROM (
    SELECT
        order_id,
        SUM(quantity * unit_price) AS order_total
    FROM Order_Details
    GROUP BY order_id
) AS order_summary;


-- 7. SUM() OVER()
-- Calculate running total of order amounts

SELECT
    order_id,
    order_total,
    SUM(order_total) OVER (
        ORDER BY order_id
    ) AS running_total
FROM (
    SELECT
        order_id,
        SUM(quantity * unit_price) AS order_total
    FROM Order_Details
    GROUP BY order_id
) AS order_summary;

-- =====================================================

-- =====================================================
--  CTE & RECURSIVE CTE


-- 1. CTE (Common Table Expression)
-- Create a temporary result set using WITH

WITH CustomerOrders AS (
    SELECT
        customer_id,
        COUNT(*) AS total_orders
    FROM Orders
    GROUP BY customer_id
)
SELECT
    customer_id,
    total_orders
FROM CustomerOrders;


-- 2. MULTIPLE CTE
-- Use more than one CTE in a single query

WITH
CustomerCount AS (
    SELECT COUNT(*) AS total_customers
    FROM Customers
),
ProductCount AS (
    SELECT COUNT(*) AS total_products
    FROM Products
)
SELECT
    CustomerCount.total_customers,
    ProductCount.total_products
FROM CustomerCount
CROSS JOIN ProductCount;


-- 3. RECURSIVE CTE
-- Generate numbers from 1 to 5

WITH RECURSIVE NumberSeries AS (
    SELECT 1 AS num

    UNION ALL

    SELECT num + 1
    FROM NumberSeries
    WHERE num < 5
)
SELECT num
FROM NumberSeries;

-- =====================================================



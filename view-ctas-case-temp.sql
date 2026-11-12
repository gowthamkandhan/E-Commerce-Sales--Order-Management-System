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
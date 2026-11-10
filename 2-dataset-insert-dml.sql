USE ECommerce_DB;

INSERT INTO Categories
(category_id, category_name)
VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Accessories'),
(4, 'Home Appliances'),
(5, 'Books');

SELECT * FROM Categories;

INSERT INTO Customers
(customer_id, customer_name, email, phone, city, created_at)
VALUES
(1, 'Arun Kumar', 'arun@gmail.com', '9876500001', 'Chennai', '2026-01-10'),
(2, 'Priya', 'priya@gmail.com', '9876500002', 'Pondicherry', '2026-01-12'),
(3, 'Rahul', 'rahul@gmail.com', '9876500003', 'Bangalore', '2026-01-15'),
(4, 'Karthik', 'karthik@gmail.com', '9876500004', 'Chennai', '2026-01-18'),
(5, 'Divya', 'divya@gmail.com', '9876500005', 'Coimbatore', '2026-01-20'),
(6, 'Vijay', 'vijay@gmail.com', '9876500006', 'Madurai', '2026-01-22'),
(7, 'Sneha', 'sneha@gmail.com', '9876500007', 'Chennai', '2026-01-25'),
(8, 'Ajith', 'ajith@gmail.com', '9876500008', 'Salem', '2026-01-28'),
(9, 'Meena', 'meena@gmail.com', '9876500009', 'Pondicherry', '2026-02-01'),
(10, 'Sanjay', 'sanjay@gmail.com', '9876500010', 'Bangalore', '2026-02-03'),
(11, 'Kavya', 'kavya@gmail.com', '9876500011', 'Chennai', '2026-02-05'),
(12, 'Praveen', 'praveen@gmail.com', '9876500012', 'Trichy', '2026-02-08'),
(13, 'Nithya', 'nithya@gmail.com', '9876500013', 'Coimbatore', '2026-02-10'),
(14, 'Manoj', 'manoj@gmail.com', '9876500014', 'Madurai', '2026-02-12'),
(15, 'Swathi', 'swathi@gmail.com', '9876500015', 'Chennai', '2026-02-15'),
(16, 'Dinesh', 'dinesh@gmail.com', '9876500016', 'Salem', '2026-02-18'),
(17, 'Harish', 'harish@gmail.com', '9876500017', 'Bangalore', '2026-02-20'),
(18, 'Anitha', 'anitha@gmail.com', '9876500018', 'Trichy', '2026-02-22'),
(19, 'Gokul', 'gokul@gmail.com', '9876500019', 'Chennai', '2026-02-25'),
(20, 'Lavanya', 'lavanya@gmail.com', '9876500020', 'Pondicherry', '2026-02-28');

SELECT * FROM Customers;

INSERT INTO Products
(product_id, product_name, category_id, price, stock_quantity)
VALUES
(101, 'Laptop', 1, 55000, 10),
(102, 'Smartphone', 1, 25000, 20),
(103, 'Monitor', 1, 12000, 15),

(104, 'T-Shirt', 2, 799, 50),
(105, 'Jeans', 2, 1499, 30),
(106, 'Shoes', 2, 2499, 25),

(107, 'Headphones', 3, 1500, 40),
(108, 'Keyboard', 3, 1200, 35),
(109, 'Mouse', 3, 650, 60),

(110, 'Mixer Grinder', 4, 3500, 15),
(111, 'Electric Kettle', 4, 1200, 20),
(112, 'Microwave Oven', 4, 8500, 8),

(113, 'SQL Basics Book', 5, 499, 40),
(114, 'Python Programming', 5, 699, 30),
(115, 'Data Analytics Book', 5, 899, 25);

SELECT * FROM Products;

INSERT INTO Orders
(order_id, customer_id, order_date, order_status)
VALUES
(1001, 1, '2026-10-01', 'Delivered'),
(1002, 2, '2026-10-02', 'Pending'),
(1003, 3, '2026-10-03', 'Shipped'),
(1004, 4, '2026-10-04', 'Delivered'),
(1005, 5, '2026-10-05', 'Cancelled'),
(1006, 1, '2026-10-06', 'Delivered'),
(1007, 6, '2026-10-07', 'Shipped'),
(1008, 7, '2026-10-08', 'Delivered'),
(1009, 8, '2026-10-09', 'Pending'),
(1010, 9, '2026-10-10', 'Delivered'),
(1011, 10, '2026-10-11', 'Shipped'),
(1012, 2, '2026-10-12', 'Cancelled'),
(1013, 11, '2026-10-13', 'Delivered'),
(1014, 12, '2026-10-14', 'Delivered'),
(1015, 13, '2026-10-15', 'Pending'),
(1016, 14, '2026-10-16', 'Delivered'),
(1017, 15, '2026-10-17', 'Shipped'),
(1018, 16, '2026-10-18', 'Delivered'),
(1019, 17, '2026-10-19', 'Pending'),
(1020, 18, '2026-10-20', 'Delivered'),
(1021, 3, '2026-10-21', 'Delivered'),
(1022, 4, '2026-10-22', 'Shipped'),
(1023, 5, '2026-10-23', 'Delivered'),
(1024, 6, '2026-10-24', 'Cancelled'),
(1025, 7, '2026-10-25', 'Delivered'),
(1026, 8, '2026-10-26', 'Shipped'),
(1027, 9, '2026-10-27', 'Delivered'),
(1028, 10, '2026-10-28', 'Pending'),
(1029, 11, '2026-10-29', 'Delivered'),
(1030, 12, '2026-10-30', 'Shipped');

SELECT * FROM Orders;

INSERT INTO Order_Details
(order_id, product_id, quantity, unit_price)
VALUES
-- Order 1001
(1001, 101, 1, 55000),
(1001, 107, 2, 1500),

-- Order 1002
(1002, 104, 3, 799),
(1002, 113, 1, 499),

-- Order 1003
(1003, 102, 1, 25000),
(1003, 109, 2, 650),

-- Order 1004
(1004, 106, 1, 2499),
(1004, 105, 1, 1499),

-- Order 1005
(1005, 111, 1, 1200),
(1005, 114, 2, 699),

-- Order 1006
(1006, 102, 1, 25000),
(1006, 108, 1, 1200),

-- Order 1007
(1007, 103, 1, 12000),
(1007, 109, 1, 650),

-- Order 1008
(1008, 104, 2, 799),
(1008, 106, 1, 2499),

-- Order 1009
(1009, 107, 1, 1500),
(1009, 113, 2, 499),

-- Order 1010
(1010, 110, 1, 3500),
(1010, 111, 1, 1200),

-- Order 1011
(1011, 102, 1, 25000),
(1011, 107, 1, 1500),

-- Order 1012
(1012, 105, 2, 1499),
(1012, 109, 1, 650),

-- Order 1013
(1013, 101, 1, 55000),
(1013, 115, 1, 899),

-- Order 1014
(1014, 103, 1, 12000),
(1014, 108, 1, 1200),

-- Order 1015
(1015, 115, 2, 899),
(1015, 114, 1, 699),

-- Order 1016
(1016, 108, 2, 1200),

-- Order 1017
(1017, 106, 1, 2499),

-- Order 1018
(1018, 109, 3, 650),

-- Order 1019
(1019, 112, 1, 8500),

-- Order 1020
(1020, 104, 1, 799),

-- Order 1021
(1021, 101, 1, 55000),

-- Order 1022
(1022, 107, 2, 1500),

-- Order 1023
(1023, 105, 1, 1499),

-- Order 1024
(1024, 102, 1, 25000),

-- Order 1025
(1025, 111, 2, 1200),

-- Order 1026
(1026, 113, 1, 499),

-- Order 1027
(1027, 110, 1, 3500),

-- Order 1028
(1028, 114, 1, 699),

-- Order 1029
(1029, 103, 1, 12000),

-- Order 1030
(1030, 115, 1, 899);

SELECT
    order_id,
    product_id,
    quantity,
    unit_price,
    quantity * unit_price AS total_price
FROM Order_Details;

-- payment table [ select method,case foringkey join used]

INSERT INTO Payments
(order_id, amount, payment_method, payment_status, payment_date)

SELECT
    o.order_id,

    SUM(od.quantity * od.unit_price) AS amount,

    CASE MOD(o.order_id, 3)
        WHEN 0 THEN 'UPI'
        WHEN 1 THEN 'Card'
        ELSE 'Cash'
    END AS payment_method,

    CASE
        WHEN o.order_status = 'Cancelled' THEN 'Refunded'
        WHEN o.order_id IN (1009, 1019) THEN 'Failed'
        WHEN o.order_status = 'Pending' THEN 'Pending'
        ELSE 'Success'
    END AS payment_status,

    o.order_date

FROM Orders o

INNER JOIN Order_Details od
    ON o.order_id = od.order_id

GROUP BY
    o.order_id,
    o.order_status,
    o.order_date;

select * from payments ;

SELECT 'Customers' AS table_name, COUNT(*) AS total_records
FROM Customers
UNION ALL
SELECT 'Categories', COUNT(*)
FROM Categories
UNION ALL
SELECT 'Products', COUNT(*)
FROM Products
UNION ALL
SELECT 'Orders', COUNT(*)
FROM Orders
UNION ALL
SELECT 'Order_Details', COUNT(*)
FROM Order_Details
UNION ALL
SELECT 'Payments', COUNT(*)
FROM Payments;
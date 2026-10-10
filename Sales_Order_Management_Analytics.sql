CREATE DATABASE sales_order_analytics;

USE sales_order_analytics;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    city VARCHAR(80),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(80),
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(30) NOT NULL,
    total_amount DECIMAL(12,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_date DATE,
    amount DECIMAL(12,2),
    payment_status VARCHAR(30),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


----- CUSTOMERS
INSERT INTO customers
(customer_id, name, email, city, signup_date)
VALUES
(1, 'Aarav Sharma', 'aarav.sharma@email.com', 'Delhi', '2025-01-15'),
(2, 'Priya Verma', 'priya.verma@email.com', 'Mumbai', '2025-02-10'),
(3, 'Rahul Gupta', 'rahul.gupta@email.com', 'Lucknow', '2025-02-22'),
(4, 'Ananya Singh', 'ananya.singh@email.com', 'Bangalore', '2025-03-05'),
(5, 'Rohan Mehta', 'rohan.mehta@email.com', 'Pune', '2025-03-18'),
(6, 'Sneha Kapoor', 'sneha.kapoor@email.com', 'Delhi', '2025-04-01'),
(7, 'Vikram Yadav', 'vikram.yadav@email.com', 'Noida', '2025-04-15'),
(8, 'Isha Malhotra', 'isha.malhotra@email.com', 'Jaipur', '2025-05-03'),
(9, 'Karan Arora', 'karan.arora@email.com', 'Chandigarh', '2025-05-20'),
(10, 'Neha Agarwal', 'neha.agarwal@email.com', 'Hyderabad', '2025-06-12'),
(11, 'Aditya Joshi', 'aditya.joshi@email.com', 'Mumbai', '2025-07-01'),
(12, 'Simran Kaur', 'simran.kaur@email.com', 'Amritsar', '2025-07-15'),
(13, 'Manish Kumar', 'manish.kumar@email.com', 'Kanpur', '2025-08-02'),
(14, 'Pooja Sharma', 'pooja.sharma@email.com', 'Gurgaon', '2025-08-20'),
(15, 'Nitin Bansal', 'nitin.bansal@email.com', 'Meerut', '2025-09-05');


------ PRODUCTS
INSERT INTO products
(product_id, product_name, category, price, stock)
VALUES
(101, 'Wireless Headphones', 'Electronics', 2499.00, 50),
(102, 'Bluetooth Speaker', 'Electronics', 1799.00, 40),
(103, 'Smart Watch', 'Electronics', 3499.00, 35),
(104, 'USB-C Charger', 'Accessories', 899.00, 80),
(105, 'Laptop Backpack', 'Bags', 1299.00, 60),
(106, 'Wireless Mouse', 'Accessories', 799.00, 70),
(107, 'Mechanical Keyboard', 'Accessories', 2499.00, 30),
(108, 'Running Shoes', 'Footwear', 2999.00, 45),
(109, 'Casual T-Shirt', 'Clothing', 999.00, 100),
(110, 'Denim Jeans', 'Clothing', 1999.00, 55),
(111, 'Smartphone Stand', 'Accessories', 599.00, 90),
(112, 'Power Bank', 'Electronics', 1599.00, 65);


------ ORDERS
INSERT INTO orders
(order_id, customer_id, order_date, status, total_amount)
VALUES
(1001, 1, '2025-01-20', 'COMPLETED', 4298.00),
(1002, 2, '2025-01-25', 'COMPLETED', 3499.00),
(1003, 3, '2025-02-05', 'COMPLETED', 2598.00),
(1004, 4, '2025-02-15', 'COMPLETED', 5498.00),
(1005, 5, '2025-03-01', 'COMPLETED', 1799.00),
(1006, 1, '2025-03-10', 'COMPLETED', 3798.00),
(1007, 6, '2025-03-18', 'COMPLETED', 2999.00),
(1008, 7, '2025-04-05', 'COMPLETED', 4398.00),
(1009, 8, '2025-04-20', 'CANCELLED', 2499.00),
(1010, 9, '2025-05-02', 'COMPLETED', 5098.00),
(1011, 10, '2025-05-15', 'COMPLETED', 2598.00),
(1012, 2, '2025-06-01', 'COMPLETED', 4798.00),
(1013, 11, '2025-06-12', 'COMPLETED', 1599.00),
(1014, 12, '2025-06-25', 'COMPLETED', 6998.00),
(1015, 3, '2025-07-05', 'COMPLETED', 2998.00),
(1016, 13, '2025-07-18', 'COMPLETED', 3398.00),
(1017, 14, '2025-08-03', 'COMPLETED', 2499.00),
(1018, 4, '2025-08-15', 'COMPLETED', 5997.00),
(1019, 5, '2025-09-01', 'COMPLETED', 3598.00),
(1020, 15, '2025-09-10', 'PENDING', 1999.00);


------ ORDER ITEMS
INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(1, 1001, 101, 1, 2499.00),
(2, 1001, 102, 1, 1799.00),

(3, 1002, 103, 1, 3499.00),

(4, 1003, 105, 2, 1299.00),

(5, 1004, 103, 1, 3499.00),
(6, 1004, 106, 1, 799.00),
(7, 1004, 111, 2, 599.00),

(8, 1005, 102, 1, 1799.00),

(9, 1006, 101, 1, 2499.00),
(10, 1006, 106, 1, 799.00),
(11, 1006, 111, 1, 500.00),

(12, 1007, 108, 1, 2999.00),

(13, 1008, 110, 1, 1999.00),
(14, 1008, 109, 1, 999.00),
(15, 1008, 105, 1, 1400.00),

(16, 1009, 101, 1, 2499.00),

(17, 1010, 107, 1, 2499.00),
(18, 1010, 105, 2, 1299.00),

(19, 1011, 104, 1, 899.00),
(20, 1011, 106, 1, 799.00),
(21, 1011, 111, 1, 900.00),

(22, 1012, 103, 1, 3499.00),
(23, 1012, 104, 1, 899.00),
(24, 1012, 106, 1, 400.00),

(25, 1013, 112, 1, 1599.00),

(26, 1014, 108, 1, 2999.00),
(27, 1014, 110, 1, 1999.00),
(28, 1014, 109, 2, 1000.00),

(29, 1015, 110, 1, 1999.00),
(30, 1015, 109, 1, 999.00),

(31, 1016, 101, 1, 2499.00),
(32, 1016, 104, 1, 899.00),

(33, 1017, 107, 1, 2499.00),

(34, 1018, 103, 1, 3499.00),
(35, 1018, 104, 1, 899.00),
(36, 1018, 106, 1, 799.00),
(37, 1018, 111, 1, 800.00),

(38, 1019, 102, 1, 1799.00),
(39, 1019, 109, 1, 999.00),
(40, 1019, 111, 1, 800.00),

(41, 1020, 110, 1, 1999.00);


------ PAYMENTS
INSERT INTO payments
(payment_id, order_id, payment_date, amount, payment_status)
VALUES
(501, 1001, '2025-01-20', 4298.00, 'PAID'),
(502, 1002, '2025-01-25', 3499.00, 'PAID'),
(503, 1003, '2025-02-05', 2598.00, 'PAID'),
(504, 1004, '2025-02-15', 5498.00, 'PAID'),
(505, 1005, '2025-03-01', 1799.00, 'PAID'),
(506, 1006, '2025-03-10', 3798.00, 'PAID'),
(507, 1007, '2025-03-18', 2999.00, 'PAID'),
(508, 1008, '2025-04-05', 4398.00, 'PAID'),
(509, 1009, '2025-04-20', 2499.00, 'REFUNDED'),
(510, 1010, '2025-05-02', 5098.00, 'PAID'),
(511, 1011, '2025-05-15', 2598.00, 'PAID'),
(512, 1012, '2025-06-01', 4798.00, 'PAID'),
(513, 1013, '2025-06-12', 1599.00, 'PAID'),
(514, 1014, '2025-06-25', 6998.00, 'PAID'),
(515, 1015, '2025-07-05', 2998.00, 'PAID'),
(516, 1016, '2025-07-18', 3398.00, 'PAID'),
(517, 1017, '2025-08-03', 2499.00, 'PAID'),
(518, 1018, '2025-08-15', 5997.00, 'PAID'),
(519, 1019, '2025-09-01', 3598.00, 'PAID'),
(520, 1020, '2025-09-10', 1999.00, 'PENDING');

SELECT COUNT(*) AS total_customers FROM customers;

SELECT COUNT(*) AS total_products FROM products;

SELECT COUNT(*) AS total_orders FROM orders;

SELECT COUNT(*) AS total_order_items FROM order_items;

SELECT COUNT(*) AS total_payments FROM payments;

INSERT INTO customers
(customer_id, name, email, city, signup_date)
VALUES
(16, 'Kavya Sharma', 'kavya.sharma@email.com', 'Delhi', '2025-09-15');

------- CRUDE OPERATIONS
----- CREATE
SELECT * 
FROM customers
WHERE customer_id = 16;

---- READ
SELECT *
FROM customers;

SELECT customer_id, name, city
FROM customers
ORDER BY name;

----- UPDATE
UPDATE customers
SET city = 'Noida'
WHERE customer_id = 16;

SELECT *
FROM customers
WHERE customer_id = 16;

----- DELETE
DELETE FROM customers
WHERE customer_id = 16;

SELECT *
FROM customers
WHERE customer_id = 16;

------- JOIN
---- INNER JOIN

SELECT
    o.order_id,
    o.order_date,
    p.product_name,
    p.category,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS item_revenue
FROM orders o
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
INNER JOIN products p
    ON oi.product_id = p.product_id
ORDER BY o.order_id;

------ MULTI-TABLE JOIN
SELECT
    c.name AS customer_name,
    c.city,
    o.order_id,
    o.order_date,
    o.total_amount,
    p.amount AS payment_amount,
    p.payment_status
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN payments p
    ON o.order_id = p.order_id
ORDER BY o.order_date;

----- LEFT JOIN
SELECT
    c.customer_id,
    c.name AS customer_name,
    c.city,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.name,
    c.city
ORDER BY total_orders DESC;

----- ANALYTICAL JOIN
SELECT
    c.customer_id,
    c.name AS customer_name,
    c.city,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.name,
    c.city
ORDER BY total_orders DESC;

------ BUSINESS ANALYTICS
---- TOTAL REVENUE
SELECT
    SUM(total_amount) AS total_revenue
FROM orders
WHERE status = 'COMPLETED';

----- TOTAL NUMBER OF ORDERS
SELECT
    COUNT(*) AS total_orders
FROM orders
WHERE status = 'COMPLETED';

---- AVERAGE ORDER VALUE 
SELECT
    AVG(total_amount) AS average_order_value
FROM orders
WHERE status = 'COMPLETED';

---- MINIMUM AND MAXIMUM ORDER VALUE 
SELECT
    MIN(total_amount) AS minimum_order_value,
    MAX(total_amount) AS maximum_order_value
FROM orders
WHERE status = 'COMPLETED';

---- REVENUE BY MONTH
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_amount) AS monthly_revenue
FROM orders
WHERE status = 'COMPLETED'
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    year,
    month;
    
---- ORDERS BY MONTH
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(*) AS total_orders
FROM orders
WHERE status = 'COMPLETED'
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    year,
    month;
    
---- REVENUE BY PRODUCT
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'COMPLETED'
GROUP BY
    p.product_id,
    p.product_name
ORDER BY revenue DESC;

---- TOP 5 PRODUCTS
SELECT
    p.product_name,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'COMPLETED'
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC
LIMIT 5;

---- REVENUE BY CATEGORY
SELECT
    p.category,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS category_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'COMPLETED'
GROUP BY p.category
ORDER BY category_revenue DESC;

---- CUSTOMER PERFORMANCE
SELECT
    c.customer_id,
    c.name AS customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_revenue,
    AVG(o.total_amount) AS average_order_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY
    c.customer_id,
    c.name
ORDER BY total_revenue DESC;

---- HAVING- CUSTOMER WITH MORE THAN ONE ORDER
SELECT
    c.customer_id,
    c.name AS customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY
    c.customer_id,
    c.name
HAVING COUNT(o.order_id) > 1
ORDER BY total_orders DESC;

---- PAYMENT STATUS ANALYSIS
SELECT
    payment_status,
    COUNT(*) AS number_of_payments,
    SUM(amount) AS total_amount
FROM payments
GROUP BY payment_status
ORDER BY total_amount DESC;

---- PRODUCTS SALES USING HAVING
SELECT
    p.product_name,
    SUM(oi.quantity) AS total_units_sold,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'COMPLETED'
GROUP BY
    p.product_id,
    p.product_name
HAVING SUM(oi.quantity) > 2
ORDER BY total_units_sold DESC;

---- OVERALL SALES STATISTICS
SELECT
    COUNT(*) AS total_completed_orders,
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS average_order_value,
    MIN(total_amount) AS minimum_order_value,
    MAX(total_amount) AS maximum_order_value
FROM orders
WHERE status = 'COMPLETED';

----- SUBQUERY- ORDER ABOVE AVERAGE
SELECT
    order_id,
    customer_id,
    order_date,
    total_amount
FROM orders
WHERE status = 'COMPLETED'
  AND total_amount > (
      SELECT AVG(total_amount)
      FROM orders
      WHERE status = 'COMPLETED'
  )
ORDER BY total_amount DESC;

------ SUBQUERY — CUSTOMERS SPENDING ABOVE AVERAGE
SELECT
    c.customer_id,
    c.name AS customer_name,
    SUM(o.total_amount) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY c.customer_id, c.name
HAVING SUM(o.total_amount) > (
    SELECT AVG(customer_revenue)
    FROM (
        SELECT
            customer_id,
            SUM(total_amount) AS customer_revenue
        FROM orders
        WHERE status = 'COMPLETED'
        GROUP BY customer_id
    ) AS customer_summary
)
ORDER BY total_revenue DESC;

---- SUBQUERY - MOST EXPENSIVE PRODUCT
SELECT
    product_id,
    product_name,
    category,
    price
FROM products
WHERE price = (
    SELECT MAX(price)
    FROM products
);

---- CTE- CUSTOMER REVENUE
WITH customer_revenue AS (
    SELECT
        c.customer_id,
        c.name AS customer_name,
        SUM(o.total_amount) AS total_revenue
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    WHERE o.status = 'COMPLETED'
    GROUP BY c.customer_id, c.name
)
SELECT *
FROM customer_revenue
ORDER BY total_revenue DESC;

---- CTE- MONTHLY REVENUE
WITH monthly_sales AS (
    SELECT
        YEAR(order_date) AS year,
        MONTH(order_date) AS month,
        SUM(total_amount) AS revenue
    FROM orders
    WHERE status = 'COMPLETED'
    GROUP BY
        YEAR(order_date),
        MONTH(order_date)
)
SELECT *
FROM monthly_sales
ORDER BY year, month;

---- CASE- CUSTOMER SEGMENTATION
SELECT
    c.customer_id,
    c.name AS customer_name,
    SUM(o.total_amount) AS total_revenue,

    CASE
        WHEN SUM(o.total_amount) >= 8000 THEN 'High Value'
        WHEN SUM(o.total_amount) >= 4000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment

FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id

WHERE o.status = 'COMPLETED'

GROUP BY
    c.customer_id,
    c.name

ORDER BY total_revenue DESC;

---- CASE- ORDER VALUE CLASSIFICATION
SELECT
    order_id,
    customer_id,
    total_amount,

    CASE
        WHEN total_amount >= 5000 THEN 'High Value Order'
        WHEN total_amount >= 3000 THEN 'Medium Value Order'
        ELSE 'Low Value Order'
    END AS order_category

FROM orders

WHERE status = 'COMPLETED'

ORDER BY total_amount DESC;

---- CASE- PAYMENT STATUS
SELECT
    payment_id,
    order_id,
    amount,
    payment_status,

    CASE
        WHEN payment_status = 'PAID' THEN 'Successful'
        WHEN payment_status = 'PENDING' THEN 'Awaiting Payment'
        WHEN payment_status = 'REFUNDED' THEN 'Refunded'
        ELSE 'Other'
    END AS payment_category

FROM payments;

----- WINDOW FUNCTIONS
--- RANK() - RANK CUSTOMERS BY REVENUE
SELECT
    c.customer_id,
    c.name AS customer_name,
    SUM(o.total_amount) AS total_revenue,

    RANK() OVER (
        ORDER BY SUM(o.total_amount) DESC
    ) AS revenue_rank

FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id

WHERE o.status = 'COMPLETED'

GROUP BY
    c.customer_id,
    c.name

ORDER BY revenue_rank;

----- DENSE_RANK() — Product Ranking
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS revenue,

    DENSE_RANK() OVER (
        ORDER BY SUM(oi.quantity * oi.unit_price) DESC
    ) AS product_rank

FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id

WHERE o.status = 'COMPLETED'

GROUP BY
    p.product_id,
    p.product_name

ORDER BY product_rank;

---- ROW_NUMBER() — Number Customer Orders
SELECT
    customer_id,
    order_id,
    order_date,
    total_amount,

    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS order_number

FROM orders

WHERE status = 'COMPLETED'

ORDER BY customer_id, order_date;

----- Running Total of Revenue
WITH monthly_sales AS (
    SELECT
        YEAR(order_date) AS year,
        MONTH(order_date) AS month,
        SUM(total_amount) AS monthly_revenue
    FROM orders
    WHERE status = 'COMPLETED'
    GROUP BY
        YEAR(order_date),
        MONTH(order_date)
)

SELECT
    year,
    month,
    monthly_revenue,

    SUM(monthly_revenue) OVER (
        ORDER BY year, month
    ) AS running_revenue

FROM monthly_sales

ORDER BY year, month;

---- Customer Running Revenue
SELECT
    customer_id,
    order_id,
    order_date,
    total_amount,

    SUM(total_amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS customer_running_revenue

FROM orders

WHERE status = 'COMPLETED'

ORDER BY customer_id, order_date;

---- Compare Each Order with Previous Order
SELECT
    customer_id,
    order_id,
    order_date,
    total_amount,

    LAG(total_amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS previous_order_amount

FROM orders

WHERE status = 'COMPLETED'

ORDER BY customer_id, order_date;

---- Difference Between Current and Previous Order
SELECT
    customer_id,
    order_id,
    order_date,
    total_amount,

    LAG(total_amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS previous_order_amount,

    total_amount -
    LAG(total_amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS difference_from_previous

FROM orders

WHERE status = 'COMPLETED'

ORDER BY customer_id, order_date;

---- Monthly Revenue with Previous Month
WITH monthly_sales AS (
    SELECT
        YEAR(order_date) AS year,
        MONTH(order_date) AS month,
        SUM(total_amount) AS revenue
    FROM orders
    WHERE status = 'COMPLETED'
    GROUP BY
        YEAR(order_date),
        MONTH(order_date)
)

SELECT
    year,
    month,
    revenue,

    LAG(revenue) OVER (
        ORDER BY year, month
    ) AS previous_month_revenue

FROM monthly_sales

ORDER BY year, month;

---- Month-over-Month Revenue Change
WITH monthly_sales AS (
    SELECT
        YEAR(order_date) AS year,
        MONTH(order_date) AS month,
        SUM(total_amount) AS revenue
    FROM orders
    WHERE status = 'COMPLETED'
    GROUP BY
        YEAR(order_date),
        MONTH(order_date)
),

monthly_comparison AS (
    SELECT
        year,
        month,
        revenue,

        LAG(revenue) OVER (
            ORDER BY year, month
        ) AS previous_month_revenue

    FROM monthly_sales
)

SELECT
    year,
    month,
    revenue,
    previous_month_revenue,

    revenue - previous_month_revenue AS revenue_change

FROM monthly_comparison

ORDER BY year, month;

---- Month-over-Month Percentage Change
WITH monthly_sales AS (
    SELECT
        YEAR(order_date) AS year,
        MONTH(order_date) AS month,
        SUM(total_amount) AS revenue
    FROM orders
    WHERE status = 'COMPLETED'
    GROUP BY
        YEAR(order_date),
        MONTH(order_date)
),

monthly_comparison AS (
    SELECT
        year,
        month,
        revenue,

        LAG(revenue) OVER (
            ORDER BY year, month
        ) AS previous_month_revenue

    FROM monthly_sales
)

SELECT
    year,
    month,
    revenue,
    previous_month_revenue,

    ROUND(
        ((revenue - previous_month_revenue)
        / previous_month_revenue) * 100,
        2
    ) AS mom_growth_percentage

FROM monthly_comparison

ORDER BY year, month;

----- REUSABLE REPORTING VIEWS 
---- CUSTOMER REVENUE VIEW
CREATE OR REPLACE VIEW vw_customer_revenue AS
SELECT
    c.customer_id,
    c.name AS customer_name,
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_revenue,
    AVG(o.total_amount) AS average_order_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY
    c.customer_id,
    c.name,
    c.city;
    
    --- TEST
    SELECT *
FROM vw_customer_revenue
ORDER BY total_revenue DESC;

---- PRODUCT PERFORMANCE VIEW
CREATE OR REPLACE VIEW vw_product_performance AS
SELECT
    p.product_id,
    p.product_name,
    p.category,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'COMPLETED'
GROUP BY
    p.product_id,
    p.product_name,
    p.category;
    
    --- TEST
    SELECT *
FROM vw_product_performance
ORDER BY revenue DESC;

SELECT *
FROM vw_product_performance
ORDER BY revenue DESC
LIMIT 5;

---- MONTHLY SALES VIEW
CREATE OR REPLACE VIEW vw_monthly_sales AS
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS monthly_revenue,
    AVG(total_amount) AS average_order_value
FROM orders
WHERE status = 'COMPLETED'
GROUP BY
    YEAR(order_date),
    MONTH(order_date);
    
    --- TEST
    SELECT *
FROM vw_monthly_sales
ORDER BY year, month;

---- ORDER AND PAYMENT DETAILS
CREATE OR REPLACE VIEW vw_order_payment_details AS
SELECT
    c.customer_id,
    c.name AS customer_name,
    c.city,
    o.order_id,
    o.order_date,
    o.status AS order_status,
    o.total_amount AS order_amount,
    p.payment_id,
    p.payment_date,
    p.amount AS payment_amount,
    p.payment_status
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN payments p
    ON o.order_id = p.order_id;
    
    --- TEST
    SELECT *
FROM vw_order_payment_details
ORDER BY order_date;

---- CHECK VIEWS
SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';

SHOW CREATE VIEW vw_customer_revenue;

----- INDEXES AND QUERY OPTIMIZATION
---- CHECK EXISTING INDEXES
SHOW INDEX FROM orders;

SHOW INDEX FROM order_items;

SHOW INDEX FROM payments;

---- CREATE USEFUL INDEXES
--- ORDER BY DATE
CREATE INDEX idx_orders_order_date
ON orders(order_date);

--- ORDER BY STATUS
CREATE INDEX idx_orders_status
ON orders(status);

--- ORDER ITEMS BY PRODUCT
CREATE INDEX idx_order_items_product_id
ON order_items(product_id);

--- PAYMENT BY STATUS
CREATE INDEX idx_payments_status
ON payments(payment_status);

---- CREATE A COMPOSITE INDEX
CREATE INDEX idx_orders_status_date
ON orders(status, order_date);

SELECT
    order_id,
    order_date,
    total_amount
FROM orders
WHERE status = 'COMPLETED'
AND order_date BETWEEN '2026-01-01' AND '2026-12-31';

---- USE EXPLAIN
EXPLAIN
SELECT
    order_id,
    order_date,
    total_amount
FROM orders
WHERE status = 'COMPLETED'
AND order_date BETWEEN '2026-01-01' AND '2026-12-31';

---- CHECK WHETHER INDEX IS BEING USED
EXPLAIN
SELECT *
FROM orders
WHERE status = 'COMPLETED';

EXPLAIN
SELECT *
FROM orders
WHERE status = 'COMPLETED'
AND order_date BETWEEN '2026-01-01' AND '2026-12-31';

---- CHECKING ALL INDEXES AFTER CREATION
SHOW INDEX FROM orders;

SHOW INDEX FROM order_items;

SHOW INDEX FROM payments;

----- TRANSACTIONS
---- STARTING A TRANSACTION
START TRANSACTION;

---- INSERTING TEMPORARY DATA
INSERT INTO customers
(customer_id, name, email, city, signup_date)
VALUES
(16, 'Test Customer', 'test.customer@example.com', 'Delhi', '2026-10-03');

SELECT *
FROM customers
WHERE customer_id = 16;

---- CREATING A SAVEPOINT
SAVEPOINT customer_insert;

---- UPDATING THE CUSTOMER
UPDATE customers
SET city = 'Noida'
WHERE customer_id = 16;

SELECT *
FROM customers
WHERE customer_id = 16;

---- ROLLBACK ENTIRE TRANSACTION
ROLLBACK;

SELECT *
FROM customers
WHERE customer_id = 16;

---- DEMONSTRATE COMMIT
START TRANSACTION;

INSERT INTO customers
(customer_id, name, email, city, signup_date)
VALUES
(17, 'Commit Test', 'commit.test@example.com', 'Meerut', '2026-10-03');

SELECT *
FROM customers
WHERE customer_id = 17;

COMMIT;

SELECT *
FROM customers
WHERE customer_id = 17;

---- CLEANUP THE TEST RECORD
DELETE FROM customers
WHERE customer_id = 17;

SELECT *
FROM customers
WHERE customer_id = 17;

----- FINAL BUSINESS REPORT & KEY INSIGHTS
---- OVERALL SALES SUMMARY
SELECT
    COUNT(*) AS total_completed_orders,
    SUM(total_amount) AS total_revenue,
    ROUND(AVG(total_amount), 2) AS average_order_value,
    MIN(total_amount) AS minimum_order_value,
    MAX(total_amount) AS maximum_order_value
FROM orders
WHERE status = 'COMPLETED';

---- MONTHLY SALES REPORT
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS monthly_revenue,
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM orders
WHERE status = 'COMPLETED'
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

---- TOP PRODUCTS REPORT 
SELECT
    p.product_id,
    p.product_name,
    p.category,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'COMPLETED'
GROUP BY
    p.product_id,
    p.product_name,
    p.category
ORDER BY revenue DESC
LIMIT 5;

---- CUSTOMER RANKING REPORT
SELECT
    c.customer_id,
    c.name AS customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(o.total_amount) DESC
    ) AS customer_rank
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'COMPLETED'
GROUP BY
    c.customer_id,
    c.name
ORDER BY customer_rank;

---- CATEGORY PERFORMANCE REPORT
SELECT
    p.category,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS category_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'COMPLETED'
GROUP BY p.category
ORDER BY category_revenue DESC;

---- PAYMENT ANALYSIS
SELECT
    payment_status,
    COUNT(*) AS number_of_payments,
    SUM(amount) AS total_amount
FROM payments
GROUP BY payment_status
ORDER BY total_amount DESC;

---- MONTH OVER MONTH REVENUE ANALYSIS
WITH monthly_sales AS (
    SELECT
        YEAR(order_date) AS year,
        MONTH(order_date) AS month,
        SUM(total_amount) AS revenue
    FROM orders
    WHERE status = 'COMPLETED'
    GROUP BY
        YEAR(order_date),
        MONTH(order_date)
),
monthly_comparison AS (
    SELECT
        year,
        month,
        revenue,
        LAG(revenue) OVER (
            ORDER BY year, month
        ) AS previous_month_revenue
    FROM monthly_sales
)
SELECT
    year,
    month,
    revenue,
    previous_month_revenue,
    ROUND(
        ((revenue - previous_month_revenue)
        / previous_month_revenue) * 100,
        2
    ) AS mom_growth_percentage
FROM monthly_comparison
ORDER BY year, month;


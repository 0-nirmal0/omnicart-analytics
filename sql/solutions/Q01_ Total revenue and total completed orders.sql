-- Q01: Total revenue and total completed orders
-- Tables: orders, order_items
-- Skills: JOINs, SUM, COUNT, filtering

-- Total revenue
SELECT 
    SUM(oi.unit_price * oi.quantity) AS total_revenue
FROM orders o
JOIN order_items oi 
ON o.order_id = oi.order_id
WHERE o.status = 'Completed';

-- total revenue = 439738902.99

-- Total completed orders
SELECT 
    COUNT(DISTINCT o.order_id) AS total_completed_orders
FROM orders o
WHERE o.status = 'Completed';

-- Total completed orders = 17074





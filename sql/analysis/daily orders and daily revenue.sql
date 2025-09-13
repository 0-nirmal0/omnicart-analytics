-- Daily Sales Trend
-- Returns daily orders and daily revenue

SELECT 
    DATE(o.order_date) AS order_day,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - COALESCE(oi.discount,0))), 2) AS revenue
FROM orders o
JOIN order_items oi USING(order_id)
GROUP BY DATE(o.order_date)
ORDER BY order_day;

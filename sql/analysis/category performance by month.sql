-- Category Performance (by Month)

SELECT 
    p.category,
    SUBSTR(o.order_date::text, 1, 7) AS month,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - COALESCE(oi.discount,0))), 2) AS revenue
FROM order_items oi
JOIN products p USING(product_id)
JOIN orders o USING(order_id)
GROUP BY p.category, SUBSTR(o.order_date::text, 1, 7)
ORDER BY month, revenue DESC;

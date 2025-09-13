-- Top Products & “revenue” Contribution
-- Top 10 products

SELECT 
    p.product_id,
    p.category,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - COALESCE(oi.discount,0))),2) AS revenue
FROM order_items oi
JOIN products p USING(product_id)
GROUP BY p.product_id, p.category
ORDER BY revenue DESC
LIMIT 10;

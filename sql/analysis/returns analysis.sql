-- Returns Analysis (returns by reason)

SELECT 
    reason,
    COUNT(*) AS total_returns,
    ROUND(SUM(refund_amount), 2) AS total_refunds
FROM returns
GROUP BY reason
ORDER BY total_returns DESC;

-- Return Rate
-- By Orders
SELECT 
    ROUND(
      COUNT(DISTINCT r.order_item_id)::numeric 
      / COUNT(DISTINCT oi.order_id), 2
    ) * 100 AS return_rate_percent
FROM order_items oi
LEFT JOIN returns r ON oi.order_item_id = r.order_item_id;
-- 14% of orders had at least one item returned.

-- By Items
SELECT 
    ROUND(
      COUNT(r.return_id)::numeric 
      / COUNT(oi.order_item_id), 2
    ) * 100 AS return_rate_percent
FROM order_items oi
LEFT JOIN returns r ON oi.order_item_id = r.order_item_id;
-- 6% of sold items were returned.

-- By Revenue
SELECT 
    ROUND(
      SUM(r.refund_amount) 
      / SUM(oi.quantity * oi.unit_price * (1 - COALESCE(oi.discount,0))) * 100,
      2
    ) AS return_rate_percent
FROM order_items oi
LEFT JOIN returns r ON oi.order_item_id = r.order_item_id;
-- 4.74% of revenue was refunded due to returns.
-- flag unrealistic values (negative prices, huge discounts, future dates)

-- zero or negative prices
SELECT * FROM order_items WHERE unit_price <= 0 LIMIT 20;

-- extreme discounts (>90%)
SELECT * FROM order_items WHERE discount > 0.9 LIMIT 20;

-- refunds > line revenue
SELECT r.* FROM returns r
JOIN order_items oi ON r.order_item_id = oi.order_item_id
WHERE r.refund_amount > (oi.quantity * oi.unit_price) LIMIT 20;

-- future dates
SELECT * FROM orders WHERE order_date > CURRENT_DATE LIMIT 20;
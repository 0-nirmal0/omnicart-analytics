-- find rows that reference missing parents (broken FKs)

-- order_items with missing product
SELECT oi.* FROM order_items oi
LEFT JOIN products p ON oi.product_id = p.product_id
WHERE p.product_id IS NULL LIMIT 20;

-- orders with missing customers
SELECT o.* FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL LIMIT 20;

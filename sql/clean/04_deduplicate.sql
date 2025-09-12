-- Duplicates & integrity

-- find duplicate order_id counts
SELECT order_id, COUNT(*) 
FROM orders 
GROUP BY order_id 
HAVING COUNT(*) > 1;


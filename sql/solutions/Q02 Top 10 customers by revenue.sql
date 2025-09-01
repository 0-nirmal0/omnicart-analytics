/* Q02: Top 10 customers by revenue
   Tables: orders, order_items
   Skills: GROUP BY, ORDER BY, JOINs
*/

SELECT 
    o.customer_id AS "Top 10 customers",
    SUM(oi.unit_price * oi.quantity) AS "Revenue"
FROM orders o
JOIN order_items oi 
    ON oi.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY o.customer_id
ORDER BY "Revenue" DESC
LIMIT 10;

/* Results: Top 10 customers and their revenue
"Customer_ID"   "Revenue"
--------------------------------
"C02156"        755499.91
"C01757"        530543.07
"C00986"        470359.11
"C02654"        418496.02
"C04810"        415205.95
"C01079"        412577.60
"C04715"        405207.96
"C05017"        400042.04
"C03024"        388566.73
"C02754"        385501.57
*/

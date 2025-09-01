/* Q04: Repeat vs one-time customers,
   Count customers with >1 completed order vs =1 order
   Table: orders
   Skills: COUNT, GROUP BY, CASE
*/

SELECT 
    CASE 
        WHEN order_count > 1 THEN 'Repeat'
        ELSE 'One-time'
    END AS customer_type,
    COUNT(*) AS customer_count
FROM (
    SELECT 
        customer_id,
        COUNT(order_id) AS order_count
    FROM orders
    WHERE status = 'Completed'
    GROUP BY customer_id
) AS customer_orders
GROUP BY 
    CASE 
        WHEN order_count > 1 THEN 'Repeat'
        ELSE 'One-time'
    END
ORDER BY customer_type;

-- Result
/* Customer_type | Customer_count
1. One time      | 1996   
2. Repeat        | 5074     
*/
/* Gross Merchandise Value (GMV) 
   & Average Order Value (AOV) */

-- Compute GMV (discount-adjusted revenue)
SELECT 
    ROUND(SUM(quantity * unit_price * (1 - COALESCE(discount, 0))), 2) AS gmv
FROM order_items;
-- Revenue = quantity * unit_price
-- GMV = sum of all line revenues (488207580.82)

-- Average Order Value (AOV) = GMV / number of orders
SELECT 
    ROUND(SUM(quantity * unit_price * (1 - COALESCE(discount,0))) 
	/ COUNT(DISTINCT order_id), 2) AS aov
FROM order_items;

-- Average Order Value (AOV) = 24410.38


   
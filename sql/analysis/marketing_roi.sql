-- Marketing ROI
/* Joins campaign spend with actual order revenue.
   Computes profit = revenue − spend.
   ROI = revenue / spend.
   Shows which campaigns are worth continuing. */

WITH revenue_by_campaign AS (
    SELECT 
        o.campaign_id,
        SUM(oi.quantity * oi.unit_price * (1 - COALESCE(oi.discount,0))) AS revenue
    FROM orders o
    JOIN order_items oi USING(order_id)
    GROUP BY o.campaign_id
)
SELECT 
    mc.campaign_id,
    mc.campaign_name,
    mc.channel,
    mc.spend,
    COALESCE(r.revenue, 0) AS revenue,
    ROUND(COALESCE(r.revenue, 0) - mc.spend, 2) AS profit,
    CASE WHEN mc.spend = 0 THEN NULL 
         ELSE ROUND(r.revenue / mc.spend, 2) END AS roi
FROM marketing_campaigns mc
LEFT JOIN revenue_by_campaign r USING(campaign_id)
ORDER BY roi DESC NULLS LAST;
   

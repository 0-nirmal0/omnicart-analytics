-- Returns Analysis (returns by reason)

SELECT 
    reason,
    COUNT(*) AS total_returns,
    ROUND(SUM(refund_amount), 2) AS total_refunds
FROM returns
GROUP BY reason
ORDER BY total_returns DESC;

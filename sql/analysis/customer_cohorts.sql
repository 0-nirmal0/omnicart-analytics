/*Customer Cohorts (Retention)
Finds each customer’s first order (cohort).
Assigns every later order to that cohort.
Counts active customers per cohort per month. */

WITH first_orders AS (
    SELECT 
        customer_id,
        MIN(DATE(order_date)) AS first_order_date
    FROM orders
    GROUP BY customer_id
),
orders_with_cohort AS (
    SELECT 
        o.customer_id,
        DATE(o.order_date) AS order_date,
        fo.first_order_date,
        TO_CHAR(fo.first_order_date, 'YYYY-MM') AS cohort_month,
        TO_CHAR(o.order_date, 'YYYY-MM') AS order_month
    FROM orders o
    JOIN first_orders fo USING(customer_id)
)
SELECT 
    cohort_month,
    order_month,
    COUNT(DISTINCT customer_id) AS active_customers
FROM orders_with_cohort
GROUP BY cohort_month, order_month
ORDER BY cohort_month, order_month;


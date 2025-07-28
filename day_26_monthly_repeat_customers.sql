--Day 26 Challenge: Show total orders per month only for repeat customers

WITH customer_order_counts AS (
  SELECT
    customer_id,
    COUNT(*) AS order_count
  FROM orders
  GROUP BY customer_id
  HAVING COUNT(*) > 1
),
repeat_customer_orders AS (
  SELECT o.*
  FROM orders o
  JOIN customer_order_counts rc ON o.customer_id = rc.customer_id
)
SELECT
  DATE_TRUNC('month', order_date) AS month,
  COUNT(*) AS total_repeat_orders
FROM repeat_customer_orders
GROUP BY month
ORDER BY month;

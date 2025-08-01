--Day 28 Challenge: Compare Monthly Performance of Sales Channels

WITH monthly_sales AS (
  SELECT
    DATE_TRUNC('month', order_date) AS order_month,
    channel,
    SUM(total_amount) AS monthly_sales
  FROM orders
  WHERE order_date BETWEEN '2025-04-01' AND '2025-06-30'
  GROUP BY order_month, channel
)
SELECT * FROM monthly_sales
ORDER BY order_month, channel;

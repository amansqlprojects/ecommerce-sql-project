--Day 26 Challenge: Calculate a 3-month moving average of total monthly sales

WITH monthly_sales AS (
  SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(oi.quantity * oi.item_price) AS total_sales
  FROM
    orders o
    JOIN order_items oi ON o.order_id = oi.order_id
  GROUP BY month
)
SELECT
  month,
  total_sales,
  ROUND(AVG(total_sales) OVER (
    ORDER BY month
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ), 2) AS moving_avg_3_months
FROM monthly_sales
ORDER BY month;

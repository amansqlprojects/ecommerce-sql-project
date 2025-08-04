--Day 29 Challenge: Prepare Monthly Revenue versus Target Analysis

WITH monthly_revenue AS (
  SELECT 
    DATE_TRUNC('month', order_date) AS month,
    SUM(total_amount) AS actual_revenue
  FROM orders
  GROUP BY month
),
comparison AS (
  SELECT 
    t.month,
    t.target_amount,
    r.actual_revenue,
    (r.actual_revenue - t.target_amount) AS variance
  FROM monthly_targets t
  LEFT JOIN monthly_revenue r ON t.month = r.month
)
SELECT * FROM comparison
ORDER BY month;

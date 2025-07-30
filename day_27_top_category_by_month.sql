--Day 27 Challenge: For each month, identify the top-performing product category by total sales

WITH monthly_category_sales AS (
  SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    p.category,
    SUM(oi.quantity * oi.item_price) AS total_sales
  FROM
    orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
  GROUP BY month, p.category
),
ranked_sales AS (
  SELECT
    *,
    RANK() OVER (PARTITION BY month ORDER BY total_sales DESC) AS rank
  FROM monthly_category_sales
)
SELECT
  month,
  category,
  total_sales
FROM ranked_sales
WHERE rank = 1
ORDER BY month;

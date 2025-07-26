--Day 25 Challenge: For each category, find the top 2 customers based on total spend

WITH customer_category_spend AS (
  SELECT
    c.customer_id,
    p.category,
    SUM(oi.quantity * oi.item_price) AS total_spent,
    RANK() OVER (PARTITION BY p.category ORDER BY SUM(oi.quantity * oi.item_price) DESC) AS rank
  FROM customers c
  JOIN orders o ON c.customer_id = o.customer_id
  JOIN order_items oi ON o.order_id = oi.order_id
  JOIN products p ON oi.product_id = p.product_id
  GROUP BY c.customer_id, p.category
)
SELECT *
FROM customer_category_spend
WHERE rank <= 2;

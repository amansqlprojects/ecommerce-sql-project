-- Day 16: Rank products in each category based on total revenue.

SELECT
  p.category,
  p.product_name,
  SUM(oi.quantity * oi.item_price) AS total_revenue,
  DENSE_RANK() OVER (PARTITION BY p.category ORDER BY SUM(oi.quantity * oi.item_price) DESC) AS revenue_rank
FROM
  products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category, p.product_name
ORDER BY p.category, revenue_rank;

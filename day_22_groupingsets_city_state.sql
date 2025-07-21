--Day 22 Challenge: Sales Summary by City and State

SELECT
  c.state,
  c.city,
  SUM(oi.quantity * oi.item_price) AS total_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY GROUPING SETS (
  (c.state),
  (c.city),
  ()
)
ORDER BY c.state NULLS LAST, c.city NULLS LAST;

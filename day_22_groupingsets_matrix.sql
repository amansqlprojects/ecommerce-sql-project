--Day 22 Challenge: Sales Matrix – (Category, State), (Category), (State), (Overall)

SELECT
  p.category,
  o.state,
  SUM(oi.quantity * oi.item_price) AS total_sales
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY GROUPING SETS (
  (p.category, o.state),
  (p.category),
  (o.state),
  ()
)
ORDER BY p.category NULLS LAST, o.state NULLS LAST;

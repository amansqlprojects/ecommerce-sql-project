-- Day 10 Challenge: Most Popular Product Category by State

SELECT
  o.state,
  p.category,
  SUM(oi.quantity) AS total_quantity_sold
FROM
  orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY
  o.state, p.category
ORDER BY
  o.state, total_quantity_sold DESC;

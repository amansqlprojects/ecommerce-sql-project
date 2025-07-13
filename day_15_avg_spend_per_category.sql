--Day 15 Challenge: For each category, calculate the average spending per order (based on item price × quantity)

SELECT
  p.category,
  ROUND(AVG(oi.quantity * oi.item_price), 2) AS avg_spend_per_order
FROM
  products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY
  p.category
ORDER BY
  avg_spend_per_order DESC;

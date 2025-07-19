--Day 21 Challenge: Show total sales by state and product category, including subtotals by state and overall grand total

SELECT
  o.state,
  p.category,
  SUM(oi.quantity * oi.item_price) AS total_sales
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY ROLLUP (o.state, p.category)
ORDER BY o.state NULLS LAST, p.category NULLS LAST;

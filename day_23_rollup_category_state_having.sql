--Day 23 Challenge: Find sales by category and state. Show only rows where subtotal or actual total is above ₹500.

SELECT 
  p.category,
  o.state,
  SUM(oi.quantity * oi.item_price) AS total_sales
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY ROLLUP (p.category, o.state)
HAVING SUM(oi.quantity * oi.item_price) > 500
ORDER BY p.category NULLS LAST, o.state NULLS LAST;

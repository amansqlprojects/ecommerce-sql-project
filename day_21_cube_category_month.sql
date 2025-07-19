--Day 21 Challenge: Show sales for each product category per month, including all subtotals across dimensions

SELECT
  p.category,
  DATE_TRUNC('month', o.order_date) AS order_month,
  SUM(oi.quantity * oi.item_price) AS total_sales
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY CUBE (p.category, DATE_TRUNC('month', o.order_date))
ORDER BY p.category NULLS LAST, order_month NULLS LAST;

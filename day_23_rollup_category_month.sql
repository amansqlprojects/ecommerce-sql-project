--Day 23 Challenge: Get the total sales per category and order month, along with subtotals and grand total using ROLLUP

SELECT 
  p.category,
  TO_CHAR(o.order_date, 'YYYY-MM') AS order_month,
  SUM(oi.quantity * oi.item_price) AS total_sales
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY ROLLUP (p.category, TO_CHAR(o.order_date, 'YYYY-MM'))
ORDER BY p.category NULLS LAST, order_month NULLS LAST;

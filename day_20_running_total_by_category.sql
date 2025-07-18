--Day 20 Challenge: For each category, calculate the running total of sales amount over time

SELECT
  p.category,
  o.order_date,
  SUM(oi.item_price * oi.quantity) AS day_sales,
  SUM(SUM(oi.item_price * oi.quantity)) OVER (
    PARTITION BY p.category
    ORDER BY o.order_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS running_total
FROM order_items oi
JOIN orders o ON o.order_id = oi.order_id
JOIN products p ON p.product_id = oi.product_id
GROUP BY p.category, o.order_date
ORDER BY p.category, o.order_date;

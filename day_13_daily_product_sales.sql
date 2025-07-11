--Day 13 Challenge: Analyze Total Quantity of Products Sold Per Day

SELECT
  o.order_date,
  SUM(oi.quantity) AS total_quantity_sold
FROM
  orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY
  o.order_date
ORDER BY
  o.order_date;

-- Day 6: Top 3 Most Popular Products by Quantity Sold

SELECT
  p.product_name,
  SUM(oi.quantity) AS total_quantity_sold
FROM
  order_items oi
JOIN
  products p ON oi.product_id = p.product_id
GROUP BY
  p.product_name
ORDER BY
  total_quantity_sold DESC
LIMIT 3;

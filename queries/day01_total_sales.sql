
SELECT
  p.category,
  SUM(oi.quantity * oi.item_price) AS total_sales
FROM
  order_items oi
JOIN
  products p ON oi.product_id = p.product_id
GROUP BY
  p.category
ORDER BY
  total_sales DESC;

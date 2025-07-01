-- Day 4 (Moderate) Challenge: Sales performance per Product

SELECT
  p.product_name,
  SUM(oi.quantity) AS total_quantity_sold,
  SUM(oi.quantity * oi.item_price) AS total_sales,
  COUNT(DISTINCT o.customer_id) AS unique_customers
FROM
  order_items oi
JOIN
  products p ON oi.product_id = p.product_id
JOIN
  orders o ON oi.order_id = o.order_id
GROUP BY
  p.product_name
ORDER BY
  total_sales DESC;

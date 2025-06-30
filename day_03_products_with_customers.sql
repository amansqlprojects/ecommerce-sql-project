Day 3 – List All Ordered Products with Customer Names
SELECT
  c.name AS customer_name,
  p.product_name,
  oi.quantity,
  o.order_date
FROM
  order_items oi
JOIN
  orders o ON oi.order_id = o.order_id
JOIN
  customers c ON o.customer_id = c.customer_id
JOIN
  products p ON oi.product_id = p.product_id
ORDER BY
  o.order_date, customer_name;

-- Day 6: Customers with more than 1 order
SELECT
  c.name AS customer_name,
  COUNT(o.order_id) AS total_orders
FROM
  customers c
JOIN
  orders o ON c.customer_id = o.customer_id
GROUP BY
  c.name
HAVING
  COUNT(o.order_id) > 1
ORDER BY
  total_orders DESC;


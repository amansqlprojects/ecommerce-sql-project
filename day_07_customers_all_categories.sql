-- Day 7: Customers who Ordered from all 3 Product Categories

SELECT
  c.customer_id,
  c.name AS customer_name,
  COUNT(DISTINCT p.category) AS categories_ordered
FROM
  customers c
JOIN
  orders o ON o.customer_id = c.customer_id
JOIN
  order_items oi ON o.order_id = oi.order_id
JOIN
  products p ON oi.product_id = p.product_id
GROUP BY
  c.customer_id, c.name
HAVING
  COUNT(DISTINCT p.category) = 3;

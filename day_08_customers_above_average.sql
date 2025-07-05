-- Day 08 Challenge: Customers with Orders Above Average Total Amount

SELECT DISTINCT
  c.customer_id,
  c.name AS customer_name
FROM
  customers c
JOIN
  orders o ON c.customer_id = o.customer_id
WHERE
  o.total_amount > (
    SELECT AVG(total_amount) FROM orders
  )
ORDER BY
  c.name;

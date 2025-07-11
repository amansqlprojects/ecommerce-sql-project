--Day 13 Challenge: Identify when each customer first placed an order

SELECT
  c.customer_id,
  c.name,
  MIN(o.order_date) AS first_order_date
FROM
  customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY
  c.customer_id, c.name
ORDER BY
  first_order_date;

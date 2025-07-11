--Day 13 Challenge: Find the first time (date) each customer placed an order

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

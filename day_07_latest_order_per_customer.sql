-- Day 7 Challenge: Latest Order per Customer

SELECT
  c.customer_id,
  c.name AS customer_name,
  o.order_id,
  o.order_date,
  o.total_amount
FROM
  customers c
JOIN
  orders o ON o.customer_id = c.customer_id
WHERE
  o.order_date = (
    SELECT MAX(o2.order_date)
    FROM orders o2
    WHERE o2.customer_id = c.customer_id
  )
ORDER BY
  o.order_date DESC;

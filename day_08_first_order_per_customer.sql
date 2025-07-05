-- 🗓️ Day 08 Challenge: First Order Per Customer (Using Subquery)

SELECT
  c.customer_id,
  c.name AS customer_name,
  o.order_id,
  o.order_date,
  o.total_amount
FROM
  customers c
JOIN
  orders o ON c.customer_id = o.customer_id
WHERE
  o.order_date = (
    SELECT MIN(o2.order_date)
    FROM orders o2
    WHERE o2.customer_id = c.customer_id
  )
ORDER BY
  o.order_date;

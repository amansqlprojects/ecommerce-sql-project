-- Day 3 Challenge: Display each order with the customer's name, order date, and total amount

SELECT
  o.order_id,
  c.name AS customer_name,
  o.order_date,
  o.total_amount
FROM
  orders o
JOIN
  customers c ON o.customer_id = c.customer_id
ORDER BY
  o.order_date;

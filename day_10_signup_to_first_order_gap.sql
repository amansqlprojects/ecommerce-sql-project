-- Day 10 Challenge: Days Between Signup and First Order (Simple Date Math)

SELECT
  c.customer_id,
  c.name AS customer_name,
  c.signup_date,
  MIN(o.order_date) AS first_order_date,
  MIN(o.order_date) - c.signup_date AS days_to_first_order
FROM
  customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY
  c.customer_id, c.name, c.signup_date
ORDER BY
  days_to_first_order DESC;

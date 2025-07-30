--Day 27 Challenge: For each customer, calculate their lifetime value (total spent) and the date of their first and last purchase

WITH customer_orders AS (
  SELECT
    c.customer_id,
    c.name,
    o.order_date,
    oi.quantity * oi.item_price AS order_value
  FROM
    customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
)
SELECT
  customer_id,
  name,
  SUM(order_value) AS lifetime_value,
  MIN(order_date) AS first_purchase,
  MAX(order_date) AS last_purchase
FROM customer_orders
GROUP BY customer_id, name
ORDER BY lifetime_value DESC;

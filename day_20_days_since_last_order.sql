--Day 20 Challenge: For each order, show how many days have passed since the previous order by that customer

SELECT
  customer_id,
  order_id,
  order_date,
  order_date - LAG(order_date) OVER (
    PARTITION BY customer_id
    ORDER BY order_date
  ) AS days_since_last_order
FROM orders
ORDER BY customer_id, order_date;

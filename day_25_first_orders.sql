--Day 25 Challenge: Find the first order date and amount for each customer

WITH first_order AS (
  SELECT
    customer_id,
    order_date,
    total_amount,
    RANK() OVER (PARTITION BY customer_id ORDER BY order_date) AS order_rank
  FROM orders
)
SELECT customer_id, order_date AS first_order_date, total_amount
FROM first_order
WHERE order_rank = 1;

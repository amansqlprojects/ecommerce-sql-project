-- Day 19 Challenge: For each customer, calculate the difference between their first and last order amount

SELECT
  customer_id,
  MAX(total_amount) - MIN(total_amount) AS diff_first_last_order
FROM (
  SELECT
    customer_id,
    order_date,
    total_amount,
    ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS row_asc,
    ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS row_desc
  FROM orders
) t
WHERE row_asc = 1 OR row_desc = 1
GROUP BY customer_id;

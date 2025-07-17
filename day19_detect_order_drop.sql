--Day 19 Challenge: For each order, compare it to the previous order by the same customer and flag a drop if the current order's amount is 30% less than the previous one

SELECT
  o.customer_id,
  o.order_id,
  o.order_date,
  o.total_amount,
  LAG(o.total_amount) OVER (
    PARTITION BY o.customer_id
    ORDER BY o.order_date
  ) AS previous_order_amount,
  CASE
    WHEN LAG(o.total_amount) OVER (PARTITION BY o.customer_id ORDER BY o.order_date) IS NOT NULL
         AND o.total_amount < 0.7 * LAG(o.total_amount) OVER (PARTITION BY o.customer_id ORDER BY o.order_date)
    THEN 'YES'
    ELSE 'NO'
  END AS is_sudden_drop
FROM orders o
ORDER BY o.customer_id, o.order_date;

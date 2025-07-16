-- Day 18 Challenge: Average of Last 3 Orders (Rolling Average)

SELECT
  o.order_id,
  o.order_date,
  o.total_amount,
  ROUND(AVG(o.total_amount) OVER (
    ORDER BY o.order_date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ), 2) AS avg_last_3_orders
FROM
  orders o
ORDER BY o.order_date;

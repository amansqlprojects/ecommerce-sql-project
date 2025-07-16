-- Day 18 Challenge: For each order, show the order amount and the running total of orders

SELECT
  o.order_id,
  o.order_date,
  o.total_amount,
  SUM(o.total_amount) OVER (
    ORDER BY o.order_date
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS running_total
FROM
  orders o
ORDER BY o.order_date;

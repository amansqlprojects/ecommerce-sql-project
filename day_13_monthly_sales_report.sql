--Day 13 Challenge: Monthly Sales Report (Get total orders and revenue grouped by month)

SELECT
  TO_CHAR(order_date, 'YYYY-MM') AS month,
  COUNT(order_id) AS total_orders,
  SUM(total_amount) AS total_revenue
FROM
  orders
GROUP BY
  TO_CHAR(order_date, 'YYYY-MM')
ORDER BY
  month;

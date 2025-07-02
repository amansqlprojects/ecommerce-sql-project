-- Day 5: Monthly Sales Summary

SELECT
  TO_CHAR(order_date, 'Month') AS month,
  COUNT(order_id) AS total_orders,
  SUM(total_amount) AS total_sales
FROM
  orders
GROUP BY
  TO_CHAR(order_date, 'Month'),
  DATE_PART('month', order_date)
ORDER BY
  DATE_PART('month', order_date);

-- Day 1 Challenge 2: Total Orders by Region

SELECT
  region,
  COUNT(order_id) AS total_orders
FROM
  sales
GROUP BY
  region
ORDER BY
  total_orders DESC;

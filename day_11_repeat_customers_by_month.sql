-- Day 11 Challenge: Customers with Multiple Orders in the Same Month

SELECT
  c.name AS customer_name,
  TO_CHAR(o.order_date, 'YYYY-MM') AS order_month,
  COUNT(o.order_id) AS orders_in_month
FROM
  customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY
  c.name, TO_CHAR(o.order_date, 'YYYY-MM')
HAVING COUNT(o.order_id) > 1
ORDER BY
  orders_in_month DESC;

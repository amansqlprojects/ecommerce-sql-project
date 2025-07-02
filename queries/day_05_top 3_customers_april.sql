-- Day 5 Challenge: Top 3 customers by sales in April

SELECT
  c.name AS customer_name,
  SUM(o.total_amount) AS april_sales
FROM
  orders o
JOIN
  customers c ON o.customer_id = c.customer_id
WHERE
  DATE_PART('month', o.order_date) = 4
GROUP BY
  c.name
ORDER BY
  april_sales DESC
LIMIT 3;

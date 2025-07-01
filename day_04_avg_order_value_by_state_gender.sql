-- Day 4 Challenge: Average Order Value by State and Gender

SELECT
  c.state,
  c.gender,
  ROUND(AVG(o.total_amount), 2) AS avg_order_value
FROM
  orders o
JOIN
  customers c ON o.customer_id = c.customer_id
GROUP BY
  c.state, c.gender
ORDER BY
  avg_order_value DESC;

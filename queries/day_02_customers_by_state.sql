-- Day 2 Challenge: Count customers from each state

SELECT
  state,
  COUNT(*) AS customer_count
FROM
  customers
GROUP BY
  state
ORDER BY
  customer_count DESC;

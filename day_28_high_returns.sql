--Day 28 Challenge: Identify Customers where Total Return > ₹5000

WITH customer_returns AS (
  SELECT o.customer_id, SUM(r.return_amount) AS total_return
  FROM returns r
  JOIN orders o ON r.order_id = o.order_id
  GROUP BY o.customer_id
)
SELECT *
FROM customer_returns
WHERE total_return > 5000
ORDER BY total_return DESC;

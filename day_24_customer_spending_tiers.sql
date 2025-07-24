--Day 24 Challenge: Classify each customer as Platinum, Gold, Silver, or Bronze based on total spending

SELECT
  c.customer_id,
  c.name,
  SUM(o.total_amount) AS total_spent,
  CASE 
    WHEN SUM(o.total_amount) >= 10000 THEN 'Platinum'
    WHEN SUM(o.total_amount) >= 5000 THEN 'Gold'
    WHEN SUM(o.total_amount) >= 2000 THEN 'Silver'
    ELSE 'Bronze'
  END AS customer_tier
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;

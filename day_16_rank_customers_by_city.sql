-- Day 16: Rank Customers by Spending in Each City

SELECT
  c.city,
  c.customer_id,
  c.name,
  SUM(o.total_amount) AS total_spent,
  RANK() OVER (PARTITION BY c.city ORDER BY SUM(o.total_amount) DESC) AS city_rank
FROM
  customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city, c.customer_id, c.name
ORDER BY c.city, city_rank;

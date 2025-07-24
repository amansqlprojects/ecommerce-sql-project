--Day 24 Challenge: Group customers into age bands (e.g., <18, 18–35, 36–50, >50) and show total sales from each

SELECT
  CASE
    WHEN c.age < 18 THEN '<18'
    WHEN c.age BETWEEN 18 AND 35 THEN '18-35'
    WHEN c.age BETWEEN 36 AND 50 THEN '36-50'
    ELSE '>50'
  END AS age_band,
  SUM(o.total_amount) AS total_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY age_band
ORDER BY age_band;

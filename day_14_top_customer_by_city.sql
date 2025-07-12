--Day 14 Challenge: Find the customer with the highest total order value from each city

SELECT
  c.customer_id,
  c.name,
  c.city,
  SUM(o.total_amount) AS total_spent
FROM
  customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY
  c.customer_id, c.name, c.city
HAVING
  SUM(o.total_amount) = (
    SELECT
      MAX(total_by_customer)
    FROM (
      SELECT
        c2.city,
        c2.customer_id,
        SUM(o2.total_amount) AS total_by_customer
      FROM
        customers c2
      JOIN orders o2 ON c2.customer_id = o2.customer_id
      WHERE c2.city = c.city
      GROUP BY c2.customer_id, c2.city
    ) sub
  )
ORDER BY c.city;

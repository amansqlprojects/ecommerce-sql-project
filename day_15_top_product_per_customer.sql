--Day 15 Challenge: List each customer and the product they ordered the most times

SELECT
  c.customer_id,
  c.name,
  p.product_name,
  SUM(oi.quantity) AS total_quantity
FROM
  customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY
  c.customer_id, c.name, p.product_name
HAVING
  SUM(oi.quantity) = (
    SELECT
      MAX(sub.total_quantity)
    FROM (
      SELECT
        oi2.product_id,
        SUM(oi2.quantity) AS total_quantity
      FROM
        orders o2
      JOIN order_items oi2 ON o2.order_id = oi2.order_id
      WHERE o2.customer_id = c.customer_id
      GROUP BY oi2.product_id
    ) sub
  )
ORDER BY c.customer_id;

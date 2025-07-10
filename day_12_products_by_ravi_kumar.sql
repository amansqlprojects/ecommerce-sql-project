--Day 12 Challenge: Products Ordered by a Specific Customer (e.g., 'Ravi Kumar')

SELECT
  product_name
FROM
  products
WHERE
  product_id IN (
    SELECT
      oi.product_id
    FROM
      order_items oi
    JOIN orders o ON oi.order_id = o.order_id
    JOIN customers c ON o.customer_id = c.customer_id
    WHERE
      c.name = 'Ravi Kumar'
  );

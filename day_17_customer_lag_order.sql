-- Day 17: Rank Customers by Spending in Each City

SELECT
  c.customer_id,
  c.name,
  o.order_id,
  o.order_date,
  o.total_amount,
  LAG(o.total_amount) OVER (
    PARTITION BY c.customer_id ORDER BY o.order_date
  ) AS previous_order_amount
FROM
  customers c
JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_id, o.order_date;

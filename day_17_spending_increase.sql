-- Day 17: List customer orders where the current order is higher than the previous one

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
QUALIFY
  o.total_amount > LAG(o.total_amount) OVER (
    PARTITION BY c.customer_id ORDER BY o.order_date
  )
ORDER BY c.customer_id, o.order_date;

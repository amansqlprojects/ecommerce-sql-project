-- Day 17: List customer orders where the current order is higher than the previous one

SELECT *
FROM (
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
) AS sub
WHERE sub.total_amount > sub.previous_order_amount
ORDER BY sub.customer_id, sub.order_date;

-- Day 11 Challenge: Products Sold in Multiple Orders

SELECT
  p.product_id,
  p.product_name,
  COUNT(o.order_id) AS no_of_orders
FROM
  products p
INNER JOIN order_items o ON p.product_id = o.product_id
GROUP BY
  p.product_id, p.product_name
HAVING
  COUNT(o.order_id) > 2
ORDER BY
  COUNT(o.order_id) DESC;

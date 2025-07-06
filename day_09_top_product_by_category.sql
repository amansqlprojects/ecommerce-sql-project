Day 09 - : Top Product by Revenue Per Category

SELECT
  category,
  product_name,
  total_revenue
FROM (
  SELECT
    p.category,
    p.product_name,
    SUM(oi.quantity * oi.item_price) AS total_revenue,
    RANK() OVER (
      PARTITION BY p.category
      ORDER BY SUM(oi.quantity * oi.item_price) DESC
    ) AS rnk
  FROM products p
  JOIN order_items oi ON p.product_id = oi.product_id
  GROUP BY p.category, p.product_name
) ranked
WHERE rnk = 1
ORDER BY category;

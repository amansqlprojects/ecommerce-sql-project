--Day 14 Challenge: List all products from the catalog that have never been sold

SELECT
  product_id,
  product_name,
  category
FROM
  products
WHERE
  product_id NOT IN (
    SELECT DISTINCT product_id FROM order_items
  );

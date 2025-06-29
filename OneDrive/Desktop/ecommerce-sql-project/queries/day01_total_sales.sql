
-- Day 01: Total Sales by Product Category
SELECT 
  product_category,
  SUM(amount) AS total_sales
FROM sales
GROUP BY product_category
ORDER BY total_sales DESC;

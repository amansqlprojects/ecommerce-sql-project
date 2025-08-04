--Day 29 Challenge: Number of Customers who Browsed but never Placed an Order

WITH browsing_only AS (
  SELECT DISTINCT ca.customer_id
  FROM customer_activity ca
  WHERE activity_type = 'browsed'
    AND ca.customer_id NOT IN (SELECT DISTINCT customer_id FROM orders)
)
SELECT COUNT(*) AS abandoned_customers
FROM browsing_only;

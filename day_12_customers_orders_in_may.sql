-- Day 12 Challenge: Customers Who Placed Orders in May (SUBQUERY)

SELECT
  name
FROM
  customers
WHERE
  customer_id IN (
    SELECT
      customer_id
    FROM
      orders
    WHERE
      EXTRACT(MONTH FROM order_date) = 5
  );

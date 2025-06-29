-- Day 2: Recently Signed-Up Customers 
SELECT
  name,
  signup_date
FROM
  customers
WHERE
  signup_date > '2023-03-01'
ORDER BY
  signup_date DESC;


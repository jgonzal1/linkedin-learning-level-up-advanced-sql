-- Create a report showing sales per month and an annual total
-- Get the needed data
SELECT strftime('%Y', soldDate) AS soldYear,
  strftime('%m', soldDate) AS soldMonth,
  salesAmount
FROM sales
ORDER BY soldYear,
  soldMonth;
-- Apply the grouping
SELECT strftime('%Y', soldDate) AS soldYear,
  strftime('%m', soldDate) AS soldMonth,
  SUM(salesAmount) AS salesAmount
FROM sales
GROUP BY soldYear,
  soldMonth
ORDER BY soldYear,
  soldMonth;
-- Add the window function - simplify with cte
WITH cte_sales AS (
  SELECT strftime('%Y', soldDate) AS soldYear,
    strftime('%m', soldDate) AS soldMonth,
    SUM(salesAmount) AS salesAmount
  FROM sales
  GROUP BY soldYear,
    soldMonth
)
SELECT soldYear,
  soldMonth,
  salesAmount,
  SUM(salesAmount) OVER (
    PARTITION BY soldYear
    ORDER BY soldYear,
      soldMonth
  ) AS annualSalesRunningTotal
FROM cte_sales
ORDER BY soldYear,
  soldMonth;
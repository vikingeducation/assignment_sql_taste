-- The count of days when Apple traded in a range that was larger than $5
SELECT
  COUNT(*) AS number_of_days
FROM tutorial.aapl_historical_stock_price
WHERE open > 5

-- The highest daily trading range that Apple stock achieved in 2012
SELECT
  MAX(close - open) AS highest_trading_range
FROM tutorial.aapl_historical_stock_price
WHERE year = 2012

-- The average price for all days when Apple's trading volume exceeded 10,000,000 shares.
SELECT
  AVG(close) AS average_price
FROM tutorial.aapl_historical_stock_price
WHERE volume > 10000000

-- The number of trading days in each month of the year 2012
SELECT
  month,
  COUNT(*) AS trading_days
FROM tutorial.aapl_historical_stock_price
WHERE year = 2012
GROUP BY month
ORDER BY 1

-- The maximum price Apple traded at during each year of the data set
SELECT
  year,
  MAX(close)
FROM tutorial.aapl_historical_stock_price
GROUP BY year
ORDER BY 1

-- The average price and trading volume on each calendar month across the
-- full data set (this should return only 12 rows, one for each month!)
SELECT
  month,
  AVG(close) AS avg_price,
  AVG(volume) AS avg_volume
FROM tutorial.aapl_historical_stock_price
GROUP BY month
ORDER BY 1

-- The average price for each month and year of data since 2008, ordered by
-- years descending and months ascending.
SELECT
  year,
  month,
  AVG(close) AS avg_price
FROM tutorial.aapl_historical_stock_price
GROUP BY year, month
ORDER BY 1 DESC, 2

-- The average price of days with a trading volume above 25,000,000 shares
-- (just 1 row)
SELECT
  AVG(close) AS avg_price
FROM tutorial.aapl_historical_stock_price
WHERE volume > 25000000

-- The average price on all months with an average daily trading volume above
-- 10,000,000 shares.
SELECT
  month,
  AVG(close) AS avg_price
FROM tutorial.aapl_historical_stock_price
WHERE volume > 10000000
GROUP BY month
ORDER BY 1

-- The lowest and highest prices that Apple stock achieved between 2005 and
-- 2010 (inclusive).
SELECT
  MIN(close) AS lowest_price,
  MAX(close) AS highest_price
FROM tutorial.aapl_historical_stock_price
WHERE year BETWEEN 2005 AND 2010

-- The average daily trading range in months where the stock moved more than
-- $25 (open of month to close of month)


-- All months in the second half of the year where average daily trading
-- volume was below 10,000,000.
SELECT
  month,
  AVG(volume) AS avg_daily_trading
FROM tutorial.aapl_historical_stock_price
WHERE
  month > 6
GROUP BY month
HAVING AVG(volume) < 10000000
ORDER BY 1

-- A list of all calendar months by average daily trading volume (so only 12
-- rows), sorted from highest to lowest.
SELECT
  month,
  AVG(volume) AS avg_daily_trading
FROM tutorial.aapl_historical_stock_price
GROUP BY month
ORDER BY 2 DESC

-- Count how many unique months there are in the data set (should equal 12)
SELECT COUNT(DISTINCT month)
FROM tutorial.aapl_historical_stock_price

-- Count how many unique years there are in the data set
SELECT COUNT(DISTINCT year)
FROM tutorial.aapl_historical_stock_price

-- Count how many unique prices there are in the data set
SELECT COUNT(DISTINCT open)
FROM tutorial.aapl_historical_stock_price

-- Return the percentage of unique "open" prices compared to all open prices
-- in the data set
SELECT (COUNT(DISTINCT open)*100) / COUNT(open)
FROM tutorial.aapl_historical_stock_price

-- A listing of all months by their average daily trading volume and a
-- classification that puts this volume into the following categories:
-- "Low" = below 10MM, "Medium" = 10-25 MM, "High" = above 25MM
SELECT
  month,
  CASE WHEN AVG(volume) < 10000000 THEN 'Low'
       WHEN AVG(volume) < 25000000 THEN 'Medium'
       ELSE 'High' END AS avg_trading_volume
FROM tutorial.aapl_historical_stock_price
GROUP BY month
ORDER BY 1

-- A listing of average monthly price plus which quarter of the year they
-- are in (e.g. "Q2" or "Q4").
SELECT
  month,
  AVG(open) AS avg_price,
  CASE WHEN month < 4 THEN 'Q1'
       WHEN month < 7 THEN 'Q2'
       WHEN month < 10 THEN 'Q3'
       ELSE 'Q4' END AS quarter
FROM tutorial.aapl_historical_stock_price
GROUP BY month
ORDER BY 1


-- This same listing filtered for only Q4 (use the new column not the months explicitly as part of this filtering).

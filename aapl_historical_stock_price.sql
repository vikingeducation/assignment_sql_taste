-- For use in this tutorial: https://modeanalytics.com/editor/lortz/reports/8c1368005d61
/* columns: date, year, month #, open, close, high, low, volume, id */

-- The count of days when Apple traded in a range that was larger than $5
SELECT COUNT(high)
  FROM tutorial.aapl_historical_stock_price
  WHERE high > 5

-- The highest daily trading range that Apple stock achieved in 2012
SELECT MAX(high - low) AS range_max
  FROM tutorial.aapl_historical_stock_price
  WHERE year = 2012

-- The average price for all days when Apple's trading volume exceeded 10,000,000 shares.
SELECT AVG(close)
  FROM tutorial.aapl_historical_stock_price
  WHERE volume > 10000000


-- The number of trading days in each month of the year 2012
SELECT month, COUNT(date) AS "trading days"
  FROM tutorial.aapl_historical_stock_price
  WHERE year = 2012
  GROUP BY month
  ORDER BY month

-- The maximum price Apple traded at during each year of the data set
SELECT year, MAX(high) AS "max high"
  FROM tutorial.aapl_historical_stock_price
  GROUP BY year
  ORDER BY year

-- The average price and trading volume on each calendar month across the full data set (this should return only 12 rows, one for each month!)
SELECT month, AVG(close) AS "avg close", AVG(volume) AS "avg volume"
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month
  ORDER BY month

-- The average price for each month and year of data since 2008, ordered by years descending and months ascending.
SELECT year, month, AVG(close) AS "avg price"
  FROM tutorial.aapl_historical_stock_price
  GROUP BY year, month
  ORDER BY year DESC, month ASC

-- The average price of days with a trading volume above 25,000,000 shares (just 1 row)
SELECT  AVG(close) AS "avg price"
  FROM tutorial.aapl_historical_stock_price
  WHERE volume > 25000000

-- The average price on all months with an average daily trading volume above 10,000,000 shares.
SELECT  month, AVG(close) AS "avg price"
  FROM tutorial.aapl_historical_stock_price
  WHERE volume > 25000000
  GROUP BY month
  ORDER BY month ASC

-- The lowest and highest prices that Apple stock achieved between 2005 and 2010 (inclusive).
SELECT  year, MAX(close) AS "max price", MIN(close) AS "min price"
  FROM tutorial.aapl_historical_stock_price
  WHERE year BETWEEN 2005 AND 2010
  GROUP BY year
  ORDER BY year ASC

-- The average daily trading range in months where the stock moved more than $25 (open of month to close of month)

SELECT year, month, AVG(high - low) AS range_avg
  FROM tutorial.aapl_historical_stock_price
  WHERE (open - close) > 25
    OR (close - open) > 25
  GROUP BY year, month
  ORDER BY year, month

-- All months in the second half of the year where average daily trading volume was below 10,000,000.
SELECT  *
  FROM tutorial.aapl_historical_stock_price
  WHERE month > 6
  AND volume < 10000000
  ORDER BY month

-- A list of all calendar months by average daily trading volume (so only 12 rows), sorted from highest to lowest.
SELECT month, AVG(volume) AS "avg volume"
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month
  ORDER BY AVG(volume) DESC

-- Count how many unique months there are in the data set (should equal 12)
SELECT COUNT(DISTINCT month)
  FROM tutorial.aapl_historical_stock_price

-- Count how many unique years there are in the data set
SELECT COUNT(DISTINCT year)
  FROM tutorial.aapl_historical_stock_price

-- Count how many unique prices there are in the data set
SELECT COUNT(DISTINCT close)
  FROM tutorial.aapl_historical_stock_price

-- Return the percentage of unique "open" prices compared to all open prices in the data set
SELECT COUNT(DISTINCT open) AS "open", COUNT(close) AS "all prices"
  FROM tutorial.aapl_historical_stock_price


*********** -- A listing of all months by their average daily trading volume and a classification that puts this volume into the following categories: "Low" = below 10MM, "Medium" = 10-25 MM, "High" = above 25MM
  SELECT month, AVG(volume) AS avg_volume,
    CASE WHEN avg_volume < 10000000 THEN 'low'
         WHEN avg_volume BETWEEN 10000000 AND 25000000 THEN 'medium'
         WHEN avg_volume > 25000000 THEN 'high'
         ELSE NULL
         END AS classification
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month
  ORDER BY month

-- A listing of average monthly price plus which quarter of the year they are in (e.g. "Q2" or "Q4").
SELECT month, AVG(close) AS avg_close,
  CASE
    WHEN month BETWEEN 1 AND 3 THEN 'Q1'
    WHEN month BETWEEN 4 AND 6 THEN 'Q2'
    WHEN month BETWEEN 7 AND 9 THEN 'Q3'
    WHEN month BETWEEN 10 AND 12 THEN 'Q4'
    ELSE NULL
    END
    AS "fiscal quarter"
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month
  ORDER BY month

*********** -- This same listing filtered for only Q4 (use the new column not the months explicitly as part of this filtering).
SELECT month, AVG(close) AS avg_close,
  CASE
    WHEN month BETWEEN 10 AND 12 THEN 'Q4'
    ELSE NULL
    END
    AS fiscal_quarter
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month
  ORDER BY month

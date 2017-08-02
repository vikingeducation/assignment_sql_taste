-----------------------
-- Billboard Top 100 --
-----------------------
-- What is the highest position ever reached by Phil Collins?
SELECT * 
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%Phil Collins%'
  ORDER BY year_rank

-- What is the average position reached by Michael Jackson?
SELECT SUM(year_rank) / COUNT(*) AS average
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%Michael Jackson%'

-- Madonna's average position when she actually reached the top 10
SELECT SUM(year_rank) / COUNT(*) AS average
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%Madonna%'
  AND year_rank < 11

-- List the top 10 artists based on their number of appearances on this list (and what that number is) since 1985
SELECT artist, COUNT(*) as appearances
  FROM tutorial.billboard_top_100_year_end
  WHERE year > 1984
  GROUP BY artist
  ORDER BY appearances DESC
  LIMIT 10

-- The total count of top 10 hits written by either Elvis, Madonna, the Beatles, or Elton John
SELECT COUNT(*) as hits
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IN ('Elvis Presley', 'Madonna', 'Beatles', 'Elton John')

-----------------------
-- Apple Stock Price --
-----------------------

-- The count of days when Apple traded in a range that was larger than $5
SELECT COUNT(*) AS days
  FROM tutorial.aapl_historical_stock_price
  WHERE high - low > 5

-- The highest daily trading range that Apple stock achieved in 2012
SELECT high - low as range
  FROM tutorial.aapl_historical_stock_price
  WHERE year = 2012
  AND high - low IS NOT NULL
  ORDER BY high - low DESC
  LIMIT 1

-- The average price for all days when Apple's trading volume exceeded 10,000,000 shares.
SELECT (SUM(high) + sum(low)/ 2) / COUNT(*) as average
  FROM tutorial.aapl_historical_stock_price
  WHERE volume > 10000000

-- The number of trading days in each month of the year 2012
SELECT month, COUNT(*) as days
  FROM tutorial.aapl_historical_stock_price
  WHERE year = 2012
  GROUP BY month
  ORDER BY month

### tutorial.billboard_top_100_year_end

1. What is the highest position ever reached by Phil Collins?
5

  ```
  SELECT MIN(year_rank) AS highest_position_by_phil_collins
    FROM tutorial.billboard_top_100_year_end
    WHERE "group" ILIKE '%phil collins%'
  ```

2. What is the average position reached by Michael Jackson?
~45

  ```
  SELECT AVG(year_rank) AS avg_position_by_MJ
    FROM tutorial.billboard_top_100_year_end
    WHERE "group" ILIKE '%michael jackson%'
  ```

3. Madonna's average position when she actually reached the top 10
6

  ```
  SELECT AVG(year_rank) AS avg_Madonna_at_first_top_10
    FROM tutorial.billboard_top_100_year_end
    WHERE "group" ILIKE '%madonna%'
    AND year_rank <= 10
  ```

4. List the top 10 artists based on their number of appearances on this list (and what that number is) since 1985

  ```
  SELECT artist, COUNT(artist) AS appearances
    FROM tutorial.billboard_top_100_year_end
    GROUP BY artist
    ORDER BY COUNT(artist) DESC
    LIMIT 10
  ```

5. The total count of top 10 hits written by either Elvis, Madonna, the Beatles, or Elton John
23

  ```
  SELECT COUNT(DISTINCT song_name) AS count_of_top_10_song_by_various
    FROM tutorial.billboard_top_100_year_end
    WHERE year_rank <= 10
    AND ("group" ILIKE '%elvis presley%'
    OR "group" ILIKE '%madonna%'
    OR "group" ILIKE '%beatles%'
    OR "group" ILIKE '%elton john%')
  ```

### aapl_historical_stock_price

1. The count of days when Apple traded in a range that was larger than $5
1004

  ```
  SELECT COUNT(*)
    FROM tutorial.aapl_historical_stock_price
    WHERE (high - low) > 5
  ```

2. The highest daily trading range that Apple stock achieved in 2012

  ```
  SELECT MAX(high - low) AS highest_daily_trade_range
    FROM tutorial.aapl_historical_stock_price
    WHERE year = 2012
  ```

3. The average price for all days when Apple's trading volume exceeded 10,000,000 shares.

  ```
  SELECT AVG( (high + low)/2 ) AS daily_avg_price_when_volume_over_10m
    FROM tutorial.aapl_historical_stock_price
    WHERE volume > 10000000
  ```

3. The number of trading days in each month of the year 2012

  ```
  SELECT month, COUNT(DISTINCT date) AS trade_days_in_each_month
  FROM tutorial.aapl_historical_stock_price
    WHERE year = 2012
    GROUP BY month
  ```

4. The maximum price Apple traded at during each year of the data set

  ```
  SELECT year, MAX(high) AS highest_trade_price_each_year
    FROM tutorial.aapl_historical_stock_price
    GROUP BY year
  ```
5. The average price and trading volume on each calendar month across the full data set (this should return only 12 rows, one for each month!)

  ```
  SELECT month, AVG(high) AS avg_price, AVG(volume) AS avg_vol
    FROM tutorial.aapl_historical_stock_price
    GROUP BY month
  ```

6. The average price for each month and year of data since 2008, ordered by years descending and months ascending.

  ```
  SELECT year, month, AVG(high) AS avg_price, AVG(volume) AS avg_vol
    FROM tutorial.aapl_historical_stock_price
    WHERE year >= 2008
    GROUP BY year, month
    ORDER BY year DESC, month
  ```
7. The average price of days with a trading volume above 25,000,000 shares (just 1 row)

  ```
  SELECT AVG( (high + low)/2 ) AS daily_avg_price_when_vol_above_25m
    FROM tutorial.aapl_historical_stock_price
    WHERE volume > 25000000
  ```
8. The average price on all months with an average daily trading volume above 10,000,000 shares.

  ```
  SELECT month, AVG( (high + low)/2 ) AS monthly_avg_price_when_vol_above_25m
    FROM tutorial.aapl_historical_stock_price
    WHERE volume > 10000000
    GROUP BY month
    ORDER BY month
  ```

9. The lowest and highest prices that Apple stock achieved between 2005 and 2010 (inclusive).

  ```
  SELECT MIN(low) AS lowest_price, MAX(high) AS highest_price
    FROM tutorial.aapl_historical_stock_price
    WHERE year BETWEEN 2005 and 2010
  ```

10. The average daily trading range in months where the stock moved more than $25 (open of month to close of month)

  ```
  SELECT year, month, AVG(high-low) AS avg_daily_trading_range_over_25
    FROM tutorial.aapl_historical_stock_price
    WHERE (open - close > 25) OR (close - open > 25)
    GROUP BY year, month
  ```
11. All months in the second half of the year where average daily trading volume was below 10,000,000.

  ```
  SELECT month, AVG(volume)
    FROM tutorial.aapl_historical_stock_price
    WHERE month > 6
    AND volume < 10000000
    GROUP BY month
    ORDER BY month
  ```

12. A list of all calendar months by average daily trading volume (so only 12 rows), sorted from highest to lowest.

  ```
  SELECT month, AVG(volume)
    FROM tutorial.aapl_historical_stock_price
    GROUP BY month
    ORDER BY AVG(volume) DESC
  ```

13. Count how many unique months there are in the data set (should equal 12)

  ```
  SELECT COUNT(DISTINCT month)
    FROM tutorial.aapl_historical_stock_price
  ```

14. Count how many unique years there are in the data set

  ```
  SELECT COUNT(DISTINCT year)
    FROM tutorial.aapl_historical_stock_price
  ```

15. Count how many unique prices there are in the data set

  ```
  SELECT COUNT(DISTINCT open)
    FROM tutorial.aapl_historical_stock_price
  ```

16. Return the percentage of unique "open" prices compared to all open prices in the data set

  ```
  SELECT COUNT(DISTINCT open) * 100/COUNT(open) AS percent_unique_open_prices
    FROM tutorial.aapl_historical_stock_price
  ```

17. A listing of all months by their average daily trading volume and a classification that puts this volume into the following categories: "Low" = below 10MM, "Medium" = 10-25 MM, "High" = above 25MM

  ```
  SELECT month, AVG(volume),
    CASE WHEN AVG(volume) < 10000000 THEN 'Low'
          WHEN AVG(volume) BETWEEN 10000000 AND 25000000 THEN 'Medium'
          ELSE 'High'
          END AS category
    FROM tutorial.aapl_historical_stock_price
    GROUP BY month
  ```

18. A listing of average monthly price plus which quarter of the year they are in (e.g. "Q2" or "Q4").

  ```
  SELECT month, AVG((high+low)/2),
    CASE WHEN month <= 3 THEN 'Q1'
          WHEN month BETWEEN 4 AND 6 THEN 'Q2'
          WHEN month BETWEEN 7 AND 9 THEN 'Q3'
          ELSE 'Q4' END AS quarter
    FROM tutorial.aapl_historical_stock_price
    GROUP BY month
    ORDER BY month
  ```

19. This same listing filtered for only Q4 (use the new column not the months explicitly as part of this filtering).

  ```

  ```

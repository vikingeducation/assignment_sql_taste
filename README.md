# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries
10 results with information on all columns
```
SELECT *
  FROM tutorial.us_housing_units
  LIMIT 10
```

Housing starts in the Midwest
```
SELECT midwest
  FROM tutorial.us_housing_units
```

All housing starts in December since 1985
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 12 AND year >= 1985
```

All housing starts in the second half of the year since 1990
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month > 6 AND year >= 1990
```

All rows where housing starts were above 30,000 in the South region
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > 30
```

The sum of housing starts across all regions for each row
```
SELECT year, month, month_name, south + west + midwest + northeast AS sum
  FROM tutorial.us_housing_units
```

All rows where the sum of all housing starts is above 70,000 Note: You can't use an alias in a WHERE clause.
```
SELECT year, month, month_name, south + west + midwest + northeast AS sum
  FROM tutorial.us_housing_units
  WHERE south + west + midwest + northeast > 70
```

All rows where the sum of all housing starts is between 50-80k
```
SELECT year, month, month_name, south + west + midwest + northeast AS sum
  FROM tutorial.us_housing_units
  WHERE south + west + midwest + northeast > 50 AND south + west + midwest + northeast > 80
```

The average of all housing starts across all regions for each row
```
SELECT year, month, month_name, (south + west + midwest + northeast)/4 AS avg
  FROM tutorial.us_housing_units
```

All rows where the housing starts in the South are above the sum of the other three regions
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > (west + northeast + midwest)
```

The percentage of housing starts that occur in each region since 1990 Note: Use an alias to title the new columns appropriately
```
SELECT year, month, month_name, south/(south + west + midwest + northeast) AS south, west/(south + west + midwest + northeast) AS west, midwest/(south + west + midwest + northeast) AS midwest, northeast/(south + west + midwest + northeast) AS northeast
  FROM tutorial.us_housing_units
  WHERE year > 1990
```

-------------------------------------------

All rows where Elvis Presley had a song on the top 100 charts
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist='Elvis Presley'
```

All rows where the artist's name contained "Tony" (not case sensitive)
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE upper(artist) ILIKE '%TONY%'
```

All rows where the song title contained the word "love" in any way
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE song_name ILIKE '%love%'
```

All rows where the artist's name begins with the letter "A"
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist LIKE 'A%'
```

The top 3 songs from each year between 1960-1969
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank <= 3 AND year BETWEEN 1960 AND 1969
```

All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Elvis Presley' OR artist = 'Rolling Stones' OR artist = 'Van Halen'
```

Which artist has had the most appearances on the top 100 list? (Tie Elvis/Madonna, 36)
```
SELECT artist, COUNT(artist)
  FROM tutorial.billboard_top_100_year_end
  GROUP BY artist
  ORDER BY COUNT(artist) DESC
```

Which artist has had the most #1 hits? How many? (Beatles, 2)
```
SELECT artist, COUNT(artist)
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1
  GROUP BY artist
  ORDER BY COUNT(artist) DESC
```

All rows from 1970 where the songs were ranked 10-20th
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1970 AND year_rank BETWEEN 10 AND 20
```

All rows from the 1990's where Madonna was not ranked 10-100th
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year BETWEEN 1990 AND 1999 AND NOT (artist LIKE 'Madonna' AND year_rank >= 10)
```

All rows from 1985 which do not include Madonna or Phil Collins in the group.
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1985 AND NOT (artist = 'Madonna' OR artist = 'Phil Collins')
```

All number 1 songs in the data set.
```
SELECT song_name
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1
```

All rows where the artist is not listed
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IS NULL
```

All of Madonna's top 100 hits ordered by their ranking (1 to 100)
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Madonna'
  ORDER BY year_rank
```

All of Madonna's top 100 hits ordered by their ranking within each year
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Madonna'
  ORDER BY year, year_rank
```

Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990. (Hint: Multiple ordering)
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank BETWEEN 1 and 3 AND year >= 1990
  ORDER BY year_rank, year
```

----------------------------- tutorial.billboard_top_100_year_end

What is the highest position ever reached by Phil Collins?
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank BETWEEN 1 and 3 AND year >= 1990
  ORDER BY year_rank, year
```

What is the average position reached by Michael Jackson?
```
SELECT AVG(year_rank)
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Michael Jackson'
```

Madonna's average position when she actually reached the top 10
```
SELECT AVG(year_rank)
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Madonna' AND year_rank BETWEEN 1 AND 10
```

List the top 10 artists based on their number of appearances on this list (and what that number is) since 1985
```
SELECT artist, COUNT(artist)
  FROM tutorial.billboard_top_100_year_end
  GROUP BY artist
  ORDER BY COUNT(artist) DESC
  LIMIT 10
```

The total count of top 10 hits written by either Elvis, Madonna, the Beatles, or Elton John
```
SELECT artist, COUNT(artist)
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank <= 10 AND (artist = 'Elvis Presley' OR artist = 'Madonna' OR artist = 'Beatles' OR artist = 'Elton John')
  GROUP BY artist
```

------------------------------------tutorial.aapl_historical_stock_price

The count of days when Apple traded in a range that was larger than $5
```
SELECT COUNT(date)
  FROM tutorial.aapl_historical_stock_price
  WHERE 5 < (high - low)
```

The highest daily trading range that Apple stock achieved in 2012
```
SELECT MAX(high - low)
  FROM tutorial.aapl_historical_stock_price
  WHERE year = 2012
```

The average price for all days when Apple's trading volume exceeded 10,000,000 shares.
```
SELECT AVG((high + low)/2)
  FROM tutorial.aapl_historical_stock_price
  WHERE volume > 10000000
```

The number of trading days in each month of the year 2012
```
SELECT month, COUNT(date)
  FROM tutorial.aapl_historical_stock_price
  WHERE year = 2012
  GROUP BY month
  ORDER BY month
```

The maximum price Apple traded at during each year of the data set
```
SELECT year, MAX(high)
  FROM tutorial.aapl_historical_stock_price
  GROUP BY year
  ORDER BY year
```


The average price and trading volume on each calendar month across the full data set (this should return only 12 rows, one for each month!)
```
SELECT month, AVG((high + low) / 2) as AvgPrice, AVG(volume) as AvgVol
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month
  ORDER BY month
```

The average price for each month and year of data since 2008, ordered by years descending and months ascending.
```
SELECT year, month, AVG((high + low) / 2) as AvgPrice
  FROM tutorial.aapl_historical_stock_price
  WHERE year >= 2008
  GROUP BY year, month
  ORDER BY year, month
```

The average price of days with a trading volume above 25,000,000 shares (just 1 row)
```
SELECT AVG((high + low) / 2) as Avg_Price
  FROM tutorial.aapl_historical_stock_price
  WHERE volume > 25000000
```

The average price on all months with an average daily trading volume above 10,000,000 shares.
```
SELECT year, month, AVG((high + low) / 2) as AVERAGE 
  FROM tutorial.aapl_historical_stock_price 
  GROUP BY year, month
  HAVING AVG(volume) > 10000000
```

The lowest and highest prices that Apple stock achieved between 2005 and 2010 (inclusive).
```
SELECT MAX(high), MIN(low)
  FROM tutorial.aapl_historical_stock_price
  WHERE year BETWEEN 2005 AND 2010
```

The average daily trading range in months where the stock moved more than $25 (open of month to close of month)
```
SELECT year, month, AVG(high - low)
  FROM tutorial.aapl_historical_stock_price 
  group by year, month
  HAVING  ABS(SUM(close - open)) > 25
```

All months in the second half of the year where average daily trading volume was below 10,000,000.
```
SELECT year, month
  FROM tutorial.aapl_historical_stock_price
  WHERE month > 6 
  GROUP BY year, month
  HAVING AVG(volume) < 10000000
```

A list of all calendar months by average daily trading volume (so only 12 rows), sorted from highest to lowest.
```
SELECT month, AVG(volume)
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month
  ORDER BY AVG(volume) DESC
```

Count how many unique months there are in the data set (should equal 12)
```
SELECT count(DISTINCT month)
  FROM tutorial.aapl_historical_stock_price
```

Count how many unique years there are in the data set
```
SELECT count(DISTINCT year)
  FROM tutorial.aapl_historical_stock_price
```

Count how many unique prices there are in the data set NOT COMPLETE
```
SELECT Count(DISTINCT open) + COUNT(DISTINCT close) + COUNT(DISTINCT high) + COUNT(DISTINCT low) 
  FROM tutorial.aapl_historical_stock_price 
```

Return the percentage of unique "open" prices compared to all open prices in the data set
```
SELECT CAST(Count(DISTINCT open) as float) / CAST(COUNT(open) as float)
  FROM tutorial.aapl_historical_stock_price 
```

A listing of all months by their average daily trading volume and a classification that puts this volume into the following categories: "Low" = below 10MM, "Medium" = 10-25 MM, "High" = above 25MM
```
SELECT year, month, CASE WHEN AVG(volume) > 10000000 THEN 'LOW'
  WHEN AVG(volume) BETWEEN 10000000 AND 25000000 THEN 'MEDIUM'
  ELSE 'HIGH' END AS rating
  FROM tutorial.aapl_historical_stock_price 
  GROUP BY year, month
```

A listing of average monthly price plus which quarter of the year they are in (e.g. "Q2" or "Q4").
```
SELECT year, month, AVG((high + low) /2), CASE WHEN month <= 3 THEN 'Q1'
  WHEN month BETWEEN 4 and 6 THEN 'Q2'
  WHEN month BETWEEN 7 and 9 THEN 'Q3'
  ELSE 'Q4' END AS Q
  FROM tutorial.aapl_historical_stock_price 
  GROUP BY year, month
```

This same listing filtered for only Q4 (use the new column not the months explicitly as part of this filtering).
```
SELECT year, month, av
FROM (
SELECT year, month, AVG((high + low) /2) as av, CASE WHEN month <= 3 THEN 'Q1'
  WHEN month BETWEEN 4 and 6 THEN 'Q2'
  WHEN month BETWEEN 7 and 9 THEN 'Q3'
  ELSE 'Q4' END AS Q
  FROM tutorial.aapl_historical_stock_price 
  GROUP BY year, month) anything
  GROUP BY year, month, av, q
  HAVING Q = 'Q4'
```
-------------------benn.college_football_players and benn.college_football_teams

The most common home town of football players
```

```
The total number of players in each of their Freshmen, Sophomore, Junior or Senior years (4 rows)
The total number of players in each position
The average height of quarterbacks
The average height of each position
Return 100 football players and which conference they play for
The heaviest football player in the SEC
The top 5 heaviest football players in each conference
The most common home state of players by conference
The average height of football players in each conference
The count of football players in the top 100 of weight who belong to each division
All players whose home state is Kansas but who went to a school in Missouri

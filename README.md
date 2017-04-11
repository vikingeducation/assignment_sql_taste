# assignment_sql_taste
A delicious appetizer of SQL-ey goodness

Tom McLaughlin and Jerry Gao


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

--------------------
#### tutorial.us_housing_units

10 results with information on all columns

```sql
SELECT *
FROM tutuorial.us_housing_units
LIMIT 10
```

Housing starts in the Midwest

```sql
SELECT midwest
FROM tutorial.us_housing_units
```

All housing starts in December since 1985

```sql
SELECT *
FROM tutorial.us_housing_units
WHERE month = 12 AND year > 1984
```

All housing starts in the second half of the year since 1990

```sql
SELECT *
FROM tutorial.us_housing_units
WHERE month > 5 AND year > 1989
```

All rows where housing starts were above 30,000 in the South region

```sql
SELECT *
FROM tutorial.us_housing_units
WHERE south > 30
```

The sum of housing starts across all regions for each row

```sql
SELECT *, south + west + midwest + northeast AS sum
FROM tutorial.us_housing_units
```

All rows where the sum of all housing starts is above 70,000 Note: You can't use an alias in a WHERE clause.

```sql
SELECT *
FROM tutorial.us_housing_units
WHERE south + west + midwest + northeast > 70
```

All rows where the sum of all housing starts is between 50-80k

```sql
SELECT *
FROM tutorial.us_housing_units
WHERE south + west + midwest + northeast BETWEEN 50 AND 80
```

The average of all housing starts across all regions for each row

```sql
SELECT (south + west + midwest + northeast)/4 AS average
FROM tutorial.us_housing_units
```

All rows where the housing starts in the South are above the sum of the other three regions

```sql
SELECT *
FROM tutorial.us_housing_units
WHERE south > west + midwest + northeast
```

The percentage of housing starts that occur in each region since 1990 Note: Use an alias to title the new columns appropriately

```sql
SELECT year,
south/total AS south_percent,
west/total AS west_percent,
midwest/total AS midwest_percent,
northeast/total AS northeast_percent
FROM (
  SELECT year, south, west, midwest, northeast, (south + west + midwest + northeast) AS total
  FROM tutorial.us_housing_units
) AS t2
WHERE year > 1989
```

------------
#### tutorial.billboard_top_100_year_end

All rows where Elvis Presley had a song on the top 100 charts

```sql
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Elvis Presley'
```

All rows where the artist's name contained "Tony" (not case sensitive)

```sql
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist ILIKE 'Tony%'
```

All rows where the song title contained the word "love" in any way

```sql
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE song_name ILIKE '%love%'
```

All rows where the artist's name begins with the letter "A"

```sql
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist LIKE 'A%'
```

The top 3 songs from each year between 1960-1969

```sql
SELECT year, year_rank, song_name
FROM tutorial.billboard_top_100_year_end
WHERE year_rank < 4
AND year BETWEEN 1960 AND 1969
```

All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist

```sql
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist IN ('Elvis Presley', 'The Rolling Stones', 'Van Halen')
```

Which artist has had the most appearances on the top 100 list?

```sql
SELECT artist, COUNT(*) AS artist_count
FROM tutorial.billboard_top_100_year_end
GROUP BY artist
ORDER BY artist_count DESC
LIMIT 1
```

Which artist has had the most #1 hits? How many?

```sql
SELECT COUNT(*) AS number_one_hits, artist
FROM tutorial.billboard_top_100_year_end
GROUP BY year_rank, artist
HAVING year_rank = 1
ORDER BY number_one_hits DESC
LIMIT 2
```

All rows from 1970 where the songs were ranked 10-20th

```sql
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year = 1970
AND year_rank BETWEEN 10 AND 20
```

All rows from the 1990's where Madonna was not ranked 10-100th

```sql
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year IN (
  SELECT year
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Madonna'
  AND year_rank < 10
)
AND year BETWEEN 1990 AND 1999
```

All rows from 1985 which do not include Madonna or Phil Collins in the group.

```sql
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year = 1985
AND "group" NOT ILIKE '%Madonna%'
AND "group" NOT ILIKE '%Phil Collins%'
```

All number 1 songs in the data set.

```sql
SELECT year, song_name
FROM tutorial.billboard_top_100_year_end
WHERE year_rank = 1
GROUP BY year, song_name
```

All rows where the artist is not listed

```sql
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist IS NULL
```

All of Madonna's top 100 hits ordered by their ranking (1 to 100)

```sql
SELECT year_rank, song_name
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Madonna'
ORDER BY year_rank
```

All of Madonna's top 100 hits ordered by their ranking within each year

```sql
SELECT year, year_rank, song_name
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Madonna'
ORDER BY year, year_rank
```

Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990. (Hint: Multiple ordering)

```sql
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year > 1989
ORDER BY year_rank, year
```

------
#### tutorial.billboard_top_100_year_end

What is the highest position ever reached by Phil Collins?

```sql
SELECT MIN(year_rank)
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Phil Collins'
```

What is the average position reached by Michael Jackson?

```sql
SELECT AVG(year_rank)
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Michael Jackson'
```

Madonna's average position when she actually reached the top 10

```sql
SELECT AVG(year_rank)
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Madonna'
AND year_rank < 11
```

List the top 10 artists based on their number of appearances on this list (and what that number is) since 1985

```sql
SELECT COUNT(*) AS appearances, artist
FROM tutorial.billboard_top_100_year_end
WHERE year > 1984
GROUP BY artist
ORDER BY appearances DESC
LIMIT 10
```

The total count of top 10 hits written by either Elvis, Madonna, the Beatles, or Elton John

```sql
SELECT COUNT(*) AS hits
FROM tutorial.billboard_top_100_year_end
WHERE year_rank < 11
AND artist IN ('Elvis', 'Madonna', 'Beatles', 'Elton John')
```

-----
#### tutorial.aapl_historical_stock_price

The count of days when Apple traded in a range that was larger than $5

```sql
SELECT COUNT(*)
FROM tutorial.aapl_historical_stock_price
WHERE high - low > 5
```

The highest daily trading range that Apple stock achieved in 2012

```sql
SELECT MAX(high - low)
FROM tutorial.aapl_historical_stock_price
WHERE year = 2012
```

The average price for all days when Apple's trading volume exceeded 10,000,000 shares.

```sql
SELECT AVG(close)
FROM tutorial.aapl_historical_stock_price
WHERE volume > 10000000
```

The number of trading days in each month of the year 2012

```sql
SELECT COUNT(*), month
FROM tutorial.aapl_historical_stock_price
WHERE year = 2012
GROUP BY month
ORDER BY month
```

The maximum price Apple traded at during each year of the data set

```sql
SELECT MAX(high), year
FROM tutorial.aapl_historical_stock_price
GROUP BY year
ORDER BY year
```

The average price and trading volume on each calendar month across the full data set (this should return only 12 rows, one for each month!)

```sql
SELECT AVG(close) AS avg_price, AVG(volume) AS avg_volume, month
FROM tutorial.aapl_historical_stock_price
GROUP BY month
ORDER BY month
```

The average price for each month and year of data since 2008, ordered by years descending and months ascending.

```sql
SELECT year, month, AVG(close) AS avg_price
FROM tutorial.aapl_historical_stock_price
WHERE year > 2007
GROUP BY month, year
ORDER BY year DESC, month ASC
```

The average price of days with a trading volume above 25,000,000 shares (just 1 row)

```sql
SELECT AVG(close) AS avg_price
FROM tutorial.aapl_historical_stock_price
WHERE volume > 25000000
```

The average price on all months with an average daily trading volume above 10,000,000 shares.

```sql
SELECT year, month, avg_price
FROM (
  SELECT year, month, AVG(volume) AS avg_volume, AVG(close) AS avg_price
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month, year
) AS monthly_averages
WHERE avg_volume > 10000000
```

The lowest and highest prices that Apple stock achieved between 2005 and 2010 (inclusive).

```sql
SELECT MIN(low), MAX(high)
FROM tutorial.aapl_historical_stock_price
WHERE year BETWEEN 2005 AND 2010
```

The average daily trading range in months where the stock moved more than $25 (open of month to close of month)

```sql
SELECT year, month, MAX(close) - MIN(open) AS movement, AVG(high - low) AS range
FROM tutorial.aapl_historical_stock_price
GROUP BY year, month
HAVING MAX(close) - MIN(open) > 25
ORDER BY year, month
```

All months in the second half of the year where average daily trading volume was below 10,000,000.

```sql
SELECT year, month
FROM tutorial.aapl_historical_stock_price
WHERE month > 5
GROUP BY year, month
HAVING avg(volume) < 10000000
ORDER BY year, month
```

A list of all calendar months by average daily trading volume (so only 12 rows), sorted from highest to lowest.

```sql
SELECT month, AVG(volume) AS avg_volume
FROM tutorial.aapl_historical_stock_price
GROUP BY month
ORDER BY avg_volume DESC
```

Count how many unique months there are in the data set (should equal 12)

```sql
SELECT COUNT(DISTINCT month)
FROM tutorial.aapl_historical_stock_price
```

Count how many unique years there are in the data set

```sql
SELECT COUNT(DISTINCT year)
FROM tutorial.aapl_historical_stock_price
```

Count how many unique prices there are in the data set

```sql
SELECT COUNT(DISTINCT(price)) AS unique_prices
FROM (
  SELECT open AS price
  FROM tutorial.aapl_historical_stock_price
  UNION
  SELECT low
  FROM tutorial.aapl_historical_stock_price
  UNION
  SELECT high
  FROM tutorial.aapl_historical_stock_price
  UNION
  SELECT close
  FROM tutorial.aapl_historical_stock_price
) AS prices
```

Return the percentage of unique "open" prices compared to all open prices in the data set

```sql
SELECT COUNT(DISTINCT(open)) * 100.0 / COUNT(open) AS percent_unique
FROM tutorial.aapl_historical_stock_price
```

A listing of all months by their average daily trading volume and a classification that puts this volume into the following categories: "Low" = below 10MM, "Medium" = 10-25 MM, "High" = above 25MM

```sql
SELECT year, month, AVG(volume) AS avg_volume,
CASE WHEN AVG(volume) > 25000000 THEN 'high'
     WHEN AVG(volume) >= 10000000 THEN 'medium'
     WHEN AVG(volume) < 10000000 THEN 'low'
END AS classification
FROM tutorial.aapl_historical_stock_price
GROUP BY month, year
ORDER BY avg_volume DESC
```

A listing of average monthly price plus which quarter of the year they are in (e.g. "Q2" or "Q4").

```sql
SELECT year, month, AVG(close),
CASE WHEN month < 4 THEN 'Q1'
    WHEN month < 7 THEN 'Q2'
    WHEN month < 10 THEN 'Q3'
    WHEN month < 13 THEN 'Q4'
END AS quarter
FROM tutorial.aapl_historical_stock_price
GROUP BY month, year
ORDER BY year, month
```

This same listing filtered for only Q4 (use the new column not the months explicitly as part of this filtering).

```sql
SELECT *
FROM (
  SELECT year, month, AVG(close),
  CASE WHEN month < 4 THEN 'Q1'
      WHEN month < 7 THEN 'Q2'
      WHEN month < 10 THEN 'Q3'
      WHEN month < 13 THEN 'Q4'
  END AS quarter
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month, year
  ORDER BY year, month
) AS quarter_table
WHERE quarter = 'Q4'
```

#### benn.college_football_players and benn.college_football_teams

The most common home town of football players

```sql
SELECT COUNT(hometown)
FROM benn.college_football_players
WHERE hometown != '--'
GROUP BY hometown
ORDER BY COUNT(hometown) DESC
LIMIT 1
```

The total number of players in each of their Freshmen, Sophomore, Junior or Senior years (4 rows)

```sql
SELECT year, COUNT(*)
FROM benn.college_football_players
GROUP BY year
```

The total number of players in each position

```sql
SELECT position, COUNT(position)
FROM benn.college_football_players
GROUP BY position
```

The average height of quarterbacks

```sql
SELECT AVG(height) AS quarterback_avg_height
FROM benn.college_football_players
WHERE position = 'QB'
GROUP BY position
```

The average height of each position

```sql
SELECT position, AVG(height) AS avg_height
FROM benn.college_football_players
GROUP BY position
```

Return 100 football players and which conference they play for

```sql
SELECT player_name, conference
FROM benn.college_football_players
JOIN benn.college_football_teams
ON benn.college_football_players.school_name = benn.college_football_teams.school_name
```

The heaviest football player in the SEC

```sql
SELECT player_name, weight
FROM benn.college_football_players
JOIN benn.college_football_teams
ON benn.college_football_players.school_name = benn.college_football_teams.school_name
WHERE conference = 'SEC'
ORDER BY weight DESC
LIMIT 1
```

The top 5 heaviest football players in each conference



The most common home state of players by conference



The average height of football players in each conference

```sql
SELECT conference, AVG(height) AS avg_height
FROM benn.college_football_players
JOIN benn.college_football_teams
ON benn.college_football_players.school_name = benn.college_football_teams.school_name
GROUP BY conference
```

The count of football players in the top 100 of weight who belong to each division
All players whose home state is Kansas but who went to a school in Missouri

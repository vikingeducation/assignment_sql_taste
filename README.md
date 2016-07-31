# assignment_sql_taste
A delicious appetizer of SQL-ey goodness

Leo and Mike

## Queries

### tutorial.us_housing_units

1. 10 results with information on all columns
```sql
SELECT *
  FROM tutorial.us_housing_units
  LIMIT 10
```
2. Housing starts in the Midwest
```sql
SELECT midwest
  FROM tutorial.us_housing_units
```
3. All housing starts in every December since 1985
```sql
SELECT *
  FROM tutorial.us_housing_units
  Where month_name = 'December'
  AND year >= 1985
```
4. All housing starts in the second half of the year since 1990
```sql
SELECT *
  FROM tutorial.us_housing_units
  WHERE year >= 1990
  AND month >= 7
```
5. All rows where housing starts were above 30,000 in the South region
```sql
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > 30
```
6. The sum of housing starts across all regions for each row
```sql
SELECT *, south + west + midwest + northeast AS "sum"
  FROM tutorial.us_housing_units
```
7. All rows where the sum of all housing starts is above 70,000 Note: You can't use an alias in a WHERE clause.
```sql
SELECT *
  FROM tutorial.us_housing_units
  WHERE south + west + midwest + northeast > 70
```
8. All rows where the sum of all housing starts is between 50-80k
```sql
SELECT *
  FROM tutorial.us_housing_units
  WHERE south + west + midwest + northeast BETWEEN 50 AND 80
```
9. The average of all housing starts across all regions for each row
```sql
SELECT *, (south+west+midwest+northeast)/4 AS "average"
  FROM tutorial.us_housing_units
```
10. All rows where the housing starts in the South are above the sum of the other three regions
```sql
SELECT *
  FROM tutorial.us_housing_units
  WHERE west+midwest+northeast < south
```
11. The percentage of housing starts that occur in each region since 1990 Note: Use an alias to title the new columns appropriately
```sql
SELECT *,
  (south/(south+west+midwest+northeast)*100) AS south_percent,
  (west/(south+west+midwest+northeast)*100) AS west_percent,
  (midwest/(south+west+midwest+northeast)*100) AS midwest_percent,
  (northeast/(south+west+midwest+northeast)*100) AS northeast_percent
  FROM tutorial.us_housing_units
```


### tutorial.billboard_top_100_year_end

1. All rows where Elvis Presley had a song on the top 100 charts
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE "group" ILIKE '%elvis presley%'
```
2. All rows where the artist's name contained "Tony" (not case sensitive)
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE "group" ILIKE '%tony%'
```
3. All rows where the song title contained the word "love" in any way
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE song_name ILIKE '%love%'
```
4. All rows where the artist's name begins with the letter "A"
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist LIKE 'A%'
```
5. The top 3 songs from each year between 1960-1969
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank <= 3
  AND year BETWEEN 1960 AND 1969
```
6. All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IN ('Elvis Presley', 'Rolling Stones', 'Van Halen')
```
7. Which artist has had the most appearances on the top 100 list? Madonna..
```sql
SELECT artist,
  COUNT(artist) AS artist_occurrence
  FROM tutorial.billboard_top_100_year_end
  GROUP BY artist
  ORDER BY artist_occurrence DESC
```
8. Which artist has had the most #1 hits? How many? Beatles and Elvis with 2
```sql
SELECT artist,
  COUNT(artist) AS artist_occurrence
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1
  GROUP BY artist
  ORDER BY artist_occurrence DESC
```
9. All rows from 1970 where the songs were ranked 10-20th
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1970
  AND year_rank BETWEEN 10 AND 20
```
10. All rows from the 1990's where Madonna was not ranked 10-100th
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year BETWEEN 1990 AND 1999
  AND "group" not ILIKE '%madonna%'
  AND NOT WHERE year_rank > 10
```
11. All rows from 1985 which do not include Madonna or Phil Collins in the group.
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1985
  AND "group" NOT ILIKE '%madonna%'
  AND "group" NOT ILIKE '%phil collins%'
```
12. All number 1 songs in the data set.
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1
```
13. All rows where the artist is not listed
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IS null
```
14. All of Madonna's top 100 hits ordered by their ranking (1 to 100)
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE 'Madonna'
  ORDER BY year_rank
  LIMIT 100
```
15. All of Madonna's top 100 hits ordered by their ranking within each year
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE 'Madonna'
  ORDER BY year, year_rank
```
16. Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990. (Hint: Multiple ordering)
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year >= 1990
  ORDER BY year_rank, year
```

### tutorial.billboard_top_100_year_end

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
  WHERE artist ILIKE 'madonna%'
  AND year_rank <= 10
```

List the top 10 artists based on their number of appearances on this list (and what that number is) since 1985

```sql
SELECT artist,
  COUNT(artist) AS appearances
  FROM tutorial.billboard_top_100_year_end
  WHERE year >= 1985
  GROUP BY artist
  ORDER BY appearances DESC
```

The total count of top 10 hits written by either Elvis, Madonna, the Beatles, or Elton John

```sql
SELECT COUNT(1)
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IN ('Elvis Presley', 'Madonna', 'Beatles', 'Elton John')
  AND year_rank <= 10
```

### aapl_historical_stock_price

The count of days when Apple traded in a range that was larger than $5
```sql
SELECT COUNT(1)
  FROM tutorial.aapl_historical_stock_price
  WHERE ((close - open) > 5)
```

The highest daily trading range that Apple stock achieved in 2012
```sql
SELECT MAX(close-open)
  FROM tutorial.aapl_historical_stock_price
  WHERE year = 2012
```

The average price for all days when Apple's trading volume exceeded 10,000,000 shares.
```sql
SELECT AVG((open+close)/2)
  FROM tutorial.aapl_historical_stock_price
  WHERE volume > 10000000
```

The number of trading days in each month of the year 2012
```sql
SELECT month, COUNT(*)
  FROM tutorial.aapl_historical_stock_price
  WHERE year = 2012
  GROUP BY month
  ORDER BY month
```

The maximum price Apple traded at during each year of the data set
```sql
SELECT year, MAX(high)
  FROM tutorial.aapl_historical_stock_price
  GROUP BY year
  ORDER BY year
```

The average price and trading volume on each calendar month across the full data set (this should return only 12 rows, one for each month!)
```sql
SELECT month, AVG((close+open)/2) AS average_price,
  AVG(volume) AS average_volume
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month
  ORDER BY month
```

The average price for each month and year of data since 2008, ordered by years descending and months ascending.
```sql
SELECT year, month, AVG((close+open)/2) AS average_price
  FROM tutorial.aapl_historical_stock_price
  WHERE year >= 2008
  GROUP BY year, month
  ORDER BY year DESC, month
```

The average price of days with a trading volume above 25,000,000 shares (just 1 row)
```sql
SELECT AVG((close+open)/2) AS average_price
  FROM tutorial.aapl_historical_stock_price
  WHERE volume > 25000000
```

The average price on all months with an average daily trading volume above 10,000,000 shares.
```sql
SELECT month, AVG((close+open)/2) AS average_price
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month
  HAVING AVG(volume) > 10000000
```

The lowest and highest prices that Apple stock achieved between 2005 and 2010 (inclusive).
```sql
SELECT year, MIN(low), MAX(high)
  FROM tutorial.aapl_historical_stock_price
  WHERE year BETWEEN 2005 AND 2010
  GROUP BY year
```

The average daily trading range in months where the stock moved more than $25 (open of month to close of month)
```sql
SELECT month, AVG(close-open)
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month
  HAVING MAX(high) - MIN(low) > 25
  ORDER BY month
```

All months in the second half of the year where average daily trading volume was below 10,000,000.
```sql
SELECT month, CASE WHEN AVG(volume) < 10000000 THEN 'over'
              ELSE 'nope' END AS volume_avg
  FROM tutorial.aapl_historical_stock_price
  WHERE month >= 7
  GROUP BY 1
```
A list of all calendar months by average daily trading volume (so only 12 rows), sorted from highest to lowest.

```sql
SELECT month, AVG(volume) AS avg_vol
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month
  ORDER BY avg_vol DESC
```

Count how many unique months there are in the data set (should equal 12)

```sql
SELECT COUNT(DISTINCT(month))
  FROM tutorial.aapl_historical_stock_price
```

Count how many unique years there are in the data set

```sql
SELECT COUNT(DISTINCT(year))
  FROM tutorial.aapl_historical_stock_price
```

Count how many unique prices there are in the data set

```sql
SELECT COUNT(DISTINCT(close))
  FROM tutorial.aapl_historical_stock_price
```

Return the percentage of unique "open" prices compared to all open prices in the data set

```sql
SELECT (100*COUNT(DISTINCT open)/COUNT(open)) percent
  FROM tutorial.aapl_historical_stock_price
```

A listing of all months by their average daily trading volume and a classification that puts this volume into the following categories: "Low" = below 10MM, "Medium" = 10-25 MM, "High" = above 25MM

```sql
SELECT month,
  AVG(volume),
  CASE WHEN AVG(volume) < 10000000 THEN 'low'
  WHEN AVG(volume) BETWEEN 10000000 and 25000000 THEN 'medium'
  WHEN AVG(volume) > 25000000 THEN 'high'
  ELSE null END
  FROM tutorial.aapl_historical_stock_price
    GROUP BY month
```

A listing of average monthly price plus which quarter of the year they are in (e.g. "Q2" or "Q4").

```sql
SELECT month,
  AVG(close),
  CASE WHEN month IN (1, 2, 3) THEN 'Q1'
  WHEN month IN (4, 5, 6) THEN 'Q2'
  WHEN month IN (7, 8, 9) THEN 'Q3'
  WHEN month IN (10, 11, 12) THEN 'Q4'
  ELSE null END AS quarter
  FROM tutorial.aapl_historical_stock_price
    GROUP BY month
    ORDER BY month
```


This same listing filtered for only Q4 (use the new column not the months explicitly as part of this filtering).

```sql
SELECT * FROM
(SELECT month,
  AVG(close),
  CASE WHEN month IN (1, 2, 3) THEN 'Q1'
  WHEN month IN (4, 5, 6) THEN 'Q2'
  WHEN month IN (7, 8, 9) THEN 'Q3'
  WHEN month IN (10, 11, 12) THEN 'Q4'
  ELSE null END AS quarter
  FROM tutorial.aapl_historical_stock_price
    GROUP BY month
    ORDER BY month
    ) as inner_table
    WHERE quarter = 'Q4'
```


### benn.college_football_players and benn.college_football_teams

Note: To see the schemas for these tables listed on the left panel, you need to search for "benn" where it says "Search Mode Public Tables"... they are not listed under "Tutorial" automatically like the previous tables were.

Note2: Mode uses a non-primary key "school_name" to join their tables here. You should really use primary keys wherever possible in your own data.

The most common home town of football players
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

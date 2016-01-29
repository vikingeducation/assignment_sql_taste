# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

Kelsey

===================================================
tutorial.us_housing_units
===================================================

10 results with information on all columns:
```
SELECT *
  FROM tutorial.us_housing_units
LIMIT 10
```
Housing starts in the Midwest:
```
SELECT "midwest"
  FROM tutorial.us_housing_units
```
All housing starts in December since 1985:
```
SELECT *
  FROM tutorial.us_housing_units
WHERE (month_name = 'December') AND (year >= 1985)
```
All housing starts in the second half of the year since 1990:
```
SELECT *
  FROM tutorial.us_housing_units
WHERE (month BETWEEN 7 AND 12) AND (year >= 1990)
```
All rows where housing starts were above 30,000 in the South region:
```
SELECT *
  FROM tutorial.us_housing_units
WHERE south > 30
```
The sum of housing starts across all regions for each row:
```
SELECT south + west + midwest + northeast AS "Total Housing"
  FROM tutorial.us_housing_units
```
All rows where the sum of all housing starts is above 70,000:
```
SELECT *
  FROM tutorial.us_housing_units
WHERE south + west + midwest + northeast > 70
```
All rows where the sum of all housing starts is between 50-80k:
```
SELECT *
  FROM tutorial.us_housing_units
WHERE south + west + midwest + northeast BETWEEN 50 AND 80
```
The average of all housing starts across all regions for each row:
```
SELECT (south + west + midwest + northeast) / 4 AS "Average Housing"
  FROM tutorial.us_housing_units
```
All rows where the housing starts in the South are above the sum of the other three regions:
```
SELECT *
  FROM tutorial.us_housing_units
WHERE south > west + midwest + northeast
```
The percentage of housing starts that occur in each region since 1990:
```
SELECT south * 100 / ( south + west + midwest + northeast ) AS "South Percent",
       west * 100 / ( south + west + midwest + northeast ) AS "West Percent",
       midwest * 100 / ( south + west + midwest + northeast ) AS "Midwest Percent",
       northeast * 100 / ( south + west + midwest + northeast ) AS "Northeast Percent"
  FROM tutorial.us_housing_units
WHERE year >= 1990
```
===================================================
tutorial.billboard_top_100_year_end
===================================================

All rows where Elvis Presley had a song on the top 100 charts:
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE "artist" LIKE 'Elvis Presley'
```
All rows where the artist's name contained "Tony" (not case sensitive):
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE "artist" ILIKE '%tony%'
```
All rows where the song title contained the word "love" in any way:
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE "song_name" ILIKE '%love%'
```
All rows where the artist's name begins with the letter "A":
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE "artist" ILIKE 'A%'
```
The top 3 songs from each year between 1960-1969:
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE ("year" BETWEEN 1960 AND 1969) AND ("year_rank" <= 3)
```
All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist:
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE "artist" IN ('Elvis Presley', 'Rolling Stones', 'Van Halen')
```
Which artist has had the most appearances on the top 100 list?
```
SELECT "artist", COUNT(*) AS count
  FROM tutorial.billboard_top_100_year_end
GROUP BY "artist"
ORDER BY "count" DESC
```
This shows Madonna and Elvis Presley tied at 36.

Which artist has had the most #1 hits? How many?
```
SELECT "artist", COUNT(*) AS count
  FROM tutorial.billboard_top_100_year_end
WHERE "year_rank" = 1
GROUP BY "artist"
ORDER BY "count" DESC
```
This shows The Beatles and Elvis Presley tied at 2.

All rows from 1970 where the songs were ranked 10-20th:
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE ("year_rank" BETWEEN 10 AND 20) AND "year" = 1970
```
All rows from the 1990's where Madonna was not ranked 10-100th:
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE ("year" BETWEEN 1990 AND 1999) AND NOT (("artist" ILIKE 'Madonna') AND ("year_rank" BETWEEN 10 AND 100))
```
All rows from 1985 which do not include Madonna or Phil Collins in the group:
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE "artist" NOT ILIKE '%madonna%' AND "artist" NOT ILIKE '%phil collins%' AND "year" = 1985
```
All number 1 songs in the data set:
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE "year_rank" = 1
```
All rows where the artist is not listed:
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE "artist" IS NULL
```
All of Madonna's top 100 hits ordered by their ranking (1 to 100):
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE "artist" ILIKE 'Madonna'
ORDER BY "year_rank"
```
All of Madonna's top 100 hits ordered by their ranking within each year:
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE "artist" ILIKE 'Madonna'
ORDER BY "year", "year_rank"
```
Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990:
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE "year" >= 1990 AND "year_rank" <= 3
ORDER BY "year_rank", "year"
```
===================================================
tutorial.billboard_top_100_year_end (Intermediate)
===================================================

What is the highest position ever reached by Phil Collins?
```
SELECT MIN(year_rank)
  FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Phil Collins'
```
Highest position = 5

What is the average position reached by Michael Jackson?
```
SELECT AVG(year_rank)
  FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Michael Jackson'
```
Average position = 46

Madonna's average position when she actually reached the top 10:
```
SELECT AVG(year_rank)
  FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Madonna' AND year_rank <= 10
```
Average position = 6

List the top 10 artists based on their number of appearances on this list (and what that number is) since 1985

```
SELECT artist, COUNT(*) AS artist_count
  FROM tutorial.billboard_top_100_year_end
GROUP BY artist
ORDER BY artist_count DESC
```
Madonna: 36
Elvis Presley: 36
Rihanna: 33
Mariah Carey: 33
Ludacris: 28
Elton John: 28
Beatles: 27
Michael Jackson: 26
Lil Wayne: 25
R. Kelly: 25

The total count of top 10 hits written by either Elvis, Madonna, the Beatles, or Elton John:
```
SELECT artist, COUNT(*) AS artist_count
  FROM tutorial.billboard_top_100_year_end
WHERE artist IN ('Elvis Presley', 'Madonna', 'Beatles', 'Elton John')
GROUP BY artist
```
Total is 127

===================================================
tutorial.aapl_historical_stock_price (Intermediate)
===================================================

The count of days when Apple traded in a range that was larger than $5:
```
SELECT COUNT(date) AS count_of_date
  FROM tutorial.aapl_historical_stock_price
WHERE high - low > 5
```
1004 days

The highest daily trading range that Apple stock achieved in 2012:
```
SELECT MAX(high - low) AS max_range
  FROM tutorial.aapl_historical_stock_price
WHERE year = 2012
```
Max range = 38.09

The average price for all days when Apple's trading volume exceeded 10,000,000 shares:
```
SELECT AVG(close) AS avg_price
  FROM tutorial.aapl_historical_stock_price
WHERE volume > 10000000
```
Average price (at closing) = 181.25

The number of trading days in each month of the year 2012:
```
SELECT month, COUNT(date) AS count_of_days
  FROM tutorial.aapl_historical_stock_price
WHERE year = 2012
GROUP BY month
ORDER BY month
```
The maximum price Apple traded at during each year of the data set:
```
SELECT year, MAX(high) AS max_price
  FROM tutorial.aapl_historical_stock_price
GROUP BY year
ORDER BY year
```
The average price and trading volume on each calendar month across the full data set:
```
SELECT month, AVG(close) AS avg_price, AVG(volume) AS avg_volume
  FROM tutorial.aapl_historical_stock_price
GROUP BY month
ORDER BY month
```
The average price for each month and year of data since 2008, ordered by years descending and months ascending:
```
SELECT year, month, AVG(close) AS avg_price
  FROM tutorial.aapl_historical_stock_price
WHERE year >= 2008
GROUP BY year, month
ORDER BY year DESC, month
```
The average price of days with a trading volume above 25,000,000 shares:
```
SELECT AVG(close) AS avg_price
  FROM tutorial.aapl_historical_stock_price
WHERE volume > 25000000
```
Average closing price is 145.77

The average price on all months with an average daily trading volume above 10,000,000 shares:
```
SELECT month, AVG(close) AS avg_price
  FROM tutorial.aapl_historical_stock_price
GROUP BY month
HAVING AVG(volume) > 10000000
```
The lowest and highest prices that Apple stock achieved between 2005 and 2010 (inclusive):
```
SELECT MIN(low) AS min_price, MAX(high) AS max_price
  FROM tutorial.aapl_historical_stock_price
WHERE year BETWEEN 2005 AND 2010
```
Lowest price is 31.3, highest price is 326.66

The average daily trading range in months where the stock moved more than $25 (open of month to close of month):
```
SELECT year, month, AVG(high - low) AS avg_range
  FROM tutorial.aapl_historical_stock_price
WHERE close - open > 25
GROUP BY month, year
ORDER BY year DESC, month
```
All months in the second half of the year where average daily trading volume was below 10,000,000:
```
SELECT year, month
  FROM tutorial.aapl_historical_stock_price
WHERE month BETWEEN 7 AND 12
GROUP BY month, year
HAVING AVG(volume) < 10000000
ORDER BY year DESC, month
```
A list of all calendar months by average daily trading volume (so only 12 rows), sorted from highest to lowest:
```
SELECT month, AVG(volume) AS volume_avg
  FROM tutorial.aapl_historical_stock_price
GROUP BY month
ORDER BY volume_avg DESC
```
Count how many unique months there are in the data set (should equal 12):
```
SELECT COUNT(DISTINCT month) AS unique_months
  FROM tutorial.aapl_historical_stock_price
```
Does equal 12

Count how many unique years there are in the data set:
```
SELECT COUNT(DISTINCT year) AS unique_years
  FROM tutorial.aapl_historical_stock_price
```
15 unique years

Count how many unique prices there are in the data set:
```
SELECT COUNT(DISTINCT open) AS unique_price
  FROM tutorial.aapl_historical_stock_price
```
2942 unique opening prices

Return the percentage of unique "open" prices compared to all open prices in the data set:
```
SELECT (COUNT(DISTINCT open) * 100 / COUNT(open)) AS unique_price_percentage
  FROM tutorial.aapl_historical_stock_price
```
Unique open prices are 83% of total open prices


A listing of all months by their average daily trading volume and a classification that puts this volume into the following categories: "Low" = below 10MM, "Medium" = 10-25 MM, "High" = above 25MM:

A listing of average monthly price plus which quarter of the year they are in (e.g. "Q2" or "Q4"):
```
SELECT month, CASE WHEN month BETWEEN 1 AND 3 THEN 'Q1'
            WHEN month BETWEEN 4 AND 6 THEN 'Q2'
            WHEN month BETWEEN 7 AND 9 THEN 'Q3'
            ELSE 'Q4' END AS quarter,
            AVG(open) AS average_price
  FROM tutorial.aapl_historical_stock_price
GROUP BY month
ORDER BY month
```

This same listing filtered for only Q4 (use the new column not the months explicitly as part of this filtering):
```
SELECT month, CASE WHEN month BETWEEN 10 AND 12 THEN 'Q4'
            ELSE NULL END AS quarter,
            AVG(open) AS average_price
  FROM tutorial.aapl_historical_stock_price
GROUP BY 1
```

(note, filtering by quarter gives me error 'column quarter does not exist')
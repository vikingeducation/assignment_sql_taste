# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

10 results with information on all columns
```
SELECT * FROM tutorial.us_housing_units LIMIT 10;
```

Housing starts in the Midwest
```
SELECT midwest FROM tutorial.us_housing_units;
```

All housing starts in December since 1985
```
SELECT * FROM tutorial.us_housing_units WHERE month_name = 'December' AND
   year >= 1985;
```

All housing starts in the second half of the year since 1990
```
SELECT * FROM tutorial.us_housing_units WHERE month > 6 AND year > 1989;
```

All rows where housing starts were above 30,000 in the South region
```
SELECT * FROM tutorial.us_housing_units WHERE south > 30;
```

The sum of housing starts across all regions for each row
```
SELECT (south + west + midwest + northeast) as total FROM
tutorial.us_housing_units;
```

All rows where the sum of all housing starts is above 70,000 Note: You can't use an alias in a WHERE clause.
```
SELECT * FROM tutorial.us_housing_units WHERE (south + west + midwest +
northeast) > 70;
```

All rows where the sum of all housing starts is between 50-80k
```
SELECT * FROM tutorial.us_housing_units WHERE (south + west + midwest +
northeast) BETWEEN 50 AND 80;
```

The average of all housing starts across all regions for each row
```
SELECT AVG(south + west + midwest + northeast) FROM tutorial.us_housing_units;
```

All rows where the housing starts in the South are above the sum of the other three regions
```
SELECT * FROM tutorial.us_housing_units WHERE south > (west + midwest +
northeast);
```

The percentage of housing starts that occur in each region since 1990 Note: Use an alias to title the new columns appropriately

column average
```
SELECT AVG(south / (south + west + midwest + northeast)) * 100 as south_percentage,
       AVG(west / (south + west + midwest + northeast)) * 100 as west_percentage,
       AVG(midwest / (south + west + midwest + northeast)) * 100 as midwest_percentage,
       AVG(northeast / (south + west + midwest + northeast)) * 100 as northeast_percentage
FROM tutorial.us_housing_units WHERE year >= 1990;
```

Row average
```
SELECT ((south / (south + west + midwest + northeast)) * 100) as south_percentage,
       ((west / (south + west + midwest + northeast)) * 100) as west_percentage,
       ((midwest / (south + west + midwest + northeast)) * 100) as midwest_percentage,
       ((northeast / (south + west + midwest + northeast)) * 100) as northeast_percentage
FROM tutorial.us_housing_units WHERE year >= 1990;
```

## tutorial.billboard_top_100_year_end

All rows where Elvis Presley had a song on the top 100 charts
```
SELECT * FROM tutorial.billboard_top_100_year_end WHERE artist LIKE 'Elvis
Presley';
```

All rows where the artist's name contained "Tony" (not case sensitive)
```
SELECT * FROM tutorial.billboard_top_100_year_end WHERE artist ILIKE 'Tony%';
```

All rows where the song title contained the word "love" in any way
```
SELECT * FROM tutorial.billboard_top_100_year_end WHERE song_name ILIKE '%love%';
```

All rows where the artist's name begins with the letter "A"
```
SELECT * FROM tutorial.billboard_top_100_year_end WHERE artist LIKE 'A%';
```

The top 3 songs from each year between 1960-1969
```
SELECT * FROM tutorial.billboard_top_100_year_end WHERE year_rank < 4;
```

All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist
```
SELECT * FROM tutorial.billboard_top_100_year_end WHERE artist IN ('Elvis
Presley', 'Rolling Stones', 'Van Halen');
```

Which artist has had the most appearances on the top 100 list?
```
SELECT COUNT(artist) as artist_count, artist
FROM tutorial.billboard_top_100_year_end
GROUP BY artist ORDER BY artist_count DESC LIMIT 1;
```

Which artist has had the most #1 hits? How many?
```
SELECT COUNT(year_rank), artist
FROM (SELECT year_rank, artist
      FROM tutorial.billboard_top_100_year_end
WHERE year_rank = 1) num_1_hits
GROUP BY artist ORDER BY count DESC LIMIT 2;
```

All rows from 1970 where the songs were ranked 10-20th
```
SELECT * FROM tutorial.billboard_top_100_year_end WHERE (year_rank BETWEEN 10 AND
20) AND year = 1970;
```

All rows from the 1990's where Madonna was not ranked 10-100th
```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year IN (SELECT year
               FROM tutorial.billboard_top_100_year_end
               WHERE artist = 'Madonna' and year_rank < 10)
AND year BETWEEN 1990 AND 1999;
```

All rows from 1985 which do not include Madonna or Phil Collins in the group.
```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year = 1985 AND ("group" NOT ILIKE '%Madonna%' AND "group" NOT ILIKE '%Phil
Collins%)';
```

All number 1 songs in the data set.
```
SELECT song_name, year
FROM tutorial.billboard_top_100_year_end
WHERE year_rank = 1
GROUP BY "group", song_name, year;
```

All rows where the artist is not listed
```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist IS NULL;
```

All of Madonna's top 100 hits ordered by their ranking (1 to 100)
```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Madonna'
ORDER BY year_rank
LIMIT 100;
```

Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990. (Hint: Multiple ordering)
```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year >= 1990 AND year_rank <= 3
ORDER BY year_rank, year;
```

What is the highest position ever reached by Phil Collins?
```
SELECT MIN(year_rank) FROM tutorial.billboard_top_100_year_end WHERE "group" ILIKE ('%Phil Collins%');
```

What is the average position reached by Michael Jackson?
```
SELECT AVG(year_rank)
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Michael Jackson';
```

Madonna's average position when she actually reached the top 10
```
SELECT AVG(year_rank)
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Madonna' AND year_rank <= 10;
```

List the top 10 artists based on their number of appearances on this list (and what that number is) since 1985
```
SELECT artist, appearances
FROM (
  SELECT COUNT(artist) as appearances, artist
  FROM tutorial.billboard_top_100_year_end
  GROUP BY artist
) appearance_count
ORDER BY appearances DESC
LIMIT 10;
```

The total count of top 10 hits written by either Elvis, Madonna, the Beatles, or Elton John
```
SELECT COUNT(DISTINCT(song_name)) as hits
FROM tutorial.billboard_top_100_year_end
WHERE ("group" ILIKE '%Madonna%'
      OR "group" ILIKE '%Elton John%'
      OR "group" ILIKE '%Beatles%'
      OR "group" ILIKE '%Elvis Presley%')
      AND year_rank <= 10;
```


##INTERMEDIATE aapl_historical_stock_price

The count of days when Apple traded in a range that was larger than $5
```
SELECT COUNT(date)
FROM tutorial.aapl_historical_stock_price
WHERE (high - low) > 5;
```

The highest daily trading range that Apple stock achieved in 2012
```
SELECT MAX((high - low))
FROM tutorial.aapl_historical_stock_price
WHERE year = 2012;
```

The average price for all days when Apple's trading volume exceeded 10,000,000 shares.
```
SELECT AVG(((open + high + low + close) / 4))
FROM tutorial.aapl_historical_stock_price
WHERE volume > 10000000;
```

The number of trading days in each month of the year 2012
```
SELECT AVG(month_count)
FROM (
      SELECT COUNT(month) as month_count
      FROM tutorial.aapl_historical_stock_price
      WHERE year = 2012
      GROUP BY month
      ) days_per_month;
```

The maximum price Apple traded at during each year of the data set
```
SELECT year, MAX(high)
FROM tutorial.aapl_historical_stock_price
GROUP BY year
ORDER BY year;
```

The average price and trading volume on each calendar month across the full data set (this should return only 12 rows, one for each month!)
```
SELECT *
FROM (
  SELECT month, AVG((high + low + open + close)/4) as price, AVG(volume) as vol
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month
  ORDER BY month
  ) monthly_avg
WHERE vol > 10000000;
```

The average price for each month and year of data since 2008, ordered by years descending and months ascending.
```
SELECT year, month, AVG((high + low + open + close)/4) as price
FROM tutorial.aapl_historical_stock_price
GROUP BY month, year
ORDER BY year DESC, month ASC;
```

The average price of days with a trading volume above 25,000,000 shares (just 1 row)
```
SELECT AVG((high + low + open + close)/4) as price
FROM tutorial.aapl_historical_stock_price
WHERE volume > 25000000;
```

The average price on all months with an average daily trading volume above 10,000,000 shares.
```
SELECT year, month, price
FROM (
        SELECT AVG(volume) as avg_vol, AVG((high + low + open + close)/4) as price, month, year
        FROM tutorial.aapl_historical_stock_price
        GROUP BY month, year
      ) month_avg
WHERE avg_vol > 10000000
ORDER BY year, month;
```

The lowest and highest prices that Apple stock achieved between 2005 and 2010 (inclusive).
```
SELECT year, MIN(low) as lowest, MAX(high) as highest
FROM tutorial.aapl_historical_stock_price
WHERE year BETWEEN 2005 AND 2010
GROUP BY year
ORDER BY year;
```

The average daily trading range in months where the stock moved more than $25 (open of month to close of month)
```
SELECT main.year, main. month, AVG((high + low + open + close)/4) as price
FROM
tutorial.aapl_historical_stock_price as main
INNER JOIN
(SELECT open_price.year, open_price.month
FROM (SELECT open, year, month
      FROM tutorial.aapl_historical_stock_price
      WHERE id IN (
                    SELECT MIN(id)
                    FROM tutorial.aapl_historical_stock_price
                    GROUP BY year, month
                    ORDER BY year, month
                  )
    ) open_price
    INNER JOIN
    (SELECT close, year, month
      FROM tutorial.aapl_historical_stock_price
      WHERE id IN (
                    SELECT MAX(id)
                    FROM tutorial.aapl_historical_stock_price
                    GROUP BY year, month
                    ORDER BY year, month
                  )
    ) close_price
ON (close_price.year = open_price.year AND close_price.month = open_price.month)
WHERE (open - close) > 25) valid
ON (main.year = valid.year AND main.month = valid.month)
GROUP BY main.year, main.month
ORDER BY main.year, main.month;
```

All months in the second half of the year where average daily trading volume was below 10,000,000.
```
SELECT year, month, vol
FROM (
      SELECT year, month, AVG(volume) as vol
      FROM tutorial.aapl_historical_stock_price
      WHERE month > 6
      GROUP BY year, month
      ) avg_monthly
WHERE vol < 10000000
ORDER BY year, month
```

A list of all calendar months by average daily trading volume (so only 12 rows), sorted from highest to lowest.
```
SELECT month, avg_vol
FROM (
        SELECT AVG(volume) as avg_vol, month
        FROM tutorial.aapl_historical_stock_price
        GROUP BY month
      ) month_avg
ORDER BY avg_vol DESC;
```

Count how many unique months there are in the data set (should equal 12)
```
SELECT COUNT(DISTINCT(month))
FROM tutorial.aapl_historical_stock_price;
```

Count how many unique years there are in the data set
```
SELECT COUNT(DISTINCT(year))
FROM tutorial.aapl_historical_stock_price;
```

Return the percentage of unique "open" prices compared to all open prices in the data set
```
SELECT COUNT(DISTINCT(price))
FROM (
      SELECT open as price
      FROM tutorial.aapl_historical_stock_price
      UNION
      SELECT close as price
      FROM tutorial.aapl_historical_stock_price
      UNION
      SELECT high as price
      FROM tutorial.aapl_historical_stock_price
      UNION
      SELECT low as price
      FROM tutorial.aapl_historical_stock_price
      )unioned
WHERE price IS NOT NULL
```

Count how many unique prices there are in the data set
```
SELECT (CAST(COUNT(DISTINCT(open))AS FLOAT)/COUNT(open)) * 100 as percent_distinct
FROM tutorial.aapl_historical_stock_price
```

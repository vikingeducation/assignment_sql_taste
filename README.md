# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```


#US_Housing_Units

##10 results with information on all columns

    SELECT *
    FROM tutorial.us_housing_units
    LIMIT 10

##Housing starts in the Midwest

    SELECT midwest
    FROM tutorial.us_housing_units

##All housing starts in December since 1985

    SELECT *
    FROM tutorial.us_housing_units
    WHERE year >= 1985 AND month_name = 'December'

##All housing starts in the second half of the year since 1990

    SELECT *
    FROM tutorial.us_housing_units
    WHERE year >= 1990 AND month > 6

##All rows where housing starts were above 30,000 in the South region

    SELECT *
    FROM tutorial.us_housing_units
    WHERE south > 30

##The sum of all housing starts in the full data set

    SELECT year,
          south,
          west,
          midwest,
          northeast,
          south + west + midwest + northeast AS Sum
    FROM tutorial.us_housing_units

##All rows where the sum of all housing starts is above 70,000

    SELECT *,
      south + west + midwest + northeast AS sum
    FROM tutorial.us_housing_units
    WHERE (south + west + midwest + northeast) > 70

##All rows where the sum of all housing starts is between 50-80k

    SELECT *,
      south + west + midwest + northeast AS sum
    FROM tutorial.us_housing_units
    WHERE (south + west + midwest + northeast) BETWEEN 50 AND 80


##The average of all housing starts across all regions for each row

    SELECT *,
      (south + west + midwest + northeast)/4 AS average_starts
    FROM tutorial.us_housing_units


##All rows where the housing starts in the South are above the sum of the other three regions

    SELECT *
    FROM tutorial.us_housing_units
    WHERE south > (west + midwest + northeast)


##The percentage of housing starts that occur in each region since 1990 Note: Use an alias to title the new columns appropriately

    SELECT year,
      south,
      west,
      midwest,
      northeast,
      south / (south + west + midwest + northeast) * 100 AS south_percentage,
      west / (south + west + midwest + northeast) * 100 AS west_percentage,
      midwest / (south + west + midwest + northeast) * 100 AS midwest_percentage,
      northeast / (south + west + midwest + northeast) * 100 AS northeast_percentage
    FROM tutorial.us_housing_units
    WHERE year >= 1990


#billboard_top_100_year_end
##All rows where Elvis Presley had a song on the top 100 charts

  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Elvis Presley'

##All rows where the artist's name contained "Tony" (not case sensitive)

  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%tony%'

##All rows where the song title contained the word "love" in any way

  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE song_name ILIKE '%love%'

##All rows where the artist's name begins with the letter "A"

  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE 'A%'

##The top 3 songs from each year between 1960-1969

  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year BETWEEN 1960 AND 1969
  AND year_rank <= 3

##All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist

  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IN ('Elvis Presley', 'Rolling Stones', 'Van Halen')

##All rows from 1970 where the songs were ranked 10-20th

  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1970
  AND year_rank BETWEEN 10 AND 20

##All rows from the 1990's where Madonna was not ranked > 50th

  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year BETWEEN 1990 AND 1999
  AND artist = 'Madonna'
  AND year_rank < 50

##All rows from 1985 which do not include Madonna or Phil Collins in the group.

  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1985
  AND "group" NOT ILIKE '%Madonna%'
  AND "group" NOT ILIKE '%Phil Collins%'

##All number 1 songs in the data set.

  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1

##All rows where the artist is not listed

  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IS NULL

##All of Madonna's top 100 hits ordered by their ranking (1 to 100)

  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Madonna'
  ORDER BY year_rank

##All of Madonna's top 100 hits ordered by their ranking within each year

  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Madonna'
  ORDER BY year, year_rank

##Every number 1 song since 1990 followed by every number 2 song and number 3 song.

  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year >= 1990
  AND year_rank BETWEEN 1 AND 3
  ORDER BY year_rank, year


#INTERMEDIATE
#tutorial.billboard_top_100_year_end

##What is the highest position ever reached by Phil Collins?

    SELECT MIN(year_rank) AS best_position
    FROM tutorial.billboard_top_100_year_end
    WHERE artist = 'Phil Collins'

##What is the average position reached by Michael Jackson?

    SELECT AVG(year_rank) AS average_position
    FROM tutorial.billboard_top_100_year_end
    WHERE artist = 'Michael Jackson'


##Madonna's average position when she actually reached the top 10

    SELECT AVG(year_rank)
    FROM tutorial.billboard_top_100_year_end
    WHERE artist = 'Madonna'
    AND year_rank <= 10


##List the top 10 artists based on their number of appearances on this list (and what that number is) since 1985

    SELECT artist,
        COUNT(artist) AS artist_appearance
    FROM tutorial.billboard_top_100_year_end
    WHERE year_rank <= 10
    AND year >= 1985
    GROUP BY artist
    ORDER BY artist_appearance DESC
    LIMIT 10


##The total count of top 10 hits written by either Elvis, Madonna, the Beatles, or Elton John

    SELECT COUNT(*)
    FROM tutorial.billboard_top_100_year_end
    WHERE artist IN ('Elvis Presley', 'Madonna', 'Beatles', 'Elton John')
    AND year_rank <= 10

#aapl_historical_stock_price

##The count of days when Apple traded in a range that was larger than $5

    SELECT COUNT(*)
    FROM tutorial.aapl_historical_stock_price
    WHERE (high - low) > 5


##The highest daily trading range that Apple stock achieved in 2012

    SELECT MAX(high - low) AS highest_range
    FROM tutorial.aapl_historical_stock_price
    WHERE year = 2012


##The average price on days when Apple's trading volume exceeded 10,000,000 shares.

    SELECT AVG((high + low) / 2) AS average_historical_price
    FROM tutorial.aapl_historical_stock_price
    WHERE volume > 10000000


##The number of trading days in each month of the year 1992

  SELECT COUNT(month) AS total_trading_days_in_month,
    Month
  FROM tutorial.aapl_historical_stock_price
  WHERE year = 2002
  GROUP BY month


##The maximum price Apple traded at during each year of the data set

  SELECT MAX(high) AS max_trading_price,
  year
  FROM tutorial.aapl_historical_stock_price
  GROUP BY year
  ORDER BY year

##The average price and trading volume on each calendar month across the full data set (this should return only 12 rows, one for each month!)

  SELECT AVG((high+low)/2) AS avg_trading_price,
  month
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month
  ORDER BY month

##The average price for each month and year of data since 2008, ordered by years descending and months ascending.

  SELECT AVG((high+low)/2) AS avg_trading_price,
  month,
  year
  FROM tutorial.aapl_historical_stock_price
  WHERE year >= 2008
  GROUP BY month, year
  ORDER BY year DESC, month

##The average price on all days with a trading volume above 25,000,000 shares (just 1 row)

  SELECT AVG((high+low)/2) AS avg_trading_price
  FROM tutorial.aapl_historical_stock_price
  WHERE volume > 25000000

##The average price on all months with an average daily trading volume above 10,000,000 shares.

  SELECT AVG((high+low)/2) AS avg_trading_price
  FROM tutorial.aapl_historical_stock_price
  WHERE volume > 10000000

##The lowest and highest prices that Apple stock achieved between 2005 and 2010 (inclusive).

  SELECT MIN(low) AS min_trading_price,
          MAX(high) AS max_trading_price
  FROM tutorial.aapl_historical_stock_price
  WHERE year BETWEEN 2005 AND 2010

##The average daily trading range in months where the stock moved more than $25 (open to close)

  SELECT AVG(high-low) AS trading_range,
  month
  FROM tutorial.aapl_historical_stock_price
  WHERE abs(close-open) > 25
  GROUP BY month

##All months in the second half of the year where average daily trading volume was below 10,000,000.

  SELECT AVG(volume) AS trading_volume_avg,
  month
  FROM tutorial.aapl_historical_stock_price
  WHERE month > 6
  AND volume < 10000000
  GROUP BY month

##A list of all calendar months by average daily trading volume (so only 12 rows), sorted from highest to lowest.

  SELECT AVG(volume) AS trading_volume_avg,
  month
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month
  ORDER BY trading_volume_avg DESC

##Count how many unique months there are in the data set

  SELECT COUNT(DISTINCT month)
  FROM tutorial.aapl_historical_stock_price

##Count how many unique years there are in the data set

  SELECT COUNT(DISTINCT year)
  FROM tutorial.aapl_historical_stock_price

##Count how many unique prices there are in the data set

  SELECT COUNT(DISTINCT open)
  FROM tutorial.aapl_historical_stock_price

##Return the percentage of unique prices compared to all prices in the data set

    SELECT COUNT(DISTINCT(open)) * 100 / COUNT(*)
    FROM tutorial.aapl_historical_stock_price


##A listing of all months by their average daily trading volume and a classification that puts this volume into the following categories: "Low" = below 10MM, "Medium" = 10-25 MM, "High" = above 25MM

    SELECT month,
      AVG(volume) as average_trading_volume,
      case  when AVG(volume) < 10000000 THEN 'Low'
            when AVG(volume) BETWEEN 10000000 AND 25000000 THEN 'Medium'
            else 'High' end as trading_volume
    FROM tutorial.aapl_historical_stock_price
    GROUP BY month


##A listing of average monthly price plus which quarter of the year they are in (e.g. "Q2" or "Q4").

    SELECT month,
      AVG((high+low)/2) as average_monthly_price,
      case  when month between 1 and 3 THEN 'Q1'
            when month between 4 and 6 THEN 'Q2'
            when month between 7 and 9 THEN 'Q3'
            else 'Q4' end as quarter
    FROM tutorial.aapl_historical_stock_price
    GROUP BY month
    ORDER BY quarter


##This same listing filtered for only Q4 (use the new column not the months explicitly as part of this filtering).

    SELECT *
    FROM (SELECT month,
          AVG((high+low)/2) as average_monthly_price,
          case  when month between 1 and 3 THEN 'Q1'
                when month between 4 and 6 THEN 'Q2'
                when month between 7 and 9 THEN 'Q3'
                else 'Q4' end as quarter
    FROM tutorial.aapl_historical_stock_price
    GROUP BY month
    ORDER BY quarter) as new_table
    WHERE quarter = 'Q4'



# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```
Ann Allan
tutorial.us_housing_units
1) 10 results with information on all columns
    SELECT *
    FROM tutorial.us_housing_units
    LIMIT 10
2) Housing starts in the Midwest
    SELECT year, month, month_name, west
    FROM tutorial.us_housing_units
3) All housing starts in December since 1985
    SELECT *
    FROM tutorial.us_housing_units
    WHERE month = 12 AND year >= 1985
4) All housing starts in the second half of the year since 1990
    SELECT *
    FROM tutorial.us_housing_units
    WHERE month >= 6 AND year >= 1990
5) All rows where housing starts were above 30,000 in the South region
    SELECT *
    FROM tutorial.us_housing_units
    WHERE south > 30
6) The sum of housing starts across all regions for each row
    SELECT *, (west + south + midwest + northeast) as "Total"
    FROM tutorial.us_housing_units
7) All rows where the sum of all housing starts is above 70,000 Note: You can't use an alias in a WHERE clause.
    SELECT *
    FROM tutorial.us_housing_units
    WHERE (west + south + midwest + northeast) > 70
8) All rows where the sum of all housing starts is between 50-80k
    SELECT *
    FROM tutorial.us_housing_units
    WHERE (west + south + midwest + northeast) > 50 AND (west + south + midwest + northeast) < 80
9) The average of all housing starts across all regions for each row
    SELECT *, (west + south + midwest + northeast)/4 as "average"
    FROM tutorial.us_housing_units
10) All rows where the housing starts in the South are above the sum of the other three regions
    SELECT *
    FROM tutorial.us_housing_units
    WHERE south > (west + midwest + northeast)
11) The percentage of housing starts that occur in each region since 1990 Note: Use an alias to title the new columns appropriately
    SELECT year, month, month_name,
          west/(west + midwest + northeast + south) * 100 as "west %",
          south/(west + midwest + northeast + south) * 100 as "south %",
          midwest/(west + midwest + northeast + south) * 100 as "midwest %",
          northeast/(west + midwest + northeast + south) * 100 as "northeast %"
    FROM tutorial.us_housing_units


tutorial.billboard_top_100_year_end
1) All rows where Elvis Presley had a song on the top 100 charts
    SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist = 'Elvis Presley'

2) All rows where the artist's name contained "Tony" (not case sensitive)
    SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist ILIKE '%Tony%'

3) All rows where the song title contained the word "love" in any way
    SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE song_name ILIKE '%love%'

4) All rows where the artist's name begins with the letter "A"
    SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist LIKE 'A%'

5) The top 3 songs from each year between 1960-1969
    SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE year_rank IN (1, 2, 3) AND year BETWEEN 1960 AND 1969

6) All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist
    SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist IN ('Elvis Presley', 'The Rolling Stones', 'Van Halen')

7) Which artist has had the most appearances on the top 100 list?
    SELECT artist, COUNT(song_name) AS "appearances"
    FROM tutorial.billboard_top_100_year_end
    GROUP BY artist
    ORDER BY appearances DESC

8) Which artist has had the most #1 hits? How many?
    SELECT artist, COUNT(song_name) AS "appearances"
    FROM tutorial.billboard_top_100_year_end
    WHERE year_rank = 1
    GROUP BY artist
    ORDER BY appearances DESC

9) All rows from 1970 where the songs were ranked 10-20th
    SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE year = 1970 AND year_rank BETWEEN 10 AND 20

10) All rows from the 1990's where Madonna was not ranked 10-100th
    SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE year BETWEEN 1990 AND 1999 AND year_rank BETWEEN 10 AND 100 AND artist != 'Madonna'

11) All rows from 1985 which do not include Madonna or Phil Collins in the group.
    SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE year = 1985 AND artist != 'Madonna' AND artist != 'Phil Collins'

12) All number 1 songs in the data set.
    SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE year_rank = 1

13) All rows where the artist is not listed
    SELECT *
      FROM tutorial.billboard_top_100_year_end
     WHERE artist IS NULL

14) All of Madonna's top 100 hits ordered by their ranking (1 to 100)
    SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist = 'Madonna'
    ORDER BY year_rank

15) All of Madonna's top 100 hits ordered by their ranking within each year
    SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist = 'Madonna'
    ORDER BY year, year_rank

16) Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990. (Hint: Multiple ordering)
  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank IN (1, 2, 3) AND year >= 1990
  ORDER BY year_rank, year


  tutorial.billboard_top_100_year_end

  1) What is the highest position ever reached by Phil Collins?
      SELECT MIN (year_rank)
        FROM tutorial.billboard_top_100_year_end
        WHERE artist = 'Phil Collins'

  2) What is the average position reached by Michael Jackson?
      SELECT AVG (year_rank)
        FROM tutorial.billboard_top_100_year_end
        WHERE artist = 'Michael Jackson'

  3) Madonna's average position when she actually reached the top 10
      SELECT AVG (year_rank)
        FROM tutorial.billboard_top_100_year_end
        WHERE artist = 'Michael Jackson' AND year_rank BETWEEN 1 and 10

  4) List the top 10 artists based on their number of appearances on this list (and what that number is) since 1985
      SELECT artist, COUNT(song_name) AS "appearances"
          FROM tutorial.billboard_top_100_year_end
          WHERE year_rank BETWEEN 1 AND 10 AND year >= 1985
          GROUP BY artist
          ORDER BY appearances DESC
          LIMIT 10

  5) The total count of top 10 hits written by either Elvis, Madonna, the Beatles, or Elton John
      SELECT COUNT(song_name) AS "hits"
          FROM tutorial.billboard_top_100_year_end
          WHERE artist IN ('Elvis', 'Madonna', 'Beatles', 'Elton John') AND year_rank BETWEEN 1 AND 10

  aapl_historical_stock_price

  1) The count of days when Apple traded in a range that was larger than $5
      SELECT COUNT (date) as days_traded_higher_than_5
      FROM tutorial.aapl_historical_stock_price
      WHERE ABS(high - low) > 5

  2) The highest daily trading range that Apple stock achieved in 2012
      SELECT MAX(high - low)
      FROM tutorial.aapl_historical_stock_price
      WHERE year = 2012

  3) The average price for all days when Apple's trading volume exceeded 10,000,000 shares.
      SELECT *, (high + low)/2 as avg_daily_price
      FROM tutorial.aapl_historical_stock_price
      WHERE volume > 10000000

  4) The number of trading days in each month of the year 2012
      SELECT year, month, COUNT(date) as num_trading_days
      FROM tutorial.aapl_historical_stock_price
      GROUP BY year, month
      ORDER BY year, month

  5) The maximum price Apple traded at during each year of the data set
      SELECT year, MAX(high) as max_yearly_trading_price
      FROM tutorial.aapl_historical_stock_price
      GROUP BY year
      ORDER BY year

  6) The average price and trading volume on each calendar month across the full data set (this should return only 12 rows, one for each month!)
      SELECT  month,
            (SUM(high) + SUM(low)) / (COUNT(date) * 2) AS avg_monthly_price,
            SUM(volume) /COUNT(date) AS avg_trading_volume
      FROM tutorial.aapl_historical_stock_price
      GROUP BY month
      ORDER BY month

  7) The average price for each month and year of data since 2008, ordered by years descending and months ascending.
      SELECT  year, month,
            (SUM(high) + SUM(low)) / (COUNT(date) * 2) AS avg_monthly_price
      FROM tutorial.aapl_historical_stock_price
      WHERE year >= 2008
      GROUP BY month, year
      ORDER BY year DESC, month

  8) The average price of days with a trading volume above 25,000,000 shares (just 1 row)
      SELECT  
            (SUM(high) + SUM(low)) / (COUNT(date) * 2) AS avg_daily_price
      FROM tutorial.aapl_historical_stock_price
      WHERE volume > 25000000

  9) The average price on all months with an average daily trading volume above 10,000,000 shares.
      SELECT  year, month,
            (SUM(high) + SUM(low)) / (COUNT(date) * 2) AS avg_monthly_price
      FROM tutorial.aapl_historical_stock_price
      GROUP BY year, month
      HAVING SUM(volume)/COUNT(date) > 10000000
      ORDER BY year, month

  10) The lowest and highest prices that Apple stock achieved between 2005 and 2010 (inclusive).
      SELECT MAX(high), MIN(low)
      FROM tutorial.aapl_historical_stock_price
      WHERE year BETWEEN 2005 AND 2010

  11) The average daily trading range in months where the stock moved more than $25 (open of month to close of month)






  12) All months in the second half of the year where average daily trading volume was below 10,000,000.
      SELECT month
      FROM tutorial.aapl_historical_stock_price
      GROUP BY month
      HAVING month >= 6 AND SUM(volume)/COUNT(date) < 10000000


  13) A list of all calendar months by average daily trading volume (so only 12 rows), sorted from highest to lowest.
      SELECT month
      FROM tutorial.aapl_historical_stock_price
      GROUP BY month, volume
      ORDER BY volume DESC

  14) Count how many unique months there are in the data set (should equal 12)
      SELECT COUNT( DISTINCT month)
      FROM tutorial.aapl_historical_stock_price

  15) Count how many unique years there are in the data set
      SELECT COUNT( DISTINCT year)
      FROM tutorial.aapl_historical_stock_price

  16) Count how many unique prices there are in the data set
      SELECT COUNT( DISTINCT open) + COUNT(DISTINCT close) + COUNT(DISTINCT high) + COUNT(DISTINCT low)
      FROM tutorial.aapl_historical_stock_price

  17) Return the percentage of unique "open" prices compared to all open prices in the data set
      SELECT COUNT(DISTINCT open) * 100 / COUNT(open)
      FROM tutorial.aapl_historical_stock_price

  18) A listing of all months by their average daily trading volume and a classification that puts this volume into the following categories: "Low" = below 10MM, "Medium" = 10-25 MM, "High" = above 25MM
      SELECT year, month,
      CASE WHEN volume > 10000000 THEN 'Low'
          WHEN volume > 25000000 THEN 'Medium'
            ELSE 'High' END AS volume_class
      FROM tutorial.aapl_historical_stock_price
      GROUP BY year, month, volume
      ORDER BY volume DESC

  19) A listing of average monthly price plus which quarter of the year they are in (e.g. "Q2" or "Q4").
      SELECT month, (sum(high) + sum(low)) / (count(date) * 2) as avg_monthly_price,
      CASE WHEN month between 1 and 3 THEN 'Q1'
          WHEN month between 4 and 6 THEN 'Q2'
          WHEN month between 7 and 9 THEN 'Q3'
          ELSE 'Q4' END AS quarter
      FROM tutorial.aapl_historical_stock_price
      GROUP BY month

  20) This same listing filtered for only Q4 (use the new column not the months explicitly as part of this filtering).
      SELECT year, month, (sum(high) + sum(low)) / (count(date) * 2) as avg_monthly_price,
          CASE WHEN month between 1 and 3 THEN 'Q1'
              WHEN month between 4 and 6 THEN 'Q2'
              WHEN month between 7 and 9 THEN 'Q3'
              ELSE 'Q4' END AS quarter
          FROM tutorial.aapl_historical_stock_price
          GROUP BY year, month
          Having 'quarter' = 'Q4'


  benn.college_football_players and benn.college_football_teams

  1) The most common home town of football players
    SELECT hometown, Count(hometown)
      FROM benn.college_football_players
      group by hometown
      order by count DESC

  2)The total number of players in each of their Freshmen, Sophomore, Junior or Senior years (4 rows)
      SELECT year, Count(year)
        FROM benn.college_football_players
        group by year

  3) The total number of players in each position
      SELECT position, Count(position)
        FROM benn.college_football_players
        group by position

  4) The average height of quarterbacks
      SELECT AVG(height)
        FROM benn.college_football_players
        where position = 'QB'

  5) The average height of each position
      SELECT position, AVG(height)
        FROM benn.college_football_players
        Group by position

  6) Return 100 football players and which conference they play for
      SELECT player_name, conference
        FROM benn.college_football_players players
        JOIN benn.college_football_teams teams
          ON teams.school_name = players.school_name
       GROUP BY players.player_name, teams.conference

  7) The heaviest football player in the SEC
      SELECT teams.conference AS conference,
             AVG(players.weight) AS average_weight
        FROM benn.college_football_players players
        JOIN benn.college_football_teams teams
          ON teams.school_name = players.school_name
       GROUP BY teams.conference
       ORDER BY AVG(players.weight) DESC

  8) The top 5 heaviest football players in each conference


  9) The most common home state of players by conference


  10) The average height of football players in each conference


  11) The count of football players in the top 100 of weight who belong to each division


  12) All players whose home state is Kansas but who went to a school in Missouri

# assignment_sql_taste
A delicious appetizer of SQL-ey goodness

Julia + John

## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

###### tutorial.us_housing_units


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
SELECT * 
  FROM tutorial.us_housing_units 
  WHERE month_name = 'December'
  AND year >= 1985; 
```
All housing starts in the second half of the year since 1990
```
SELECT * 
  FROM tutorial.us_housing_units 
  WHERE month > 6
  AND year >= 1990;  
```
All rows where housing starts were above 30,000 in the South region
```
SELECT * 
  FROM tutorial.us_housing_units 
  WHERE south > 30; 
```
The sum of housing starts across all regions for each row
```
SELECT *, 
  (south + west + midwest + northeast) as sum_regions
  FROM tutorial.us_housing_units; 
```
All rows where the sum of all housing starts is above 70,000 Note: You can't use an alias in a WHERE clause.
```
SELECT * 
  FROM tutorial.us_housing_units
  where (south+west+midwest+northeast) > 70;
```
All rows where the sum of all housing starts is between 50-80k
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE (south + west + midwest + northeast)
  BETWEEN 50 AND 80; 
```
The average of all housing starts across all regions for each row
```
SELECT *,
  (south + west + midwest + northeast)/4 as average
  FROM tutorial.us_housing_units; 
```
All rows where the housing starts in the South are above the sum of the other three regions
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > (west + midwest + northeast);
```
The percentage of housing starts that occur in each region since 1990 Note: Use an alias to title the new columns appropriately
```
SELECT year, month_name,
  south/(south+west+midwest+northeast)*100 as south_percentage,
  west/(south+west+midwest+northeast)*100 as west_percentage,
  midwest/(south+west+midwest+northeast)*100 as midwest_percentage,
  northeast/(south+west+midwest+northeast)*100 as northeast_percentage
  FROM tutorial.us_housing_units
  WHERE year >= 1990;
```



###### tutorial.billboard_top_100_year_end

All rows where Elvis Presley had a song on the top 100 charts
```
SELECT * 
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist = 'Elvis Presley';
```
All rows where the artist's name contained "Tony" (not case sensitive)
```
SELECT * 
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist ilike '%tony%';
```
All rows where the song title contained the word "love" in any way
```
SELECT * 
  FROM tutorial.billboard_top_100_year_end 
  WHERE song_name ilike '%love%';
```
All rows where the artist's name begins with the letter "A"
```
SELECT * 
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist like 'A%';
```
The top 3 songs from each year between 1960-1969
```
SELECT * 
  FROM tutorial.billboard_top_100_year_end 
  WHERE year_rank <= 3
  AND year BETWEEN 1960 AND 1969;
```
All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist
```
SELECT *
   FROM tutorial.billboard_top_100_year_end
   WHERE artist IN ('Rolling Stones', 'Van Halen', 'Elvis Presley');
```
Which artist has had the most appearances on the top 100 list? Madonna and Elvis Presley, 36 each
```
SELECT artist, count(artist)
   FROM tutorial.billboard_top_100_year_end
   GROUP BY artist
   ORDER BY count desc;
```
Which artist has had the most #1 hits? How many? Beatles and Elvis Presley, 2 each
```
SELECT artist, count(year_rank)
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1
  GROUP BY artist
  ORDER BY count desc;
```
All rows from 1970 where the songs were ranked 10-20th
```
SELECT * 
  FROM tutorial.billboard_top_100_year_end 
  WHERE year = 1970
  AND year_rank BETWEEN 10 and 20;
```
All rows from the 1990's where Madonna was not ranked 10-100th
```
SELECT * 
  FROM tutorial.billboard_top_100_year_end 
  WHERE year BETWEEN 1990 and 1999
  AND NOT (artist = 'Madonna' AND year_rank BETWEEN 10 AND 100);
```
All rows from 1985 which do not include Madonna or Phil Collins in the group.
```
SELECT * 
  FROM tutorial.billboard_top_100_year_end 
  WHERE year = 1985
  AND artist NOT IN ('Madonna', 'Phil Collins');
```
All number 1 songs in the data set.
```
SELECT song_name, year_rank
  FROM tutorial.billboard_top_100_year_end 
  WHERE year_rank = 1 group by year_rank, song_name;
```
All rows where the artist is not listed
```
SELECT *
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist is null;
```
All of Madonna's top 100 hits ordered by their ranking (1 to 100)
```
SELECT *
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist = 'Madonna' 
  ORDER BY year_rank;
```
All of Madonna's top 100 hits ordered by their ranking within each year
```
SELECT *
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist = 'Madonna' 
  ORDER BY year, year_rank;
```
Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990. (Hint: Multiple ordering)
```
SELECT *
  FROM tutorial.billboard_top_100_year_end 
  WHERE year > 1990
  AND year_rank BETWEEN 1 AND 3
  ORDER BY year_rank, year;
```



###### (optional) tutorial.billboard_top_100_year_end

What is the highest position ever reached by Phil Collins? 5
```
SELECT min(year_rank)
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist = 'Phil Collins';
```
What is the average position reached by Michael Jackson? 46
```
SELECT avg(year_rank)
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist = 'Michael Jackson';
```
Madonna's average position when she actually reached the top 10 = 6
```
SELECT avg(year_rank)
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist = 'Madonna'
  AND year_rank <= 10;
```
List the top 10 artists based on their number of appearances on this list (and what that number is) since 1985
```
SELECT artist, count(artist)
  FROM tutorial.billboard_top_100_year_end 
  WHERE year >= 1985
  GROUP BY artist 
  ORDER BY count DESC
  LIMIT 10;
```
The total count of top 10 hits written by either Elvis, Madonna, the Beatles, or Elton John
```
SELECT count(*)
  FROM tutorial.billboard_top_100_year_end 
  WHERE year_rank <= 10
  AND artist in ('Elvis', 'Madonna', 'The Beatles', 'Elton John');
```



############ (optional) aapl_historical_stock_price

The count of days when Apple traded in a range that was larger than $5
```
SELECT count(*)
  FROM tutorial.aapl_historical_stock_price
  WHERE (high - low) > 5;
```
The highest daily trading range that Apple stock achieved in 2012
```
SELECT max(high-low)
  FROM tutorial.aapl_historical_stock_price
  WHERE year = 2012;
```
The average price for all days when Apple's trading volume exceeded 10,000,000 shares.
```
SELECT avg((high+low)/2)
  FROM tutorial.aapl_historical_stock_price
  WHERE volume > 10000000
  AND high IS NOT NULL
  AND low IS NOT NULL;
```
The number of trading days in each month of the year 2012
```
SELECT month, count(date)
  FROM tutorial.aapl_historical_stock_price
  WHERE year = 2012
  GROUP BY month
  ORDER BY month;
```
The maximum price Apple traded at during each year of the data set
```
SELECT year, max(high)
  FROM tutorial.aapl_historical_stock_price
  GROUP BY year
  ORDER BY year;
```
The average price and trading volume on each calendar month across the full data set (this should return only 12 rows, one for each month!)
```
SELECT 
  month,
  avg((high+low)/2) as avg_price, 
  avg(volume) as avg_volume
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month
  ORDER BY month;
```
The average price for each month and year of data since 2008, ordered by years descending and months ascending.
```
SELECT 
  month,
  year,
  avg((high+low)/2) as avg_price
  FROM tutorial.aapl_historical_stock_price
  WHERE year > 2008
  GROUP BY month, year
  ORDER BY year DESC, month ASC;
```
The average price of days with a trading volume above 25,000,000 shares (just 1 row)
```
SELECT 
  avg((high+low)/2) as avg_price
  FROM tutorial.aapl_historical_stock_price
  WHERE volume > 25000000;
```
The average price on all months with an average daily trading volume above 10,000,000 shares.
```
SELECT avg((high+low)/2) as avg_price
  FROM tutorial.aapl_historical_stock_price
  -- months with an average daily trading volume >10mil shares
  HAVING avg(volume) > 10000000;
```
The lowest and highest prices that Apple stock achieved between 2005 and 2010 (inclusive).
```
SELECT min(low), max(high)
  FROM tutorial.aapl_historical_stock_price
  WHERE year BETWEEN 2005 and 2010;
```
The average daily trading range in months where the stock moved more than $25 (open of month to close of month)
```
-- not 100% sure what 'trading range' is
-- i'm treating it as (high - low)
SELECT month, year, avg(high-low) as range
  FROM tutorial.aapl_historical_stock_price
  GROUP BY high, low, month, year
  HAVING (max(high) - min(low)) > 25
  ORDER BY year;
```
All months in the second half of the year where average daily trading volume was below 10,000,000.
```
SELECT month, year, avg(volume)
  FROM tutorial.aapl_historical_stock_price
  WHERE month > 6
  GROUP BY month, year
  HAVING avg(volume) < 10000000
  ORDER BY year, month;
```
A list of all calendar months by average daily trading volume (so only 12 rows), sorted from highest to lowest.
```
SELECT month, avg(volume)
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month
  ORDER BY avg(volume) desc;
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
Count how many unique prices there are in the data set
```
SELECT COUNT(*)
FROM (
  SELECT low
  FROM tutorial.aapl_historical_stock_price
  UNION
    SELECT high
    FROM tutorial.aapl_historical_stock_price
    UNION
      SELECT open
      FROM tutorial.aapl_historical_stock_price
      UNION
        SELECT close
        FROM tutorial.aapl_historical_stock_price
) AS distinct (COUNT);
```
Return the percentage of unique "open" prices compared to all open prices in the data set
```
-- 2942 distinct, 3541 total
SELECT 
  100 * (COUNT(DISTINCT(open)) / CAST(COUNT(open) AS float))
  FROM tutorial.aapl_historical_stock_price;
```
A listing of all months by their average daily trading volume and a classification that puts this volume into the following categories: "Low" = below 10MM, "Medium" = 10-25 MM, "High" = above 25MM
```
SELECT avg(volume), month, year,
  CASE WHEN avg(volume) < 10000000 THEN 'Low'
       WHEN avg(volume) BETWEEN 10000000 AND 25000000 THEN 'Medium'
       ELSE 'High' END AS trading_volume
  FROM tutorial.aapl_historical_stock_price
  GROUP BY year, month
  ORDER BY trading_volume;
```
A listing of average monthly price plus which quarter of the year they are in (e.g. "Q2" or "Q4").
```
SELECT avg((high+low)/2), month, year,
  CASE WHEN month BETWEEN 1 AND 3 THEN 'Q1'
       WHEN month BETWEEN 4 AND 6 THEN 'Q2'
       WHEN month BETWEEN 7 AND 9 THEN 'Q3'
       ELSE 'Q4' END AS quarter
  FROM tutorial.aapl_historical_stock_price
  GROUP BY year, month
  ORDER BY year;
```
This same listing filtered for only Q4 (use the new column not the months explicitly as part of this filtering).
```
SELECT * from (
    SELECT month, year, 
      CASE WHEN month BETWEEN 10 AND 12 THEN 'Q4' 
        END AS quarter
      FROM tutorial.aapl_historical_stock_price
      GROUP BY year, month
      ORDER BY year ) as test
where quarter = 'Q4';
```




########## benn.college_football_players and benn.college_football_teams

The most common home town of football players
```
select hometown, count(hometown)
  from benn.college_football_players 
  where hometown NOT IN ('--')
  group by hometown
  order by count desc
  LIMIT 1;
```
The total number of players in each of their Freshmen, Sophomore, Junior or Senior years (4 rows)
```
SELECT year, count(*)
FROM benn.college_football_players 
  GROUP BY year;
```
The total number of players in each position
```
SELECT position, count(*)
FROM benn.college_football_players 
  GROUP BY position;
```
The average height of quarterbacks
```
SELECT avg(height)
  FROM benn.college_football_players 
  WHERE position = 'QB';
```
The average height of each position
```
SELECT position, AVG(height)
  FROM benn.college_football_players 
  GROUP BY position;
```
Return 100 football players and which conference they play for
```
SELECT position, AVG(height)
  FROM benn.college_football_players 
  GROUP BY position;
```
The heaviest football player in the SEC
```
SELECT fp.weight, fp.player_name, ft.conference
  FROM benn.college_football_players fp
  JOIN benn.college_football_teams ft 
  ON fp.id = ft.id
  WHERE ft.conference = 'SEC'
  GROUP BY fp.player_name, ft.conference, fp.weight
  ORDER BY fp.weight desc
  LIMIT 1;
```
The top 5 heaviest football players in each conference
```
```
The most common home state of players by conference
```
```
The average height of football players in each conference
```
```
The count of football players in the top 100 of weight who belong to each division
```
```
All players whose home state is Kansas but who went to a school in Missouri
```
```
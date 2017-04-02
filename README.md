# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


DAVID WIESENBERG

## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

QUERIES, QUERIES, QUERIES

tutorial.us_housing_units
-------------------------
1.
SELECT *
  FROM tutorial.us_housing_units
  LIMIT 10

2.
SELECT year, midwest
  FROM tutorial.us_housing_units
  
3.
SELECT *
  FROM tutorial.us_housing_units
  WHERE month_name = 'December'
  AND year >= 1985

4.
SELECT *
  FROM tutorial.us_housing_units
  WHERE month BETWEEN 7 AND 12
  AND year >= 1990
  
5.
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > 30
  
6. 
SELECT *, (south + west + midwest + northeast) AS total
  FROM tutorial.us_housing_units
  
7.
SELECT *, (south + west + midwest + northeast) AS total
  FROM tutorial.us_housing_units
  WHERE (south + west + midwest + northeast) > 70
  
8.
SELECT *, (south + west + midwest + northeast) AS total
  FROM tutorial.us_housing_units
  WHERE (south + west + midwest + northeast) BETWEEN 50 AND 80
  
9.
SELECT *, (south + west + midwest + northeast)/4 AS total
  FROM tutorial.us_housing_units
  
10.
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > (west + midwest + northeast)
  
11.
SELECT south*100/(south + west + midwest + northeast) AS "Percent South",
       west*100/(south + west + midwest + northeast) AS "Percent West",
       midwest*100/(south + west + midwest + northeast) AS "Percent Midwest",
       northeast*100/(south + west + midwest + northeast) AS "Percent Northeast"
  FROM tutorial.us_housing_units
  WHERE year >= 1990
  
tutorial.billboard_top_100_year_end 
-----------------------------------

1.
SELECT *
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist = 'Elvis Presley'

2.
SELECT *
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist ILIKE '%Tony%'

3.
SELECT *
  FROM tutorial.billboard_top_100_year_end 
  WHERE song_name ILIKE '%love%'

4.
SELECT *
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist LIKE 'A%'

5.
SELECT *
  FROM tutorial.billboard_top_100_year_end 
  WHERE year BETWEEN 1960 AND 1969
  AND year_rank <=3

6.
SELECT *
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist = IN ('Elvis Presley', 'The Rolling Stones', 'Van Halen')

7.
SELECT artist
  FROM tutorial.billboard_top_100_year_end 
  GROUP BY artist
  ORDER BY COUNT(*)
  LIMIT 1

8.
SELECT year_rank, artist, COUNT(artist) AS "Number of Hits"
  FROM tutorial.billboard_top_100_year_end 
  GROUP by year_rank, artist
  ORDER BY year_rank, COUNT(artist) DESC

Elvis Presley ... 2
Beatles ......... 2

9.
SELECT *
  FROM tutorial.billboard_top_100_year_end 
  WHERE year = 1970
  AND year_rank BETWEEN 10 AND 20

10. 
SELECT *
  FROM tutorial.billboard_top_100_year_end 
  WHERE year BETWEEN 1990 AND 1999
  AND artist = 'Madonna' 
  AND year_rank < 10

11.
SELECT *
  FROM tutorial.billboard_top_100_year_end 
  WHERE year = 1985
  AND "group" NOT LIKE ('%Madonna%')
  AND "group" NOT LIKE ('%Phil Collins%')
  
12.
SELECT song_name
  FROM tutorial.billboard_top_100_year_end 
  WHERE year_rank = 1
  
13.
SELECT *
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist IS NULL
  
14.
SELECT song_name, year_rank
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist = 'Madonna'
  ORDER BY year_rank

15.
SELECT song_name, year_rank, year
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist = 'Madonna'
  ORDER BY year, year_rank
  
16.
SELECT song_name, year_rank, year
  FROM tutorial.billboard_top_100_year_end 
  WHERE year >= 1990
  ORDER BY year_rank, year
  
INTERMEDIATE

  
tutorial.billboard_top_100_year_end 
-----------------------------------

1. 
SELECT artist, MAX(year_rank) AS max_rank
  FROM tutorial.billboard_top_100_year_end 
  GROUP BY artist
  HAVING artist = 'Phil Collins'

2.
SELECT artist, AVG(year_rank) AS avg_position
  FROM tutorial.billboard_top_100_year_end 
  GROUP BY artist
  HAVING artist = 'Michael Jackson'
  
3.
  SELECT artist,
         CASE WHEN year_rank <= 10 THEN AVG(year_rank)
            ELSE NULL END AS average_in_top_ten
  FROM tutorial.billboard_top_100_year_end 

  GROUP BY artist
  HAVING artist = 'Madonna'
  Note: coud not solve

4.
SELECT artist, COUNT(*) AS "Number of Appearances"
  FROM tutorial.billboard_top_100_year_end 
  WHERE year > 1985
  GROUP BY artist
  ORDER BY "Number of Appearances" DESC
  LIMIT 10

5.
SELECT artist, year_rank, COUNT(DISTINCT song_name) AS "Total Top 10 Hits"
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist IN ('Elvis', 'Madonna', 'Beatles', 'Elton John')
  GROUP BY artist, year_rank
  HAVING year_rank <= 10  ... test procedure

SELECT COUNT(DISTINCT song_name) AS "Total Top 10 Hits"
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist IN ('Elvis', 'Madonna', 'Beatles', 'Elton John')
    AND year_rank <= 10

aapl_historical_stock_price 
---------------------------
1.
SELECT COUNT(date)
  FROM tutorial.aapl_historical_stock_price  
  WHERE (high - low) > 5
  
2. 
SELECT date, MAX(high - low)
  FROM tutorial.aapl_historical_stock_price  
  WHERE year = 2012
  GROUP BY date
  HAVING MAX(high - low) IS NOT NULL
  ORDER BY MAX(high - low) DESC
  LIMIT 1
  
3.
SELECT AVG((open + close)/2)
  FROM tutorial.aapl_historical_stock_price  
  WHERE volume > 10000000
  
4.
SELECT year, month, COUNT(date)
  FROM tutorial.aapl_historical_stock_price  
  WHERE year = 2012
  GROUP by year, month
  ORDER BY month

5.
SELECT year, MAX(high)
  FROM tutorial.aapl_historical_stock_price  
  GROUP by year
  ORDER BY year
  
6.
SELECT month, AVG((open + close)/2) AS avg_price, AVG(volume) AS avg_volume
  FROM tutorial.aapl_historical_stock_price  
  GROUP by month
  ORDER by month
  
7.
SELECT year, month, AVG((open + close)/2) AS avg_price
  FROM tutorial.aapl_historical_stock_price  
  WHERE year >= 2008
  GROUP by year, month
  ORDER by year DESC, month
  
8.
SELECT AVG((open + close)/2) AS avg_price
  FROM tutorial.aapl_historical_stock_price  
  WHERE volume > 25000000
  
9.
SELECT year, month, AVG(volume) AS avg_volume, AVG((open + close)/2) AS avg_price
  FROM tutorial.aapl_historical_stock_price  
  GROUP BY year, month
  HAVING AVG(volume) > 10000000
  ORDER BY year, month
  
10.
SELECT MIN(low) AS min_price, MAX(high)AS max_price
  FROM tutorial.aapl_historical_stock_price  
  WHERE year BETWEEN 2005 AND 2010

11.
SELECT year, month, (MAX(close) - MIN(open)) AS stock_movement, AVG(high - low) AS avg_trading_range
  FROM tutorial.aapl_historical_stock_price  
  GROUP BY year, month
  HAVING (MAX(close) - MIN(open)) > 25
  ORDER BY year, month

12.
SELECT year, month, AVG(volume) AS avg_volume
  FROM tutorial.aapl_historical_stock_price  
  WHERE month BETWEEN 7 AND 12
  GROUP BY year, month
  HAVING AVG(volume) < 10000000
  ORDER BY year, month

13.
SELECT month, AVG(volume) AS avg_volume
  FROM tutorial.aapl_historical_stock_price  
  GROUP BY month
  ORDER BY month
  
14.
SELECT COUNT(DISTINCT month)
  FROM tutorial.aapl_historical_stock_price  

  
15.
SELECT COUNT(DISTINCT year)
  FROM tutorial.aapl_historical_stock_price 

16.
SELECT COUNT(DISTINCT open), COUNT(DISTINCT high), COUNT(DISTINCT low), COUNT(DISTINCT close) 
  FROM tutorial.aapl_historical_stock_price 

17.
SELECT COUNT(DISTINCT open) AS count_uniq_open, COUNT(open) AS count_open, 100*COUNT(DISTINCT open)/COUNT(open) AS percent_distinct
  FROM tutorial.aapl_historical_stock_price 


18. 
SELECT year, month, AVG(volume),
  CASE WHEN AVG(volume) < 10000000 THEN 'below 10 MM'
       WHEN AVG(volume) BETWEEN 10000000 AND 25000000 THEN '10 - 25 MM'
       WHEN AVG(volume) > 25000000 THEN 'above 25 MM'
       ELSE NULL 
       END AS category
  FROM tutorial.aapl_historical_stock_price 
  GROUP BY year, month
  ORDER BY AVG(volume)
  
19.
SELECT year, month,
  CASE WHEN month BETWEEN 1 AND 3 THEN 'Q1'
       WHEN month BETWEEN 4 AND 6 THEN 'Q2'
       WHEN month BETWEEN 7 AND 9 THEN 'Q3'
       WHEN month BETWEEN 10 AND 12 THEN 'Q4'
       ELSE NULL 
       END AS quarter,
       AVG((low + high)/2)
  FROM tutorial.aapl_historical_stock_price 
  GROUP BY year, month
  ORDER BY year, month

20.
SELECT year,
  CASE WHEN month BETWEEN 1 AND 3 THEN 'Q1'
       WHEN month BETWEEN 4 AND 6 THEN 'Q2'
       WHEN month BETWEEN 7 AND 9 THEN 'Q3'
       WHEN month BETWEEN 10 AND 12 THEN 'Q4'
       ELSE NULL 
       END AS "quarter",
       AVG((low + high)/2)
  FROM tutorial.aapl_historical_stock_price 
  GROUP BY year, quarter
  ORDER BY year, quarter
  ... test

  SELECT year,
  CASE WHEN month BETWEEN 1 AND 3 THEN 'Q1'
       WHEN month BETWEEN 4 AND 6 THEN 'Q2'
       WHEN month BETWEEN 7 AND 9 THEN 'Q3'
       WHEN month BETWEEN 10 AND 12 THEN 'Q4'
       ELSE NULL END AS quarter,
       AVG((low + high)/2)
  FROM tutorial.aapl_historical_stock_price 
  WHERE CASE WHEN month BETWEEN 1 AND 3 THEN 'Q1'
       WHEN month BETWEEN 4 AND 6 THEN 'Q2'
       WHEN month BETWEEN 7 AND 9 THEN 'Q3'
       WHEN month BETWEEN 10 AND 12 THEN 'Q4'
       ELSE NULL END = 'Q4'
  GROUP BY year, quarter
  ORDER BY year, quarter
  
  







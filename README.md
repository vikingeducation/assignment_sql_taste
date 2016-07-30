# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

1. SELECT *
    FROM tutorial.us_housing_units
    LIMIT 10
2. SELECT year, month, midwest
      FROM tutorial.us_housing_units
3. SELECT *
    FROM tutorial.us_housing_units
    WHERE month = 12 AND year >=1985
4. SELECT *
    FROM tutorial.us_housing_units
    WHERE month > 6 AND year >=1990
5. SELECT *
    FROM tutorial.us_housing_units
    WHERE south > 30
6. SELECT year, month, month_name,
    south+west+midwest+northeast AS housing_total
    FROM tutorial.us_housing_units
7. SELECT *
    FROM tutorial.us_housing_units
    WHERE south+west+midwest+northeast > 70
8. SELECT *
    FROM tutorial.us_housing_units
    WHERE south+west+midwest+northeast BETWEEN 50 AND 80
9. SELECT *,
    (south+west+midwest+northeast)/4 AS average
    FROM tutorial.us_housing_units
10. SELECT *
    FROM tutorial.us_housing_units
    WHERE south > west+midwest+northeast
11. SELECT *,
    (south/(south+west+midwest+northeast))*100 AS south_percentage,
    (west/(south+west+midwest+northeast))*100 AS west_percentage,
    (midwest/(south+west+midwest+northeast))*100 AS midwest_percentage,
    (northeast/(south+west+midwest+northeast))*100 AS northeast_percentage
    FROM tutorial.us_housing_units

1. SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist LIKE 'Elvis%'
2. SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist ILIKE '%tony%'
3. SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE song_name ILIKE '%love%'
4. SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist ILIKE 'a%'
5. SELECT year, song_name, year_rank
    FROM tutorial.billboard_top_100_year_end
    WHERE (year_rank BETWEEN 1 AND 3) AND year BETWEEN 1960 AND 1969
6. SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist IN ('Elvis Presley', 'Van Halen', 'Rolling Stones')
7. SELECT artist,
      COUNT(artist) AS count
    FROM tutorial.billboard_top_100_year_end
    GROUP by artist
    ORDER by COUNT(artist) desc
8. SELECT artist,
       COUNT(artist) as num_one_count
    FROM tutorial.billboard_top_100_year_end
    WHERE year_rank = 1
    GROUP by artist
    ORDER by COUNT(artist) desc
9. SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE year = 1970 AND year_rank BETWEEN 10 AND 20
10. SELECT *
      FROM tutorial.billboard_top_100_year_end
      WHERE year BETWEEN 1990 AND 1999
      AND artist = 'Madonna' AND year_rank < 10;
11. SELECT *
  FROM tutorial.billboard_top_100_year_end
    WHERE year = 1985
    AND "group" NOT LIKE '%Madonna%'
    AND "group" NOT LIKE '%Phil Collins%'
12. SELECT *
      FROM tutorial.billboard_top_100_year_end
      WHERE year_rank = 1
13. SELECT *
      FROM tutorial.billboard_top_100_year_end
      WHERE artist IS NULL
14. SELECT *
      FROM tutorial.billboard_top_100_year_end
      WHERE artist = 'Madonna'
      ORDER BY year_rank
15. SELECT *
      FROM tutorial.billboard_top_100_year_end
      WHERE artist = 'Madonna'
      ORDER BY year, year_rank
16. SELECT *
      FROM tutorial.billboard_top_100_year_end
      WHERE year >= 1990
      AND year_rank BETWEEN 1 AND 3
      ORDER BY year_rank, year 
### Example

INTERMEDIATE
1. SELECT min(year_rank)
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist = 'Phil Collins'
2. SELECT avg(year_rank)
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist = 'Michael Jackson'
3.SELECT avg(year_rank)
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist = 'Madonna' AND year_rank < 11
4. SELECT artist,
      COUNT(artist) AS count
    FROM tutorial.billboard_top_100_year_end
    WHERE year >=1985
    GROUP by artist
    ORDER by COUNT(artist) desc
    LIMIT 10
5. SELECT artist,
      COUNT(artist) AS count
    FROM tutorial.billboard_top_100_year_end
    WHERE year_rank < 11 AND artist IN ('Elvis Presley','Madonna', 'Beatles', 'Elton John')
    GROUP by artist
6. SELECT count(date)
    FROM tutorial.aapl_historical_stock_price 
    WHERE high-low > 5
7. SELECT max(high-low)
    FROM tutorial.aapl_historical_stock_price 
    WHERE year = 2012
8. SELECT avg(high-low)
    FROM tutorial.aapl_historical_stock_price 
    WHERE volume > 10000000
9. SELECT count(date), month
    FROM tutorial.aapl_historical_stock_price 
    WHERE year = 2012
    GROUP BY month
10. SELECT max(high), year
    FROM tutorial.aapl_historical_stock_price 
    GROUP BY year
11. SELECT avg(high-low), avg(volume),  month
    FROM tutorial.aapl_historical_stock_price 
    GROUP BY month
12. SELECT avg(high-low), month, year
    FROM tutorial.aapl_historical_stock_price 
    GROUP BY year, month
    ORDER BY year DESC, month
13. SELECT avg(high-low)
    FROM tutorial.aapl_historical_stock_price 
    WHERE volume > 25000000   

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

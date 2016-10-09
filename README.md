# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

Tamal Riedman

tutorial.us_housing_units
1.  SELECT *
    FROM tutorial.us_housing_units
    LIMIT 10
2.  Select midwest
    FROM tutorial.us_housing_units
3.  Select *
    FROM tutorial.us_housing_units
    WHERE month = 11
    AND year > 1984
4.  Select *
    FROM tutorial.us_housing_units
    WHERE month > 6
    AND year > 1990
5.  Select *
    FROM tutorial.us_housing_units
    WHERE south > 30
6.  Select year,
       month_name,
       south + west + midwest + northeast AS sum
    FROM tutorial.us_housing_units
7.  SELECT *
    FROM tutorial.us_housing_units
    WHERE (south + west + midwest + northeast) > 70
8.  SELECT year,
       month_name,
       south + west + midwest + northeast AS sum
    FROM tutorial.us_housing_units
    WHERE (south + west + midwest + northeast) > 50
    AND (south + west + midwest + northeast) < 80
9.  SELECT year,
       month_name,
       (south + west + midwest + northeast) / 4 AS average
    FROM tutorial.us_housing_units
10.  SELECT *
     FROM tutorial.us_housing_units
     WHERE south > (west + midwest + northeast)
11.  SELECT south/(south + west + midwest + northeast) AS south,
            west/(south + west + midwest + northeast) AS west,
            midwest/(south + west + midwest + northeast) AS midwest,
            northeast/(south + west + midwest + northeast) AS northeast
     FROM tutorial.us_housing_units
     WHERE year >= 1990

tutorial.billboard_top_100_year_end

1.  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE "group" ILIKE '%Elvis Presley%'
2.  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist ILIKE '%Tony%'
3.  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE song_name ILIKE '%love%'
4.  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist ILIKE 'A%'
5.  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE year_rank <= 3
    AND year BETWEEN 1960 AND 1969
6.  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist IN ('Elvis Presley', 'Rolling Stones', 'Van Halen')
7.  SELECT artist,
    COUNT(*) AS count
    FROM tutorial.billboard_top_100_year_end
    GROUP BY artist
    ORDER BY COUNT(*) DESC
8.  SELECT artist,
    COUNT(artist) AS count
    FROM tutorial.billboard_top_100_year_end
    WHERE year_rank = 1
    GROUP BY artist
    ORDER BY COUNT(*) DESC
9.  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE year >= 1970
    AND year_rank BETWEEN 10 AND 20
10.  SELECT *
     FROM tutorial.billboard_top_100_year_end
     WHERE year >= 1990
     AND NOT ((year_rank BETWEEN 10 AND 100) AND artist = 'Madonna')
11.  SELECT *
     FROM tutorial.billboard_top_100_year_end
     WHERE year >= 1985
     AND artist NOT IN ('Phil Collins', 'Madonna')
12.  SELECT *
     FROM tutorial.billboard_top_100_year_end
     WHERE year_rank = 1
13.  SELECT *
     FROM tutorial.billboard_top_100_year_end
     WHERE artist IS NULL
14.  SELECT *
     FROM tutorial.billboard_top_100_year_end
     WHERE artist = 'Madonna'
     ORDER BY year_rank
15.  SELECT *
     FROM tutorial.billboard_top_100_year_end
     WHERE artist = 'Madonna'
     ORDER BY year, year_rank
16.  SELECT *
     FROM tutorial.billboard_top_100_year_end
     WHERE year_rank <= 3 AND year >= 1990
     ORDER BY year_rank, year
# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries
-------
HOUSING
-------

1)
SELECT *
  FROM tutorial.us_housing_units
  LIMIT 10

2)
SELECT year,
      month,
      month_name,
      midwest
FROM tutorial.us_housing_units

3)
SELECT *
FROM tutorial.us_housing_units
WHERE month = 12 AND year >= 1985

4)
SELECT *
FROM tutorial.us_housing_units
WHERE month > 6 AND year >= 1990

5)
SELECT *
FROM tutorial.us_housing_units
WHERE south > 30

6)
SELECT year,
      month,
      south,
      west,
      midwest,
      northeast,
      (south + west + midwest + northeast) AS sum
FROM tutorial.us_housing_units

7)
SELECT *
FROM tutorial.us_housing_units
WHERE (south + west + midwest + northeast) > 70


**Remember that between is inclusive**
8)
SELECT *
FROM tutorial.us_housing_units
WHERE (south + west + midwest + northeast) BETWEEN 50 AND 80

9)
SELECT year,
      month,
      south,
      west,
      midwest,
      northeast,
      (south + west + midwest + northeast) / 4 AS average
FROM tutorial.us_housing_units

10)
SELECT *
FROM tutorial.us_housing_units
WHERE south > (west + midwest + northeast)

11)
SELECT year,
      south / (south + west + midwest + northeast) * 100 as "south_%",
      west / (south + west + midwest + northeast) * 100 as "west_%",
      midwest / (south + west + midwest + northeast) * 100  as "midwest_%",
      northeast / (south + west + midwest + northeast) * 100 as "northeast_%"
  FROM tutorial.us_housing_units
  WHERE year >= 1990

---------
BILLBOARD
---------
1)
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE "artist" = 'Elvis Presley'

2)
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE "artist" ILIKE '%Tony%'

3)
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE "song_name" ILIKE '%love%'

4)
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE "artist" ILIKE 'a%'

5)
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank IN (1,2,3)
    AND year BETWEEN 1960 AND 1969

6)
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IN ('Elvis Presley', 'Van Halen', 'Rolling Stones')

7)

8)

9)
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1970 AND year_rank BETWEEN 10 AND 20

10)
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year BETWEEN 1990 AND 1999 AND artist = 'Madonna' AND year_rank NOT BETWEEN 10 AND 100

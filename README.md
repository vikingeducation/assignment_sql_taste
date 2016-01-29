# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```
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
  WHERE month = 12
  AND year >= 1985

4.
  SELECT *
  FROM tutorial.us_housing_units
  WHERE month > 6
  AND year >= 1990

5.
  SELECT *
  FROM tutorial.us_housing_units
  WHERE south > 30

6.
  SELECT *,
  south + west + midwest + northeast AS sum
  FROM tutorial.us_housing_units

7.
  SELECT *
  FROM tutorial.us_housing_units
  WHERE ( south + west + midwest + northeast ) > 70

8.
  SELECT *
  FROM tutorial.us_housing_units
  WHERE ( south + west + midwest + northeast )
  BETWEEN 50 AND 80

9.
  SELECT *,
  ( south + west + midwest + northeast ) / 4 AS avg
  FROM tutorial.us_housing_units

10.
  SELECT *
  FROM tutorial.us_housing_units
  WHERE south > ( west + midwest + northeast )

11.
  SELECT year, month, month_name,
  ( south / ( south + west + midwest + northeast ) ) * 100 AS south_pct,
  ( west / ( south + west + midwest + northeast ) ) * 100 AS west_pct,
  ( midwest / ( south + west + midwest + northeast ) ) * 100 AS midwest_pct,
  ( northeast / ( south + west + midwest + northeast ) ) * 100 AS northeast_pct
  FROM tutorial.us_housing_units

Billboard

1.
  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%elvis%presley%'

2.
  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%tony%'

3.
  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE song_name ILIKE '%love%'

4.
  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE 'A%'

5.
  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year BETWEEN 1960 AND 1969
  AND year_rank <=3

6.
  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IN ( 'Elvis Presley', 'Rolling Stones', 'Van Halen' )

7.
  SELECT artist,
  COUNT(artist)
  FROM tutorial.billboard_top_100_year_end
  GROUP BY artist
  ORDER BY count DESC

  Answer: 'Madonna', 'Elvis Presley'

8.
  SELECT artist,
  COUNT(artist)
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1
  GROUP BY artist
  ORDER BY count DESC

  Answer: 'Beatles', 'Elvis Presley'

9.
  SELECT *
  FROM tutorial.billboard_top_100_year_end
  where year = 1970
  AND (year_rank BETWEEN 10 AND 20)

10.
  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%madonna%'
  AND year BETWEEN 1990 AND 1999
  AND NOT year_rank BETWEEN 10 AND 100

11.
  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1985
  AND NOT ("group" ILIKE '%madonna%' 
  OR "group" ILIKE '%phil collins%')

12.
  SELECT song_name
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1

13.
  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IS NULL

14.
  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%madonna%'
  ORDER BY year_rank

15.
  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%madonna%'
  ORDER BY year, year_rank

16.
  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year >= 1990
  AND year_rank <= 3
  ORDER BY year_rank, year

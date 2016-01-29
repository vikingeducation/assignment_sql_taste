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

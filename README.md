# assignment_sql_taste
A delicious appetizer of SQL-ey goodness

Anthony Sin

## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

### tutorial.us_housing_units
```
SELECT *
  FROM tutorial.us_housing_units
  LIMIT 10
```
```
SELECT year, month, month_name, midwest AS "Midwest"
  FROM tutorial.us_housing_units
```
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 12 AND year >= 1985
```
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month > 6 AND year >= 1990
```
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > 30
```
```
SELECT south + west + midwest + northeast AS "Sum"
  FROM tutorial.us_housing_units
```
```
SELECT *, south + west + midwest + northeast AS "Sum"
  FROM tutorial.us_housing_units
  WHERE south + west + midwest + northeast > 70
```
```
SELECT *, south + west + midwest + northeast AS "Sum"
  FROM tutorial.us_housing_units
  WHERE south + west + midwest + northeast BETWEEN 50 AND 80
```
```
SELECT *, (south + west + midwest + northeast) / 4 AS "Average"
  FROM tutorial.us_housing_units
```
```
SELECT *, west + midwest + northeast AS "West, Midwest, and Northeast"
  FROM tutorial.us_housing_units
  WHERE south > (west + midwest + northeast)
```
```
SELECT  *, 
        south / (south + west + midwest + northeast) * 100 AS "South %",
        west / (south + west + midwest + northeast) * 100 AS "West %",
        midwest / (south + west + midwest + northeast) * 100 AS "Midwest %",
        northeast / (south + west + midwest + northeast) * 100 AS "Northeast %"
  FROM tutorial.us_housing_units
  WHERE year >= 1990
```

### tutorial.billboard_top_100_year_end
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Elvis Presley'
```
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%tony%'
```
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE song_name ILIKE '%love%'
```
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist LIKE 'A%'
```
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank <= 3
  AND year BETWEEN 1960 AND 1969
```
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IN ('Elvis Presley','Rolling Stones','Van Halen')
```
```
SELECT artist, COUNT(artist) AS count
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1
  GROUP BY artist
  ORDER BY COUNT(artist) DESC
```
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1970
  AND year_rank BETWEEN 10 and 20
```
```
SELECT * 
  FROM tutorial.billboard_top_100_year_end
  WHERE year BETWEEN 1990 AND 1999
  AND artist = 'Madonna'
  AND year_rank NOT BETWEEN 10 AND 100
```
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1985
  AND "group" NOT ILIKE '%madonna%' 
  AND "group" NOT ILIKE 'phil collins'
```
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1
```
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IS NULL
```
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Madonna'
  ORDER BY year_rank
```
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Madonna'
  ORDER BY year DESC, year_rank
```
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year >= 1990
  AND year_rank <= 3
  ORDER BY year_rank, year
```
# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

1. SELECT *
  FROM tutorial.us_housing_units
  LIMIT 10

2. SELECT midwest,
        year,
        month
  FROM tutorial.us_housing_units

  3. SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 12 AND year >= 1985

  4. SELECT *
  FROM tutorial.us_housing_units
  WHERE month > 6 AND year >= 1990

  5. SELECT *
  FROM tutorial.us_housing_units
  WHERE south > 30

  6. SELECT * ,
  south + west + midwest + northeast AS total
  FROM tutorial.us_housing_units

  7. SELECT * ,
   south + west + midwest + northeast AS total
  FROM tutorial.us_housing_units
  WHERE south + west + midwest + northeast > 70

  8. SELECT * ,
   south + west + midwest + northeast AS total
  FROM tutorial.us_housing_units
  WHERE south + west + midwest + northeast BETWEEN 50 AND 80

  9. SELECT * ,
   (south + west + midwest + northeast)/4 AS average
  FROM tutorial.us_housing_units

  10. SELECT *
  FROM tutorial.us_housing_units
  WHERE south > west + northeast + midwest

  11. SELECT * ,
  south * 100 / (south + west + northeast + midwest) AS south_per,
  west * 100 / (south + west + northeast + midwest) AS west_per,
  midwest * 100 / (south + west + northeast + midwest) AS midwest_per,
  northeast * 100 / (south + west + northeast + midwest) AS northeast_per
  FROM tutorial.us_housing_units
  WHERE year >= 1990

  BILLBOARD

  1. SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%Elvis Presley%'

  2. SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%tony%'

  3. SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE song_name ILIKE '%love%'

  4. SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE 'a%'

  5. SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year BETWEEN 1960 AND 1969
  AND year_rank < 4

  6. SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IN ('Elvis Presley', 'Rolling Stones', 'Van Halen' ) 

  7.

  8.

  9. SELECT * 
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1970 AND year_rank BETWEEN 10 AND 20

  10. SELECT * 
  FROM tutorial.billboard_top_100_year_end
WHERE year BETWEEN 1990 AND 1999 AND ((artist NOT ILIKE '%Madonna%' AND year_rank > 9) OR (year_rank < 10))

11. SELECT * 
  FROM tutorial.billboard_top_100_year_end
WHERE year = 1985 AND ("group" NOT ILIKE '%Madonna%' AND "group" NOT ILIKE '%Phil Collins%')

12. SELECT * 
  FROM tutorial.billboard_top_100_year_end
WHERE year_rank = 1

13. SELECT * 
  FROM tutorial.billboard_top_100_year_end
WHERE artist IS NULL

14. SELECT * 
  FROM tutorial.billboard_top_100_year_end
WHERE artist ILIKE '%Madonna%'
ORDER BY year_rank

15. SELECT * 
  FROM tutorial.billboard_top_100_year_end
WHERE artist ILIKE '%Madonna%'
ORDER BY year_rank, year

16. SELECT * 
  FROM tutorial.billboard_top_100_year_end
WHERE year >= 1990 AND year_rank < 4
ORDER BY year_rank, year

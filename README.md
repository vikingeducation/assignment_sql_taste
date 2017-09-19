# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

TUTORIAL US HOUSING

1. SELECT *
  FROM tutorial.us_housing_units
  LIMIT 10

2. SELECT year, month, month_name, midwest
  FROM tutorial.us_housing_units

3. SELECT *
FROM tutorial.us_housing_units
WHERE month = 12
AND year >= 1985

4. SELECT *
FROM tutorial.us_housing_units
WHERE month > 6
AND year >= 1990

5. SELECT *
FROM tutorial.us_housing_units
WHERE south > 30

6. SELECT year, month, month_name, (south+west+midwest+northeast) as Total
FROM tutorial.us_housing_units

7. SELECT *
FROM tutorial.us_housing_units
WHERE (south+west+midwest+northeast) > 70

8. SELECT *
FROM tutorial.us_housing_units
WHERE (south+west+midwest+northeast) BETWEEN 50 AND 80

9. SELECT year, (south+west+midwest+northeast)/4 as average
FROM tutorial.us_housing_units

10. SELECT *
FROM tutorial.us_housing_units
WHERE south > (west+midwest+northeast)

11. SELECT year, (west/(west+midwest+northeast+south)) * 100 as west_percentage,
(northeast/(west+midwest+northeast+south)) * 100 as northeast_percentage,
(midwest/(west+midwest+northeast+south)) * 100 as midwest_percentage,
(south/(west+midwest+northeast+south)) * 100 as south_percentage
FROM tutorial.us_housing_units


BILLBOARD TOP 100

1. SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "group" ILIKE 'Elvis%' OR artist ILIKE 'Elvis%'

2. SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "group" ILIKE 'Tony%' OR artist ILIKE 'Tony%'

3. SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "song_name" ILIKE '%love%'

4. SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "artist" LIKE 'A%'

5. SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year BETWEEN 1960 AND 1969
AND year_rank BETWEEN 1 AND 3

6. SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist IN ('Elvis Presley', 'Rolling Stones', 'Van Halen')

7. 


### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

# assignment_sql_taste
A delicious appetizer of SQL-ey goodness

By Tyler Ketron.

## Queries
tutorial.us_housing_units

1.
SELECT *
FROM tutorial.us_housing_units LIMIT 10

2.
SELECT year, month, month_name, midwest
FROM tutorial.us_housing_units

3.
SELECT *
FROM tutorial.us_housing_units
WHERE year >= 1985 AND month = 12

4.
SELECT *
FROM tutorial.us_housing_units
WHERE year >= 1990 AND month > 6

5.
SELECT *
FROM tutorial.us_housing_units
WHERE south > 30

6.
SELECT *
(south + west + midwest + northeast) AS total
FROM tutorial.us_housing_units

7.
SELECT *
FROM tutorial.us_housing_units
WHERE (south + west + midwest + northeast) > 70

8.
SELECT *
FROM tutorial.us_housing_units
WHERE (south + west + midwest + northeast) BETWEEN 50 AND 80

9.
SELECT year, month, month_name,
(south + west + midwest + northeast) / 4 AS average
FROM tutorial.us_housing_units

10.
SELECT *
FROM tutorial.us_housing_units
WHERE south > (west + midwest + northeast)

11.
SELECT year, month, month_name,
south / (south + west + midwest + northeast) AS south_percentage,
west / (south + west + midwest + northeast) AS west_percentage,
midwest / (south + west + midwest + northeast) AS midwest_percentage,
northeast / (south + west + midwest + northeast) AS northeast_percentage
FROM tutorial.us_housing_units


tutorial.billboard_top_100_year_end

1.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "group" = 'Elvis Presley'

2.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "artist" ILIKE '%tony%'

3.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "song_name" ILIKE '%love%'

4.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "artist" ILIKE 'a%'

5.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank <=3 AND year BETWEEN 1960 AND 1969

6.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE (artist = 'Elvis Presley')
OR artist = 'The Rolling Stones'
OR artist = 'Van Halen'

7.
SELECT artist,
  COUNT(* AS count
FROM tutorial.billboard_top_100_year_end
GROUP BY artist
ORDER BY count DESC

8.
SELECT artist,
  COUNT(* AS count
FROM tutorial.billboard_top_100_year_end
WHERE year_rank = 1
GROUP BY artist
ORDER BY count DESC

9.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE (year_rank BETWEEN 10 AND 20) AND (year = 1970)

10.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE (year_rank BETWEEN 10 AND 100)
AND (year BETWEEN 1990 AND 2000)
AND (artist != 'Madonna')

11.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year = '1985'
AND ("group" NOT LIKE '%Madonna%')
AND ("group" NOT LIKE '%Phil Collins%')

12.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank = '1'

13.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist IS NULL

14.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Madonna'
ORDER BY year_rank

15.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Madonna'
ORDER BY year, year_rank

16.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank IN (1, 2, 3)
AND (year >= '1990')
ORDER BY year_rank, year





### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

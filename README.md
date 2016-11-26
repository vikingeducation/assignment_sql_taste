# assignment_sql_taste
A delicious appetizer of SQL-ey goodness

Dexter Ford
Jessica Gillan

## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```
BASIC

1.
SELECT *
FROM tutorial.housing_units_completed_us
LIMIT 10

2.
SELECT midwest
FROM tutorial.housing_units_completed_us

3.
SELECT *
FROM tutorial.housing_units_completed_us
WHERE month = 12 AND year >= 1985

4.
SELECT *
FROM tutorial.housing_units_completed_us
WHERE month > 6 AND year >= 1990

5.
SELECT *
FROM tutorial.housing_units_completed_us
WHERE south > 30

6.
SELECT *,
  south + west + midwest + northeast AS "All Houses!"
FROM tutorial.housing_units_completed_us

7.
SELECT *,
  south + west + midwest + northeast AS "All houses"
FROM tutorial.housing_units_completed_us
WHERE (south + west + midwest + northeast) > 70

8.
SELECT *,
  south + west + midwest + northeast AS "All houses"
FROM tutorial.housing_units_completed_us
WHERE (south + west + midwest + northeast) BETWEEN 50 AND 80

9.
SELECT *,
  (south + west + midwest + northeast) / 4 AS "Average"
FROM tutorial.housing_units_completed_us

10.
SELECT *
FROM tutorial.housing_units_completed_us
WHERE south > (west + midwest + northeast)

11.
SELECT year, month,
  west / (midwest + south + northeast) * 100 AS "% in West",
  midwest / (west + south + northeast) * 100 AS "% in Midwest",
  south / (west + midwest + northeast) * 100 AS "% in South",
  northeast / (west + south + midwest) * 100 AS "% in Northeast"
FROM tutorial.housing_units_completed_us
WHERE year >= 1990

1.
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE "group" ILIKE '%elvis presley%'

2.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "artist" ILIKE '%tony%'

3.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE song_name ILIKE '%love%' OR song_name ILIKE '%loving%'

4.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist ILIKE 'a%'

5.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank <= 3
AND year BETWEEN 1960 AND 1969

6.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist IN ('Elvis Presley', 'Rolling Stones', 'Van Halen')

7.
SELECT artist,
COUNT(artist) AS "Number of Top Hits"
FROM tutorial.billboard_top_100_year_end
GROUP BY artist
ORDER BY "Number of Top Hits" DESC

8.
**??
SELECT artist, 
COUNT(artist) AS "Number of Top Hits" 
FROM tutorial.billboard_top_100_year_end 
WHERE year_rank = 1
GROUP BY artist
ORDER BY "Number of Top Hits" DESC
??**

9.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year = 1970 AND year_rank BETWEEN 10 AND 20

10.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year BETWEEN 1990 AND 1999
AND ((( year_rank BETWEEN 10 AND 100 ) AND artist NOT ILIKE 'madonna')
OR year_rank BETWEEN 1 AND 9 )
ORDER BY artist

11.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year = 1985
AND "group" NOT ILIKE '%phil collins%'
AND "group" NOT ILIKE '%madonna%'

12.
SELECT *
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
AND year_rank IN (1, 2, 3)
ORDER BY year_rank, year
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

7. SELECT artist, COUNT(*) AS count
  FROM tutorial.billboard_top_100_year_end
  GROUP BY artist
  ORDER BY count DESC

8. SELECT artist, COUNT(*) AS count
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1
  GROUP BY artist
  ORDER BY count DESC

9. SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1970
  AND year_rank BETWEEN 10 AND 20

10. SELECT * 
  FROM tutorial.billboard_top_100_year_end
  WHERE year BETWEEN 1990 AND 1999
  AND NOT (artist = 'Madonna' AND year_rank <= 10)

11. SELECT * 
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1985
  AND NOT (artist ILIKE '%Madonna%' OR artist ILIKE '%Phil Collins%')

12. SELECT * 
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = '1'

13. SELECT * 
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IS null

14. SELECT * 
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%Madonna%'
  ORDER BY year_rank

15. SELECT * 
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%Madonna%'
  ORDER BY year, year_rank

16. SELECT * 
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank < 4
  AND year > 1989
  ORDER BY year_rank, year


Intermediate Stuff

* Phil Collins Top
SELECT * 
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%Phil Collins%'
  ORDER BY year_rank

* Michael Jackson Average
SELECT SUM(year_rank) / COUNT(*) AS average
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%Michael Jackson%'

* Madonna Top 10 Average
SELECT SUM(year_rank) / COUNT(*) AS average
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%Madonna%'
  AND year_rank < 11

* Winningest Artists Since 1985
SELECT artist, COUNT(*) as appearances
  FROM tutorial.billboard_top_100_year_end
  WHERE year > 1984
  GROUP BY artist
  ORDER BY appearances DESC
  LIMIT 10

* Top Hit Team Total
SELECT COUNT(*) as hits
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IN ('Elvis Presley', 'Madonna', 'Beatles', 'Elton John')

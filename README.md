# assignment_sql_taste
A delicious appetizer of SQL-ey goodness

Sean Kelly
## Queries

### Example

1.
SELECT *
  FROM tutorial.us_housing_units
  LIMIT 10

2.
SELECT year, month_name, midwest
  FROM tutorial.us_housing_units

3.
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 12 AND year > 1985

4.
SELECT *
  FROM tutorial.us_housing_units
  WHERE month > 6 AND year > 1990

5.
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > 30

6.
SELECT year, month, month_name, (south + west + midwest + northeast) as total
  FROM tutorial.us_housing_units

7.
SELECT *
  FROM tutorial.us_housing_units
  WHERE (south + west + midwest + northeast) > 70

8.
SELECT *
  FROM tutorial.us_housing_units
  WHERE (midwest + south + northeast + west) > 50
  AND (midwest + south + northeast + west) < 80

9.
SELECT year, month, (midwest + south + northeast + west) / 4 AS avg
  FROM tutorial.us_housing_units

10.
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > (northeast + west + midwest)

11.
SELECT year, month, south / total AS south, west / total AS west, midwest / total AS midwest, northeast / total AS northeast
FROM
  (SELECT *, (south + west + midwest + northeast) as total
    FROM tutorial.us_housing_units
    WHERE year >= 1990) AS sum


tutorial.billboard_top_100_year_end

1.
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE "group" = 'Elvis Presley'

2.
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE "artist" ILIKE 'Tony%'

3.
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE song_name ILIKE '%love%'

4.
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE 'A%'

5.
SELECT song_name, year_rank
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank BETWEEN 1 AND 3
  AND year BETWEEN 1960 AND 1969

6.
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Elvis Presley' OR artist = 'Rolling Stones'
  OR artist = 'Van Halen'

7.
SELECT COUNT(artist) as count, artist
  FROM tutorial.billboard_top_100_year_end
  GROUP BY artist
  ORDER BY count DESC
  LIMIT 1

8.

# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

10 results with information on all columns

SELECT *
  FROM tutorial.us_housing_units LIMIT 10

Housing starts in the Midwest

SELECT year, month, month_name, midwest
  FROM tutorial.us_housing_units

All housing starts in December since 1985

SELECT *
  FROM tutorial.us_housing_units WHERE month_name='December' AND year>1985

All housing starts in the second half of the year since 1990


  SELECT *
  FROM tutorial.us_housing_units WHERE month>6 AND year>1990

All rows where housing starts were above 30,000 in the South region

  SELECT *
  FROM tutorial.us_housing_units WHERE south>30

The sum of housing starts across all regions for each row

  SELECT year, month, month_name, south+midwest+northeast+west AS total_sum
  FROM tutorial.us_housing_units


All rows where the sum of all housing starts is above 70,000 Note: You can't use an alias in a WHERE clause

  SELECT year, month, month_name, south+midwest+northeast+west AS total_sum
  FROM tutorial.us_housing_units WHERE south+midwest+northeast+west > 70

.
All rows where the sum of all housing starts is between 50-80k


  SELECT year, month, month_name, south+midwest+northeast+west AS total_sum
  FROM tutorial.us_housing_units WHERE south+midwest+northeast+west > 50 AND south+midwest+northeast+west < 80


The average of all housing starts across all regions for each row

SELECT year, month, month_name, (south+midwest+northeast+west)/4 AS avg
  FROM tutorial.us_housing_units


All rows where the housing starts in the South are above the sum of the other three regions

SELECT *
  FROM tutorial.us_housing_units WHERE south > (midwest+northeast+west)

The percentage of housing starts that occur in each region since 1990 Note: Use an alias to title the new columns appropriately

SELECT year,month,month_name,
((south)/(south+west+midwest+northeast))*100 AS south_percentage,
((west)/(south+west+midwest+northeast))*100 AS west_percentage,
((midwest)/(south+west+midwest+northeast))*100 AS midwest_percentage,
((northeast)/(south+west+midwest+northeast))*100 AS northeast_percentage

  FROM tutorial.us_housing_units WHERE year >  1990


tutorial.billboard_top_100_year_end
====================================

Note: Use single quotes ' instead of double quotes " for LIKE and similar queries since the Mode tool is very particular about its syntax. Double quotes are used to specify column names, so you might get a "column XYZ does not exist" error if you mess this up.

1. All rows where Elvis Presley had a song on the top 100 charts
select * from
tutorial.billboard_top_100_year_end where artist = 'Elvis Presley'
All rows where the artist's name contained "Tony" (not case sensitive)
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "artist" ILIKE '%Tony%'
All rows where the song title contained the word "love" in any way
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "song_name" ILIKE '%love%'
All rows where the artist's name begins with the letter "A"

SELECT *
  FROM tutorial.billboard_top_100_year_end WHERE "artist" ILIKE 'a%'

The top 3 songs from each year between 1960-1969

SELECT *
  FROM tutorial.billboard_top_100_year_end WHERE year > 1960 and year <1970 and year_rank <4

All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist

  SELECT *
  FROM tutorial.billboard_top_100_year_end WHERE "group"='Van Halen'
  or "group"='Rolling Stones'
  or "group"='Elvis Presley'

Which artist has had the most appearances on the top 100 list?
SELECT "artist", COUNT(artist) AS value_occurence
  FROM tutorial.billboard_top_100_year_end
  GROUP BY "artist"
  ORDER BY value_occurence DESC
  LIMIT 1;

Which artist has had the most #1 hits? How many?
SELECT "artist", COUNT(artist) AS count_value
from tutorial.billboard_top_100_year_end
where year_rank < 2
GROUP BY "artist"
ORDER BY count_value DESC
LIMIT 1;

All rows from 1970 where the songs were ranked 10-20th
SELECT * FROM tutorial.billboard_top_100_year_end
WHERE year_rank > 9 AND year_rank < 21 AND year = 1970

All rows from the 1990's where Madonna was not ranked 10-100th
SELECT * FROM tutorial.billboard_top_100_year_end
WHERE year >= 1990 AND year < 2000 AND (artist != 'Madonna' OR year_rank < 10)

All rows from 1985 which do not include Madonna or Phil Collins in the group.
SELECT * FROM tutorial.billboard_top_100_year_end


WHERE year = 1985 AND "group" NOT ILIKE  '%Madonna%' AND "group" NOT ILIKE '%Phil Collins%'

All number 1 songs in the data set.
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank=1

All rows where the artist is not listed

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist IS NULL

All of Madonna's top 100 hits ordered by their ranking (1 to 100)

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "artist"='Madonna'
ORDER BY year_rank


All of Madonna's top 100 hits ordered by their ranking within each year

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "artist"='Madonna'
ORDER BY year, year_rank


Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990. (Hint: Multiple ordering)

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank <4 AND year > 1990
ORDER BY year_rank, year
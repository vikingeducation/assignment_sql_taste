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
The top 3 songs from each year between 1960-1969
All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist
Which artist has had the most appearances on the top 100 list?
Which artist has had the most #1 hits? How many?
All rows from 1970 where the songs were ranked 10-20th
All rows from the 1990's where Madonna was not ranked 10-100th
All rows from 1985 which do not include Madonna or Phil Collins in the group.
All number 1 songs in the data set.
All rows where the artist is not listed
All of Madonna's top 100 hits ordered by their ranking (1 to 100)
All of Madonna's top 100 hits ordered by their ranking within each year
Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990. (Hint: Multiple ordering)

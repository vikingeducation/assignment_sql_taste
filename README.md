Assignment completed by [Stephen Mayeux](http://stephenmayeux.com)

# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

### Housing Units

10 results with information on all columns
```
SELECT *
  FROM tutorial.us_housing_units
  LIMIT 10
```

Housing stats in the Midwest
```
SELECT year, month_name, midwest AS "Midwest"
  FROM tutorial.us_housing_units
```

All housing stats in December since 1985
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month_name = 'December'
  AND year >= 1985
```

All housing stats in the second half of the year since 1990
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month IN (7,8,9,10,11,12)
  AND year >= 1990
```

All rows where housing starts were above 30,000 in the South region
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > 30
```

The sum of housing stats across all regions for each row
```
SELECT
  year,
  month,
  month_name,
  south + west + midwest + northeast AS "Sum of Regions"
  FROM tutorial.us_housing_units
```

All rows where the sum of all housing stats is above 70,000 *Note: You can't use an alias in a WHERE clause.*
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE (south + west + midwest + northeast) > 70
```

All rows where the sum of all housing stats is between 50-80k
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE (south + west + midwest + northeast) BETWEEN 50 AND 80
```

The average of all housing stats across all regions for each row
```
SELECT *,
  (south + west + midwest + northeast) / 4 AS "Averages"
  FROM tutorial.us_housing_units
```

All rows where the housing stats in the South are above the sum of the other three regions
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE (west + midwest + northeast) < south
```

The percentage of housing stats that occur in each region since 1990 *Note: Use an alias to title the new columns appropriately*
```
SELECT *,
  (south / (south + west + midwest + northeast)) * 100 as "South Percentage",
  (west / (south + west + midwest + northeast)) * 100 as "West Percentage",
  (midwest / (south + west + midwest + northeast)) * 100 as "Midwest Percentage",
  (northeast / (south + west + midwest + northeast)) * 100 as "Northeast Percentage"
  FROM tutorial.us_housing_units
```

### Billboard Charts

All rows where Elvis Presley had a song on the top 100 charts
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE "group" = 'Elvis Presley'
```

All rows where the artist's name contained "Tony" (not case sensitive)
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%Tony%'
```

All rows where the song title contained the word "love" in any way
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE song_name ILIKE '%love%'
```

All rows where the artist's name begins with the letter "A"
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist LIKE 'A%'
```

The top 3 songs from each year between 1960-1969
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank IN (1,2,3)
  AND year BETWEEN 1960 AND 1969
```

All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IN ('Elvis Presley', 'The Rolling Stones', 'Van Halen')
```

Which artist has had the most appearances on the top 100 list?
```
SELECT artist
  FROM tutorial.billboard_top_100_year_end
  GROUP BY artist
  ORDER BY COUNT(*) DESC
  LIMIT 1
```
Madonna!

Which artist has had the most #1 hits? How many?
```
SELECT COUNT(*) as count, artist
  FROM tutorial.billboard_top_100_year_end
  GROUP BY artist
  ORDER BY count DESC
  LIMIT 3
```

All rows from 1970 where the songs were ranked 10-20th
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1970
  AND year_rank BETWEEN 10 AND 20
```

All rows from the 1990's where Madonna was not ranked 10-100th
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Madonna' AND
  year BETWEEN 1990 AND 1999 AND
  year_rank BETWEEN 1 AND 9
```

All rows from 1985 which do not include Madonna or Phil Collins in the group.
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1985 AND
  artist NOT ILIKE '%Madonna%' AND
  artist NOT ILIKE '%Phil Collins%'
```

All number 1 songs in the data set.
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1
```

All rows where the artist is not listed
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IS NULL
```

All of Madonna's top 100 hits ordered by their ranking (1 to 100)
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Madonna'
  ORDER BY year_rank
```

All of Madonna's top 100 hits ordered by their ranking within each year
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Madonna'
  ORDER BY year, year_rank
```

Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990.
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank IN (1, 2, 3) AND
  year BETWEEN 1990 AND 2014
  ORDER BY year_rank, year
```

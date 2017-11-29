# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries
10 results with information on all columns
```
SELECT *
  FROM tutorial.us_housing_units
  LIMIT 10
```

Housing starts in the Midwest
```
SELECT midwest
  FROM tutorial.us_housing_units
```

All housing starts in December since 1985
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 12 AND year >= 1985
```

All housing starts in the second half of the year since 1990
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month > 6 AND year >= 1990
```

All rows where housing starts were above 30,000 in the South region
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > 30
```

The sum of housing starts across all regions for each row
```
SELECT year, month, month_name, south + west + midwest + northeast AS sum
  FROM tutorial.us_housing_units
```

All rows where the sum of all housing starts is above 70,000 Note: You can't use an alias in a WHERE clause.
```
SELECT year, month, month_name, south + west + midwest + northeast AS sum
  FROM tutorial.us_housing_units
  WHERE south + west + midwest + northeast > 70
```

All rows where the sum of all housing starts is between 50-80k
```
SELECT year, month, month_name, south + west + midwest + northeast AS sum
  FROM tutorial.us_housing_units
  WHERE south + west + midwest + northeast > 50 AND south + west + midwest + northeast > 80
```

The average of all housing starts across all regions for each row
```
SELECT year, month, month_name, (south + west + midwest + northeast)/4 AS avg
  FROM tutorial.us_housing_units
```

All rows where the housing starts in the South are above the sum of the other three regions
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > (west + northeast + midwest)
```

The percentage of housing starts that occur in each region since 1990 Note: Use an alias to title the new columns appropriately
```
SELECT year, month, month_name, south/(south + west + midwest + northeast) AS south, west/(south + west + midwest + northeast) AS west, midwest/(south + west + midwest + northeast) AS midwest, northeast/(south + west + midwest + northeast) AS northeast
  FROM tutorial.us_housing_units
  WHERE year > 1990
```


### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

All rows where Elvis Presley had a song on the top 100 charts
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist='Elvis Presley'
```

All rows where the artist's name contained "Tony" (not case sensitive)
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  LIKE upper(artist) LIKE '%TONY%'
```

All rows where the song title contained the word "love" in any way
```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE song_name LIKE '%love%'
```
All rows where the artist's name begins with the letter "A"
```

```
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

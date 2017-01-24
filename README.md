# assignment_sql_taste
A delicious appetizer of SQL-ey goodness

Author : Behdad Analui

## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```


/*********************************   tutorial.us_housing_units *********************************/

1) 10 results with information on all columns

```
SELECT *
  FROM tutorial.us_housing_units
  LIMIT 10
```

2) Housing starts in the Midwest

```
SELECT midwest AS "Midwest"
  FROM tutorial.us_housing_units
```

3) All housing starts in December since 1985

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 12
  AND year >= 1985
```

4) All housing starts in the second half of the year since 1990

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month > 6
  AND year >= 1990
```

5) All rows where housing starts were above 30,000 in the South region

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > 30
```

6) The sum of housing starts across all regions for each row

```
SELECT *,
      (west + south + midwest + northeast) AS sum
  FROM tutorial.us_housing_units
```

7) All rows where the sum of all housing starts is above 70,000 Note: You can't use an alias in a WHERE clause.

```
SELECT *, (west + south + midwest + northeast) AS sum
  FROM tutorial.us_housing_units
  WHERE ((west + south + midwest + northeast) > 70)
```

8) All rows where the sum of all housing starts is between 50-80k

```
SELECT *, (west + south + midwest + northeast) AS sum
  FROM tutorial.us_housing_units
  WHERE (west + south + midwest + northeast) BETWEEN 50 AND 80
```

9) The average of all housing starts across all regions for each row

```
SELECT *, (west + south + midwest + northeast)/4 AS average
  FROM tutorial.us_housing_units
```

10) All rows where the housing starts in the South are above the sum of the other three regions

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE (south > (west + midwest + northeast))
```

11)The percentage of housing starts that occur in each region since 1990 Note: Use an alias to title the new columns appropriately

```
SELECT *, 
      (west)/(west + northeast + south + midwest)*100 AS west_percentage,
      (south)/(west + northeast + south + midwest)*100 AS south_percentage,
      (northeast)/(west + northeast + south + midwest)*100 AS northeast_percentage,
      (midwest)/(west + northeast + south + midwest)*100 AS midwest_percentage
  FROM tutorial.us_housing_units
  WHERE year >= 1990
```

/*********************************   tutorial.billboard_top_100_year_end *********************************/

1) All rows where Elvis Presley had a song on the top 100 charts

```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE "group" = 'Elvis Presley'
```

2) All rows where the artist's name contained "Tony" (not case sensitive)

```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%tony%'
```

3) All rows where the song title contained the word "love" in any way

```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE song_name ILIKE '%love%'
```

4) All rows where the artist's name begins with the letter "A"

```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist LIKE 'A%'
```

5) The top 3 songs from each year between 1960-1969

```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank <= 3
  AND year BETWEEN 1960 AND 1969
```

6) All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist

```
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IN ('Elvis Presley','Rolling Stones','Van Halen')
```

7) Which artist has had the most appearances on the top 100 list?

```
SELECT artist,
      COUNT(artist) AS "Artist Appearance"
    FROM tutorial.billboard_top_100_year_end
    GROUP BY "artist"
    ORDER BY "Artist Appearance" DESC
```

Madonna, Elvis Presley 36

8) Which artist has had the most #1 hits? How many?

```
SELECT artist,
      COUNT(artist) AS "Artist Appearance"
    FROM tutorial.billboard_top_100_year_end
    WHERE year_rank = 1
    GROUP BY artist
    ORDER BY "Artist Appearance" DESC
```

Beattles and Elvis Presley --> 2


9) All rows from 1970 where the songs were ranked 10-20th

```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year = 1970
AND year_rank BETWEEN 10 and 20
```

10) All rows from the 1990's where Madonna was not ranked 10-100th

```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year BETWEEN 1990 AND 1999
AND (artist != 'Madonna' OR year_rank < 10)
```

11) All rows from 1985 which do not include Madonna or Phil Collins in the group.

```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year = 1985
AND ("group" NOT ILIKE '%madonna%' AND "group" NOT ILIKE 'phil collins')
```

12) All number 1 songs in the data set.

```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank = 1
```

13) All rows where the artist is not listed

```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist IS NULL
```

14) All of Madonna's top 100 hits ordered by their ranking (1 to 100)

```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist ILIKE '%madonna%'
ORDER BY year_rank
```

15) All of Madonna's top 100 hits ordered by their ranking within each year

```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist ILIKE '%madonna%'
ORDER BY year, year_rank
```

16) Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990. (Hint: Multiple ordering)

```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year >= 1990
AND year_rank IN (1,2,3)
ORDER BY year_rank,year
```

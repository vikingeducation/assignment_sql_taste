# assignment_sql_taste
A delicious appetizer of SQL-ey goodness

#-Deepak

## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

## tutorial.us_housing_units
### 10 results with information on all columns
```sql
SELECT *
  FROM tutorial.us_housing_units
 LIMIT 10
```
### Housing starts in the Midwest
```sql
SELECT midwest
  FROM tutorial.us_housing_units
```
### All housing starts in December since 1985
```sql
SELECT *
  FROM tutorial.us_housing_units
 WHERE month = 11
   AND year >= 1985
```
### All housing starts in the second half of the year since 1990
```sql
SELECT *
  FROM tutorial.us_housing_units
 WHERE month > 6
   AND year >= 1990
```
### All rows where housing starts were above 30,000 in the South region
```sql
SELECT *
  FROM tutorial.us_housing_units
 WHERE south > 30
```
### The sum of housing starts across all regions for each row
```sql
SELECT year,
       month_name,
       south + west + midwest + northeast AS sum
  FROM tutorial.us_housing_units
```
### All rows where the sum of all housing starts is above 70,000 Note: You can't use an alias in a WHERE clause.
```sql
SELECT *
  FROM tutorial.us_housing_units
 WHERE (south + west + midwest + northeast) > 70
```
### All rows where the sum of all housing starts is between 50-80k
```sql
SELECT *
  FROM tutorial.us_housing_units
 WHERE (south + west + midwest + northeast) BETWEEN 50 AND 80
```
### The average of all housing starts across all regions for each row
```sql
SELECT year,
       month_name,
       (south + west + midwest + northeast)/4 AS average
  FROM tutorial.us_housing_units
```
### All rows where the housing starts in the South are above the sum of the other three regions
```sql
SELECT *
  FROM tutorial.us_housing_units
 WHERE south > (west + midwest + northeast)
```
### The percentage of housing starts that occur in each region since 1990 Note: Use an alias to title the new columns appropriately
```sql
SELECT south/(south + west + midwest + northeast) AS south,
       west/(south + west + midwest + northeast) AS west,
       midwest/(south + west + midwest + northeast) AS midwest,
       northeast/(south + west + midwest + northeast) AS northeast
  FROM tutorial.us_housing_units
 WHERE year >= 1990
```

## tutorial.billboard_top_100_year_end
### All rows where Elvis Presley had a song on the top 100 charts
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" LIKE '%Elvis Presley%'
```
### All rows where the artist's name contained "Tony" (not case sensitive)
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist LIKE '%Tony%'
```
### All rows where the song title contained the word "love" in any way
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE song_name LIKE '%love%'
```
### All rows where the artist's name begins with the letter "A"
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist LIKE 'A%'
```
### The top 3 songs from each year between 1960-1969
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank <= 3
   AND year BETWEEN 1960 AND 1969
```
### All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist IN ('Elvis Presley', 'Rolling Stones', 'Van Halen')
```
### Which artist has had the most appearances on the top 100 list?
```sql
SELECT artist,
       COUNT(*) AS count
  FROM tutorial.billboard_top_100_year_end
 GROUP BY artist
 ORDER BY COUNT(*) DESC
```
### Which artist has had the most #1 hits? How many?
```sql
SELECT artist,
       COUNT(artist) AS count
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank = 1
 GROUP BY artist
 ORDER BY COUNT(*) DESC
```
### All rows from 1970 where the songs were ranked 10-20th
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year >= 1970
   AND year_rank BETWEEN 10 AND 20
```
### All rows from the 1990's where Madonna was not ranked 10-100th
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year >= 1990
   AND NOT ((year_rank BETWEEN 10 AND 100) AND artist = 'Madonna')
```
### All rows from 1985 which do not include Madonna or Phil Collins in the group.
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year >= 1985
   AND artist NOT IN ('Phil Collins', 'Madonna')
```
### All number 1 songs in the data set.
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank = 1
```
### All rows where the artist is not listed
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist IS NULL
```
### All of Madonna's top 100 hits ordered by their ranking (1 to 100)
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist = 'Madonna'
 ORDER BY year_rank
```
### All of Madonna's top 100 hits ordered by their ranking within each year
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist = 'Madonna'
 ORDER BY year, year_rank
```
### Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990. (Hint: Multiple ordering)
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank <= 3 AND year >= 1990
 ORDER BY year_rank, year
```
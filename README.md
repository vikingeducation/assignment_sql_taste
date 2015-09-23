# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

tutorial.us_housing_units

10 results with information on all columns
SELECT *
  FROM tutorial.us_housing_units
  LIMIT 10;

Housing starts in the Midwest
SELECT midwest
  FROM tutorial.us_housing_units;

All housing starts in December since 1985
SELECT *
  FROM tutorial.us_housing_units
  WHERE month_name = 'December'
  AND year >= 1985

All housing starts in the second half of the year since 1990
SELECT *
  FROM tutorial.us_housing_units
  WHERE month >= 7
  AND year >= 1990;

All rows where housing starts were above 30,000 in the South region
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > 30;

The sum of housing starts across all regions for each row
SELECT south + west + midwest + northeast AS sum_across_regions
  FROM tutorial.us_housing_units;

All rows where the sum of all housing starts is above 70,000 Note: You can't use an alias in a WHERE clause.
SELECT *
  FROM tutorial.us_housing_units
  WHERE (south + west + midwest + northeast) > 70;

All rows where the sum of all housing starts is between 50-80k
SELECT *
  FROM tutorial.us_housing_units
  WHERE (south + west + midwest + northeast) >= 50
  AND (south + west + midwest + northeast) <= 80;

The average of all housing starts across all regions for each row
SELECT (south + west + midwest + northeast)/4 as avg_across_regions
  FROM tutorial.us_housing_units;

All rows where the housing starts in the South are above the sum of the other three regions
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > (west + midwest + northeast)

The percentage of housing starts that occur in each region since 1990 Note: Use an alias to title the new columns appropriately
SELECT
  south / (south + west + midwest + northeast) as south_percentage,
  west / (south + west + midwest + northeast) as west_percentage,
  midwest / (south + west + midwest + northeast) as midwest_percentage,
  northeast / (south + west + midwest + northeast) as northeast_percentage
  FROM tutorial.us_housing_units





tutorial.billboard_top_100_year_end

All rows where Elvis Presley had a song on the top 100 charts
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Elvis Presley';

All rows where the artist's name contained "Tony" (not case sensitive)
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE LOWER(artist) LIKE '%tony%';

All rows where the song title contained the word "love" in any way
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE LOWER(song_name) LIKE '%love%';

All rows where the artist's name begins with the letter "A"
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist LIKE 'A%';

The top 3 songs from each year between 1960-1969
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank BETWEEN 1 AND 3
  AND year BETWEEN 1960 AND 1969;

All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Elvis Presley' OR
        artist = 'The Rolling Stones' OR
        artist = 'Van Halen';

Which artist has had the most appearances on the top 100 list?
Madonna and Elvis Presley

SELECT artist, count(artist)
  FROM tutorial.billboard_top_100_year_end
  GROUP BY artist
  ORDER BY count(artist) DESC;

Which artist has had the most #1 hits? How many?
Beatles and Elvis Presley

SELECT artist, count(artist)
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1
  group BY artist
  order BY count(artist) DESC;

All rows from 1970 where the songs were ranked 10-20th
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year >= 1970
  AND year_rank BETWEEN 10 AND 20;

All rows from the 1990's where Madonna was not ranked 10-100th
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year BETWEEN 1990 AND 1999
  AND artist = 'Madonna'
  AND year_rank BETWEEN 1 AND 9;

All rows from 1985 which do not include Madonna or Phil Collins in the group.
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year >= 1985
  AND "group" NOT LIKE '%Madonna%'
  AND "group" NOT LIKE '%Phil Collins%';

All number 1 songs in the data set.
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1;

All rows where the artist is not listed
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist is NULL;

All of Madonna's top 100 hits ordered by their ranking (1 to 100)
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Madonna'
  order BY year_rank ASC;

All of Madonna's top 100 hits ordered by their ranking within each year
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Madonna'
  order BY year ASC;

Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990. (Hint: Multiple ordering)
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank in (1, 2, 3)
  AND year >= 1990
  order BY year ASC;
# Practice with SQL

[Mode Analytics](https://community.modeanalytics.com/sql/tutorial/introduction-to-sql/)

## Answers to Mode Analytics Tutorial
tutorial.us_housing_units

1. 10 results with information on all columns
```
SELECT *
  FROM tutorial.us_housing_units
  LIMIT 10
```

2. Housing starts in the Midwest
```
SELECT midwest,
      year,
      month,
      month_name
  FROM tutorial.us_housing_units
```

3. All housing starts in December since 1985
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month_name='December'
```

4. All housing starts in the second half of the year since 1990
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month>6
    AND year >= 1990
```

5. All rows where housing starts were above 30,000 in the South region
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE south>30
```

6. The sum of housing starts across all regions for each row
```
SELECT
  year,
  month,
  south + west + midwest + northeast AS all_regions
  FROM tutorial.us_housing_units
```

7. All rows where the sum of all housing starts is above 70,000 Note: You can't use an alias in a WHERE clause.
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE (south + west + midwest + northeast)>70
```

8. All rows where the sum of all housing starts is between 50-80k
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE (south + west + midwest + northeast)>50 AND (south + west + midwest + northeast)<80
```

9. The average of all housing starts across all regions for each row
```
SELECT
  year,
  month,
  (south + west + midwest + northeast)/4 AS regions_avg
  FROM tutorial.us_housing_units
```

10. All rows where the housing starts in the South are above the sum of the other three regions
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > (west + midwest + northeast)
```

11. The percentage of housing starts that occur in each region since 1990 Note: Use an alias to title the new columns appropriately
```
SELECT  year,
        month,
        south/(south + west + midwest + northeast)*100 AS south_perc,
        west/(south + west + midwest + northeast)*100 AS west_perc,
        midwest/(south + west + midwest + northeast)*100 AS midwest_perc,
        northeast/(south + west + midwest + northeast)*100 AS northeast_perc
FROM tutorial.us_housing_units
WHERE year >= 1990
```



tutorial.billboard_top_100_year_end

1. All rows where Elvis Presley had a song on the top 100 charts
```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "artist" ILIKE '%elvis presley%'
  AND year_rank<=100
```

2. All rows where the artist's name contained "Tony" (not case sensitive)
```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "artist" ILIKE '%tony%'
```

3. All rows where the song title contained the word "love" in any way
```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "song_name" ILIKE '%love%'
```

4. All rows where the artist's name begins with the letter "A"
```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "artist" LIKE 'A%'
```

5. The top 3 songs from each year between 1960-1969
```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank <= 3
    AND year BETWEEN 1960 AND 1969
```

6. All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist
```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "artist" IN ('Elvis Presley', 'Van Halen', 'Rolling Stones')
```

7. Which artist has had the most appearances on the top 100 list?
```
SELECT artist,
      COUNT(*) AS count
FROM tutorial.billboard_top_100_year_end
WHERE "year_rank" <= 100
GROUP BY "artist"
ORDER BY "count" DESC
```

8. Which artist has had the most #1 hits? How many?
```
SELECT artist,
      COUNT(*) AS count
FROM tutorial.billboard_top_100_year_end
WHERE "year_rank" = 1
GROUP BY "artist"
ORDER BY "count" DESC
LIMIT 3
```

9. All rows from 1970 where the songs were ranked 10-20th
```
SELECT year,
      artist,
      song_name
FROM tutorial.billboard_top_100_year_end
WHERE "year" >= 1960
  AND "year_rank" >= 10
  AND "year_rank" <= 20
  ```

10. All rows from the 1990's where Madonna was not ranked 10-100th
```
SELECT year,
      artist,
      song_name,
      year_rank
FROM tutorial.billboard_top_100_year_end
WHERE "artist" IN ('Madonna')
  AND "year" >= 1990
  AND "year" < 2000
  AND "year_rank" < 10
  OR "year_rank" > 100
  ```

11. All rows from 1985 which do not include Madonna or Phil Collins in the group.
```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "group" NOT ILIKE '%madonna%' OR "group" NOT ILIKE '%phil collins%'
  AND "year" >= 1985
```


12. All number 1 songs in the data set.
```
SELECT song_name
FROM tutorial.billboard_top_100_year_end
WHERE "year_rank" = 1
```

13. All rows where the artist is not listed
```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "artist" IS NULL
```

14. All of Madonna's top 100 hits ordered by their ranking (1 to 100)
```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "artist" ILIKE '%madonna%'
ORDER BY "year_rank"
LIMIT 100
```

15. All of Madonna's top 100 hits ordered by their ranking within each year
```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "artist" ILIKE '%madonna%'
ORDER BY "year", "year_rank"
LIMIT 100
```

16. Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990.
```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "year" >= 1990
AND "year_rank" <= 3
ORDER BY year_rank, year
```

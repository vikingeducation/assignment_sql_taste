### tutorial.us_housing_units

1. 10 results with information on all columns

  ```
  SELECT *
    FROM tutorial.us_housing_units
    LIMIT 10
  ```

2. Housing starts in the Midwest

  ```
  SELECT year, month, midwest
    FROM tutorial.us_housing_units
  ```

3. All housing starts in December since 1985

  ```
  SELECT *
    FROM tutorial.us_housing_units
    WHERE year >= 1985 AND month = 12
  ```

4. All housing starts in the second half of the year since 1990

  ```
  SELECT *
    FROM tutorial.us_housing_units
    WHERE month > 6 AND year >= 1990
  ```

5. All rows where housing starts were above 30,000 in the South region

  ```
  SELECT *
    FROM tutorial.us_housing_units
    WHERE south > 30
  ```

6. The sum of housing starts across all regions for each row

  ```
  SELECT year, month, west + south + northeast + midwest AS all_regions
    FROM tutorial.us_housing_units
  ```

7. All rows where the sum of all housing starts is above 70,000 Note: You can't use an alias in a WHERE clause.

  ```
  SELECT *
    FROM tutorial.us_housing_units
    WHERE west + south + northeast + midwest > 70
  ```

8. All rows where the sum of all housing starts is between 50-80k

  ```
  SELECT *
    FROM tutorial.us_housing_units
    WHERE (west + south + northeast + midwest) BETWEEN 50 AND 80
  ```

9. The average of all housing starts across all regions for each row

  ```
  SELECT year,
        month,
        (west + northeast + midwest + south)/4 AS all_regions_avg
    FROM tutorial.us_housing_units
  ```

10. All rows where the housing starts in the South are above the sum of the other three regions

  ```
  SELECT *
    FROM tutorial.us_housing_units
    WHERE south > (west + northeast + midwest)
  ```

11. The percentage of housing starts that occur in each region since 1990 Note: Use an alias to title the new columns appropriately

  ```
  SELECT year,
      month,
      west/(west + northeast + midwest + south)*100 AS west_percent,
      midwest/(west + northeast + midwest + south)*100 AS midwest_percent,
      northeast/(west + northeast + midwest + south)*100 AS northeast_percent,
      south/(west + northeast + midwest + south)*100 AS south_percent
    FROM tutorial.us_housing_units
    WHERE year >= 1990
  ```
### tutorial.billboard_top_100_year_end

1. All rows where Elvis Presley had a song on the top 100 charts

  ```
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE "group" ILIKE '%elvis presley%'
  ```

2. All rows where the artist's name contained "Tony" (not case sensitive)

  ```
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist ILIKE '%tony%'
  ```

3. All rows where the song title contained the word "love" in any way

  ```
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE song_name ILIKE '%love%'
  ```

4. All rows where the artist's name begins with the letter "A"

  ```
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist LIKE 'A%'
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
    WHERE artist IN ('Rolling Stones', 'Elvis Presley', 'Van Halen')
  ```

7. Which artist has had the most appearances on the top 100 list?

Madonna and Elvis Presley

  ```
  SELECT artist, COUNT(artist) AS artist_count
    FROM tutorial.billboard_top_100_year_end
    GROUP BY artist
    ORDER BY artist_count DESC
  ```

8. Which artist has had the most #1 hits? How many?

Beatles and Elvis Presley

  ```
  SELECT artist, COUNT(artist) AS artist_with_1_hits
    FROM tutorial.billboard_top_100_year_end
    WHERE year_rank = 1
    GROUP BY  artist
    ORDER BY COUNT(artist) DESC
  ```

9. All rows from 1970 where the songs were ranked 10-20th

  ```
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE year = 1970
    AND year_rank BETWEEN 10 AND 20
  ```

10. All rows from the 1990's where Madonna was not ranked 10-100th

  ```
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE year BETWEEN 1990 AND 1999
    AND artist = 'Madonna'
    AND year_rank < 10
  ```

11. All rows from 1985 which do not include Madonna or Phil Collins in the group.

  ```
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE year = 1985
    AND ("group" NOT ILIKE '%madonna%'
    OR "group" NOT ILIKE '%phil collins%')
  ```

12. All number 1 songs in the data set.

  ```
  SELECT DISTINCT song_name, year, "group"
    FROM tutorial.billboard_top_100_year_end
    WHERE year_rank = 1
    ORDER BY year
  ```

13. All rows where the artist is not listed

  ```
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist IS NULL
  ```
14. All of Madonna's top 100 hits ordered by their ranking (1 to 100)

  ```
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE "group" ILIKE '%madonna%'
    ORDER BY year_rank
  ```

15. All of Madonna's top 100 hits ordered by their ranking within each year

  ```
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE "group" ILIKE '%madonna%'
    ORDER BY year, year_rank
  ```

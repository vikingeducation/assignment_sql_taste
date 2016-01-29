### tutorial.billboard_top_100_year_end

1. What is the highest position ever reached by Phil Collins?
5

  ```
  SELECT MIN(year_rank) AS highest_position_by_phil_collins
    FROM tutorial.billboard_top_100_year_end
    WHERE "group" ILIKE '%phil collins%'
  ```

2. What is the average position reached by Michael Jackson?
~45

  ```
  SELECT AVG(year_rank) AS avg_position_by_MJ
    FROM tutorial.billboard_top_100_year_end
    WHERE "group" ILIKE '%michael jackson%'
  ```

3. Madonna's average position when she actually reached the top 10

  ```
  SELECT AVG(year_rank) AS avg_Madonna_at_first_top_10
    FROM tutorial.billboard_top_100_year_end
    WHERE "group" ILIKE '%madonna%'
    AND year_rank <= 10
  ```

4. List the top 10 artists based on their number of appearances on this list (and what that number is) since 1985

  ```
  SELECT artist, COUNT(artist) AS appearances
    FROM tutorial.billboard_top_100_year_end
    GROUP BY artist
    ORDER BY COUNT(artist) DESC
    LIMIT 10
  ```

5. The total count of top 10 hits written by either Elvis, Madonna, the Beatles, or Elton John

  ```
  SELECT COUNT(DISTINCT song_name) AS count_of_top_10_song_by_various
    FROM tutorial.billboard_top_100_year_end
    WHERE year_rank <= 10
    AND ("group" ILIKE '%elvis presley%'
    OR "group" ILIKE '%madonna%'
    OR "group" ILIKE '%beatles%'
    OR "group" ILIKE '%elton john%')
  ```

### aapl_historical_stock_price

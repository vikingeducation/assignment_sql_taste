-- https://modeanalytics.com/bideowego/reports/80f140818909

-- 1. All rows where Elvis Presley had a song on the top 100 charts
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist='Elvis Presley';

-- 2. All rows where the artist's name contained "Tony" (not case sensitive)
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE LOWER(artist) LIKE '%tony%';

-- 3. All rows where the song title contained the word "love" in any way
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE LOWER(song_name) LIKE '%love%';

-- 4. All rows where the artist's name begins with the letter "A"
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist LIKE 'A%';

5. The top 3 songs from each year between 1960-1969
WITH partitioned AS
(SELECT *,
        ROW_NUMBER() OVER(PARTITION BY year ORDER BY year_rank ASC) as row_num
        FROM tutorial.billboard_top_100_year_end
)
SELECT *
FROM partitioned
WHERE row_num <= 3
  AND year >= 1960
  AND year <= 1969
  ORDER BY year DESC, year_rank ASC;

-- 6. All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Elvis Presley'
    OR artist = 'Rolling Stones'
    OR artist = 'Van Halen';

-- 7. Which artist has had the most appearances on the top 100 list?
SELECT artist, COUNT(*) AS appearances
  FROM tutorial.billboard_top_100_year_end
  GROUP BY artist
  ORDER BY appearances DESC
  LIMIT 1;

-- 8. Which artist has had the most #1 hits? How many?
SELECT artist, COUNT(*) AS appearances
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1
  GROUP BY artist
  ORDER BY appearances DESC
  LIMIT 1;

-- 9. All rows from 1970 where the songs were ranked 10-20th
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1970
    AND year_rank >= 10
    AND year_rank <= 20;

-- 10. All rows from the 1990's where Madonna was not ranked 10-100th
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year NOT IN (
    SELECT year
      FROM tutorial.billboard_top_100_year_end
      WHERE artist = 'Madonna'
        AND year_rank >= 10
  )
  AND year >= 1990
  AND year <= 1999;

-- 11. All rows from 1985 which do not include Madonna or Phil Collins in the group.
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1985
    AND artist != 'Madonna'
    AND artist != 'Phil Collins';

-- 12. All number 1 songs in the data set.
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1;

-- 13. All rows where the artist is not listed
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IS NULL;

-- 14. All of Madonna's top 100 hits ordered by their ranking (1 to 100)
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Madonna'
  ORDER BY year_rank;

-- 15. All of Madonna's top 100 hits ordered by their ranking within each year
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Madonna'
  ORDER BY year DESC, year_rank ASC;

-- 16. Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990. (Hint: Multiple ordering)
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year >= 1990
  ORDER BY year_rank, year DESC;













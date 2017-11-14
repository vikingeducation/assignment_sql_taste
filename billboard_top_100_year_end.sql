-- For use in this tutorial: https://modeanalytics.com/editor/lortz/reports/8c1368005d61


/* BASIC QUERIES */
-- All rows where Elvis Presley had a song on the top 100 charts
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE 'Elvis%'

-- All rows where the artist's name contained "Tony" (not case sensitive)
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%tony%'

-- All rows where the song title contained the word "love" in any way
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE song_name ILIKE '%love%'

-- All rows where the artist's name begins with the letter "A"
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE song_name ILIKE 'a%'

-- The top 3 songs from each year between 1960-1969
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year BETWEEN 1960 AND 1969
  AND year_rank BETWEEN 1 AND 3

-- All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IN ('Elvis Presley', 'Rolling Stones', 'Van Halen')

  --option 2
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist = 'Elvis Presley' OR
          artist = 'Rolling Stones' OR
          artist = 'Van Halen'

-- Which artist has had the most appearances on the top 100 list?
SELECT artist, count(artist)
  FROM tutorial.billboard_top_100_year_end
  GROUP BY artist
  ORDER BY count(artist) DESC;

-- Which artist has had the most #1 hits? How many?
SELECT artist, count(artist)
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1
  group BY artist
  order BY count(artist) DESC;

-- All rows from 1970 where the songs were ranked 10-20th
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1970
  AND year_rank BETWEEN 10 AND 20

-- All rows from the 1990's where Madonna was not ranked 10-100th
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year BETWEEN 1990 AND 1999
  AND artist NOT IN
    (SELECT artist FROM tutorial.billboard_top_100_year_end
    WHERE artist LIKE 'Madonna%'
    AND year_rank BETWEEN 10 AND 100)

-- All rows from 1985 which do not include Madonna or Phil Collins in the group.
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1985
  AND ("group" NOT LIKE '%Madonna%')
  AND ("group" NOT LIKE '%Phil Collins%')

-- All number 1 songs in the data set.
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1

-- All rows where the artist is not listed
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IS NULL

-- All of Madonna's top 100 hits ordered by their ranking (1 to 100)
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist LIKE 'Madonna'
  ORDER BY year_rank

-- All of Madonna's top 100 hits ordered by their ranking within each year
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist LIKE 'Madonna'
  ORDER BY year, year_rank

-- Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990. (Hint: Multiple ordering)
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year >= 1990
  AND year_rank IN (1, 2, 3)
  ORDER BY year_rank, year

/* INTERMEDIATE QUERIES */

-- What is the highest position ever reached by Phil Collins?

-- What is the average position reached by Michael Jackson?

-- Madonna's average position when she actually reached the top 10

-- List the top 10 artists based on their number of appearances on this list (and what that number is) since 1985

-- The total count of top 10 hits written by either Elvis, Madonna, the Beatles, or Elton John


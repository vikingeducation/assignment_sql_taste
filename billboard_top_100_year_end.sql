-- All rows where Elvis Presley had a song on the top 100 charts
SELECT * 
FROM tutorial.billboard_top_100_year_end
WHERE "artist" ILIKE ('elvis presley')
AND year_rank <= 100

-- All rows where the artist's name contained "Tony" (not case sensitive)
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "artist" ILIKE ('%tony%')

-- All rows where the song title contained the word "love" in any way
SELECT *
FROM tutorial.billboard_top_100_year_end 
WHERE song_name ILIKE ('%love%')

-- All rows where the artist's name begins with the letter "A"
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist ILIKE ('a%')

-- The top 3 songs from each year between 1960-1969
SELECT *
FROM tutorial.billboard_top_100_year_end 
WHERE year BETWEEN 1960 AND 1969
AND year_rank < 4

-- All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist
SELECT *
FROM tutorial.billboard_top_100_year_end 
WHERE artist = 'Elvis Presley' 
OR artist = 'The Rolling Stones' 
OR artist = 'Van Halen'

-- Which artist has had the most appearances on the top 100 list?
Elvis Presley, with 36 appearances

SELECT artist,
    COUNT(*) AS appearances
FROM tutorial.billboard_top_100_year_end 
WHERE year_rank <= 100
GROUP BY artist
ORDER BY artist DESC
LIMIT 1

-- Which artist has had the most #1 hits? How many?
Elvis Presley and the Beatles, with 2 each.

SELECT artist,
    COUNT(*) AS no_1s
FROM tutorial.billboard_top_100_year_end 
WHERE year_rank = 1
GROUP BY artist
ORDER BY no_1s DESC


-- All rows from 1970 where the songs were ranked 10-20th
SELECT *
FROM tutorial.billboard_top_100_year_end 
WHERE year = 1970
AND year_rank BETWEEN 10 AND 20

-- All rows from the 1990's where Madonna was not ranked 10-100th
SELECT *
FROM tutorial.billboard_top_100_year_end 
WHERE artist ILIKE '%madonna%'
AND year_rank BETWEEN 1 AND 9
AND year = 1990


-- All rows from 1985 which do not include Madonna or Phil Collins in the group.
SELECT *
FROM tutorial.billboard_top_100_year_end 
WHERE year = 1985
AND "group" NOT ILIKE '%madonna%'
  AND "group" NOT ILIKE '%phil collins%'


-- All number 1 songs in the data set.
SELECT *
FROM tutorial.billboard_top_100_year_end 
WHERE year_rank = 1

-- All rows where the artist is not listed
SELECT *
FROM tutorial.billboard_top_100_year_end 
WHERE artist IS null

-- All of Madonna's top 100 hits ordered by their ranking (1 to 100)
SELECT *
FROM tutorial.billboard_top_100_year_end 
WHERE artist = 'Madonna'
AND year_rank <= 100
ORDER BY year_rank ASC

-- All of Madonna's top 100 hits ordered by their ranking within each year
SELECT *
FROM tutorial.billboard_top_100_year_end 
WHERE artist = 'Madonna'
AND year_rank <= 100
ORDER BY year, year_rank ASC

-- Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990. (Hint: Multiple ordering)
SELECT *
FROM tutorial.billboard_top_100_year_end 
WHERE year >= 1990
AND year_rank <= 3
ORDER BY year_rank, year ASC

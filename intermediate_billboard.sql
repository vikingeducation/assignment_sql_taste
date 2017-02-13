-- What is the highest position ever reached by Phil Collins?
5th position in 1984

SELECT artist,
		year_rank,
		year
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Phil Collins'
ORDER BY year_rank ASC

-- What is the average position reached by Michael Jackson?
SELECT artist,
    AVG(year_rank)
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Michael Jackson'
GROUP BY artist

-- Madonna's average position when she actually reached the top 10
6

SELECT artist,
AVG(year_rank)
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Madonna'
AND year_rank <= 10
GROUP BY artist

-- List the top 10 artists based on their number of appearances on this list (and what that number is) since 1985
SELECT artist,
COUNT(artist) AS appearances
FROM tutorial.billboard_top_100_year_end
WHERE year_rank <= 10
GROUP BY artist
ORDER BY appearances DESC
LIMIT 10


-- The total count of top 10 hits written by either Elvis, Madonna, the Beatles, or Elton John
44

SELECT COUNT(*)
FROM tutorial.billboard_top_100_year_end
WHERE year_rank <= 10
AND "group" ILIKE ('%elton john%') OR "group" ILIKE ('%madonna%') OR "group" ILIKE ('%the beatles%') OR "group" ILIKE ('%elvis presley %')


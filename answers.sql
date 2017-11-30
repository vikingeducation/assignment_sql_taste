--tutorial.us_housing_units

--1. 10 results with information on all columns
SELECT *
  FROM tutorial.us_housing_units
LIMIT 10

--2. Housing starts in the Midwest
SELECT year,
      month,
      month_name,
      midwest
  FROM tutorial.us_housing_units

--3. All housing starts in December since 1985
SELECT *
  FROM tutorial.us_housing_units
WHERE month = 12 AND year >= 1985

--4. All housing starts in the second half of the year since 1990
SELECT *
  FROM tutorial.us_housing_units
WHERE year > 1990 AND month > 6

--5. All rows where housing starts were above 30,000 in the South region
SELECT *
  FROM tutorial.us_housing_units
WHERE south > 30

--6. The sum of housing starts across all regions for each row
SELECT *, (south + west + midwest + northeast) AS "Sum of Regions"
  FROM tutorial.us_housing_units

--7. All rows where the sum of all housing starts is above 70,000 Note: You can't use an alias in a WHERE clause.
SELECT *, (south + west + midwest + northeast) AS "Sum of Regions"
  FROM tutorial.us_housing_units
WHERE (south + west + midwest + northeast) > 70

--8. All rows where the sum of all housing starts is between 50-80k
SELECT *, (south + west + midwest + northeast) AS "Sum of Regions"
  FROM tutorial.us_housing_units
WHERE (south + west + midwest + northeast) BETWEEN 50 AND 80

--9. The average of all housing starts across all regions for each row
SELECT *, (south + west + midwest + northeast)/4 AS "Average of Regions"
  FROM tutorial.us_housing_units

--10. All rows where the housing starts in the South are above the sum of the other three regions
SELECT *
  FROM tutorial.us_housing_units
WHERE south > (west + midwest + northeast)

--11. The percentage of housing starts that occur in each region since 1990 Note: Use an alias to title the new columns appropriately
SELECT *, (south/(south + west + midwest + northeast))*100 AS "South Percentage",
(west/(south + west + midwest + northeast))*100 as "West Percentage",
(midwest/(south + west + midwest + northeast))*100 as "Midwest Percentage",
(northeast/(south + west + midwest + northeast))*100 as "Northeast Percentage"
  FROM tutorial.us_housing_units
WHERE year > 1990

--tutorial.billboard_top_100_year_end

--1. All rows where Elvis Presley had a song on the top 100 charts
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE artist LIKE 'Elvis Presley'

--2. All rows where the artist's name contained "Tony" (not case sensitive)
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE artist ILIKE '%Tony%'

--3. All rows where the song title contained the word "love" in any way
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE song_name ILIKE '%love%'

--4. All rows where the artist's name begins with the letter "A"
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE artist LIKE 'A%'

--5. The top 3 songs from each year between 1960-1969
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE year_rank < 4
  AND year BETWEEN 1960 AND 1969

--6. All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Elvis Presley'
  OR artist = 'Rolling Stones'
  OR artist = 'Van Halen'

--7. Which artist has had the most appearances on the top 100 list?
SELECT artist, COUNT(*)
  FROM tutorial.billboard_top_100_year_end
GROUP BY artist
ORDER BY count DESC
LIMIT 1

--8. Which artist has had the most #1 hits? How many?
SELECT artist, COUNT(*)
  FROM tutorial.billboard_top_100_year_end
WHERE year_rank = 1
GROUP BY artist
ORDER BY count DESC
LIMIT 1

--9. All rows from 1970 where the songs were ranked 10-20th
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE year = 1970
  AND year_rank BETWEEN 10 AND 20

--10. All rows from the 1990's where Madonna was not ranked 10-100th
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE year BETWEEN 1990 AND 1999
  AND artist = 'Madonna' AND year_rank < 10

--11. All rows from 1985 which do not include Madonna or Phil Collins in the group.
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE year = 1985 AND "group" NOT LIKE  '%Madonna%'
  AND "group" NOT LIKE  '%Phil Collins%'

--12. All number 1 songs in the data set.
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE year_rank = 1

--13. All rows where the artist is not listed
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE artist IS NULL

--14. All of Madonna's top 100 hits ordered by their ranking (1 to 100)
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Madonna'
ORDER BY year_rank

--15. All of Madonna's top 100 hits ordered by their ranking within each year
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Madonna'
ORDER BY year, year_rank

--16. Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990. (Hint: Multiple ordering)
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE year > 1989 AND year_rank < 4
ORDER BY year_rank = 3, year_rank = 2, year_rank = 1


--(Optional) Intermediate SQL

--1. What is the highest position ever reached by Phil Collins?
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Phil Collins' OR "group" LIKE '%Phil Collins%'
ORDER BY year_rank
LIMIT 1

--2. What is the average position reached by Michael Jackson?
SELECT AVG(year_rank) AS "Michael Jackson's Average"
  FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Michael Jackson' OR "group" LIKE '%Michael Jackson%'

--3. Madonna's average position when she actually reached the top 10
SELECT AVG(year_rank) AS "Madonna's Top 10 Average"
  FROM tutorial.billboard_top_100_year_end
WHERE year_rank < 11 AND artist = 'Madonna'

--4. List the top 10 artists based on their number of appearances on this list (and what that number is) since 1985
SELECT artist, COUNT(*)
  FROM tutorial.billboard_top_100_year_end
WHERE year > 1985
GROUP BY artist
ORDER BY count DESC
LIMIT 10

--5. The total count of top 10 hits written by either Elvis, Madonna, the Beatles, or Elton John
SELECT SUM(sub.count) AS "Total Top 10's for Elvis, Madonna, Beatles, and Elton John"
FROM( SELECT artist, COUNT(*)
      FROM tutorial.billboard_top_100_year_end
        WHERE year_rank < 11 AND artist = 'Elvis Presley' OR artist = 'Madonna' OR artist = 'Beatles' OR artist = 'Elton John'
        GROUP BY artist) sub

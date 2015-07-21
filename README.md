# assignment_sql_taste
A delicious appetizer of SQL-ey goodness

tutorial.us_housing_units

-- SELECT *
--   FROM tutorial.us_housing_units
-- LIMIT 10

-- SELECT midwest
--   FROM tutorial.us_housing_units

-- SELECT *
--   FROM tutorial.us_housing_units
-- WHERE month_name = 'December' AND year >= 1985

-- SELECT *
-- FROM tutorial.us_housing_units
-- WHERE month > 6 AND year > 1990

-- SELECT *
-- FROM tutorial.us_housing_units
-- WHERE   west > 30

-- SELECT south + west + northeast + midwest
-- FROM tutorial.us_housing_units

-- SELECT *
-- FROM tutorial.us_housing_units
-- WHERE (south + west + northeast + midwest) > 70

-- SELECT *
-- FROM tutorial.us_housing_units
-- WHERE 50 >  (south + west + northeast + midwest)  AND (south + west + northeast + midwest) < 70

-- SELECT  (south + west + northeast + midwest) / 4
-- FROM tutorial.us_housing_units

SELECT *,
        south / (south + west + northeast + midwest) * 100 AS south_per,
        west  / (south + west + northeast + midwest) * 100 AS west_per,
       (northeast /  (south + west + northeast + midwest)) * 100 AS northwest_per,
       (midwest / (south + west + northeast + midwest)) * 100 AS midwest_per
FROM tutorial.us_housing_units

---------------

tutorial.billboard_top_100_year_end

1.
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE "group" LIKE 'Elvis Presley'

2.
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist ILIKE 'tony%'

3.
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE song_name ILIKE '%love%'

4.
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist LIKE 'A%'

5.
  SELECT song_name
    FROM tutorial.billboard_top_100_year_end
    WHERE year_rank < 4 AND
    year BETWEEN 1960 AND 1969

6.
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist IN ('Elvis Presley', 'Van Halen', 'The Rolling Stones')

7. All rows from 1970 where the songs were ranked 10-20th
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE year_rank BETWEEN 10 AND 20
    AND year > 1970
    ORDER BY year, year_rank

8. All rows from the 1990's where Madonna was not ranked > 50th
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist LIKE 'Madonna'
    AND year_rank <= 50
    AND year BETWEEN 1990 AND 1999

9. All rows from 1985 which do not include Madonna or Phil Collins in the group.
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE year > 1985 AND
    artist NOT IN ('Madonna', 'Phil Collins')

10. All number 1 songs in the data set.
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE year_rank = 1

11. All rows where the artist is not listed
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist IS NULL

12. All of Madonna's top 100 hits ordered by their ranking (1 to 100)
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist = 'Madonna'
    ORDER BY year_rank

13. All of Madonna's top 100 hits ordered by their ranking within each year
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE artist = 'Madonna'
    ORDER BY year, year_rank

14. Every number 1 song since 1990 followed by every number 2 song and number 3 song.
  SELECT *
    FROM tutorial.billboard_top_100_year_end
    WHERE year_rank IN ('1','2','3')
    AND year > 1990
    ORDER BY year_rank



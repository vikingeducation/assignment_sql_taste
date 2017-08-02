--  tutorial.us_house_units
-- 1.
-- SELECT *
--   FROM tutorial.us_housing_units
--   LIMIT 10

-- 2.
-- SELECT midwest
--   FROM tutorial.us_housing_units

-- 3.
-- SELECT south,
--       west,
--       midwest,
--       northeast
-- FROM tutorial.us_housing_units
-- WHERE month = 12 AND year >= 1985

-- 4.
-- SELECT south,
--       west,
--       midwest,
--       northeast
--     FROM tutorial.us_housing_units
--     WHERE month > 6 AND year >= 1990

-- 5.
-- SELECT *
--   FROM tutorial.us_housing_units
--   WHERE south > 30

-- 6.
-- SELECT SUM(south) AS south_sum,
--       SUM(west) AS west_sum,
--       SUM(northeast) AS northeast_sum,
--       SUM(midwest) AS midwest_sum
--     FROM tutorial.us_housing_units

-- 7.
-- SELECT *
--     FROM tutorial.us_housing_units
--     WHERE (south + west + northeast + midwest) > 70

-- 8.
-- SELECT *
--   FROM tutorial.us_housing_units
--   WHERE (south + west + northeast + midwest) BETWEEN 50 AND 80


-- 9.
-- SELECT south AS south_avg,
--       AVG(west) AS west_avg,
--       AVG(northeast) AS northeast_avg,
--       AVG(midwest) AS midwest_avg
--     FROM tutorial.us_housing_units

-- 10.
-- SELECT *
--   FROM tutorial.us_housing_units
--   WHERE south > (west + northeast + midwest)


-- 11.
-- VERSION 1
-- SELECT SUM(south) / (SUM(south) + SUM(west) + SUM(northeast) + SUM(midwest)) AS south_avg,
--       SUM(west) / (SUM(south) + SUM(west) + SUM(northeast) + SUM(midwest)) AS west_avg,
--     SUM(northeast) / (SUM(south) + SUM(west) + SUM(northeast) + SUM(midwest)) AS northeast_avg,
--     SUM(midwest) / (SUM(south) + SUM(west) + SUM(northeast) + SUM(midwest)) AS midwest_avg
--     FROM tutorial.us_housing_units
--     WHERE year >= 1990

-- VERSION 2
-- SELECT
--         sum_south / sum_total AS percent_south,
--         sum_west / sum_total AS percent_west,
--         sum_northeast / sum_total AS percent_northeast,
--         sum_midwest / sum_total AS percent_midwest
--         FROM (
--         SELECT (SUM(south) + SUM(west) + SUM(northeast) + SUM(midwest)) AS sum_total,
--           SUM(south) AS sum_south,
--           SUM(west) AS sum_west,
--           SUM(northeast) AS sum_northeast,
--           SUM(midwest) AS sum_midwest
--         FROM tutorial.us_housing_units
--         WHERE year >= 1990
--         ) AS sum_total

-- tutorial.billboard_top_100_year_end
-- 1.
  -- SELECT *
  --   FROM tutorial.billboard_top_100_year_end
  --   WHERE artist = 'Elvis Presley'

-- 2.
-- SELECT *
--   FROM tutorial.billboard_top_100_year_end
--   WHERE artist ILIKE '%tony%'

-- 3.
-- SELECT *
--   FROM tutorial.billboard_top_100_year_end
--   WHERE song_name ILIKE '%lov%' OR song_name ILIKE '%luv%'

-- 4.
-- SELECT *
--   FROM tutorial.billboard_top_100_year_end
--   WHERE artist ILIKE 'A%'

-- 5.
-- SELECT *
--   FROM tutorial.billboard_top_100_year_end
--   WHERE year BETWEEN 1960 AND 1969
--   AND year_rank < 4

-- 6.
-- SELECT *
--     FROM tutorial.billboard_top_100_year_end
--     WHERE artist IN ('Elvis Presley', 'Rolling Stones', 'Van Halen')

-- 7.
-- SELECT DISTINCT artist
--       FROM  tutorial.billboard_top_100_year_end
--       WHERE artist IS NOT NULL

-- 8.
-- SELECT artist, COUNT(*) AS artist_hits
--   FROM  tutorial.billboard_top_100_year_end
--   WHERE artist IS NOT NULL
--   GROUP BY artist
--   ORDER BY artist_hits DESC
--   LIMIT 2

-- 9.
-- SELECT *
--   FROM tutorial.billboard_top_100_year_end
--   WHERE year = 1970
--   AND year_rank BETWEEN 10 AND 20

-- 10.
-- SELECT *
--   FROM tutorial.billboard_top_100_year_end
--   WHERE year BETWEEN 1990 AND 1999
--   AND NOT (artist = 'Madonna' AND year_rank BETWEEN 10 AND 100)

-- 11.
-- SELECT *
--   FROM tutorial.billboard_top_100_year_end
--   WHERE artist NOT ILIKE '%Madonna%' AND
--   artist NOT ILIKE '%Elvis Presley%'

-- 12.
-- SELECT song_name
--   FROM tutorial.billboard_top_100_year_end
--   WHERE year_rank = 1
-- 13.
-- SELECT *
--   FROM tutorial.billboard_top_100_year_end
--   WHERE artist IS NOT NULL

-- 14.
-- SELECT *
--   FROM tutorial.billboard_top_100_year_end
--   WHERE artist LIKE 'Madonna'
--   ORDER BY year_rank ASC

-- 15.
-- SELECT *
--   FROM tutorial.billboard_top_100_year_end
--   WHERE artist = 'Madonna'
--   ORDER BY year, year_rank DESC

-- 16.
-- SELECT *
--   FROM tutorial.billboard_top_100_year_end
--   WHERE year >= 1990 AND year_rank IN (1, 2, 3)
--   ORDER BY year_rank, year ASC

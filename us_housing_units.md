1)

SELECT *
  FROM tutorial.us_housing_units
  LIMIT 10


2)

SELECT 
  midwest
  FROM tutorial.us_housing_units


3)
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 12
  AND year >= 1985



4)

SELECT *
  FROM tutorial.us_housing_units
  WHERE year >= 1990
  AND month BETWEEN 7 AND 12




5)

SELECT *
  FROM tutorial.us_housing_units
  WHERE south > 30





6)

SELECT 
  south + west + midwest + northeast AS total_starts
  FROM tutorial.us_housing_units





7)

SELECT *
  FROM tutorial.us_housing_units
  WHERE south + west + midwest + northeast > 70




8)


SELECT *
  FROM tutorial.us_housing_units
  WHERE south + west + midwest + northeast BETWEEN 50 AND 80





9)


SELECT 
  (south + west + midwest + northeast) / 4 AS average_starts_per_region
  FROM tutorial.us_housing_units






10)


SELECT *
  FROM tutorial.us_housing_units
  WHERE south > west + midwest + northeast







11)


SELECT 
  south / (south + west + midwest + northeast) * 100 AS south_pct,
  west / (south + west + midwest + northeast) * 100 AS west_pct,
  midwest / (south + west + midwest + northeast) * 100 AS midwest_pct,
  northeast / (south + west + midwest + northeast) * 100 AS northeast_pct
  FROM tutorial.us_housing_units
  WHERE year >= 1990
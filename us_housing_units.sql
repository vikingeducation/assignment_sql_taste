-- For use in this tutorial: https://modeanalytics.com/editor/lortz/reports/8c1368005d61

-- 10 results with information on all columns
SELECT *
  FROM tutorial.us_housing_units
  LIMIT 10

-- Housing stats in the Midwest
SELECT midwest
  FROM tutorial.us_housing_units

-- All housing stats in December since 1985
SELECT *
  FROM tutorial.us_housing_units
  WHERE year >= 1985
  AND month = 12
  ORDER BY year

-- All housing stats in the second half of the year since 1990
SELECT *
  FROM tutorial.us_housing_units
  WHERE year >= 1990
  AND month BETWEEN 6 AND 12

-- All rows where housing stats were above 30,000 in the South region
SELECT *
  FROM tutorial.us_housing_units
  WHERE south >= 30

-- The sum of housing stats across all regions for each row
SELECT *,
  south + west + midwest + northeast AS sum
  FROM tutorial.us_housing_units

-- All rows where the sum of all housing stats is above 70,000 Note: You can't use an alias in a WHERE clause.
  -- option 1:
  SELECT sub.*
    FROM (
          SELECT *
          south + west + midwest + northeast AS sum
          FROM tutorial.us_housing_units
         ) sub
    WHERE sub.sum >= 70

  -- option 2:
  SELECT *
  FROM tutorial.us_housing_units
  WHERE (south + west + midwest + northeast) > 70;

-- All rows where the sum of all housing stats is between 50-80k
SELECT sub.*
  FROM (
        SELECT *,
        south + west + midwest + northeast AS sum
        FROM tutorial.us_housing_units
      ) sub
  WHERE sub.sum BETWEEN 50 AND 80

-- The average of all housing stats across all regions for each row
SELECT
  (south + west + midwest + northeast) / 4 AS average
  FROM tutorial.us_housing_units

-- All rows where the housing stats in the South are above the sum of the other three regions
SELECT sub.*
  FROM (
        SELECT *,
        west + midwest + northeast AS sum
        FROM tutorial.us_housing_units
      ) sub
  WHERE sub.sum < south

  --option 2:
  SELECT *
  FROM tutorial.us_housing_units
  WHERE south > (west + midwest + northeast)

-- The percentage of housing stats that occur in each region since 1990 Note: Use an alias to title the new columns appropriately
SELECT
  south / (south + west + midwest + northeast) * 100 AS "south%",
  west / (south + west + midwest + northeast) * 100 AS "west%",
  midwest / (south + west + midwest + northeast) * 100 AS "midwest%",
  northeast / (south + west + midwest + northeast) * 100 AS "northeast%"
  FROM tutorial.us_housing_units
  WHERE year >= 1990

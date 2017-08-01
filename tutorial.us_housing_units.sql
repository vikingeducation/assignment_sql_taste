-- https://modeanalytics.com/bideowego/reports/9c8f1cd3240e/runs/1a3cad0f8552

-- 1. 10 results with information on all columns
SELECT *
  FROM tutorial.us_housing_units
  LIMIT 10;

-- 2. Housing starts in the Midwest
SELECT midwest
  FROM tutorial.us_housing_units;
  
-- 3. All housing starts in December since 1985
SELECT *
  FROM tutorial.us_housing_units
  WHERE month_name = 'December'
    AND year >= 1985;

-- 4. All housing starts in the second half of the year since 1990
SELECT *
  FROM tutorial.us_housing_units
  WHERE year >= 1990
    AND month >= 7;

-- 5. All rows where housing starts were above 30,000 in the South region
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > 30;

-- 6. The sum of housing starts across all regions for each row
SELECT south + west + midwest + northeast AS region_sum
  FROM tutorial.us_housing_units;

-- 7. All rows where the sum of all housing starts is above 70,000 Note: You can't use an alias in a WHERE clause.
SELECT *
  FROM tutorial.us_housing_units
  WHERE (south + west + midwest + northeast) > 70;

-- 8. All rows where the sum of all housing starts is between 50-80k
SELECT *
  FROM tutorial.us_housing_units
  WHERE (south + west + midwest + northeast) >= 50
    AND (south + west + midwest + northeast) <= 80;

-- 9. The average of all housing starts across all regions for each row
SELECT AVG(south + west + midwest + northeast) as average_start
  FROM tutorial.us_housing_units;

-- 10. All rows where the housing starts in the South are above the sum of the other three regions
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > (west + midwest + northeast);

-- 11. The percentage of housing starts that occur in each region since 1990 Note: Use an alias to title the new columns appropriately
SELECT (
  (SELECT COUNT(*) * 1.0 FROM tutorial.us_housing_units WHERE year >= 1990)
  /
  (SELECT COUNT(*) * 1.0 FROM tutorial.us_housing_units)
) as percent_since_1990 FROM tutorial.us_housing_units LIMIT 1;







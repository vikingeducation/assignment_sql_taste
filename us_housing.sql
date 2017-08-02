-- 1. 10 results with information on all columns
SELECT *
FROM tutorial.us_housing_units
LIMIT 10

-- 2. Housing starts in the Midwest
SELECT year, month, month_name, midwest
FROM tutorial.us_housing_units

-- 3. All housing starts in December since 1985
SELECT *
FROM tutorial.us_housing_units
WHERE month = 12
AND year >= 1985

-- 4. All housing starts in the second half of the year since 1990
SELECT *
FROM tutorial.us_housing_units
WHERE month > 6
AND year >= 1990

-- 5. All rows where housing starts were above 30,000 in the South region
SELECT *
FROM tutorial.us_housing_units
WHERE south > 30

-- 6. The sum of housing starts across all regions for each row
SELECT year, month, month_name, (south+west+midwest+northeast) as Total
FROM tutorial.us_housing_units

-- 7. All rows where the sum of all housing starts is above 70,000 Note: You can't use an alias in a WHERE clause.
SELECT *
FROM tutorial.us_housing_units
WHERE (south+west+midwest+northeast) > 70

-- 8. All rows where the sum of all housing starts is between 50-80k
SELECT *
FROM tutorial.us_housing_units
WHERE (south+west+midwest+northeast) BETWEEN 50 AND 80

-- 9. The average of all housing starts across all regions for each row
SELECT year, (south+west+midwest+northeast)/4 as average
FROM tutorial.us_housing_units

-- 10. All rows where the housing starts in the South are above the sum of the other three regions
SELECT *
FROM tutorial.us_housing_units
WHERE south > (west+midwest+northeast)

-- 11.The percentage of housing starts that occur in each region since 1990
SELECT year, (west/(west+midwest+northeast+south)) * 100 as west_percentage,
(northeast/(west+midwest+northeast+south)) * 100 as northeast_percentage,
(midwest/(west+midwest+northeast+south)) * 100 as midwest_percentage,
(south/(west+midwest+northeast+south)) * 100 as south_percentage
FROM tutorial.us_housing_units

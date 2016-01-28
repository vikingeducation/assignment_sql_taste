# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

Kelsey

==========================================
tutorial.us_housing_units
==========================================

10 results with information on all columns:
SELECT *
  FROM tutorial.us_housing_units
LIMIT 10

Housing starts in the Midwest:
SELECT "midwest"
  FROM tutorial.us_housing_units

All housing starts in December since 1985:
SELECT *
  FROM tutorial.us_housing_units
WHERE (month_name = 'December') AND (year >= 1985)

All housing starts in the second half of the year since 1990:
SELECT *
  FROM tutorial.us_housing_units
WHERE (month BETWEEN 7 AND 12) AND (year >= 1990)

All rows where housing starts were above 30,000 in the South region:
SELECT *
  FROM tutorial.us_housing_units
WHERE south > 30

The sum of housing starts across all regions for each row:
SELECT south + west + midwest + northeast AS "Total Housing"
  FROM tutorial.us_housing_units

All rows where the sum of all housing starts is above 70,000:
SELECT *
  FROM tutorial.us_housing_units
WHERE south + west + midwest + northeast > 70

All rows where the sum of all housing starts is between 50-80k:
SELECT *
  FROM tutorial.us_housing_units
WHERE south + west + midwest + northeast BETWEEN 50 AND 80

The average of all housing starts across all regions for each row:
SELECT (south + west + midwest + northeast) / 4 AS "Average Housing"
  FROM tutorial.us_housing_units

All rows where the housing starts in the South are above the sum of the other three regions:
SELECT *
  FROM tutorial.us_housing_units
WHERE south > west + midwest + northeast

The percentage of housing starts that occur in each region since 1990:
SELECT south * 100 / ( south + west + midwest + northeast ) AS "South Percent",
       west * 100 / ( south + west + midwest + northeast ) AS "West Percent",
       midwest * 100 / ( south + west + midwest + northeast ) AS "Midwest Percent",
       northeast * 100 / ( south + west + midwest + northeast ) AS "Northeast Percent"
  FROM tutorial.us_housing_units
WHERE year >= 1990

==========================================
tutorial.billboard_top_100_year_end
==========================================

All rows where Elvis Presley had a song on the top 100 charts:

Assignment completed by [Stephen Mayeux](http://stephenmayeux.com)

# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

### Housing Units

10 results with information on all columns
```
SELECT *
  FROM tutorial.us_housing_units
  LIMIT 10
```

Housing stats in the Midwest
```
SELECT year, month_name, midwest AS "Midwest"
  FROM tutorial.us_housing_units
```

All housing stats in December since 1985
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month_name = 'December'
  AND year >= 1985
```

All housing stats in the second half of the year since 1990
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month IN (7,8,9,10,11,12)
  AND year >= 1990
```

All rows where housing starts were above 30,000 in the South region
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > 30
```

The sum of housing stats across all regions for each row
```
SELECT
  year,
  month,
  month_name,
  south + west + midwest + northeast AS "Sum of Regions"
  FROM tutorial.us_housing_units
```

All rows where the sum of all housing stats is above 70,000 *Note: You can't use an alias in a WHERE clause.*
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE (south + west + midwest + northeast) > 70
```

All rows where the sum of all housing stats is between 50-80k
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE (south + west + midwest + northeast) BETWEEN 50 AND 80
```

The average of all housing stats across all regions for each row
```
SELECT *,
  (south + west + midwest + northeast) / 4 AS "Averages"
  FROM tutorial.us_housing_units
```

All rows where the housing stats in the South are above the sum of the other three regions
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE (west + midwest + northeast) < south
```

The percentage of housing stats that occur in each region since 1990 *Note: Use an alias to title the new columns appropriately*
```
SELECT *,
  (south / (south + west + midwest + northeast)) * 100 as "South Percentage",
  (west / (south + west + midwest + northeast)) * 100 as "West Percentage",
  (midwest / (south + west + midwest + northeast)) * 100 as "Midwest Percentage",
  (northeast / (south + west + midwest + northeast)) * 100 as "Northeast Percentage"
  FROM tutorial.us_housing_units
```

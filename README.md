# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

### Not example:

# tutorial.us_housing_units

Tip: You can use CMD + / to comment out multiple lines at a time in the SQL editor just like in your text editor

10 results with information on all columns
```
SELECT *
FROM tutorial.us_housing_units
LIMIT 10
```
Housing starts in the Midwest
```
SELECT Midwest
FROM tutorial.us_housing_units
```
All housing starts in December since 1985
```
SELECT *
FROM tutorial.us_housing_units
WHERE month = 12 AND year >= 1985
```
All housing starts in the second half of the year since 1990
```
SELECT *
FROM tutorial.us_housing_units
WHERE month >6 AND year >= 1990
```
All rows where housing starts were above 30,000 in the South region
```
SELECT *
FROM tutorial.us_housing_units
WHERE south > 30
```
The sum of housing starts across all regions for each row
```
SELECT year,
month_name,
south + west + midwest + northeast AS sum_of_all
FROM tutorial.us_housing_units
```
All rows where the sum of all housing starts is above 70,000 Note: You can't use an alias in a WHERE clause.
```
SELECT year,
month_name,
south + west + midwest + northeast AS sum_of_all
FROM tutorial.us_housing_units
WHERE (south + west + midwest + northeast) > 70
```
All rows where the sum of all housing starts is between 50-80k
```
SELECT year,
month_name,
south + west + midwest + northeast AS sum_of_all
FROM tutorial.us_housing_units
WHERE (south + west + midwest + northeast) >= 50
AND (south + west + midwest + northeast) <= 80
```
The average of all housing starts across all regions for each row
```
SELECT year,
month_name,
(south + west + midwest + northeast) / 4 AS average
FROM tutorial.us_housing_units
```
All rows where the housing starts in the South are above the sum of the other three regions
```
SELECT *
FROM tutorial.us_housing_units
WHERE (west + midwest + northeast) < south
```
The percentage of housing starts that occur in each region since 1990 Note: Use an alias to title the new columns appropriately
```
SELECT *,
south / (south + west + midwest + northeast) * 100 AS south_percent,
west / (south + west + midwest + northeast) * 100 AS west_percent,
midwest / (south + west + midwest + northeast) * 100 AS midwest_percent,
northeast / (south + west + midwest + northeast) * 100 AS northeast_percent
FROM tutorial.us_housing_units
```

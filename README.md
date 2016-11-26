# assignment_sql_taste
A delicious appetizer of SQL-ey goodness

By James and Luke

## Queries

10 results with information on all columns

```
SELECT *
  FROM tutorial.us_housing_units
LIMIT 10
```

Housing starts in the Midwest

```
SELECT year, month, month_name, midwest
  FROM tutorial.us_housing_units
```

All housing starts in December since 1985

```
SELECT *
  FROM tutorial.us_housing_units
 WHERE year >= 1985 AND month_name = 'December'
 ```

All housing starts in the second half of the year since 1990

```
SELECT *
  FROM tutorial.us_housing_units
 WHERE year >= 1990 AND month > 6
```

All rows where housing starts were above 30,000 in the South region

```
SELECT *
  FROM tutorial.us_housing_units
 WHERE south > 30
 ```

The sum of housing starts across all regions for each row

```
SELECT *, south + west + midwest + northeast AS total
  FROM tutorial.us_housing_units
```

All rows where the sum of all housing starts is above 70,000 Note: You can't use an alias in a WHERE clause.

```
SELECT *, south + west + midwest + northeast AS total
  FROM tutorial.us_housing_units
 WHERE south + west + midwest + northeast > 70
```

All rows where the sum of all housing starts is between 50-80k

```
SELECT *, south + west + midwest + northeast AS total
  FROM tutorial.us_housing_units
 WHERE south + west + midwest + northeast BETWEEN 50 and 80
```

The average of all housing starts across all regions for each row

```
SELECT *, (south + west + midwest + northeast)/4 AS average
  FROM tutorial.us_housing_units
```

All rows where the housing starts in the South are above the sum of the other three regions

```
SELECT *, west + midwest + northeast AS other_regions
  FROM tutorial.us_housing_units
 WHERE south > west + midwest + northeast
```

The percentage of housing starts that occur in each region since 1990 Note: Use an alias to title the new columns appropriately

```
SELECT *, south/(south + west + midwest + northeast) * 100 AS south_percent,
       west/(south + west + midwest + northeast) * 100 AS west_percent,
       midwest/(south + west + midwest + northeast) * 100 AS midwest_percent,
       northeast/(south + west + midwest + northeast) * 100 AS northeast_percent
  FROM tutorial.us_housing_units
 WHERE year >= 1990
```

# assignment_sql_taste
A delicious appetizer of SQL-ey goodness

Anthony Sin

## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

### tutorial.us_housing_units
```
SELECT *
  FROM tutorial.us_housing_units
  LIMIT 10
```
```
SELECT year, month, month_name, midwest AS "Midwest"
  FROM tutorial.us_housing_units
```
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 12 AND year >= 1985
```
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month > 6 AND year >= 1990
```
```
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > 30
```
```
SELECT south + west + midwest + northeast AS "Sum"
  FROM tutorial.us_housing_units
```
```
SELECT *, south + west + midwest + northeast AS "Sum"
  FROM tutorial.us_housing_units
  WHERE south + west + midwest + northeast > 70
```
```
SELECT *, south + west + midwest + northeast AS "Sum"
  FROM tutorial.us_housing_units
  WHERE south + west + midwest + northeast BETWEEN 50 AND 80
```
```
SELECT *, (south + west + midwest + northeast) / 4 AS "Average"
  FROM tutorial.us_housing_units
```
```
SELECT *, west + midwest + northeast AS "West, Midwest, and Northeast"
  FROM tutorial.us_housing_units
  WHERE south > (west + midwest + northeast)
```
```
SELECT  *, 
        south / (south + west + midwest + northeast) * 100 AS "South %",
        west / (south + west + midwest + northeast) * 100 AS "West %",
        midwest / (south + west + midwest + northeast) * 100 AS "Midwest %",
        northeast / (south + west + midwest + northeast) * 100 AS "Northeast %"
  FROM tutorial.us_housing_units
  WHERE year >= 1990
```


### tutorial.billboard_top_100_year_end

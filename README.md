* Austin Smith
* Jeff Dederick

# assignment_sql_taste

A delicious appetizer of SQL-ey goodness

## Queries

### tutorial.us_housing_units

```
1. 10 results with information on all columns
SELECT *
  FROM tutorial.us_housing_units
LIMIT 10

2. Housing starts in the Midwest
SELECT year,
      month,
      month_name,
      midwest
  FROM tutorial.us_housing_units

3. All housing starts in December since 1985
SELECT *
  FROM tutorial.us_housing_units
WHERE month = 12 AND year >= 1985

4. All housing starts in the second half of the year since 1990
```

# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

Part I
1. SELECT * FROM tutorial.us_housing_units LIMIT 10;
2. SELECT midwest FROM tutorial.us_housing_units;
3. SELECT south, west, midwest, northeast FROM tutorial.us_housing_units
   WHERE year >= 1985
     AND month = 12;
4. SELECT south, west, midwest, northeast FROM tutorial.us_housing_units
   WHERE year >= 1990
    AND month >= 6;
5. SELECT * FROM tutorial.us_housing_units
   WHERE south > 30;
6. SELECT (south + west + midwest + northeast) AS total_housing_starts
   FROM tutorial.us_housing_units;
7. SELECT year, 
          month, 
          (south + west + midwest + northeast) AS total_housing_starts
   FROM tutorial.us_housing_units;
8. SELECT * FROM tutorial.us_housing_units
   WHERE (south + midwest + northeast + west) > 70;
9. SELECT * FROM tutorial.us_housing_units 
   WHERE (south + midwest + northeast + west)
    BETWEEN 50 AND 80;
10. 
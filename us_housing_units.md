## Queries
1. 10 results with information on all columns
```sql
SELECT *
  FROM tutorial.us_housing_units 
  LIMIT 10
```

2. Housing starts in the Midwest
```sql
SELECT midwest, month, month_name, year
  FROM tutorial.us_housing_units 
```

3. All housing starts in December since 1985
```sql
SELECT *
  FROM tutorial.us_housing_units
  WHERE year >= 1985
```

4. All housing starts in the second half of the year since 1990
```sql
SELECT *
  FROM tutorial.us_housing_units
  WHERE year >= 1990
  AND month > 6
```

5. All rows where housing starts were above 30,000 in the South region
```sql
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > 30.0
```

6. The sum of housing starts across all regions for each row
```sql
SELECT year, month_name, south, west, northeast, midwest,
  south + west + northeast + midwest as Total
  FROM tutorial.us_housing_units
```

7. All rows where the sum of all housing starts is above 70,000
```sql
SELECT * 
  FROM tutorial.us_housing_units
  WHERE (south + west + northeast + midwest) > 70.0
```

8. All rows where the sum of all housing starts is between 50-80k
```sql
SELECT * 
  FROM tutorial.us_housing_units
  WHERE (south + west + northeast + midwest) BETWEEN 50.0 AND 80.0
```

9. The average of all housing starts across all regions for each row
```sql
SELECT year, month_name, (south + west + northeast + midwest)/4.0 as Avg 
  FROM tutorial.us_housing_units
```

10. All rows where the housing starts in the South are above the sum of the other three regions
```sql
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > (midwest + northeast + west)
```

11. The percentage of housing starts that occur in each region since 1990
```sql
SELECT
  year, month_name,
  south,
  (south / (south + northeast + west + midwest)) * 100 as "% South",
  west,
  (west / (south + northeast + west + midwest)) * 100 as "% West",
  midwest,
  (midwest / (south + northeast + west + midwest)) * 100 as "% Midwest",
  northeast,
  (northeast / (south + northeast + west + midwest)) * 100 as "% Northeast"
  FROM tutorial.us_housing_units
  WHERE year >= 1990
  ORDER BY year, month --chronological order
```
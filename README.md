# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

1. SELECT * 
    FROM tutorial.us_housing_units
    LIMIT 10
2. SELECT year, month, midwest
      FROM tutorial.us_housing_units
3. SELECT *
    FROM tutorial.us_housing_units
    WHERE month = 12 AND year >=1985
4. SELECT *
    FROM tutorial.us_housing_units
    WHERE month > 6 AND year >=1990
5. SELECT *
    FROM tutorial.us_housing_units
    WHERE south > 30
6. SELECT year, month, month_name,
    south+west+midwest+northeast AS housing_total
    FROM tutorial.us_housing_units
7. SELECT *
    FROM tutorial.us_housing_units
    WHERE south+west+midwest+northeast > 70
8. SELECT *
    FROM tutorial.us_housing_units
    WHERE south+west+midwest+northeast BETWEEN 50 AND 80
9. SELECT *, 
    (south+west+midwest+northeast)/4 AS average
    FROM tutorial.us_housing_units
10. SELECT *
    FROM tutorial.us_housing_units
    WHERE south > west+midwest+northeast
11. SELECT *, 
    (south/(south+west+midwest+northeast))*100 AS south_percentage,
    (west/(south+west+midwest+northeast))*100 AS west_percentage,
    (midwest/(south+west+midwest+northeast))*100 AS midwest_percentage,
    (northeast/(south+west+midwest+northeast))*100 AS northeast_percentage
    FROM tutorial.us_housing_units

1. SELECT *
    FROM tutorial.billboard_top_100_year_end 
    WHERE artist LIKE 'Elvis%'
### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

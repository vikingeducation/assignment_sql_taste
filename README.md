# assignment_sql_taste
A delicious appetizer of SQL-ey goodness
Name: Eric Stephanie

## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```
--------- US HOUSING
1. SELECT *
  FROM tutorial.us_housing_units
  LIMIT 10

2. SELECT midwest
    FROM tutorial.us_housing_units
3. SELECT *
  FROM tutorial.us_housing_units
  WHERE year >= 1985
  AND month_name = 'December'

4. SELECT *
  FROM tutorial.us_housing_units
  WHERE year >= 1990
  AND month >= 7

5. SELECT *
  FROM tutorial.us_housing_units
  WHERE south > 30

6. SELECT *,
  south + west + midwest + northeast AS sum
  FROM tutorial.us_housing_units
  WHERE south > 30

7. SELECT *
  FROM tutorial.us_housing_units
  WHERE  south + west + midwest + northeast > 70

8. SELECT *
  FROM tutorial.us_housing_units
  WHERE  south + west + midwest + northeast BETWEEN 50 and 80

9. SELECT *,
  (south + west + midwest + northeast) / 4 AS average
  FROM tutorial.us_housing_units

10. SELECT *
  FROM tutorial.us_housing_units
  WHERE (west + midwest + northeast) < south

11. SELECT year, month,
  south / (south + west + midwest + northeast) * 100 as southPercent,
  west / (south + west + midwest + northeast) * 100 as westPercent,
  midwest / (south + west + midwest + northeast) * 100 as midwestPercent,
  northeast / (south + west + midwest + northeast) * 100 as northeastPercent
  FROM tutorial.us_housing_units
  WHERE year > 1990


  /******       tutorial.billboard_top_100_year_end         ********/

1.SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE 'Elvis Presley'

2. SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%Tony%'

3. SELECT *,
  FROM tutorial.billboard_top_100_year_end
  WHERE song_name ILIKE '%love%'

4. SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE 'a%'

5.







//

# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

1)
SELECT *
  FROM tutorial.us_housing_units
  LIMIT 10

2)
SELECT year,
      month,
      month_name,
      midwest
FROM tutorial.us_housing_units

3)
SELECT *
FROM tutorial.us_housing_units
WHERE month = 12 AND year >= 1985

4)
SELECT *
FROM tutorial.us_housing_units
WHERE month > 6 AND year >= 1990

5)
SELECT *
FROM tutorial.us_housing_units
WHERE south > 30

6)
SELECT year,
      month,
      south,
      west,
      midwest,
      northeast,
      (south + west + midwest + northeast) AS sum
FROM tutorial.us_housing_units

7)
SELECT *
FROM tutorial.us_housing_units
WHERE (south + west + midwest + northeast) > 70

8)
SELECT *
FROM tutorial.us_housing_units
WHERE (south + west + midwest + northeast) > 50
  AND (south + west + midwest + northeast) < 80

9)
SELECT year,
      month,
      south,
      west,
      midwest,
      northeast,
      (south + west + midwest + northeast) / 4 AS average
FROM tutorial.us_housing_units

10)
SELECT *
FROM tutorial.us_housing_units
WHERE south > (west + midwest + northeast)

11)
SELECT year,
      south / (south + west + midwest + northeast) * 100 as "south_%",
      west / (south + west + midwest + northeast) * 100 as "west_%",
      midwest / (south + west + midwest + northeast) * 100  as "midwest_%",
      northeast / (south + west + midwest + northeast) * 100 as "northeast_%"
  FROM tutorial.us_housing_units
  WHERE year >= 1990

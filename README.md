# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Census Housing Data
1)
```sql
SELECT *
  FROM tutorial.us_housing_units
  LIMIT 10
```
2)
```sql
  SELECT midwest
  FROM tutorial.us_housing_units
```
3)
```sql
SELECT *
  FROM tutorial.us_housing_units
  WHERE year >= 1985
  AND month = 12
```
4)
```sql
SELECT *
  FROM tutorial.us_housing_units
  WHERE year >= 1990
  AND month > 6
```
5)
```sql
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > 30
```
6)
```sql
SELECT *,
       south + west + midwest + northeast AS sum
  FROM tutorial.us_housing_units
```
7)
```sql
SELECT *
  FROM tutorial.us_housing_units
  WHERE south + west + midwest + northeast > 70
```
8)
```sql
SELECT *
  FROM tutorial.us_housing_units 
  WHERE (northeast + midwest + south + west) between 50 and 80
```
9)
```sql
SELECT *,
  (northeast + midwest + south + west) / 4 as "Average"
  FROM tutorial.us_housing_units
```
10)
```sql
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > (northeast + midwest + west)
```
11)
```sql
SELECT *,
  northeast / (northeast + midwest + west + south) * 100 as "Percent NorthEast",
  midwest / (northeast + midwest + west + south) * 100 as "Percent MidWest",
  west / (northeast + midwest + west + south) * 100 as "Percent West",
  south / (northeast + midwest + west + south) * 100 as "Percent South"
  FROM tutorial.us_housing_units
  WHERE year >= 1990
```


## tutorial.billboard_top_100_year_end

1)
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist LIKE '%Elvis%' OR "group" LIKE '%Elvis%'
```
2)
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%Tony%'
```


## Authors
Vishal and Matt


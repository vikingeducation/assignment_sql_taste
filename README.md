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


Vishal and Matt

# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

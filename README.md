# assignment_sql_taste
A delicious appetizer of SQL-ey goodness

BranLiang


## Queries

### Example

```sql
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

## tutorial.us_housing_units
### 10 results with information on all columns
```sql
SELECT *
  FROM tutorial.us_housing_units
 LIMIT 10
```
### Housing starts in the Midwest
```sql
SELECT midwest
  FROM tutorial.us_housing_units
```
### All housing starts in December since 1985
```sql
SELECT *
  FROM tutorial.us_housing_units
 WHERE month = 11
   AND year >= 1985
```
### All housing starts in the second half of the year since 1990
```sql
SELECT *
  FROM tutorial.us_housing_units
 WHERE month > 6
   AND year >= 1990
```
### All rows where housing starts were above 30,000 in the South region
```sql
SELECT *
  FROM tutorial.us_housing_units
 WHERE south > 30
```
### The sum of housing starts across all regions for each row
```sql
SELECT year,
       month_name,
       south + west + midwest + northeast AS sum
  FROM tutorial.us_housing_units
```
### All rows where the sum of all housing starts is above 70,000 Note: You can't use an alias in a WHERE clause.
```sql
SELECT *
  FROM tutorial.us_housing_units
 WHERE (south + west + midwest + northeast) > 70
```
### All rows where the sum of all housing starts is between 50-80k
```sql
SELECT *
  FROM tutorial.us_housing_units
 WHERE (south + west + midwest + northeast) BETWEEN 50 AND 80
```
### The average of all housing starts across all regions for each row
```sql
SELECT year,
       month_name,
       (south + west + midwest + northeast)/4 AS average
  FROM tutorial.us_housing_units
```
### All rows where the housing starts in the South are above the sum of the other three regions
```sql
SELECT *
  FROM tutorial.us_housing_units
 WHERE south > (west + midwest + northeast)
```
### The percentage of housing starts that occur in each region since 1990 Note: Use an alias to title the new columns appropriately
```sql
SELECT south/(south + west + midwest + northeast) AS south,
       west/(south + west + midwest + northeast) AS west,
       midwest/(south + west + midwest + northeast) AS midwest,
       northeast/(south + west + midwest + northeast) AS northeast
  FROM tutorial.us_housing_units
 WHERE year >= 1990
```

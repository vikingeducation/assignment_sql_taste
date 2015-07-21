# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```


-- SELECT *
--   FROM tutorial.us_housing_units
-- LIMIT 10

-- SELECT midwest
--   FROM tutorial.us_housing_units

-- SELECT *
--   FROM tutorial.us_housing_units
-- WHERE month_name = 'December' AND year >= 1985

-- SELECT *
-- FROM tutorial.us_housing_units
-- WHERE month > 6 AND year > 1990
  
-- SELECT *
-- FROM tutorial.us_housing_units
-- WHERE   west > 30

-- SELECT south + west + northeast + midwest
-- FROM tutorial.us_housing_units

-- SELECT *
-- FROM tutorial.us_housing_units
-- WHERE (south + west + northeast + midwest) > 70
 
-- SELECT *
-- FROM tutorial.us_housing_units
-- WHERE 50 >  (south + west + northeast + midwest)  AND (south + west + northeast + midwest) < 70

-- SELECT  (south + west + northeast + midwest) / 4
-- FROM tutorial.us_housing_units

SELECT *,
        south / (south + west + northeast + midwest) * 100 AS south_per,
        west  / (south + west + northeast + midwest) * 100 AS west_per,
       (northeast /  (south + west + northeast + midwest)) * 100 AS northwest_per,
       (midwest / (south + west + northeast + midwest)) * 100 AS midwest_per
FROM tutorial.us_housing_units





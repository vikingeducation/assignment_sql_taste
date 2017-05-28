# assignment_sql_taste
A delicious appetizer of SQL-ey goodness

Chad Lucas


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1

```

1. SELECT *
        FROM tutorial.us_housing_units
        LIMIT 10   

2. SELECT year,
                   month,
                   month_name,
                   midwest
         FROM tutorial.us_housing_units

3. SELECT *
           FROM tutorial.us_housing_units
WHERE month = 12
AND year >= 1985

4. SELECT *
          FROM tutorial.us_housing_units
WHERE month BETWEEN 6 AND 12
AND year >= 1990

5. SELECT *
         FROM tutorial.us_housing_units
WHERE  south > 30


6.SELECT year,
      month,
      month_name,
      south,
      west,
      midwest,
      northeast,
      (south + west + midwest + northeast)/4 AS region_avg
  FROM tutorial.us_housing_units

7.SELECT year,
       month,
       month_name,
       south,
       west,
       midwest,
       northeast,
       (south + west + midwest + northeast) AS house_avg
  FROM tutorial.us_housing_units 
WHERE (south + west + midwest + northeast) > 70

8.SELECT year,
       month,
       month_name,
       south,
       west,
       midwest,
       northeast,
       (south + west + midwest + northeast) AS house_avg
  FROM tutorial.us_housing_units 
WHERE (south + west + midwest + northeast) BETWEEN 50 AND 80

9.

10. SELECT *
  FROM tutorial.us_housing_units 
WHERE south > (west + midwest + northeast) 




1.SELECT * 
   FROM tutorial.billboard_top_100_year_end 
WHERE artist LIKE 'Elvis Presley'

2.SELECT * 
   FROM tutorial.billboard_top_100_year_end 
WHERE artist ILIKE '%tony%'

3.SELECT * 
   FROM tutorial.billboard_top_100_year_end 
WHERE song_name ILIKE '%love%'

4.SELECT * 
   FROM tutorial.billboard_top_100_year_end 
WHERE artist LIKE 'A%'

5.SELECT * 
   FROM tutorial.billboard_top_100_year_end 
WHERE year_rank BETWEEN 1 AND 3
AND year BETWEEN 1960 AND 1969

6. SELECT *
      FROM tutorial.billboard_top_100_year_end 
WHERE artist IN ('Elvis Presley', 'The Rolling Stone', 'Van Halen')

9.SELECT *
      FROM tutorial.billboard_top_100_year_end 
WHERE year BETWEEN 1970 AND 1979
AND year_rank BETWEEN 10 AND 20

10.SELECT *
      FROM tutorial.billboard_top_100_year_end 
WHERE year BETWEEN 1990 AND 1999
AND year_rank BETWEEN 10 AND 20
AND artist NOT LIKE 'Madonna'

11. SELECT *
      FROM tutorial.billboard_top_100_year_end 
WHERE year = 1985
AND "group" NOT LIKE ('Madonna')
AND "group" NOT LIKE ('Phil Collins')

12. SELECT *
      FROM tutorial.billboard_top_100_year_end 
WHERE year_rank = 1

13. SELECT *
      FROM tutorial.billboard_top_100_year_end 
WHERE artist IS NULL

14 SELECT *
      FROM tutorial.billboard_top_100_year_end 
WHERE artist LIKE 'Madonna'
ORDER BY year_rank

15. SELECT *
      FROM tutorial.billboard_top_100_year_end 
WHERE artist LIKE 'Madonna'
ORDER BY year, year_rank

16.SELECT *
      FROM tutorial.billboard_top_100_year_end 
WHERE year >= 1990
AND year_rank IN (1,2,3)
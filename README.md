# assignment_sql_taste
A delicious appetizer of SQL-ey goodness

Greg Filipczak and Ed Triplett

## Queries
tutorial.us_housing_units

1) SELECT *
FROM tutorial.us_housing_units
LIMIT 10

2) SELECT midwest
FROM tutorial.us_housing_units

3) SELECT *
FROM tutorial.us_housing_units
WHERE month = 12
AND year>1985

4) 
SELECT *
FROM tutorial.us_housing_units
WHERE month>6
AND year>1990

5)
SELECT *
FROM tutorial.us_housing_units
WHERE south>30

6)
SELECT *,
      (northeast+midwest+west+south) AS total
FROM tutorial.us_housing_units

7)
SELECT *
FROM tutorial.us_housing_units
WHERE (northeast+midwest+west+south)>70

8)
SELECT *
FROM tutorial.us_housing_units
  WHERE (northeast+midwest+west+south) BETWEEN 50 AND 80

9)
SELECT *,
      (northeast+midwest+west+south)/4 AS average 
FROM tutorial.us_housing_units

10)
SELECT * 
FROM tutorial.us_housing_units
WHERE (northeast+midwest+west) < south

11)
SELECT *,
    100*south/(northeast+midwest+west+south) AS percentage_south,
    100*northeast/(northeast+midwest+west+south) AS percentage_northeast,
    100*west/(northeast+midwest+west+south) AS percentage_west,
    100*midwest/(northeast+midwest+west+south) AS percentage_midwest


tutorial.billboard_top_100_year_end

1)
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "group" ILIKE '%Elvis Presley%'

2)
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist ILIKE '%tony%'

3)
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE song_name ILIKE '%love%'

4)
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist ILIKE 'A%'

5)
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank < 4
  AND year BETWEEN 1960 AND 1969

6)
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist IN ('Elvis Presley', 'The Rolling Stones', 'Van Halen')

7) * from Chris
SELECT artist, COUNT(*) AS appearances
  FROM tutorial.billboard_top_100_year_end
  GROUP BY artist
  ORDER BY appearances DESC
  LIMIT 1;


8) Beatles and Elvis tie at 2 - but cheated by reading results
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank=1
ORDER BY artist

9)
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year = 1970
  AND year_rank BETWEEN 10 AND 20

10)
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year BETWEEN 1990 AND 1999
  AND artist = 'Madonna'
  AND year_rank < 10

11)
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year = 1985
  AND group NOT ILIKE '%Phil Collins%'
  AND group NOT ILIKE '%Madonna%'

12)
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank = 1

13)
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist IS NULL

14)
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Madonna'
ORDER BY 2

15)
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Madonna'
ORDER BY 1, 2

16)
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year > 1990
  AND year_rank <4
ORDER BY 2, 1












### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```















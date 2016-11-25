# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```
```
SELECT * FROM tutorial.us_housing_units LIMIT 10;
```

```
SELECT midwest FROM tutorial.us_housing_units;
```
```
SELECT * FROM tutorial.us_housing_units WHERE month_name = 'December' AND
   year >= 1985;
```

```
SELECT * FROM tutorial.us_housing_units WHERE month > 6 AND year > 1989;
```

```
SELECT * FROM tutorial.us_housing_units WHERE south > 30;
```

```
SELECT (south + west + midwest + northeast) as total FROM
tutorial.us_housing_units;
```

```
SELECT * FROM tutorial.us_housing_units WHERE (south + west + midwest +
northeast) > 70;
```

```
SELECT * FROM tutorial.us_housing_units WHERE (south + west + midwest +
northeast) BETWEEN 50 AND 80;
```

```
SELECT AVG(south + west + midwest + northeast) FROM tutorial.us_housing_units;
```

```
SELECT * FROM tutorial.us_housing_units WHERE south > (west + midwest +
northeast);
```

Total column average
```
SELECT AVG(south / (south + west + midwest + northeast)) * 100 as south_percentage,
       AVG(west / (south + west + midwest + northeast)) * 100 as west_percentage,
       AVG(midwest / (south + west + midwest + northeast)) * 100 as midwest_percentage,
       AVG(northeast / (south + west + midwest + northeast)) * 100 as northeast_percentage
FROM tutorial.us_housing_units WHERE year >= 1990;
```

Row average
```
SELECT ((south / (south + west + midwest + northeast)) * 100) as south_percentage,
       ((west / (south + west + midwest + northeast)) * 100) as west_percentage,
       ((midwest / (south + west + midwest + northeast)) * 100) as midwest_percentage,
       ((northeast / (south + west + midwest + northeast)) * 100) as northeast_percentage
FROM tutorial.us_housing_units WHERE year >= 1990;
```

```
SELECT * FROM tutorial.billboard_top_100_year_end WHERE artist LIKE 'Elvis
Presley';
```

```
SELECT * FROM tutorial.billboard_top_100_year_end WHERE artist LIKE 'Tony%';
```
% is like Ruby's * matcher

```
SELECT * FROM tutorial.billboard_top_100_year_end WHERE song_name LIKE '%love%';
```

```
SELECT * FROM tutorial.billboard_top_100_year_end WHERE artist LIKE 'A%';
```

```
SELECT * FROM tutorial.billboard_top_100_year_end WHERE year_rank < 4;
```

```
SELECT * FROM tutorial.billboard_top_100_year_end WHERE artist IN ('Elvis
Presley', 'Rolling Stones', 'Van Halen');
```

() array literal constructor

```
SELECT COUNT(artist) as artist_count, artist
FROM tutorial.billboard_top_100_year_end
GROUP BY artist ORDER BY artist_count DESC LIMIT 1;
```

```
SELECT COUNT(year_rank), artist
FROM (SELECT year_rank, artist
      FROM tutorial.billboard_top_100_year_end
WHERE year_rank = 1) num_1_hits
GROUP BY artist ORDER BY count DESC LIMIT 2;
```

```
SELECT * FROM tutorial.billboard_top_100_year_end WHERE year_rank BETWEEN 10 AND
20 AND year = 1970;
```

```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year IN (SELECT year
               FROM tutorial.billboard_top_100_year_end
               WHERE artist = 'Madonna' and year_rank < 10)
AND year BETWEEN 1990 AND 1999;
```

```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year = 1985 AND "group" NOT ILIKE '%Madonna%' AND "group" NOT ILIKE '%Phil
Collins%';
```

```
SELECT song_name, year
FROM tutorial.billboard_top_100_year_end
WHERE year_rank = 1
GROUP BY "group", song_name, year;
```

```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist IS NULL;
```

```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Madonna'
ORDER BY year_rank
LIMIT 100;
```

```
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year >= 1990 AND year_rank <= 3
ORDER BY year_rank, year;
```

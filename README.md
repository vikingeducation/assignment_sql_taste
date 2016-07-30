# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

Part I
1. SELECT * FROM tutorial.us_housing_units LIMIT 10;
2. SELECT midwest FROM tutorial.us_housing_units;
3. SELECT south, west, midwest, northeast FROM tutorial.us_housing_units
   WHERE year >= 1985
     AND month = 12;
4. SELECT south, west, midwest, northeast FROM tutorial.us_housing_units
   WHERE year >= 1990
    AND month >= 6;
5. SELECT * FROM tutorial.us_housing_units
   WHERE south > 30;
6. SELECT (south + west + midwest + northeast) AS total_housing_starts
   FROM tutorial.us_housing_units;
7. SELECT year, 
          month, 
          (south + west + midwest + northeast) AS total_housing_starts
   FROM tutorial.us_housing_units;
8. SELECT * FROM tutorial.us_housing_units
   WHERE (south + midwest + northeast + west) > 70;
9. SELECT * FROM tutorial.us_housing_units 
   WHERE (south + midwest + northeast + west)
    BETWEEN 50 AND 80;
10. SELECT *
  FROM tutorial.us_housing_units 
  where south > (west + midwest + northeast)
11. SELECT year, 
        month, 
        (south /(south + west + midwest + northeast) *100) as south_percent,
        (west /(south + west + midwest + northeast) *100) as west_percent,
        (midwest /(south + west + midwest + northeast) *100) as midwest_percent,
        (northeast /(south + west + midwest + northeast) *100) as northeast_percent
  FROM tutorial.us_housing_units 
  where south > (west + midwest + northeast)

  Tutorial.billboard_top_100_year_end

  1. SELECT *
  FROM tutorial.billboard_top_100_year_end  
  WHERE "artist" ilike '%elvis presley%'
  2. SELECT *
  FROM tutorial.billboard_top_100_year_end  
  WHERE "artist" ilike '%tony%'
  3. SELECT *
  FROM tutorial.billboard_top_100_year_end  
  WHERE "song_name" ilike '%love%'
  4. SELECT *
  FROM tutorial.billboard_top_100_year_end  
  WHERE "artist" like 'A%'
  5. SELECT *
  FROM tutorial.billboard_top_100_year_end  
  WHERE year between 1960 and 1969
  AND year_rank <=3
  6. SELECT *
  FROM tutorial.billboard_top_100_year_end  
  WHERE artist in ('Rolling Stones','Elvis Presley',  'Van Halen')
  7. SELECT artist, COUNT( artist) as "artist_occurrance"
  FROM tutorial.billboard_top_100_year_end 
  group by "artist"
  order by "artist_occurrance" desc
  limit 1
  8. SELECT artist,
       count(artist) AS artist_count
       FROM tutorial.billboard_top_100_year_end
     WHERE year_rank = 1
     GROUP BY artist
     ORDER BY artist_count desc;
  9. SELECT * FROM tutorial.billboard_top_100_year_end 
       WHERE year = 1970
       AND year_rank BETWEEN 10 AND 20;
  10. SELECT * FROM tutorial.billboard_top_100_year_end (***)
        WHERE
          (year BETWEEN 1990 AND 1999)
          AND 
          NOT (artist ilike '%madonna%' AND year_rank BETWEEN 10 AND 100);
  11. SELECT * FROM tutorial.billboard_top_100_year_end
      WHERE year = 1985
        AND NOT ("group" ilike '%madonna%')
        AND NOT ("group" ilike '%phil collins%');
  12. SELECT song_name FROM tutorial.billboard_top_100_year_end 
      WHERE year_rank = 1;
  13. SELECT * FROM tutorial.billboard_top_100_year_end 
      WHERE artist IS NULL;
  14. SELECT * FROM tutorial.billboard_top_100_year_end 
      WHERE artist ilike '%madonna%'
      ORDER BY year_rank;
  15. SELECT * FROM tutorial.billboard_top_100_year_end 
      WHERE artist ilike '%madonna%'
      ORDER BY year, year_rank;
  16. 
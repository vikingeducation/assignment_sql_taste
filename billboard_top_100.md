## Queries
1. All rows where Elvis Presley had a song on the top 100 charts
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist ILIKE '%Elvis Presley%'
```

2. All rows where the artist's name contained "Tony" (not case sensitive)
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist ILIKE '%Tony%'
```

3. All rows where the song title contained the word "love" in any way
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end 
  WHERE song_name ILIKE '%love%'
```

4. All rows where the artist's name begins with the letter "A"
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist ILIKE 'a%'
```

5. The top 3 songs from each year between 1960-1969
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end 
  WHERE year BETWEEN 1960 AND 1969
  AND year_rank <= 3
```

6. All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end 
  WHERE artist in ('Elvis Presley', 'Rolling Stones', 'Van Halen')
```

7. Which artist has had the most appearances on the top 100 list? *Tie: Madona and Elvis*
```sql
SELECT artist, COUNT(*)
  FROM tutorial.billboard_top_100_year_end 
  GROUP BY artist
  ORDER BY COUNT(*) DESC
```

8. Which artist has had the most #1 hits? How many? *Tie again: Elvis and The Beatles each had 2.*
```sql
SELECT artist, COUNT(*)
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1
  GROUP BY artist
  ORDER BY COUNT(*) DESC
```

9. All rows from 1970 where the songs were ranked 10-20th
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank BETWEEN 10 AND 20
  AND year = 1970
```

10. All rows from the 1990's where Madonna was not ranked 10-100th
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1990
  AND artist = 'Madonna'
  AND year_rank < 10
```

11. All rows from 1985 which do not include Madonna or Phil Collins in the group
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1985
  AND "group" NOT ILIKE '%Madonna%'
  AND "group" NOT ILIKE '%Phil Collins%'
```

12. All number 1 songs in the data set
```sql
SELECT song_name, artist, year
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1
```

13. All rows where the artist is not listed
```sql
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IS NULL
```

14. All of Madonna's top 100 hits ordered by their ranking (1 to 100)
```sql
SELECT year, song_name, year_rank
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%Madonna%'
  ORDER BY year_rank
```

15. All of Madonna's top 100 hits ordered by their ranking within each year
```sql
SELECT year, song_name, year_rank
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%Madonna%'
  ORDER BY year, year_rank
```

16. Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990
```sql
SELECT year, song_name, artist, year_rank
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank BETWEEN 1 AND 3
  AND year >= 1990
  ORDER BY year_rank, year
```

## Intermediate Queries
1. What is the average position reached by Michael Jackson? *46*
```sql
SELECT artist, AVG(year_rank)
  FROM tutorial.billboard_top_100_year_end
  WHERE artist = 'Michael Jackson'
  GROUP BY artist
```
2. List the top 10 artists based on their number of appearances on this list (and what that number is) since 1985
```sql
SELECT artist, COUNT(*) as appearances
  FROM tutorial.billboard_top_100_year_end
  WHERE year >= 1985
  GROUP BY artist
  ORDER BY COUNT(*) DESC
  LIMIT 10
```
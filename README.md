# assignment_sql_taste
A delicious appetizer of SQL-ey goodness

Jeremy Vermast

## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

HOUSE US : 

1 SELECT *
	FROM tut
	LIMIT 10

2 SELECT midwest
	FROM tut

3 SELECT *
	FROM tut
	WHERE year >= 1985
	AND month = 12 

4 SELECT *
	FROM tut
	WHERE year >= 1990
	AND month >= 7

5 SELECT *
	FROM tut
	WHERE south >= 30

6 SELECT west + south + midwest + northeast AS total
	FROM tut

7 SELECT *
	FROM tut
	WHERE west + south + midwest + northeast > 70

8 SELECT *
	FROM tut
	WHERE west + south + midwest + northeast BETWEEN 50 AND 70

9 SELECT ( west + south + midwest + northeast ) / 4 AS average
	FROM tut

10 SELECT *
	FROM tut
	WHERE south > ( west + midwest + northeast )

11 SELECT *,
	( west / (west + south + midwest + northeast) ) * 100 AS west_per,
	( south / (west + south + midwest + northeast) ) * 100 AS south_per,
	( midwest / (west + south + midwest + northeast) ) * 100 AS midwest_per,
	( northeast / (west + south + midwest + northeast) ) * 100 AS northeast_per
	FROM tutorial.us_housing_units 
	WHERE year >= 1990


BILLBOARD : 

1 SELECT *
	FROM bill
	WHERE artist = 'Elvis Presley'

2 SELECT *
	FROM bill
	WHERE artist ILIKE '%tony%'

3 SELECT *
	FROM bill
	WHERE song_name ILIKE '%love%'

4 SELECT *
	FROM bill
	WHERE artist LIKE 'A%'

5 SELECT *
	FROM bill
	WHERE year BETWEEN 1960 AND 1969
	AND year_rank <= 3

6 SELECT *
	FROM bill
	WHERE artist IN ('Elvis Presley', 'The Rolling Stones', 'Van Halen')

--7 Which artist has had the most appearances on the top 100 list?

	SELECT COUNT(*) AS artist_count
	FROM bill
	GROUP BY artist
	ORDER BY artist_count DESC
	LIMIT 1

--8 Which artist has had the most #1 hits? How many?

	SELECT COUNT(*) as artist_count
	FROM bill
	GROUP BY artist
	WHERE year_rank = 1
	ORDER BY artist_count DESC
	LIMIT 1

9 SELECT *
	FROM bill
	WHERE year = 1970
	AND year_rank BETWEEN 10 AND 20

--10 All rows from the 1990's where Madonna was not ranked 10-100th

	SELECT *
	FROM bill
	WHERE year BETWEEN 1990 AND 1999
	AND NOT (artist = 'Madonna' AND year_rank > 10)

11 SELECT *
	FROM tutorial.billboard_top_100_year_end 
	WHERE year = 1985
	AND "group" NOT ILIKE '%Madonna%'  
	AND "group" NOT ILIKE '%Phil Collins%'

12 SELECT *
	FROM bill
	WHERE year_rank = 1

13 SELECT *
	FROM bill
	WHERE artist IS NULL

14 SELECT *
	FROM bill
	WHERE artist = 'Madonna'
	ORDER BY year_rank

15 SELECT *
	FROM bill
	WHERE artist = 'Madonna'
	ORDER BY year, year_rank

16 SELECT *
	FROM tutorial.billboard_top_100_year_end 
	WHERE year >= 1990
	AND year_rank <= 3
	ORDER BY year_rank, year


tutorial.billboard_top_100_year_end

SELECT year_rank
FROM bill
WHERE artist = 'Phil Collins'
ORDER BY year_rank
LIMIT 1

SELECT AVG(year_rank)
FROM bill
WHERE artist = 'Michael Jackson'
GROUP BY year_rank

SELECT AVG(year_rank)
FROM bill
WHERE artist = 'Madonna'
AND year_rank <= 10
GROUP BY year_rank

SELECT COUNT(artist) AS count_artist
FROM bill
WHERE year > 1985
GROUP BY count_artist
ORDER BY count_artist

SELECT COUNT(*)
FROM bill
WHERE artist IN ('Elvis Presley', 'Madonna', 'The Beatles', 'Elton John')
AND year_rank <= 10

aapl_historical_stock_price

SELECT COUNT(*)
FROM appl
WHERE stock_price > 5





































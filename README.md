# assignment\_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

##tutorial.us\_housing_units

Tip: You can use CMD + / to comment out multiple lines at a time in the SQL editor just like in your text editor

1. 10 results with information on all columns
	
	```sql
	SELECT *
	  FROM tutorial.us_housing_units
	  LIMIT 10
	```

2. Housing starts in the Midwest
	
	```sql
	SELECT year, month, midwest 
		FROM tutorial.us_housing_units
	```
3. All housing starts in December since 1985

	```sql
	SELECT * 
		FROM tutorial.us_housing_units
		WHERE year > 1985
		OR (month_name = 'December' AND year = 1985)
	```
4. All housing starts in the second half of the year since 1990

	```sql
	SELECT *
		FROM tutorial.us_housing_units 
		 WHERE year > 1990 AND month > 5
	```
5. All rows where housing starts were above 30,000 in the South region

	```sql
	SELECT *
		FROM tutorial.us_housing_units
		WHERE south > 30
	```
6. The sum of housing starts across all regions for each row

	```sql
	SELECT year,
			month,
			west + south + midwest + northeast AS totals
		FROM tutorial.us_housing_units
	```
7. All rows where the sum of all housing starts is above 70,000 Note: 	You can't use an alias in a WHERE clause.

	```sql
	SELECT *
		FROM tutorial.us_housing_units
		WHERE (west + south + midwest + northeast)  > 70
	```
8. All rows where the sum of all housing starts is between 50-80k

	```sql
		SELECT *
			FROM tutorial.us_housing_units
			WHERE (west + south + midwest + northeast) BETWEEN 50 AND 80
	```
9. The average of all housing starts across all regions for each row

	```sql 
	SELECT 
		(west + south + midwest + northeast) / 4 AS avg_housing
		FROM tutorial.us_housing_units
	```
10. All rows where the housing starts in the South are above the sum of the other three regions

	```sql
	SELECT *
		FROM tutorial.us_housing_units
		WHERE south > (west + northeast + midwest)
	```
11. The percentage of housing starts that occur in each region since 1990 Note: Use an alias to title the new columns appropriately
	
	```sql
	SELECT 
		(west / (west + south + midwest + northeast) * 100) AS west_perc,
		(south / (west + south + midwest + northeast) * 100) AS south_perc,
		(midwest /(west + south + midwest + northeast) * 100) AS midwest_perc,
		(northeast/ (west + south + midwest + northeast) * 100) AS northeast_perc
		FROM tutorial.us_housing_units
		WHERE year > 1989
	```

tutorial.billboard_top_100_year_end
Note: Use single quotes ' instead of double quotes " for LIKE and similar queries since the Mode tool is very particular about its syntax. Double quotes are used to specify column names, so you might get a "column XYZ does not exist" error if you mess this up.

1. All rows where Elvis Presley had a song on the top 100 charts

	```sql
	SELECT *
		FROM tutorial.billboard_top_100_year_end
		WHERE "group" LIKE '%Elvis%'
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
				WHERE artist LIKE 'A%'
	```


5. The top 3 songs from each year between 1960-1969

	```sql
			SELECT *
				FROM tutorial.billboard_top_100_year_end
				WHERE year_rank < 4 AND year BETWEEN 1960 AND 1969
	```

6. All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist


	```sql
			SELECT *
				FROM tutorial.billboard_top_100_year_end
				WHERE artist IN ('Elvis Presley', 'The Rolling Stones', 'Van Halen')
	```

7. Which artist has had the most appearances on the top 100 list?

	```sql
				SELECT COUNT(artist) as count_artist, artist
				FROM tutorial.billboard_top_100_year_end
				GROUP BY artist
				ORDER BY count_artist desc
	```

8. Which artist has had the most #1 hits? How many?

	```sql
			SELECT COUNT(year_rank) as number_one, artist
				FROM tutorial.billboard_top_100_year_end
				WHERE year_rank = 1
				GROUP BY artist
				ORDER BY number_one desc
	```
	
9. All rows from 1970 where the songs were ranked 10-20th

	```sql
			SELECT *
				FROM tutorial.billboard_top_100_year_end
				WHERE year_rank BETWEEN 10 AND 20 AND year = 1970
	```

10. All rows from the 1990's where Madonna was not ranked 10-100th

	```sql
			SELECT *
				FROM tutorial.billboard_top_100_year_end
				WHERE artist ILIKE '%Madonna%' AND (year_rank NOT BETWEEN 10 AND 100) AND year = 1990
	```

11. All rows from 1985 which do not include Madonna or Phil Collins in the group.
	
	```sql
			SELECT *
				FROM tutorial.billboard_top_100_year_end
				WHERE artist NOT IN ('Madonna', 'Phil Collins') AND year = 1985
	```


12. All number 1 songs in the data set.
			SELECT song_name
				FROM tutorial.billboard_top_100_year_end
				WHERE year_rank = 1

13. All rows where the artist is not listed
			SELECT *
				FROM tutorial.billboard_top_100_year_end
				WHERE artist IS NULL

14. All of Madonna's top 100 hits ordered by their ranking (1 to 100)

			SELECT *
				FROM tutorial.billboard_top_100_year_end
				WHERE artist LIKE 'Madonna' AND year_rank < 101
			  ORDER BY year_rank

15. All of Madonna's top 100 hits ordered by their ranking within each year

			SELECT year, year_rank, artist
				FROM tutorial.billboard_top_100_year_end
				WHERE artist LIKE 'Madonna' AND year_rank < 101
				GROUP BY artist, year_rank, year
			  ORDER BY year asc

16. Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990. (Hint: Multiple ordering)

			SELECT *
				FROM tutorial.billboard_top_100_year_end
				WHERE year_rank < 3 AND year > 1989
				GROUP BY year_rank, year, "group", artist, song_name, id
			  ORDER BY year_rank asc
			  
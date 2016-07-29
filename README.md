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

All rows where Elvis Presley had a song on the top 100 charts
All rows where the artist's name contained "Tony" (not case sensitive)
All rows where the song title contained the word "love" in any way
All rows where the artist's name begins with the letter "A"
The top 3 songs from each year between 1960-1969
All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist
Which artist has had the most appearances on the top 100 list?
Which artist has had the most #1 hits? How many?
All rows from 1970 where the songs were ranked 10-20th
All rows from the 1990's where Madonna was not ranked 10-100th
All rows from 1985 which do not include Madonna or Phil Collins in the group.
All number 1 songs in the data set.
All rows where the artist is not listed
All of Madonna's top 100 hits ordered by their ranking (1 to 100)
All of Madonna's top 100 hits ordered by their ranking within each year
Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990. (Hint: Multiple ordering)
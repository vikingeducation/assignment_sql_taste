# assignment_sql_taste
A delicious appetizer of SQL-ey goodness


## Queries

### Example

```
SELECT *
  FROM tutorial.us_housing_units
  WHERE month = 1
```

Synopsis
-----
Practice writing SQL queries against a various datasets: [US Census housing](http://www.census.gov/econ/currentdata/) data, and [Billboard music charts](http://www.billboard.com/charts) data

### tutorial.us_housing_units

1.	10 results with information on all columns
```
select * 
from tutorial.us_housing_units limit 10
```

2.	Housing starts in the Midwest
```
select year, month, month_name, midwest 
from tutorial.us_housing_units
```

3.	All housing starts in December since 1985
```
select * 
from tutorial.us_housing_units 
where month = 12 and year >=1985
```

4.	All housing starts in the second half of the year since 1990
```
select * 
from tutorial.us_housing_units 
where (month between 7 and 12) and year >= 1990
```

5.	All rows where housing starts were above 30,000 in the South region
```
select * 
from tutorial.us_housing_units 
where south > 30
```

6.	The sum of housing starts across all regions for each row
```
select *, south+ west+ midwest+ northeast as sum_all_regions 
from tutorial.us_housing_units
```

7.	All rows where the sum of all housing starts is above 70,000 Note: You can't use an alias in a WHERE clause.
```
select *, south+ west+ midwest+ northeast as all_regions 
from tutorial.us_housing_units 
where (south+ west+ midwest+ northeast) > 70
```

8.	All rows where the sum of all housing starts is between 50-80k
```
select *, south+ west+ midwest+ northeast as all_regions 
from tutorial.us_housing_units 
where (south+ west+ midwest+ northeast) between 50 and 80
```

9.	The average of all housing starts across all regions for each row
```
select *, (south+ west+ midwest+ northeast)/4 as avg_all_regions 
from tutorial.us_housing_units
```

10.	All rows where the housing starts in the South are above the sum of the other three regions
```
select * 
from tutorial.us_housing_units 
where south > (west+ midwest+ northeast)
```

11.	The percentage of housing starts that occur in each region since 1990 Note: Use an alias to title the new columns appropriately
```
select *, 
(south/(west+ midwest+ northeast))*100 as "south%", 
(west/(south+ midwest+ northeast))*100 as "west%", 
(midwest/(west+ south+ northeast))*100 as "midwest%", 
(northeast/(west+ midwest+ south))*100 as "northeast%" 
from tutorial.us_housing_units 
where year >= 1990

```


### tutorial.us_housing_units
1.	All rows where Elvis Presley had a song on the top 100 charts
```
```

2.	All rows where the artist's name contained "Tony" (not case sensitive)
```
```

3.	All rows where the song title contained the word "love" in any way
```
```

4.	All rows where the artist's name begins with the letter "A"
```
```

5.	The top 3 songs from each year between 1960-1969
```
```

6.	All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist
```
```

7.	Which artist has had the most appearances on the top 100 list?
```
```

8.	Which artist has had the most #1 hits? How many?
```
```

9.	All rows from 1970 where the songs were ranked 10-20th
```
```

10.	All rows from the 1990's where Madonna was not ranked 10-100th
```
```

11.	All rows from 1985 which do not include Madonna or Phil Collins in the group.
```
```

12.	All number 1 songs in the data set.
```
```

13.	All rows where the artist is not listed
```
```

14.	All of Madonna's top 100 hits ordered by their ranking (1 to 100)
```
```

15.	All of Madonna's top 100 hits ordered by their ranking within each year
```
```

16.	Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990. (Hint: Multiple ordering)
```
```


#### by Dennis C  :hamburger:

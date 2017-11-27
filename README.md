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
Practice writing SQL queries against various datasets: [US Census housing](http://www.census.gov/econ/currentdata/) data, and [Billboard music charts](http://www.billboard.com/charts) data

### US Census housing data

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


### Billboard music charts data

1.	All rows where Elvis Presley had a song on the top 100 charts
```
select * 
from tutorial.billboard_top_100_year_end 
where "group" ilike '%elvis%presley%'
```

2.	All rows where the artist's name contained "Tony" (not case sensitive)
```
select * 
from tutorial.billboard_top_100_year_end 
where group ilike '%tony%'
```

3.	All rows where the song title contained the word "love" in any way
```
select * 
from tutorial.billboard_top_100_year_end 
where song_name ilike '%love%'
```

4.	All rows where the artist's name begins with the letter "A"
```
select * 
from tutorial.billboard_top_100_year_end 
where artist ilike 'a%'
```

5.	The top 3 songs from each year between 1960-1969
```
select * 
from tutorial.billboard_top_100_year_end 
where year_rank in (1,2,3) and year between 1960 and 1969
```

6.	All rows where either Elvis Presley, The Rolling Stones, or Van Halen were the artist
```
select * 
from tutorial.billboard_top_100_year_end 
where "group" ilike '%elvis%presley%' or "group" ilike '%van%halen%' or "group" ilike '%rolling%stones%'
```

7.	Which artist has had the most appearances on the top 100 list?
```
select artist, count(*) 
from tutorial.billboard_top_100_year_end 
group by artist 
order by count(*) desc 
-- Elvis Presley and Madonna had 36 each
```

8.	Which artist has had the most #1 hits? How many?
```
select artist, count(*) 
from tutorial.billboard_top_100_year_end 
where year_rank = 1 
group by artist 
order by count(*) desc 
-- Beatles and Elvis Presley had 2 each
```

9.	All rows from 1970 where the songs were ranked 10-20th
```
select * 
from tutorial.billboard_top_100_year_end 
where year = 1970 and year_rank between 10 and 20
```

10.	All rows from the 1990's where Madonna was not ranked 10-100th
```
select * 
from tutorial.billboard_top_100_year_end 
where (year between 1990 and 1999) and artist = 'Madonna' and year_rank < 10
```

11.	All rows from 1985 which do not include Madonna or Phil Collins in the group.
```
select * 
from tutorial.billboard_top_100_year_end 
where year = 1985 and ("group" not ilike '%madonna%') and ("group" not ilike '%phil%collins%')
```

12.	All number 1 songs in the data set.
```
select * 
from tutorial.billboard_top_100_year_end 
where year_rank = 1
```

13.	All rows where the artist is not listed
```
select * 
from tutorial.billboard_top_100_year_end 
where artist is null
```

14.	All of Madonna's top 100 hits ordered by their ranking (1 to 100)
```
select * 
from tutorial.billboard_top_100_year_end 
where artist = 'Madonna' 
order by year_rank
```

15.	All of Madonna's top 100 hits ordered by their ranking within each year
```
select * 
from tutorial.billboard_top_100_year_end 
where artist = 'Madonna' 
order by year, year_rank
```

16.	Every number 1 song since 1990 followed by every number 2 song since 1990 and number 3 song since 1990. (Hint: Multiple ordering)
```
select * 
from tutorial.billboard_top_100_year_end 
where year >= 1990 and year_rank in (1,2,3) 
order by year_rank, year
```


#### by Dennis C  :hamburger:

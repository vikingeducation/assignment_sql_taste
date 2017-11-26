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
Practice writing SQL queries against a various datasets: US Census housing starts data, and Billboard music chats data

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

#### by Dennis C  :hamburger:

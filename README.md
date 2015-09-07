# assignment_sql_taste
A delicious appetizer of SQL-ey goodness

------------------------------------------------------------------------------
select * from tutorial.us_housing_units limit 10

select midwest from tutorial.us_housing_units

select * from tutorial.us_housing_units where year > 1985 and month >6

select * from tutorial.us_housing_units where south > 30

select (south+west+midwest+northeast) as sum from tutorial.us_housing_units

select (south+west+midwest+northeast) as sum_over_70 from tutorial.us_housing_units where (south+west+midwest+northeast)>70

select (south+west+midwest+northeast) as sum_between_80_and_50 from tutorial.us_housing_units 
where (south+west+midwest+northeast)>50 and (south+west+midwest+northeast)<80

select 
(south+west+midwest+northeast)/4 as avg_each_row 
from tutorial.us_housing_units 

select 
 * 
from tutorial.us_housing_units
where south > (west+midwest+northeast)

select 
 south/(south + west + midwest + northeast) as south_percent,
 west/(south + west + midwest + northeast) as west_percent,
 midwest/(south + west + midwest + northeast) as midwest_percent,
 northeast/(south + west + midwest + northeast) as northeast_percent
from tutorial.us_housing_units

--------------------------------------------------------

select * from tutorial.billboard_top_100_year_end where artist = 'Elvis Presley'

select * from tutorial.billboard_top_100_year_end where artist like '%Tony%'

select * from tutorial.billboard_top_100_year_end where song_name like '%love%'

select * from tutorial.billboard_top_100_year_end where artist like 'A%'

select * 
from tutorial.billboard_top_100_year_end 
where year_rank between 1 and 3 
and year between 1960 and 1969

select * from tutorial.billboard_top_100_year_end 
where 
artist = 'Elvis Presley' or 
artist = 'The Rolling Stones' or 
artist = 'Van Halen'

select artist, count(artist) 
from tutorial.billboard_top_100_year_end 
group by artist 
order by count(artist) desc// madonna and Elvis Presley

select artist,count(artist) 
from tutorial.billboard_top_100_year_end 
where year_rank = 1 
group by artist le
order by count(artist) desc
//beatles and elvis presley

select * 
from tutorial.billboard_top_100_year_end 
where year > 1970 
and year_rank 
between 10 and 20

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year BETWEEN 1990 AND 1999
AND not (artist = 'Madonna'
AND year_rank between 10 and 100)

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year > 1985 
and "group" not like '%Madonna%'
and "group" not like '%Phil Collins%'

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank = 1

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist is NULL

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Madonna'
order by year_rank 
limit 100

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist = 'Madonna'
order by year
limit 100

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank in (1,2,3)
and year >= 1990
order by year


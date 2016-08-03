

1. 

SELECT name, continent, population FROM world

2. 

SELECT name FROM world
WHERE population>=200000000

3.

Select name, gdp/population FROM world
WHERE population>=200000000

4.

Select name, population/1000000 FROM world
WHERE continent = 'South America'

5. 

Select name, population FROM world
WHERE name IN ( 'France', 'Germany', 'Italy')

6. 

SELECT name FROM world
WHERE name LIKE '%United%'

7. 

SELECT name, population, area FROM world
WHERE area >= 3000000
OR population >= 250000000

8. 

SELECT name, population, area FROM world
WHERE (area >= 3000000
AND population < 250000000)
OR (area < 3000000
AND population >= 250000000)

9.

SELECT name,
ROUND( population/1000000, 2)  as pop_millions,
ROUND( gdp/1000000000, 2 ) as pop_billions
FROM world
WHERE continent = 'South America'

10.

SELECT name, ROUND( gdp/population, -3 )
FROM world
WHERE gdp >= 1000000000000

11.

SELECT name,
       CASE WHEN continent='Oceania' THEN 'Australasia'
            ELSE continent END
  FROM world
 WHERE name LIKE 'N%'

12.

 SELECT name,
       CASE WHEN continent IN ('Europe', 'Asia') THEN 'Eurasia'
      WHEN continent IN ('North America', 'South America', 'Caribbean' ) THEN 'America'       
            ELSE continent END as new_continent
  FROM world
 WHERE name LIKE 'A%' 
OR name LIKE 'B%' 

13.

SELECT name, continent as original_continent,
       CASE WHEN continent = 'Oceania' THEN 'Australasia'
      WHEN continent IN ('Eurasia', 'Turkey' ) THEN 'Europe/Asia'  
      WHEN continent = 'Caribbean' AND name LIKE 'B%' THEN 'North America'
WHEN continent = 'Caribbean' THEN 'South America'
            ELSE continent END as new_continentSQ
  FROM world
ORDER BY name

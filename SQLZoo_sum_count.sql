

1. 

SELECT SUM(population)
FROM world

2. 

SELECT continent
FROM world
GROUP BY continent

3.

SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa'

4.

SELECT COUNT(1)
FROM world
WHERE area >= 1000000

5.

SELECT SUM(population)
FROM world
WHERE name in ('France', 'Germany', 'Spain' )

6.

SELECT continent, COUNT(1)
FROM world
GROUP BY continent

7.

SELECT continent, COUNT(1)
FROM world
WHERE population >= 10000000
GROUP BY continent

8.

SELECT continent
FROM world
GROUP BY continent
HAVING  SUM(population) >= 100000000


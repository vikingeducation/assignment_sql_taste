1.

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

2.

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

3.

SELECT yr, subject
  FROM nobel
 WHERE winner = 'Albert Einstein'

 4.

 SELECT winner
  FROM nobel
 WHERE yr >= 2000
 AND subject = 'Peace'

 5.

 SELECT yr, subject, winner
  FROM nobel
 WHERE yr BETWEEN 1980 AND 1989
 AND subject = 'Literature'

6. 

SELECT * FROM nobel
  WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter')

7. 

SELECT winner FROM nobel
  WHERE winner LIKE 'John%' 

8.

SELECT *
  FROM nobel
 WHERE (yr = 1980 AND subject = 'Physics')
OR  (yr = 1984 AND subject = 'Chemistry')

9.

SELECT *
  FROM nobel
 WHERE yr = 1980 AND NOT subject IN ( 'Chemistry', 'Medicine' )

10.

SELECT *
  FROM nobel
 WHERE (yr < 1910 AND subject = 'Medicine')
 OR (yr >= 2004 AND subject = 'Literature')

11.

SELECT *
  FROM nobel
 WHERE winner LIKE 'Peter Gr%nberg'

SELECT *
  FROM nobel
 WHERE winner LIKE 'Peter Grünberg'

12.

SELECT *
  FROM nobel
 WHERE winner LIKE 'Eugene %Neill'

SELECT *
  FROM nobel
 WHERE winner LIKE 'Eugene O\'Neill'

13.

SELECT winner, yr, subject
  FROM nobel
 WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner

14.

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY  subject IN ('Physics','Chemistry') , subject, winner




























1. 

SELECT matchid, player FROM goal 
  WHERE teamid ='GER'

2. 

SELECT id,stadium,team1,team2
  FROM game
WHERE id = 1012

3.

SELECT player,teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
  WHERE goal.teamid = 'GER'

4.

SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid)
  WHERE goal.player LIKE 'Mario%'

5. 

SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam on teamid = id
 WHERE gtime<=10

6.

SELECT mdate, teamname
FROM game JOIN eteam ON (team1=eteam.id)
WHERE coach = 'Fernando Santos'

7.

SELECT player
FROM game JOIN goal ON (game.id = goal.matchid)
WHERE game.stadium = 'National Stadium, Warsaw'

8.

SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' OR team2 = 'GER')
    AND goal.teamid != 'GER'

9.

SELECT teamname, COUNT(1)
  FROM eteam JOIN goal ON eteam.id=goal.teamid
 GROUP BY teamname

10.

SELECT stadium, COUNT(1)
FROM game JOIN goal ON game.id = goal.matchid
GROUP BY stadium

11.

SELECT matchid,mdate, COUNT(1)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY game.id

12.

SELECT matchid,mdate, COUNT(1) as germany_count
  FROM game JOIN goal ON matchid = id 
 WHERE teamid = 'GER'
GROUP BY matchid
HAVING germany_count >= 1

13.

SELECT mdate,
  team1, SUM( CASE WHEN teamid=team1 THEN 1 ELSE 0 END) as score1, team2, SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END)
  as score2
  FROM game LEFT JOIN goal ON matchid = id
 GROUP BY matchid, mdate
  ORDER BY mdate, matchid, team1, team2

#######
# MORE JOINS
########

1. 

SELECT id, title
 FROM movie
 WHERE yr=1962

2. 


SELECT yr
 FROM movie
 WHERE title='Citizen Kane'

 3.


SELECT id, title, yr
 FROM movie
 WHERE title LIKE '%Star Trek%'

 4.

SELECT title
 FROM movie
 WHERE id IN (11768, 11955, 21191)

5.


SELECT id
 FROM actor
 WHERE name = 'Glenn Close'

6.

SELECT id
FROM movie
WHERE title = 'Casablanca' 

7. 

SELECT actor.name
FROM casting JOIN actor
ON casting.actorid = actor.id
WHERE casting.movieid = 11768

8.

SELECT actor.name
FROM casting JOIN actor
ON casting.actorid = actor.id
WHERE casting.movieid = (SELECT id FROM movie where title = 'Alien')

9. 

SELECT movie.title
FROM casting
JOIN actor  ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE actor.name = 'Harrison Ford'

10.

SELECT movie.title
FROM casting
JOIN actor  ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE actor.name = 'Harrison Ford'
AND casting.ord != 1

11.

SELECT movie.title, actor.name
FROM casting
JOIN actor  ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE casting.ord = 1 AND movie.yr = 1962

12.

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
WHERE name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 WHERE name='John Travolta'
 GROUP BY yr) AS t
)

13.

SELECT movie.title, actor.name
FROM casting
JOIN actor  ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE casting.ord = 1  AND
movie.id IN (SELECT movie.id
FROM casting
JOIN actor  ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE actor.name = 'Julie Andrews')

14.

SELECT actor.name
FROM casting
JOIN actor  ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE casting.ord = 1 
GROUP BY actor.name
HAVING COUNT(1) >= 30
ORDER BY actor.name

15.

SELECT movie.title, COUNT(actor.id)
FROM casting
JOIN actor  ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE movie.yr=1978 
GROUP BY movie.title
ORDER BY 2 DESC

16.

SELECT actor.name
FROM casting
JOIN actor  ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE actor.name != 'Art Garfunkel'
AND movie.title IN (SELECT movie.title
FROM casting
JOIN actor  ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE actor.name = 'Art Garfunkel')




















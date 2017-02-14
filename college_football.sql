-- The most common home town of football players
SELECT hometown, COUNT(hometown) AS count
FROM benn.college_football_players
WHERE hometown != '--'
GROUP BY hometown
ORDER BY count DESC
LIMIT 1

-- The total number of players in each of their Freshmen, Sophomore, Junior or Senior years (4 rows)
SELECT year, COUNT(benn.college_football_players.id) AS player_count
FROM benn.college_football_players LEFT OUTER JOIN benn.college_football_teams ON benn.college_football_teams.school_name = benn.college_football_players.school_name
GROUP BY year

-- The total number of players in each position
SELECT position, COUNT(benn.college_football_players.id) AS player_count
FROM benn.college_football_players LEFT OUTER JOIN benn.college_football_teams ON benn.college_football_teams.school_name = benn.college_football_players.school_name
GROUP BY position

-- The average height of quarterbacks
SELECT AVG (height) AS average_height
FROM benn.college_football_players 
WHERE position = 'QB'

-- The average height of each position
SELECT position, AVG (height)  AS average_height
FROM benn.college_football_players 
GROUP BY position

-- Return 100 football players and which conference they play for
SELECT player_name, conference
FROM benn.college_football_players LEFT OUTER JOIN benn.college_football_teams ON benn.college_football_players.school_name = benn.college_football_teams.school_name
LIMIT 100

-- The heaviest football player in the SEC
SELECT player_name, MAX(weight) AS weight
FROM benn.college_football_players LEFT OUTER JOIN benn.college_football_teams ON benn.college_football_players.school_name = benn.college_football_teams.school_name
WHERE conference = 'SEC'
GROUP BY player_name
ORDER BY weight DESC
LIMIT 1


-- The top 5 heaviest football players in each conference
-- The most common home state of players by conference
-- The average height of football players in each conference
-- The count of football players in the top 100 of weight who belong to each division
-- All players whose home state is Kansas but who went to a school in Missouri

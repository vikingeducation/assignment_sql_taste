-- benn.college_football_players
-- benn.college_football_teams

-- The most common home town of football players
SELECT
  hometown,
  COUNT(hometown) AS most_common
FROM benn.college_football_players
GROUP BY hometown
ORDER BY most_common DESC

-- The total number of players in each of their Freshmen, Sophomore, Junior
-- or Senior years (4 rows)
SELECT
  year,
  COUNT(year) AS total
FROM benn.college_football_players
GROUP BY year
ORDER BY year

-- The total number of players in each position
SELECT
  position,
  COUNT(position) AS total
FROM benn.college_football_players
GROUP BY position
ORDER BY 2 DESC

-- The average height of quarterbacks
SELECT
  AVG(height) AS avg_qb_height
FROM benn.college_football_players
WHERE position = 'QB'

-- The average height of each position
SELECT
  position,
  AVG(height) AS avg_height
FROM benn.college_football_players
GROUP BY position
ORDER BY 2 DESC

-- Return 100 football players and which conference they play for
SELECT
  players.player_name AS player_name,
  teams.conference AS conference
FROM benn.college_football_players players
JOIN benn.college_football_teams teams
ON players.school_name = teams.school_name
LIMIT 100

-- The heaviest football player in the SEC
SELECT
  MAX(players.weight) AS heaviest_player
FROM benn.college_football_players players
JOIN benn.college_football_teams teams
ON players.school_name = teams.school_name
WHERE teams.conference = 'SEC'

-- The top 5 heaviest football players in each conference


-- The most common home state of players by conference


-- The average height of football players in each conference


-- The count of football players in the top 100 of weight who belong to each division


-- All players whose home state is Kansas but who went to a school in Missouri

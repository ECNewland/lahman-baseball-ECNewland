/* Question_6
Find the player who had the most success stealing bases in 2016,
where success is measured as the percentage of stolen base attempts which are successful.
(A stolen base attempt results either in a stolen base or being caught stealing.)
Consider only players who attempted at least 20 stolen bases.
A. 
QUERY: 
NEXT STEPS:
Check aliases for correct callouts.
*/
SELECT p.playerid, p.nameFirst, p.nameLast, b.yearid,
	SUM(b.sb) AS StolenBases,
	SUM(b.cs) AS CaughtStealing,
	(SUM(b.cs) + SUM(b.sb)) / SUM(b.sb) AS attempts
	FROM people AS p
	INNER JOIN batting AS b
	USING (playerid)
	GROUP BY p.playerid, p.nameFirst, p.nameLast, b.yearid, b.sb, b.cs
	HAVING SUM(sb) + SUM(cs) >= 20 AND yearid = 2016
	ORDER BY StolenBases DESC, CaughtStealing DESC, attempts DESC
	LIMIT 1;


/* Question_5
5a. Find the average number of strikeouts per game by decade since 1920. 
Round the numbers you report to 2 decimal places.
5b. Do the same for home runs per game. Do you see any trends?
A. 
QUERY:
WITH CTE_Columns AS
(SELECT yearid, SUM(so) AS strikeouts, SUM(hr) AS homeruns
 FROM teams AS t
 GROUP BY yearid
 ),
CTE_Games_Yr AS
(SELECT year AS yearid, SUM(games) AS games
FROM homegames AS h
 GROUP BY yearid
 )
 	SELECT CONCAT(LEFT(CAST(yearid AS VARCHAR(4)), 3), '0s') AS decade,
	SUM(Columns.strikeouts) AS strikeouts,
	SUM(Columns.homeruns) AS homeruns,
	SUM(Games.games) Games,
	ROUND(SUM(Columns.homeruns) / SUM(Games.games), 2) AS avg_hr_per_game,
	ROUND(SUM(Columns.strikeouts) / SUM(Games.games), 2) AS avg_so_per_game
	FROM CTE_Columns AS Columns
	INNER JOIN CTE_Games_Yr AS Games
	USING (yearid)
	WHERE yearid >= 1920
	GROUP BY decade
	ORDER BY decade;
*/


/* Question_4
Using the fielding table, group players into three groups based on their position:
label players with position OF as "Outfield", those with position "SS", "1B", "2B", and "3B" as "Infield",
and those with position "P" or "C" as "Battery".
Determine the number of putouts made by each of these three groups in 2016.
A. Battery = 41424, Infield = 58934, Outfiled = 29560.
QUERY:
WITH CTE AS (
	SELECT yearid, playerid, pos, po,
	CASE WHEN pos IN('C', 'P') THEN 'Battery'
	WHEN pos = 'OF' THEN 'Outfield'
	ELSE 'Infield'
	END AS position
FROM fielding
WHERE yearid = 2016)
SELECT SUM(po), yearid, CTE.position
FROM CTE
WHERE position = 'Infield'
OR position = 'Outfield'
OR position = 'Battery'
GROUP BY position, yearid;
*/


/* Question_3
Find all players in the db who played for Vanderbilt University.
Create a list showing each player's first and last names, as well as the total salary they earned in the major leagues.
Sort this list in descending order by total salary earned.
Which Vanderbilt player earned the most money in the majors?
A. David Price, $30,000,000.
QUERY:
SELECT p.playerid, p.nameFirst, p.nameLast, cp.schoolid, s.salary, sch.schoolname
FROM people AS p
INNER JOIN collegeplaying as cp
USING (playerid)
JOIN salaries AS s
USING (playerid)
JOIN schools AS sch
USING (schoolid)
WHERE schoolid = 'vandy'
ORDER BY salary DESC;
*/

/* Question_2
Find the name and height of the shortest player in the database.
How many games did he play in? What is the name of the team for which he played?
A. Eddie Gaedel, height = 43, 1 game, St. Louis Browns.
QUERY:
SELECT p.playerid, p.namefirst, p.namelast, p.height, t.name, a.g_all
FROM people AS p
INNER JOIN appearances AS a
USING (playerid)
JOIN teams AS t
USING (teamid)
ORDER BY height ASC;
*/


/* Question_1
What range of years does the provided database cover?
A. 1871 - 2016
QUERY:
SELECT MAX(yearid), MIN(yearid)
FROM teams;
*/


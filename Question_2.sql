/* Question_2
Find the name and height of the shortest player in the database.
How many games did he play in? What is the name of the team for which he played?
A. Eddie Gaedel, height = 43, 1 game, St. Louis Browns.

TABLE NOTES:
people = SELECT playerid, namefirst, namelast, height.
teamshalf = JOIN teamid, g for games played

SELECT playerid, namefirst, namelast, MIN(height) AS height, teamid, g
FROM 
LEFT JOIN team(teamID, G, name)
ORDER BY height;
*/
SELECT p.playerid, p.namefirst, p.namelast, p.height, t.name, a.g_all
FROM people AS p
INNER JOIN appearances AS a
USING (playerid)
JOIN teams AS t
USING (teamid)
ORDER BY height ASC;


/* Question_1
What range of years does the provided database cover?
A. 1871 - 2016
QUERY:
SELECT MAX(yearid), MIN(yearid)
FROM teams;
*/


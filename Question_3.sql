/* Question_3
Find all players in the db who played for Vanderbilt University.
Create a list showing each player's first and last names, as well as the total salary they earned in the major leagues.
Sort this list in descending order by total salary earned.
Which Vanderbilt player earned teh most money in the majors?
A. David Price, $245,553,888.
*/
SELECT p.playerid, p.nameFirst, p.nameLast, cp.schoolid, SUM(s.salary) AS salary, sch.schoolname
FROM people AS p
INNER JOIN collegeplaying as cp
USING (playerid)
JOIN salaries AS s
USING (playerid)
JOIN schools AS sch
USING (schoolid)
WHERE schoolid = 'vandy'
GROUP BY p.playerid, p.nameFirst, p.nameLast, cp.schoolid, sch.schoolname
ORDER BY salary DESC;

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


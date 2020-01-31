/* Question_2
Find the name and height of the shortest player in the database.
How many games did he play in? What is the name of the team for which he played?
A. Eddie Gaedel, height = 43, 

TABLE NOTES:
people = SELECT playerid, namefirst, namelast, height.
teamshalf = JOIN teamid, g for games played

SELECT playerid, namefirst, namelast, MIN(height) AS height, teamid, g
FROM 
LEFT JOIN teamshalf
ORDER BY height;
*/



/* Question_1
What range of years does the provided database cover?
A. 1871 - 2016
QUERY:
SELECT MAX(yearid), MIN(yearid)
FROM teams;
*/


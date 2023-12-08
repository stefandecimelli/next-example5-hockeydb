SELECT
    '#' || number as number, p1.firstname || ' ' || p1.lastname AS player, t1.name as team,
    (SELECT COUNT(*) FROM goal WHERE goal.player = roster.player) AS goals,
    (SELECT COUNT(*) FROM goal WHERE goal.assist1 = roster.player OR goal.assist2 = roster.player) AS assists,
    (SELECT COUNT(*) FROM goal WHERE goal.player = roster.player) 
    + 
    (SELECT COUNT(*) FROM goal WHERE goal.assist1 = roster.player OR goal.assist2 = roster.player) AS points
FROM roster 
    join team as t1 on t1.id = team
    join player as p1 on p1.id = player;
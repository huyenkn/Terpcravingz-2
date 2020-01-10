---1. Which stops have between 10 to 100  restaurants within 15 minutes walkable
-- distance  ?

SELECT r.stopId, s.stopName, COUNT(r.resId) AS 'Number of restaurants'
FROM Restaurant r, Stop s
WHERE r.stopId = s.stopId
AND r.walktimeToRes <= 15
GROUP BY r.stopId, s.stopName
HAVING COUNT(r.resId) >= 10 AND COUNT(r.resId) <= 100
ORDER BY COUNT(r.resId) DESC
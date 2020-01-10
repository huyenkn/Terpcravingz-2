--5.What are the restaurants that open at late hours on weekends(11:00p.m.-5:00a.m.)?
SELECT r.resCity,COUNT(r.resId) AS 'Number of restaurants'
FROM Restaurant r
WHERE r.satStartTime >= '23:00:00' 
OR r.sunStartTime <= '05:00:00'
GROUP BY r.resCity
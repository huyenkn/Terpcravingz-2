
--10.What are the names, addresses, phone numbers for restaurants that have high ranking AND are open on the weekend and has Review that includes: family OR friends?
SELECT r.resId,r.resName,r.resStreet, r.resCity,r.resState,r.resPhoneNo, r.resStars, r.resPrice
FROM Restaurant r,review e, (
	SELECT r.resId, r.resStars 
	FROM Restaurant r, Review e
	WHERE r.resId = e.resId
	AND (e.revText Like '%family%'
	OR e.revText Like '%friend%')) f
WHERE r.resId = e.resId
AND r.resId = f.resId 
AND (r.satStartTime IS NOT NULL
OR r.sunStartTime IS NOT NULL)
AND r.resStars IN (4,5)
ORDER BY r.resStars DESC

---2. What are  the average restaurant price,  average review count, and average
---- restaurant rating for each category in all cities(while excluding irrelevant categories 'Landmark and historical buildings' and 'art museums')?

SELECT c.categoryName, ROUND(AVG(CAST(r.resPrice AS Float)), 4) AS 'Average Price', 
       AVG(r.resRevCNT) AS 'Average Restaurant Reviews', 
       CAST(AVG(r.resStars) AS decimal(10,4)) AS 'Average Stars'
FROM Restaurant r, Category c, Belong b
WHERE r.resId = b.resId
AND c.categoryId = b.categoryId
AND c.categoryName NOT IN ('Landmark and historical buildings', 'art museums')
GROUP BY c.categoryId, c.categoryName



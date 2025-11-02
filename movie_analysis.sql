--  Compare current movie duration with the previous one per user
WITH duration as (
	SELECT u.UserID,
	u.name,
	Title,
	LAG(DurationMin) OVER (PARTITION BY userid order by watchdate) as PrevDuration,
	
	CASE	
		WHEN DurationMin < LAG(DurationMin) OVER (PARTITION BY userid order by watchdate)
			THEN 'High'
		WHEN DurationMin > LAG(DurationMin) OVER (PARTITION BY userid order by watchdate)
			THEN 'Low'
		ELSE 'None'
	END as Comparison
	FROM users u
	LEFT JOIN ViewingHistory v ON u.UserID = v.UserID
	INNER JOIN Movies m ON v.MovieID = m.MovieID
)
SELECT * FROM duration;


--  Show current movie and the next movie a user will watch
WITH pmovie as (
	SELECT name,
	title as `Current Movie Watching`,
	watchdurationminutes,
	-- Use LEAD to get the next movie of the same user
	LEAD(title) OVER (PARTITION BY u.userid ORDER BY WatchDate) as next_movie
	FROM  users u 
	INNER JOIN ViewingHistory v ON u.UserID = v.UserID
	INNER JOIN Movies m ON v.MovieID = m.MovieID
)
SELECT * FROM pmovie; 


--  Top 3 most watched movies (in minutes) per user
WITH lwatch as (
	SELECT  u.USERID,
		u.name,
		m.title,
	    SUM(v.watchdurationminutes) as `Total Minutes`
	FROM users u 
	INNER JOIN ViewingHistory v ON u.UserID = v.UserID
	INNER JOIN Movies m ON v.MovieID = m.MovieID
	GROUP BY u.UserID, u.name, m.title
)
SELECT * 
FROM (
	SELECT *,
		ROW_NUMBER() OVER (PARTITION BY userid ORDER BY `Total Minutes` DESC) as RANKING
	FROM lwatch
) AS ranked
WHERE RANKING <= 3;


--  Get all users with their viewing history and movie info
SELECT * 
FROM users u 
INNER JOIN ViewingHistory v ON u.UserID = v.UserID
INNER JOIN Movies m ON v.MovieID = m.MovieID;


-- Rank movies per user by genre based on watch duration
WITH rankpergenre as (
	SELECT u.userID,
    	genre,
    	watchdurationminutes as `Total Minutes`
	FROM users u 
	INNER JOIN ViewingHistory v ON u.UserID = v.UserID
	INNER JOIN Movies m ON v.MovieID = m.MovieID
) 
SELECT *,
    DENSE_RANK() OVER (PARTITION BY u.userid ORDER BY `Total Minutes` DESC) as Ranking
FROM rankpergenre;


--  Running total of watch time per user across dates
WITH wdate as (
	SELECT u.userid,
    	watchdate,
    	SUM(watchdurationminutes) as total_spent,
    	-- Running total of minutes watched by each user
    	SUM(watchdurationminutes) OVER (PARTITION BY u.userid ORDER BY watchdate) as running
	FROM users u 
	INNER JOIN ViewingHistory v ON u.UserID = v.UserID
	INNER JOIN Movies m ON v.MovieID = m.MovieID
	GROUP BY watchdurationminutes, watchdate, u.userid
) 
SELECT * FROM wdate;


--  Percentage of users watching per city
WITH percentage as (
	SELECT city,
		u.name, 
		COUNT(DISTINCT u.userid) as total,
		-- Calculate percentage share of users per city
		CONCAT(ROUND(COUNT(*) * 100 / SUM(COUNT(*)) OVER (PARTITION BY u.name),2),'%') as percentage
	FROM users u 
	INNER JOIN ViewingHistory v ON u.UserID = v.UserID
	INNER JOIN Movies m ON v.MovieID = m.MovieID
	GROUP BY city, name
) 
SELECT city, total, percentage FROM percentage;


-- Percentage of movies per genre
WITH moviepercentage as (
	SELECT genre, 
    	COUNT(genre) as total,
    	CONCAT(ROUND(COUNT(genre) * 100.0 / SUM(COUNT(genre)) OVER() ,2),'%') as percentage
	FROM movies
	GROUP BY genre
) 
SELECT * FROM moviepercentage;


--  Count distinct customers
SELECT COUNT(DISTINCT userid) as totalcustomer 
FROM users;


-- Count movies per genre
SELECT genre, COUNT(genre) 
FROM movies
GROUP BY genre;


-- Show full user, viewing history, and movies data
SELECT * 
FROM users u
INNER JOIN ViewingHistory v ON u.UserID = v.UserID
INNER JOIN Movies m ON v.MovieID = m.MovieID;


-- Top 3 users who spent the most minutes watching
SELECT u.name, 
       SUM(m.durationmin) AS total_minutes_spent,
       CONCAT(
           ROUND(
               SUM(m.durationmin) / (
                   SELECT SUM(m2.durationmin) 
                   FROM ViewingHistory v2 
                   INNER JOIN Movies m2 ON v2.MovieID = m2.MovieID
               ) * 100, 
               2
           ), 
           '%'
       ) AS percentage
FROM users u
INNER JOIN ViewingHistory v ON u.UserID = v.UserID
INNER JOIN Movies m ON v.MovieID = m.MovieID
GROUP BY u.UserID, u.name
ORDER BY total_minutes_spent DESC
LIMIT 3;


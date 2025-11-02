
SELECT * FROM concert_tours;


--  Kunin lang ang top-grossing tour per artist (yung may pinakamataas na adjusted_gross_2022)
SELECT DISTINCT ON (artist)
    artist,
    tour_title,
    adjusted_gross_2022 AS GROSS
FROM concert_tours
ORDER BY artist, GROSS DESC;


--  Gumawa ng CTE (Common Table Expression) na 'tour' para ipakita lang ang mga concert tours
--    na nangyari mula 2010 hanggang 2020
WITH tour AS (
    SELECT 
        artist,
        tour_title,
        year
    FROM concert_tours
    WHERE year BETWEEN 2010 AND 2020
)
SELECT * FROM tour
ORDER BY year;


--  Gumawa ng CTE na 'artist' para bilangin kung ilang tours meron bawat artist
WITH artist AS (
    SELECT 
        artist AS Artist,
        tour_title,
        COUNT(tour_title) OVER (PARTITION BY artist) AS "Total Tours"
    FROM concert_tours
)
SELECT * FROM artist;


--  Gumawa ng CTE na 'ranking' para ipakita ang top 5 highest-grossing tours
WITH ranking AS (
    SELECT 
        rank,
        artist,
        tour_title,
        adjusted_gross_2022,
        year,
        shows,
        average_gross
    FROM concert_tours
)
SELECT * FROM ranking
ORDER BY adjusted_gross_2022 DESC
LIMIT 5;


--  Gumawa ng CTE na 'percentage' para makuha total shows bawat artist
--    Tapos sa 'totally' kukunin ang overall total ng lahat ng shows
--    Sa final query, ipakita ang percentage share ng bawat artist sa total shows
WITH percentage AS (
    SELECT 
        artist,
        SUM(shows) AS "TOTAL SHOWS"
    FROM concert_tours
    GROUP BY artist
),
totally AS (
    SELECT SUM("TOTAL SHOWS") AS Total
    FROM percentage
)
SELECT 
    p.artist,
    p."TOTAL SHOWS",
    CONCAT(ROUND(p."TOTAL SHOWS" / t.Total * 100, 2), '%') AS Percentage
FROM percentage p
CROSS JOIN totally t
ORDER BY p."TOTAL SHOWS" DESC;

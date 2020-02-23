-- Khang Tran
-- khvitran
-- CSE180
-- Lab3
-- queryview.sql

SELECT m.rating, COUNT(*) AS "misreportCount"
FROM "earningsView" e 
JOIN Movies m ON e.movieID = m.movieID
WHERE e."computedEarnings" != m.totalEarned 
GROUP BY m.rating
HAVING EVERY (m.year < 2019);

-- Output before deletion:
--  rating | misreportCount 
-- --------+----------------
--  P      |              1
--  G      |              2
-- (2 rows)

DELETE FROM Tickets
WHERE theaterID = 111 
AND seatNum = 1 
AND showingDate = '2009-06-23' 
AND startTime = '11:00:00';

DELETE FROM Tickets
WHERE theaterID = 444 
AND seatNum = 5 
AND showingDate = '2020-06-24' 
AND startTime = '15:00:00';

SELECT m.rating, COUNT(*) AS "misreportCount"
FROM "earningsView" e 
JOIN Movies m ON e.movieID = m.movieID
WHERE e."computedEarnings" != m.totalEarned 
GROUP BY m.rating
HAVING EVERY (m.year < 2019);

-- Output after deletion:
--  rating | misreportCount 
-- --------+----------------
--  G      |              2
-- (1 row)
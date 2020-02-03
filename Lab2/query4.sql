-- SELECT c.customerID, c.name
-- FROM Customers c
-- INNER JOIN Tickets t ON c.customerID = t.customerID
-- WHERE (c.name LIKE '%a%' OR c.name LIKE '%A%')
-- GROUP BY c.customerID
-- HAVING COUNT(t.customerID) >= 2
-- ORDER BY c.customerID ASC;

SELECT DISTINCT c.customerID, c.name
-- SELECT *
FROM Tickets t 
INNER JOIN Showings s ON t.showingDate = s.showingDate AND t.startTime = s.startTime
INNER JOIN Movies m ON s.movieID = m.movieID
INNER JOIN Customers c ON t.customerID = c.customerID
WHERE (c.name LIKE '%a%' OR c.name LIKE '%A%')
AND t.showingDate = s.showingDate
AND t.startTime = s.startTime
AND t.theaterID = s.theaterID
GROUP BY c.customerID
HAVING COUNT(DISTINCT m.movieID) >= 2
ORDER BY c.customerID ASC;

CREATE TEMP
TABLE ticketPurchases
AS
(
    SELECT t.theaterID, t.showingDate, t.startTime
FROM Tickets t
    INNER JOIN Customers c ON t.customerID = c.customerID
WHERE c.name = 'Poker Queen');

CREATE TEMP TABLE moviePurchases
AS
(
    SELECT DISTINCT s.movieID
FROM Showings s
    INNER JOIN ticketPurchases p ON (p.theaterID = s.theaterID
        AND p.showingDate = s.showingDate
        AND p.startTime = s.startTime));

SELECT m.name, m.year
FROM Movies m
    INNER JOIN moviePurchases mp ON m.movieID = mp.movieID;

DROP TABLE ticketPurchases;
DROP TABLE moviePurchases;

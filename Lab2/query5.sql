SELECT DISTINCT c.customerID AS "custID", c.name AS "custName", c.address AS "custAddress", 
th.address AS "theaterAddress", th.numSeats AS "theaterSeats", s.priceCode as "priceCode"
FROM Tickets t 
INNER JOIN Customers c ON t.customerID = c.customerID
INNER JOIN Theaters th ON t.theaterID = th.theaterID
INNER JOIN Showings s ON t.showingDate = s.showingDate
WHERE c.name LIKE 'D%'
AND (t.showingDate BETWEEN '2019-06-01' AND '2019-06-30')
AND th.numSeats > 5
AND s.priceCode IS NOT NULL;

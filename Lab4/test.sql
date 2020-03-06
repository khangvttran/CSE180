UPDATE Tickets
SET ticketPrice = ticketPrice - 3
FROM Showings
WHERE Tickets.theaterID = 111
AND Tickets.showingDate = '2018-06-23'
AND Tickets.startTime = '11:00:00'
AND Showings.priceCode = 'A';

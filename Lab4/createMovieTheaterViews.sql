-- View for checking/comparing output
CREATE VIEW showTickets AS
    SELECT s.theaterID, s.showingDate, s.startTime, s.priceCode, t.seatNum, t.customerID, t.ticketPrice AS tPrice
    FROM Showings s
    JOIN Tickets t ON s.theaterID = t.theaterID
    AND s.showingDate = t.showingDate
    AND s.startTime = t.startTime
    ORDER BY s.priceCode ASC, t.customerID ASC, s.theaterID ASC, s.showingDate ASC, s.startTime ASC, t.seatNum ASC;

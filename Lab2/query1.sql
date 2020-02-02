SELECT DISTINCT t.theaterID, t.address
FROM Theaters t, TheaterSeats s
WHERE s.brokenSeat = TRUE AND t.theaterID = s.theaterID;

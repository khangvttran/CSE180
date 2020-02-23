-- Khang Tran
-- khvitran
-- CSE180
-- Lab3
-- createview.sql

CREATE VIEW earningsView AS
    SELECT m.movieID, CASE WHEN SUM(t.ticketPrice) IS NULL THEN 0 
                            ELSE SUM(t.ticketPrice)
                        END AS computedEarnings 
    FROM Movies m 
    LEFT JOIN Showings s ON m.movieID = s.movieID
    LEFT JOIN Tickets t ON s.theaterID = t.theaterID
    AND s.showingDate = t.showingDate
    AND s.startTime = t.startTime
    GROUP BY m.movieID;

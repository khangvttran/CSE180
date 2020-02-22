-- Khang Tran
-- khvitran
-- CSE180
-- Lab3

BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

UPDATE Showings s
    SET movieID = ms.movieID
    FROM ModifyShowings ms 
    WHERE ms.theaterID = s.theaterID
    AND ms.showingDate = s.showingDate
    AND ms.startTime = s.startTime;

INSERT INTO Showings(theaterID, showingDate, startTime, movieID, priceCode)
    SELECT ms.theaterID, ms.showingDate, ms.startTime, ms.movieID, NULL
    FROM ModifyShowings ms
    WHERE NOT EXISTS (SELECT * FROM Showings s
                        WHERE ms.theaterID = s.theaterID
                        AND ms.showingDate = s.showingDate
                        AND ms.startTime = s.startTime);

COMMIT;

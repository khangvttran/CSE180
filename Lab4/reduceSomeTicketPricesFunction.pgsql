CREATE OR REPLACE FUNCTION reduceSomeTicketPricesFunction(maxTicketCount INTEGER)
    RETURNS INTEGER AS $$

    DECLARE
        code CHAR(1);
        cID INTEGER;
        price INTEGER;
        tID INTEGER;
        date DATE;
        st TIME;
        totalUpdates INTEGER;
        loopCount INTEGER;

    DECLARE orderedTickets CURSOR FOR
        SELECT s.theaterID, s.showingDate, s.startTime, s.priceCode, t.customerID, t.ticketPrice
        FROM Showings s
        JOIN Tickets t ON s.theaterID = t.theaterID
        AND s.showingDate = t.showingDate
        AND s.startTime = t.startTime
        ORDER BY s.priceCode ASC, t.customerID ASC;
    
    BEGIN
        OPEN orderedTickets;
        totalUpdates := 0;
        loopCount := 0;    
    LOOP
        FETCH orderedTickets INTO tID, date, st, code, cID, price;
        EXIT WHEN NOT FOUND;

        IF (code = 'A' AND price IS NOT NULL) THEN
            UPDATE Tickets
            SET ticketPrice = ticketPrice - 3
            FROM Showings s
            WHERE s.priceCode = 'A'
            AND Tickets.customerID = cID
            AND Tickets.ticketPrice IS NOT NULL
            AND Tickets.theaterID = tID
            AND Tickets.showingDate = date
            AND Tickets.startTime = st;
            totalUpdates := totalUpdates + 3;
            loopCount := loopCount + 1;
        
        ELSIF (code = 'B' AND price IS NOT NULL) THEN
            UPDATE Tickets
            SET ticketPrice = ticketPrice - 2
            FROM Showings s
            WHERE s.priceCode = 'B'
            AND Tickets.customerID = cID
            AND Tickets.ticketPrice IS NOT NULL
            AND Tickets.theaterID = tID
            AND Tickets.showingDate = date
            AND Tickets.startTime = st;
            totalUpdates := totalUpdates + 2;
            loopCount := loopCount + 1;

        ELSIF (code = 'C' AND price IS NOT NULL) THEN
            UPDATE Tickets
            SET ticketPrice = ticketPrice - 1
            FROM Showings s
            WHERE s.priceCode = 'C'
            AND Tickets.customerID = cID
            AND Tickets.ticketPrice IS NOT NULL
            AND Tickets.theaterID = tID
            AND Tickets.showingDate = date
            AND Tickets.startTime = st;
            totalUpdates := totalUpdates + 1;
            loopCount := loopCount + 1;

        END IF;

        EXIT WHEN loopCount = maxTicketCount;

    END LOOP;
    CLOSE orderedTickets;

    RETURN totalUpdates;

END;
$$ LANGUAGE plpgsql;
     
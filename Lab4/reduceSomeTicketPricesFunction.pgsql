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

        IF code = 'A' THEN
            UPDATE Tickets
            SET ticketPrice = ticketPrice - 3
            FROM Showings s
            WHERE s.priceCode = 'A'
            AND Tickets.customerID = cID
            AND Tickets.ticketPrice IS NOT NULL
            AND Tickets.theaterID = tID
            AND Tickets.showingDate = date
            AND Tickets.startTime = st;
            totalUpdates := totalUpdates + 1;
        END IF;

        loopCount := loopCount + 1;
        EXIT WHEN loopCount = 1;

    END LOOP;
    CLOSE orderedTickets;

    RETURN totalUpdates;

END;
$$ LANGUAGE plpgsql;
     
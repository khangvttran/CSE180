CREATE OR REPLACE FUNCTION reduceSomeTicketPricesFunction(maxTicketCount integer)
    RETURNS integer AS $$

    DECLARE
        code CHAR(1);
        price INTEGER;
        theater INTEGER;
        date DATE;
        st TIME;
        totalUpdates INTEGER;
        loopCount INTEGER; 

    DECLARE orderedTickets CURSOR FOR
        SELECT s.theaterID, s.showingDate, s.startTime, s.priceCode, t.ticketPrice
        FROM Showings s
        JOIN Tickets t ON s.theaterID = t.theaterID
        AND s.showingDate = t.showingDate
        AND s.startTime = t.startTime
        ORDER BY s.priceCode ASC, t.customerID ASC;
    
    BEGIN
        totalUpdates := 0;
        loopCount := 0;
        OPEN orderedTickets;
    
    LOOP
        FETCH orderedTickets INTO theater, date, st, code, price;
        EXIT WHEN NOT FOUND;


        IF price = NULL THEN
            RAISE NOTICE 'ticketPrice not found, skip showing';

        ELSE
            IF code = 'B' THEN
                UPDATE Tickets
                SET ticketPrice = ticketPrice - 3
                FROM Showings s
                WHERE s.priceCode = 'A'
                AND s.theaterID = theater
                AND s.showingDate = date
                AND s.startTime = st;

                totalUpdates := totalUpdates + 1;
            
            ELSIF code = 'B' THEN
                UPDATE Tickets
                SET ticketPrice = ticketPrice - 2
                FROM Showings s
                WHERE s.priceCode = 'B'
                AND s.theaterID = theater
                AND s.showingDate = date
                AND s.startTime = st;

                totalUpdates := totalUpdates + 1;

            ELSIF code = 'C' THEN
                UPDATE Tickets
                SET ticketPrice = ticketPrice - 1
                FROM Showings s
                WHERE s.priceCode = 'C'
                AND s.theaterID = theater
                AND s.showingDate = date
                AND s.startTime = st;

                -- totalUpdates := totalUpdates + 1;
            
            ELSE
                RAISE NOTICE 'priceCode not A, B, or C';
            
            END IF;
        
        END IF;
        
        loopCount := loopCount + 1;
        EXIT WHEN loopCount = maxTicketCount;

    END LOOP;

    CLOSE orderedTickets;

    RETURN totalUpdates;

END;
$$ LANGUAGE plpgsql;
     
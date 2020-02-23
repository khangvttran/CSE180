-- Khang Tran
-- khvitran
-- CSE180
-- Lab3
-- unittests.sql

-- For each of the 3 foreign key constraints:
-- Write 1 INSERT command that violates the constraint (and illicits an error)

INSERT INTO Tickets VALUES (555, 1, '2020-02-22', '23:00:00', 5, 30.00);

INSERT INTO Tickets VALUES (222, 1, '1985-09-11', '10:00:00', 10, 8.50);

INSERT INTO Tickets VALUES (222, 8, '1985-09-11', '10:00:00', 1, 8.50);

-- For each of the 3 general key constraints:
-- Write 1 UPDATE command that meets the constraint
-- Write 1 UPDATE command that violates the constraint (and illicits an error)

UPDATE Tickets
SET ticketPrice = 10.00
WHERE theaterID = 111 AND seatNum = 1 AND showingDate = '2009-06-23';

UPDATE Tickets
SET ticketPrice = 0.00
WHERE theaterID = 111 AND seatNum = 1 AND showingDate = '2009-06-23';

UPDATE Customers
SET joinDate = '2020-02-22'
WHERE customerID = 1 AND name = 'Donald Duck';

UPDATE Customers
SET joinDate = '2014-02-22'
WHERE customerID = 1 AND name = 'Donald Duck';

UPDATE Showings
SET movieID = 22358, priceCode = 'B'
WHERE theaterID = 111 AND showingDate = '2009-06-23' AND startTime = '11:00:00';

UPDATE Showings
SET movieID = 22358, priceCode = NULL
WHERE theaterID = 111 AND showingDate = '2009-06-23' AND startTime = '11:00:00';

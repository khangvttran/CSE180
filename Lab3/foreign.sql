-- Khang Tran
-- khvitran
-- CSE180
-- Lab3
-- foreign.sql

ALTER TABLE Tickets
ADD FOREIGN KEY (theaterID, showingDate, startTime) REFERENCES Showings;

ALTER TABLE Tickets
ADD FOREIGN KEY (customerID) REFERENCES Customers
    ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE Tickets
ADD FOREIGN KEY (theaterID, seatNum) REFERENCES TheaterSeats
    ON DELETE CASCADE
    ON UPDATE CASCADE;
    
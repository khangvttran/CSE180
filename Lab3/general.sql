-- Khang Tran
-- khvitran
-- CSE180
-- Lab3
-- general.sql

ALTER TABLE Tickets ADD CONSTRAINT positiveTicketPrice 
CHECK (ticketPrice > 0);

ALTER TABLE Customers ADD CHECK (joinDate >= '2015-11-27');

ALTER TABLE Showings ADD 
CHECK (CASE WHEN movieID IS NOT NULL THEN priceCode IS NOT NULL END);

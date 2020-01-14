-- Khang Tran
-- khvitran
-- Lab1

CREATE TABLE Movies (
   movieID,
   name,
   year,
   rating,
   length,
   totalEarned
);

CREATE TABLE Theaters (
   theaterID,
   address,
   numSeats
);

CREATE TABLE TheaterSeats (
   theaterID,
   seatNum,
   brokenSeat
);

CREATE TABLE Showings (
   theaterID,
   showingDate,
   startTime,
   movieID,
   priceCode
);

CREATE TABLE Customers (
   customerID,
   name,
   address,
   joinDate,
   status
);

CREATE TABLE Tickets (
   theaterID,
   seatNum,
   showingDate,
   startTime,
   customerID,
   ticketPrice
);

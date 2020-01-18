-- Khang Tran
-- khvitran
-- Lab1

CREATE TABLE Movies (
   movieID INT,
   name VARCHAR(30),
   year INT,
   rating CHAR(1),
   length INT,
   totalEarned DECIMAL(7, 2),
   PRIMARY KEY (movieID)
);

CREATE TABLE Theaters (
   theaterID INT,
   address VARCHAR(40),
   numSeats INT,
   PRIMARY KEY (theaterID)
);

CREATE TABLE TheaterSeats (
   theaterID INT,
   seatNum INT,
   brokenSeat BOOLEAN,
   PRIMARY KEY (theaterID, seatNum),
   FOREIGN KEY (theaterID) REFERENCES Theaters(theaterID)
);

CREATE TABLE Showings (
   theaterID INT,
   showingDate DATE,
   startTime TIME,
   movieID INT,
   priceCode CHAR(1),
   PRIMARY KEY (theaterID, showingDate, startTime),
   FOREIGN KEY (theaterID) REFERENCES Theaters(theaterID),
   FOREIGN KEY (movieID) REFERENCES Movies(movieID)
);

CREATE TABLE Customers (
   customerID INT,
   name VARCHAR(30),
   address VARCHAR(40),
   joinDate DATE,
   status CHAR(1),
   PRIMARY KEY (customerID)
);

CREATE TABLE Tickets (
   theaterID INT,
   seatNum INT,
   showingDate DATE,
   startTime TIME,
   customerID INT,
   ticketPrice DECIMAL(4, 2),
   PRIMARY KEY (theaterID, seatNum, showingDate, startTime),
   FOREIGN KEY (customerID) REFERENCES Customers(customerID),
   FOREIGN KEY (theaterID, showingDate, startTime) REFERENCES Showings(theaterID, showingDate, startTime),
   FOREIGN KEY (theaterID, seatNum) REFERENCES TheaterSeats(theaterID, seatNum)
);

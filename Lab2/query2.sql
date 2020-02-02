SELECT DISTINCT m.name, m.year 
FROM Movies m, Customers c, Tickets t, Showings s 
WHERE c.name = 'Donald Duck' 
AND c.customerID = t.customerID
AND s.movieID = m.movieID
AND t.theaterID = s.theaterID
AND t.showingDate = s.showingDate
AND t.startTime = s.startTime;

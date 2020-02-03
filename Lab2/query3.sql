SELECT DISTINCT m.movieID, m.name, m.year, m.length
FROM Movies m
WHERE m.length > (
    SELECT q.length
    FROM Movies q 
    WHERE q.name = 'Avengers'
    AND year = 2011
)
ORDER BY m.length DESC, m.name ASC;

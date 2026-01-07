/*
PIXAR_FILMS Database Tasks: Level 1

Goal: Table familiarity, filtering, sorting, basic aggregation
Expected skill level: Beginner → Junior Analyst
*/

--- Questions
--- 1. Select all columns from the pixar_films table.
SELECT * FROM films;

--- 2. Retrieve only film_title, release_year, and runtime_minutes.
SELECT film, release_date, run_time

FROM films;

--- 3. List all Pixar films released after 2010.
SELECT film, YEAR(release_date) AS release_year

FROM films

WHERE release_date > '2010-12-31'; --- OR release_date <= '2011-01-01'

--- 4. Find all films with a runtime greater than 100 minutes
SELECT *

FROM films

WHERE run_time > 100;

--- 5. Sort all films by release_year in ascending order.
SELECT *, YEAR(release_date) AS release_year

FROM films

ORDER BY release_date ASC;

--- 6. Sort all films by box_office_worldwide in descending order.
SELECT * FROM box_office

ORDER BY box_office_worldwide DESC;

--- 7. Count the total number of Pixar films.
SELECT COUNT(film)

FROM films;

--- 8. Find the earliest Pixar film by release year.
SELECT film, year(release_date) AS release_year

FROM films

ORDER BY release_date ASC;

--- 9. Find the most recent Pixar film.
SELECT *

FROM films

ORDER BY release_date DESC;

-- 10. Retrieve all films with a rating of G.

SELECT *

FROM films

WHERE film_rating = 'G';

--- 11. Count how many films have a rating of PG
SELECT COUNT(*)

FROM films

WHERE film_rating = 'PG';

--- 12. Show distinct film ratings available in the dataset.
SELECT DISTINCT film_rating

FROM films;

--- 13. Find all films whose title starts with 'Toy'.
SELECT *

FROM films

WHERE film LIKE 'Toy%';

--- 14. Find all films whose title contains the word 'Car'.
SELECT *

FROM films

WHERE film LIKE '%car%';

--- 15. List films released between 2005 and 2015.
SELECT *, YEAR(release_date) AS release_year

FROM films

WHERE release_date BETWEEN '2005-01-01' AND '2015-12-31';

--- 16. Display films that have a runtime between 90 and 110 minutes.
SELECT *

FROM films

WHERE run_time BETWEEN 90 AND 110;

--- 17. Show films ordered by runtime, longest first.
SELECT *

FROM films

ORDER BY run_time DESC;

--- 18. Find films that do not have a recorded box office value.
SELECT *

FROM box_office

WHERE box_office_other IS NULL
	AND box_office_us_canada IS NULL
	AND box_office_worldwide IS NULL;

--- 19. Count how many films were released in each year.
SELECT YEAR(release_date) AS release_year, COUNT(film) AS film_count

FROM films

GROUP BY YEAR(release_date)

ORDER BY film_count DESC;

--- 20. Show the average runtime of Pixar films.
SELECT AVG(run_time) AS Avg_runtime

FROM films;




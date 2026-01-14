---LEVEL 2 — MEDIUM (ANALYTICAL SQL)

/*
Goal: Grouping, joins, subqueries
Expected skill level: Data Analyst / Business Analyst
*/
SELECT * FROM films
SELECT * FROM box_office
SELECT * FROM academy
--- Questions:
--- 1. Calculate the average box office revenue per film.
SELECT AVG(CAST(box_office_worldwide AS decimal(18,2))) AS Average_Revenue

FROM box_office;

--- 2. Find the total box office revenue by release year.
SELECT YEAR(f.release_date) AS release_year, SUM(b.box_office_worldwide) AS revenue

FROM box_office b

INNER JOIN films f

ON b.film = f.film

GROUP BY YEAR(f.release_date)

ORDER BY release_year;

--- 3. Show the number of films released per rating.
SELECT film_rating, COUNT(film) AS film_count

FROM films

GROUP BY film_rating;

--- 4. Identify the highest-grossing Pixar film.
SELECT TOP 1 film, box_office_worldwide

FROM (

SELECT f.film, b.budget, b.box_office_worldwide

FROM films f

LEFT JOIN box_office b

ON f.film = b.film) AS highest_grossing_film

ORDER BY box_office_worldwide DESC;

--- 5. Identify the lowest-grossing Pixar film.
SELECT TOP 1 film, box_office_worldwide

FROM (

SELECT f.film, b.box_office_worldwide

FROM films f

LEFT JOIN box_office b

ON f.film = b.film) AS lowest_revenue_film

ORDER BY box_office_worldwide ASC;


--- Join pixar_films with pixar_box_office to show film title and worldwide gross.
SELECT f.film, b.box_office_worldwide

FROM films f

JOIN box_office b

ON f.film = b.film;


--- Show the average runtime per rating category.
SELECT film_rating, AVG(CAST(run_time AS decimal(5,2))) AS avg_runtime

FROM films

WHERE run_time > 0  --- To exclude bad data

GROUP BY film_rating

ORDER BY avg_runtime DESC;


--- Retrieve films that earned more than the average box office revenue.
SELECT film, CAST(box_office_worldwide AS DECIMAL(18,2)) AS revenue

FROM box_office

WHERE box_office_worldwide > (SELECT AVG(CAST(box_office_worldwide AS DECIMAL(18,2))) AS avg_revenue

FROM box_office)

ORDER BY revenue DESC;


--- Find films that won at least one award.
SELECT DISTINCT film

FROM academy

WHERE [status] = 'Won';

--- ADV Version.
SELECT film, COUNT(*) AS awards_won

FROM academy

WHERE [status] = 'Won'

GROUP BY film

HAVING COUNT(*) >= 1;


--- 
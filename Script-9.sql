-- question 1
CREATE OR REPLACE PROCEDURE addFilm(
    title varchar,
    description varchar,
    release_year integer,
    language_id integer,
    rental_duration integer,
    rental_rate decimal(3,2),
    length integer,
    replacement_cost decimal(3,2),
    rating mpaa_rating
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO film(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)
    VALUES (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating);
END;
$$;

-- answer to question1
CALL addFilm('Up', 'Adventure animation comedy', 2009, 1, 7, 4.99, 96, 9.99, 'G');

SELECT * FROM film f
WHERE title = 'Up'






-- question 2
CREATE OR REPLACE FUNCTION filmsInCategory(categoryId integer)
RETURNS TABLE (
    title varchar,
    film_count bigint
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT f.title, COUNT(*)
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    WHERE fc.category_id = categoryId
    GROUP BY f.title;
END;
$$;

-- answer to question 2
SELECT * FROM filmsInCategory(1);



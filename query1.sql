-- Find all film_ids of films with minimum length or maximum rental duration (compared to all other films). The returned list of film_ids should be sorted in descending order.

-- Put query for Q1 here
WITH min_max_values AS (
    SELECT MIN(length) AS min_length, MAX(rental_duration) AS max_rental_duration
    FROM film
)

SELECT f.film_id
FROM film f, min_max_values mmv
WHERE f.length = mmv.min_length OR f.rental_duration = mmv.max_rental_duration
ORDER BY f.film_id DESC;

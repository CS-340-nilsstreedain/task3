-- For each actor, find the actor_id, first_name, last_name and total_combined_film_length of "Animation" films for that actor.
-- Order your results by the actor_id in ascending order. 
-- (Note: actors who have not stared in any animation films would have a total_combined_film_length of 0).

-- Put query for Q3 here
SELECT a.actor_id, a.first_name, a.last_name, SUM(
	CASE WHEN c.name = 'Animation' THEN f.length ELSE 0
	END
) AS total_combined_film_length
FROM actor a

LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
LEFT JOIN film f ON fa.film_id = f.film_id
LEFT JOIN film_category fc ON f.film_id = fc.film_id
LEFT JOIN category c ON fc.category_id = c.category_id

GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY a.actor_id ASC;

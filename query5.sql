-- Find the title (as "film_title") of all films which feature both RALPH CRUZ and WILL WILSON. 
-- Order the results by film_title in ascending order.

-- Put your query for Q5 here.
SELECT f.title AS film_title
FROM film f
WHERE EXISTS (
	SELECT 1
	FROM film_actor fa1
	JOIN actor a1 ON fa1.actor_id = a1.actor_id
	WHERE f.film_id = fa1.film_id AND a1.first_name = 'RALPH' AND a1.last_name = 'CRUZ'
)
AND EXISTS (
	SELECT 1
	FROM film_actor fa2
	JOIN actor a2 ON fa2.actor_id = a2.actor_id
	WHERE f.film_id = fa2.film_id AND a2.first_name = 'WILL' AND a2.last_name = 'WILSON'
)
ORDER BY film_title ASC;

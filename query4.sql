-- Find the actor_id, first_name, and last_name of all actors who have never been in an Animation film. 
-- Order by the actor_id in ascending order.

-- Put your query for Q4 here
SELECT a.actor_id, a.first_name, a.last_name
FROM actor a
WHERE NOT EXISTS (
    SELECT 1
    FROM film_actor fa
    
    JOIN film f ON fa.film_id = f.film_id
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    
    WHERE a.actor_id = fa.actor_id AND c.name = 'Animation'
)
ORDER BY a.actor_id ASC;

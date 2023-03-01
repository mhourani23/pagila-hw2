/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

WITH f AS (SELECT title, unnest(special_features) AS SF FROM film), act AS (SELECT film.title, (actor.first_name || ' ' || actor.last_name) AS "Actor Name" FROM film JOIN film_actor using (film_id) JOIN actor USING (actor_id))
SELECT "Actor Name" FROM act WHERE act.title IN (SELECT title from f  WHERE SF = 'Behind the Scenes') GROUP BY "Actor Name" ORDER BY "Actor Name";

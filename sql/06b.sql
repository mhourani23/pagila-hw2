/*
 * This problem is the same as 06.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

SELECT title from film LEFT JOIN inventory AS X ON (film.film_id = X.film_id) WHERE X.film_id is NULL ORDER BY film.title; 

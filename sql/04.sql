/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */

SELECT film.title from film LEFT JOIN inventory ON inventory.film_id = film.film_id LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id LEFT JOIN customer ON rental.customer_id = customer.customer_id WHERE customer.customer_id = 1 GROUP BY film.title HAVING count(*) > 1 ORDER BY film.title;

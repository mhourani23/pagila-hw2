/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */

WITH us_customer AS (SELECT customer.customer_id FROM customer LEFT JOIN address USING (address_id) LEFT JOIN city USING (city_id) LEFT JOIN country USING (country_id) WHERE country.country_id = 103),
rentals AS (SELECT DISTINCT film.title, rental.customer_id FROM film JOIN inventory USING (film_id) JOIN rental USING (inventory_id)),
us_rents AS (SELECT * FROM rentals WHERE rentals.customer_id in (SELECT * FROM us_customer))
SELECT DISTINCT rentals.title FROM rentals LEFT JOIN us_rents USING(customer_id) WHERE rentals.title NOT IN (SELECT title FROM us_rents) ORDER BY rentals.title;

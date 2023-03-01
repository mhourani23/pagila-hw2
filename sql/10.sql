/*
 * Management is planning on purchasing new inventory.
 * Films with special features cost more to purchase than films without special features,
 * and so management wants to know if the addition of special features impacts revenue from movies.
 *
 * Write a query that for each special_feature, calculates the total profit of all movies rented with that special feature.
 *
 * HINT:
 * Start with the query you created in pagila-hw1 problem 16, but add the special_features column to the output.
 * Use this query as a subquery in a select statement similar to answer to the previous problem.
 */

WITH selected_features AS (SELECT title, unnest(special_features) AS SF FROM film), 
profits AS (SELECT film.title, SUM(payment.amount) AS profit FROM film LEFT JOIN inventory USING (film_id) LEFT JOIN rental USING (inventory_id) LEFT JOIN payment USING (rental_id) GROUP BY film.title ORDER BY profit DESC)
SELECT selected_features.SF AS special_feature, SUM(profits.profit) AS profit FROM selected_features LEFT JOIN profits USING (title) GROUP BY special_feature ORDER BY special_feature;

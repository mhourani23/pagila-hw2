/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

WITH f AS (SELECT title, unnest(special_features) AS SF FROM film), behind AS (SELECT * FROM f WHERE SF = 'Behind the Scenes'), trail AS (SELECT * FROM f WHERE SF = 'Trailers')
SELECT title FROM trail JOIN behind USING (title) ORDER BY title;

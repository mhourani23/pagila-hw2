/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

SELECT title FROM (SELECT title, rating, unnest(special_features) as X FROM film)
AS Y WHERE (rating = 'G' AND X = 'Trailers') ORDER BY title;

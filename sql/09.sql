/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

WITH X AS(SELECT title, unnest(special_features) AS Y FROM film) SELECT Y AS special_features, count(Y) FROM X GROUP BY special_features ORDER BY special_features;

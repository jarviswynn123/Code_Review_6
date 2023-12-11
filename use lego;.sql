use lego;

--Selecting Values

--Gets the name and part_num columns from the parts table that contain the word Hair and orders them by part_num in descending order.
SELECT name, part_num FROM parts WHERE name LIKE "%Hair%" ORDER BY part_num DESC;

--Gets all columns from sets table that contain the word Showdown in the name table and that is between the years 1990 and 2015
SELECT * FROM sets WHERE name LIKE "%Showdown%" AND year BETWEEN 1990 AND 2015;

--Aliases the part_categories table as p and gets the id and name from table p that contains the word Bricks in the names table 
SELECT id, name FROM part_categories AS p WHERE name LIKE "%Bricks%";

--Subqueries

--A subquery is used in the final statement. The subquery gets the id from the themes table where the name contains the word Pirates or Star Wars
--The final statement gets the name column from the sets table where the theme_id is the same as the id's from the original query
SELECT name FROM sets WHERE theme_id IN (SELECT id from themes WHERE name LIKE "%Pirates%" or name LIKE "%Star Wars%");


SELECT * FROM inventory_parts WHERE inventory_id IN (SELECT id FROM inventories WHERE version > 1)


SELECT year, CONCAT(UPPER(name), "!!!") FROM sets as s WHERE name LIKE "%Batman%"

SELECT quantity FROM inventory_parts WHERE quantity > 1

UPDATE inventory_parts
SET inventory_parts.quantity = inventory_parts.quantity*2
WHERE inventory_parts.quantity > 1

SELECT * FROM inventory_parts WHERE quantity > 1 ORDER BY quantity LIMIT 20;

SELECT *, SUM(num_parts) AS all_parts FROM sets WHERE year >= 2000

SELECT *, AVG(num_parts) AS avg_num_parts FROM sets WHERE year >= 2000

SELECT theme_id, AVG(num_parts) AS avg_num_parts From sets GROUP BY theme_id

SELECT *
FROM parts
JOIN part_categories
ON parts.part_cat_id = part_categories.id
WHERE parts.name LIKE "%Werewolf%"
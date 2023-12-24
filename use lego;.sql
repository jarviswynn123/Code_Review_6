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

--This statement gets all columns from the inventory parts table where the inventory_id is the same as the id in the inventories table with a version greater than 1.
SELECT * FROM inventory_parts WHERE inventory_id IN (SELECT id FROM inventories WHERE version > 1)

--This statement gets year and name from the sets table that includes the substring of batman. The name column is manipulated. All items in name are capitolized and concatenated with "!!!"
SELECT year, CONCAT(UPPER(name), "!!!") FROM sets as s WHERE name LIKE "%Batman%"

--Each value in the quantity column within the inventory_parts table is doubled where the value is originally greater than 1. The display is limited by 20
UPDATE inventory_parts
SET inventory_parts.quantity = inventory_parts.quantity*2
WHERE inventory_parts.quantity > 1
SELECT * FROM inventory_parts WHERE quantity > 1 ORDER BY quantity LIMIT 20;

--sum of all the parts for all the sets that came out since the year 2000
SELECT *, SUM(num_parts) AS all_parts FROM sets WHERE year >= 2000

--average number of parts for sets that came out since the year 2000
SELECT *, AVG(num_parts) AS avg_num_parts FROM sets WHERE year >= 2000

--average number of parts for each theme_id in sets
SELECT theme_id, AVG(num_parts) AS avg_num_parts From sets GROUP BY theme_id

--join the parts and part_categories tables. Filter for values where the part_categories id matches the parts part_cat_id, and where the name of the part contains the word 'Werewolf' 
SELECT *
FROM parts
JOIN part_categories
ON parts.part_cat_id = part_categories.id
WHERE parts.name LIKE "%Werewolf%" 
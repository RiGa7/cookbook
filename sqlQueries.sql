--1. Retrieve all recipes along with their cuisine, category, and serving size.
SELECT recipe_name, cuisine, category, serving_size FROM Recipes;

--2. Get all ingredients required for a specific recipe.
SELECT r.recipe_name, i.ingredient_name, ri.quantity, ri.unit FROM recipe_Ingredients ri
JOIN ingredients i ON ri.ingredient_id = i.ingredient_id JOIN recipes r ON ri.recipe_id = r.recipe_id
WHERE r.recipe_name = 'Chickpea Salad';

--3. Find all recipes that are vegan and also change the name of the column in resultant table.
SELECT  recipe_id as id,recipe_name as Name FROM Recipes WHERE is_vegan = TRUE;

--4. Retrieve recipes with a prep time of less than 15 minutes.
SELECT recipe_name, prep_time FROM Recipes WHERE prep_time <= 10;

-- 5. List recipes along with their average rating.
SELECT r.recipe_name, AVG(rev.rating) AS avg_rating FROM Reviews rev
JOIN Recipes r ON rev.recipe_id = r.recipe_id GROUP BY r.recipe_name;

-- 6. Show all reviews for a specific recipe, "Taco".
SELECT u.username, rev.rating, rev.review_text FROM Reviews rev
JOIN Users u ON rev.user_id = u.user_id JOIN Recipes r ON rev.recipe_id = r.recipe_id
WHERE r.recipe_name = 'Tacos';

-- 7. Find all gluten-free recipes in the "Main Course" category and retrieve preparation and cooking time and their average rating.
SELECT r.recipe_name AS Food, r.prep_time, r.cook_time, AVG(rev.rating) AS average_rating FROM Recipes r
JOIN Reviews rev ON rev.recipe_id = r.recipe_id
WHERE r.is_gluten_free = TRUE AND r.category = 'Main Course' GROUP BY r.recipe_name, r.prep_time, r.cook_time;


-- 8. List all users who have given a rating of 5 to any recipe.
SELECT DISTINCT u.username FROM Reviews rev
JOIN Users u ON rev.user_id = u.user_id WHERE rev.rating = 5;

-- 9. Get the total number of recipes in each cuisine type.
SELECT cuisine, COUNT(recipe_id) AS total_recipes FROM Recipes GROUP BY cuisine;

-- 10. Retrieve ingredients that have a caloric value greater than 50.
SELECT ingredient_name, caloric_value FROM Ingredients WHERE caloric_value > 100;


-- 11. Find the total calories for a recipe based on its ingredients.
SELECT r.recipe_name, SUM(i.caloric_value * ri.quantity) AS total_calories FROM Recipe_Ingredients ri
JOIN Ingredients i ON ri.ingredient_id = i.ingredient_id JOIN Recipes r ON ri.recipe_id = r.recipe_id
GROUP BY r.recipe_name;

-- 12. Display all recipes that include “Tomato” as an ingredient.
SELECT DISTINCT r.recipe_name FROM Recipe_Ingredients ri
JOIN Ingredients i ON ri.ingredient_id = i.ingredient_id JOIN Recipes r ON ri.recipe_id = r.recipe_id
WHERE i.ingredient_name = 'Tomato';

-- 13. Find recipes along with the steps for each recipe in order where food is keto.
SELECT r.recipe_name, s.step_number, s.instruction FROM Steps s
JOIN Recipes r ON s.recipe_id = r.recipe_id where is_keto = TRUE ORDER BY r.recipe_name, s.step_number;

-- 14. List recipes that are both vegan and gluten-free.
SELECT recipe_name FROM Recipes
WHERE is_vegan = TRUE AND is_gluten_free = TRUE;

-- 15. Count the total number of reviews for each recipe.
SELECT r.recipe_name, COUNT(rev.review_id) AS total_reviews FROM Reviews rev
JOIN Recipes r ON rev.recipe_id = r.recipe_id GROUP BY r.recipe_name;

-- 16. Retrieve recipes with a description that mentions the word "spicy".
SELECT recipe_name, description FROM Recipes
WHERE description ILIKE '%spicy%';

-- 17. Find users who have reviewed more than one recipe.
SELECT u.username, COUNT(rev.review_id) AS total_reviews FROM Reviews rev
JOIN Users u ON rev.user_id = u.user_id GROUP BY u.username
HAVING COUNT(rev.review_id) > 1;

-- 18. Display all the categories with their distinct recipes.
SELECT DISTINCT category, recipe_name FROM Recipes ORDER BY category;

-- 19. Retrieve Gluten-Free Main Course Recipes with Nutritional Information and Average Rating
SELECT r.recipe_name AS Food, r.prep_time, r.cook_time, AVG(rev.rating) AS average_rating, 
r.nutrition_info->>'calories' AS calories , r.nutrition_info->>'protein' AS protein FROM  Recipes r 
JOIN Reviews rev ON rev.recipe_id = r.recipe_id WHERE r.is_gluten_free = TRUE AND r.category = 'Main Course' 
GROUP BY r.recipe_name, r.prep_time, r.cook_time, r.nutrition_info; 

-- 20. Find the highest-rated recipe for each cuisine type.
SELECT r.cuisine, r.recipe_name, MAX(rev.rating) AS max_rating FROM Reviews rev
JOIN Recipes r ON rev.recipe_id = r.recipe_id GROUP BY r.cuisine, r.recipe_name
ORDER BY r.cuisine, max_rating DESC;

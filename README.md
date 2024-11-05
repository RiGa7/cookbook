# cookbook

This project creates a recipe database using PostgreSQL with tables and queries suitable for recipe management applications. The database supports complex queries for recipes, user reviews, ingredient details, and nutrition, making it applicable for AI filtering and dietary analysis.

<table>
  <tr>
    <th>Table</th>
    <td>Recipes</td>
    <td>Ingredients</td>
    <td>Recipe_Ingredients</td>
    <td>Steps</td>
    <td>Users</td>
    <td>Reviews</td>
  </tr>
  <tr>
    <th>Description</th>
    <td></td>
    <td>Stores recipe details like cuisine, prep time, cook time, etc.</td>
    <td>Holds ingredient names and their caloric values.</td>
    <td>Links recipes to their ingredients with quantities.</td>
    <td>Contains ordered cooking instructions for each recipe.</td>
    <td>Stores user information who review recipes.</td>
    <td>Records reviews and ratings for recipes by users.</td>  
	
  </tr>
</table>

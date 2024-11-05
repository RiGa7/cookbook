# cookbook

This project creates a recipe database using PostgreSQL with tables and queries suitable for recipe management applications. The database supports complex queries for recipes, user reviews, ingredient details, and nutrition, making it applicable for AI filtering and dietary analysis.
<br>
<br>

## Requirements

- **PostgreSQL** installed on your system.

<br>

## Database Structure

The database contains the following tables:

<table>
  <tr>
    <th>Table</th>
    <th>Description</th>
  </tr>
    <tr><td>Recipes</td><td>Stores recipe details like cuisine, prep time, cook time, etc.</td></tr>
    <tr><td>Ingredients</td><td>Holds ingredient names and their caloric values.</td></tr>
    <tr><td>Recipe_Ingredients</td> <td>Links recipes to their ingredients with quantities.</td></tr>
    <tr><td>Steps</td><td>Contains ordered cooking instructions for each recipe.</td></tr>
    <tr><td>Users</td> <td>Stores user information who review recipes.</td></tr>
    <tr><td>Reviews</td><td>Records reviews and ratings for recipes by users.</td> </tr>
</table>

<br><br>
link to all files [click here](https://drive.google.com/drive/folders/16iXHWjDaRA4SsXj58qSKz5y5Nnk2nyKc?usp=drive_link)

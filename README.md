# Advanced SQL Assignment
## How to attempt and turn in this Assignment ?
1. Read the questions in the next section. You will be writing SQL queries to answer the questions. This assignment will be more challenging than the previous ones. In particular it will involve using subqueries and different types of JOINs. 
2. Download the starter code from [advanced_sql_assignment_starter_code-1.zip](https://canvas.oregonstate.edu/courses/1914742/files/99254343?wrap=1). Make sure you read the files before you change them. Your queries will be executed on a database which you can set up locally by importing [this database dump](https://canvas.oregonstate.edu/courses/1914742/files/98978984/download?wrap=1) (like you did in  [Activity 1 - Access and Use your CS340 Database](https://canvas.oregonstate.edu/courses/1914742/assignments/9185722?wrap=1)). The database schema is also included below.
3. Put your queries in the correct .sql file. You will have multiple query submission files. A single .sql file can contain single or multiple queries depending on what the question requires.
4. Click on the button at the bottom of this page labeled "**Load Advanced SQL Assignment (on GradeScope) in a new window**" to go to the GradeScope page for this assignment.
5. Submit your SQL files there on the GradeScope page. You can upload a single query file at a time or you can upload them all at once. Once uploaded, GradeScope will run your SQL and indicate whether it is correct or not. If your SQL does not produce the correct results, GradeScope will show you how the expected output differs from your submission's output. Syntax errors, if any, should also be show to you.

As you write your queries, it's good practice to run them over your own instance of the database. This way, we can see what our intermediate results look like. For example, if you are having trouble with producing the correct output for a query, you can try removing parts of the WHERE clause (or other components) to get an idea of what your SELECT statement is actually doing. Also, Gradescope will provide the expected results for each query's output (after you submit a file for grading). Use this to your advantage!

## Schema:
### film
- film_id
- title
- description
- release_year
- language_id - FK: language.language_id
- original_language_id - FK: language.name
- rental_duration
- rental_rate
- length
- replacement_cost

### category
- category_id
- name
- last_update

### language
- language_id
- name
- last_update

### film_category
- film_id - FK: film.film_id
- category_id - FK: category.category_id
- last_update

### actor
- actor_id
- first_name
- last_name
- last_update

### film_actor
- film_id - FK: film.film_id
- actor_id - FK: actor.actor_id
- last_update

## Questions:
1. Find all **film_ids** of films with minimum length or maximum rental duration (compared to all other films). The returned list of film_ids should be sorted in descending order.
2. For each category of film, find the name of the category (as "category_name") and the count of films (as "number_of_films") that MAE HOFFMAN has stared in within that category. Order by the category name in descending order. (**Note**: your query should return every category even if MAE has been in no films in that category--i.e., her count is 0 for "number_of_films" for that respective "category_name").

**Hint**: for this question, you may want to consider using an aggregation function with a case statement nested inside (see https://www.w3schools.com/sql/func_mysql_case.asp) Links to an external site.. For example, the query
```sql
SELECT sum(CASE WHEN first_name = "SANDRA" THEN 1 ELSE NULL END) as "Number of SANDRAs"
FROM actor;
```
counts the number of actors named SANDRA. Start with JOINing all the necessary tables, creating the correct GROUP BY clause, and then using SUM with the correct CASE statement.

3. For each actor, find the actor_id, first_name, last_name and total_combined_film_length of "Animation" films for that actor. Order your results by the actor_id in ascending order. (Note: actors who have not stared in any animation films would have a total_combined_film_length of 0). Consider the above hint for this query as well.

4. Find the actor_id, first_name, and last_name of all actors who have never been in an Animation film. Order by the actor_id in ascending order.

5. Find the title (as "film_title") of all films which feature both RALPH CRUZ and WILL WILSON. Order the results by film_title in ascending order.

#GROUP BY EXERCISES 
# Full titles table
SELECT *
FROM titles;

#1. In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.

SELECT DISTINCT title
FROM titles;

# There are 7 unique titles.

#2. Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.

# Full employee table
SELECT *
FROM employees;

SELECT last_name
FROM employees
WHERE last_name LIKE '%E' 
	AND last_name LIKE 'E%'
GROUP BY last_name;

#3. Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%E' 
	AND last_name LIKE 'E%'
GROUP BY first_name, last_name;

#4. Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.

SELECT last_name
FROM employees
WHERE last_name LIKE '%q%'
	AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

/* Last names with q, but not qu:
Chleq
Lindqvist
Qiwen */

#5. Add a COUNT() to your results (the query above) to find the number of employees with the same last name.

SELECT COUNT(last_name)
FROM employees
WHERE last_name LIKE '%q%'
	AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

#6. Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.

SELECT COUNT(gender), gender
FROM employees
WHERE first_name = 'Irena'
	OR first_name = 'Vidya'
	OR first_name = 'Maya'
GROUP BY gender;


#7. Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?

SELECT COUNT(*) AS QTY, lower(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), "_", SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS Username
FROM employees
GROUP BY Username
ORDER BY QTY DESC;


#8. Find the historic average salary for all employees. Now determine the current average salary.

SELECT AVG(salary)
FROM salaries;
# The historic average salary for all employees is ~$63,810.74

SELECT AVG(salary)
FROM salaries
WHERE to_date LIKE '9999%';

# The current average salary is ~$72,012.24

#9. Now find the historic average salary for each employee. Reminder that when you hear "for each" in the problem statement, you'll probably be grouping by that exact column.







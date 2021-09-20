--    1. Create a file named where_exercises.sql. Make sure to use the employees database.

--    2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.
SHOW DATABASES;
USE employees;
SHOW TABLES;
DESCRIBE employees;

SELECT *
FROM employees
WHERE first_name IN ('Maya', 'Irena', 'Vidya');

-- There are 709 records returned

/*    3. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2? */

SELECT *
FROM employees
WHERE first_name = 'Maya' OR 'Irena' OR ' Vidya';

-- There were only 236 records returned and it does not match Q2

/* 4. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned. */

SELECT *
FROM employees
WHERE first_name = 'Maya' OR 'Irena' OR ' Vidya'
AND gender = 'M';

-- There were 236 records returne

/* 5. Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E. */

SELECT *
FROM employees
WHERE last_name LIKE 'E%';

-- There are 7,330 employees whose names start with E

/* 6. Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E? */

SELECT *
FROM employees
WHERE last_name LIKE 'E%' 
	OR last_name LIKE '%E';

-- There are 30,723 employees whose names either start or end with 'E'

SELECT *
FROM employees
WHERE last_name LIKE '%E' 
	AND last_name NOT LIKE 'E%';
	
-- There are 23,393 records where the name ends with 'E' and does not start with 'E'

/* 7. Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E? */

SELECT *
FROM employees
WHERE last_name LIKE 'E%' 
	AND last_name LIKE '%E';
	
-- There are 899 employees whose last names both start and end with E

SELECT *
FROM employees
WHERE last_name LIKE '%E';

-- There are 24,292 employees with last names that end with 'E' regardless of where they start with 'E'

/* 8. Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned. */

SELECT *
FROM employees
WHERE hire_date LIKE '%90-%';

-- There were 25,610 employees who were hired in the 90s.

/* 9. Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned. */

SELECT *
FROM employees
WHERE birth_date LIKE '%12-25%';

-- There are 842 employees who were born on Christmas

/* 10. Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned. */

SELECT *
FROM employees
WHERE hire_date LIKE '%90-%'
	AND birth_date LIKE '%12-25%';

-- There were 77 employees hired in the 90s and born on Christmas.

/* 11. Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned. */

SELECT *
FROM employees
WHERE last_name LIKE '%q%';

-- There were 1873 employees with 'q' in their last name.

/* 12. Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found? */

SELECT *
FROM employees
WHERE last_name LIKE '%q%';
	AND NOT last_name LIKE '%qu%';

-- There were employees with 'q' but not 'qu' in their last name. 


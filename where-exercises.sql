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
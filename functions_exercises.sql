# FUNCTIONS EXERCISES

-- 1. Copy the order by exercise and save it as functions_exercises.sql. 
-- 2. Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.
USE employees;
SELECT CONCAT(first_name, " ", last_name) AS full_name
FROM employees
WHERE last_name LIKE '%E' 
	AND last_name LIKE 'E%';
	
-- 3. Convert the names produced in your last query to all uppercase.
SELECT UPPER(CONCAT(first_name, " ", last_name)) AS full_name
FROM employees
WHERE last_name LIKE '%E' 
	AND last_name LIKE 'E%';
	
-- 4. Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),

SELECT DATEDIFF(CURDATE(),hire_date)/365 AS years_at_company, CONCAT(first_name, " ", last_name) AS Name, hire_date AS Hired_in_the_90s, birth_date AS Born_on_Christmas
FROM employees
WHERE hire_date LIKE'%199%' 
	AND birth_date LIKE '%12-25%';

-- 5. Find the smallest and largest current salary from the salaries table.
SELECT MIN(salary) AS Smallest_Salary, MAX(salary) AS Largest_Salary
FROM salaries;

-- 6. Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. 

# sjone_1085
SELECT CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), "_", SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2)) AS Username, CONCAT(first_name, " ", last_name) AS Name
FROM employees;

# ORDER BY Exercises

USE employees;
EXPLAIN employees;

/* 1. Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson. */
# see end of file for contents of previous exercise

/* 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table? */

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Irena' 
	OR first_name = 'Vidya'
	OR first_name = 'Maya'
ORDER BY first_name;

# The first and last name of the person in the first row of the results is Irene Reutenauer.

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Irena' 
	OR first_name = 'Vidya'
	OR first_name = 'Maya'
ORDER BY first_name DESC;

# The first and last name of the last person in the table is Vidya Awdeh.

/* 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table? */

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Irena' 
	OR first_name = 'Vidya'
	OR first_name = 'Maya'
ORDER BY first_name, last_name;

# The first and last name in the first row of the results is Irena Acton.

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Irena' 
	OR first_name = 'Vidya'
	OR first_name = 'Maya'
ORDER BY first_name DESC, last_name DESC;

# The first and last name of the last person in the table is Vidya Zweizig.

/* 4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table? */

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Irena' 
	OR first_name = 'Vidya'
	OR first_name = 'Maya'
ORDER BY last_name, first_name;

# The first and last name in the first row of the results is Irena Acton.

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Irena' 
	OR first_name = 'Vidya'
	OR first_name = 'Maya'
ORDER BY last_name DESC, first_name DESC;

# The first and last name of the last person in the table is Maya Zyda.

/* 5. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name. */

EXPLAIN employees;
SELECT first_name, last_name, emp_no
FROM employees
WHERE last_name LIKE 'E%'
	AND last_name LIKE '%E'
ORDER BY emp_no;

# There are 899 employees whose last name starts and ends with 'E'.
# The first employee number is 10021, with corresponding first and last name of Ramzi Erde.

SELECT first_name, last_name, emp_no
FROM employees
WHERE last_name LIKE 'E%'
	AND last_name LIKE '%E'
ORDER BY emp_no desc;

# The last employee number is 499648, with corresponding first and last name of Tadahiro Erde.

/* 6. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest emmployee. */

SELECT first_name, last_name, hire_date
FROM employees
WHERE last_name LIKE 'E%'
	AND last_name LIKE '%E'
ORDER BY hire_date DESC;


# The number of employees with last name starts and ends with 'E' is 899.

# The newest employee is Teiji Eldridge.

SELECT first_name, last_name, hire_date
FROM employees
WHERE last_name LIKE 'E%'
	AND last_name LIKE '%E'
ORDER BY hire_date;

# The oldest employee is Sergi Erde. 

/* 7. Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest emmployee who was hired first. */

EXPLAIN employees;
SELECT first_name, last_name, hire_date, birth_date
FROM employees
WHERE hire_date LIKE '%199%' AND birth_date LIKE '%-12-25';

# There are 362 employees who were hired in the 90s and born on Christmas.

SELECT first_name, last_name, hire_date, birth_date
FROM employees
WHERE hire_date LIKE '%199%' AND birth_date LIKE '%-12-25'
ORDER BY birth_date DESC, hire_date DESC;

# The oldest employee with the most recent hire date is Gudjon Vakili.

SELECT first_name, last_name, hire_date, birth_date
FROM employees
WHERE hire_date LIKE '%199%' AND birth_date LIKE '%-12-25'
ORDER BY birth_date DESC, hire_date; 

# The youngest employee with the oldest hire date is Douadi Pettis.

#-------------------------------------------------
# EXERCISE FROM PREVIOUS LESSON (WHERE-EXERCISES)

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

SELECT first_name, gender
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
WHERE hire_date LIKE '%199%';

-- There were 135,214 employees who were hired in the 90s.

/* 9. Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned. */

SELECT *
FROM employees
WHERE birth_date LIKE '%12-25%';

-- There are 842 employees who were born on Christmas

/* 10. Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned. */

SELECT hire_date, birth_date
FROM employees
WHERE hire_date LIKE '%199%'
	AND birth_date LIKE '%12-25%';

-- There were 362 employees hired in the 90s and born on Christmas.

/* 11. Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned. */

SELECT *
FROM employees
WHERE last_name LIKE '%q%';

-- There were 1873 employees with 'q' in their last name.

/* 12. Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found? */

EXPLAIN employees;

SELECT last_name
FROM employees
WHERE last_name LIKE '%q%';
	AND last_name NOT LIKE '%qu%';

-- There were 547 employees with 'q' but not 'qu' in their last name.

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


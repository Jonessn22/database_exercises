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

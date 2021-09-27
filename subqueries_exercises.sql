-- SUBQUERIES_EXERCISES
use employees;

-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.
select emp_no as 'Employee Number', concat(first_name, ' ', last_name) as 'Employee Name', hire_date as 'Hire Date', to_date
from employees
join dept_emp_latest_date
using(emp_no)
where to_date like '9999%'
and hire_date =
	(
	select hire_date
	from employees
	where emp_no = 101010
	)
order by first_name, last_name;

-- 2. Find all the titles ever held by all current employees with the first name Aamod.
select title as 'Title'
from titles
join employees
using(emp_no)
where to_date like '9999%'
and emp_no in
	(
	select emp_no
	from employees
	where first_name = 'Aamod'
	)
group by title
order by title;

-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code. 59,900
select count(*) 
from employees
join dept_emp_latest_date
using(emp_no)
where to_date < curdate(); 

select count(*)
from (
	select *
	from employees
	join dept_emp_latest_date
	using(emp_no)
	where to_date < curdate()
	) 
as o;

-- 4. Find all the current department managers that are female. List their names in a comment in your code.
select concat(first_name, ' ', last_name) as Name
from employees
where emp_no in 
		(
		select emp_no
		from dept_manager
		where to_date > curdate()
		)
and gender = 'F'
order by first_name;
		
-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.
select emp_no as 'Employee No', salary as 'Salary', concat(first_name, ' ', last_name) as 'Name' 
from salaries
join employees
using(emp_no)
where salary > 
	(
	select avg(salary) 
	from salaries
	)
and to_date > curdate()
order by salary;

-- 6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
select salary 
from salaries
where salary > 
	(
	select salary
	where 
	from salaries
	);



	select stddev(salary)
	from salaries;









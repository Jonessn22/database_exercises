-- SUBQUERIES_EXERCISES
use employees;

-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.
select emp_no as 'Employee Number', concat(first_name, ' ', last_name) as 'Employee Name', hire_date as 'Hire Date', to_date
from employees
join dept_emp_latest_date
-- where to_date like '9999%'
using(emp_no)
where hire_date =
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
-- where to_date like '9999%'
where emp_no in
	(
	select emp_no
	from employees
	where first_name = 'Aamod'
	)
group by title
order by title;

-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
select count(*)
from employees
join dept_emp_latest_date
using(emp_no)
where to_date < curdate(); 

select count(o)
from (
	select *
	from employees
	join dept_emp_latest_date
	using(emp_no)
	where to_date < curdate()
	) 
as o;










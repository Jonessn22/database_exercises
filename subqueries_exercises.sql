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

-- instructor solution test
select *
from employees
JOIN dept_emp using(emp_no)
where to_date > now()
and hire_date =
	(select hire_date
	from employees
	where emp_no = 101010);
	
	
	

-- 2. Find all the titles ever held by all current employees with the first name Aamod.

select distinct title
from titles
where emp_no in 
	(select emp_no
	from employees
	where first_name = 'Aamod')
and to_date > now()
order by title;

-- instructor solution test
select distinct title
from titles
where emp_no IN (
   select emp_no
   from employees
   join dept_emp using(emp_no)
   where first_name = 'aamod'
   and to_date > now()
);



-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code. 59,900
select count(*)
from (
	select *
	from employees
	join dept_emp_latest_date
	using(emp_no)
	where to_date < curdate()
	) 
as o;

select count(*)
from employees
where emp_no not in
	(select emp_no
	from dept_emp
	where to_date > now());

-- instructor solution test
select count(*) # count all the records
from employees # from the employees table
where emp_no not in 
	(select *
	from dept_emp
	where to_date > now()
);

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

-- instructor solution test
select *
from employees
where emp_no in (
    select emp_no
       from dept_manager
          where to_date > now()
)
and gender = "F";
		
-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.
select *
from salaries
where to_date > now()
and salary > (
	select avg(salary)
	from salaries
);


-- instructor solution test
select first_name, last_name, emp_no
from employees
join dept_emp as de using(emp_no)
where de.to_date > now() 
and emp_no IN
	(select emp_no
	from salaries
	where salary > (select avg(salary) from salaries));
	

-- 6. How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

select salary
from salaries
where (salary - stddev(salary)) > 
	(select salary
	from salaries);


-- instructor solution test












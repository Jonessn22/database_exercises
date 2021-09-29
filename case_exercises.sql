-- CASE EXERCISES

-- Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.
use employees;

select emp_no, dept_no, from_date, to_date,
	case 
		when to_date > curdate() then 1		
		else 0
		end as is_current_employee
from dept_emp;

-- Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
use employees;
select first_name, last_name,
	case
		when last_name like 'a%' then 'A - H'
		when last_name like 'b%' then 'A - H'
		when last_name like 'c%' then 'A - H'
		when last_name like 'd%' then 'A - H'
		when last_name like 'e%' then 'A - H'
		when last_name like 'f%' then 'A - H'
		when last_name like 'g%' then 'A - H'
		when last_name like 'h%' then 'A - H'
		
		when last_name like 'i%' then 'I - Q'
		when last_name like 'j%' then 'I - Q'
		when last_name like 'k%' then 'I - Q'
		when last_name like 'l%' then 'I - Q'
		when last_name like 'm%' then 'I - Q'
		when last_name like 'n%' then 'I - Q'
		when last_name like 'o%' then 'I - Q'
		when last_name like 'p%' then 'I - Q'
		when last_name like 'q%' then 'I - Q'
		
		else 'R-Z'
	end as alpha_group
from employees
order by last_name;



-- How many employees (current or previous) were born in each decade?
select * from employees order by birth_date; 

select *, 
	case when birth_date like '195%' then '50s' 
	when birth_date like '196%' then '60s'
	else 'NADA'
	end as 'decade'	
from employees;
	
	
-- BONUS

-- What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
select * from salaries;
-- emp_no
-- salary
-- from_date
-- to date
select * from dept_emp;
-- emp_no
-- dept_no
-- from_date
-- to_date
select * from departments;
-- dept_no
-- dept_name

-- find avergae salary

-- group by emp_no

-- use emp_no to group by dept_no
select * from employees
join salaries using(emp_no)
join dept_emp using(emp_no)
join departments using(dept_no)
where salaries.to_date > now()
group by dept_no;


-- TEMPORARY TABLES

-- 1. Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department.
use employees;
show tables;

-- creating temp table
create temporary table hopper_1546.employees_with_departments as 
	select first_name, last_name, dept_name
	from employees
	join dept_emp using(emp_no)
	join departments using(dept_no)
	where to_date > now();

-- confirming table is there	
use hopper_1546;
show tables;
select *
from employees_with_departments;


-- 1a. Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns.
use hopper_1546;
alter table employees_with_departments
add full_name VARCHAR(100);

-- 1b. Update the table so that full name column contains the correct data.
use hopper_1546;
update employees_with_departments
set full_name = concat(first_name, ' ', last_name);

select *
from employees_with_departments;

-- 1c. Remove the first_name and last_name columns from the table.
alter table employees_with_departments
drop column first_name;

alter table employees_with_departments
drop column last_name;

use hopper_1546;
select * from employees_with_departments;

-- 1d. What is another way you could have ended up with this same table?
use employees;

create temporary table hopper_1546.alt_emp_with_dept as
select *
from departments
join dept_emp using (dept_no)
join employees using (emp_no);

-- using the select parameters in the original create temp table line
select dept_name, concat(first_name, ' ', last_name) as full_name, to_date
from hopper_1546.alt_emp_with_dept
where to_date > now();

-- 2. Create a temporary table based on the payment table from the sakila database.
select database();
use sakila;
create temporary table hopper_1546.my_payment as 
	select *
	from payment;

-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
select * from hopper_1546.my_payment;
show create table hopper_1546.my_payment;
# amount decimal(5,2) NOT NULL

alter table hopper_1546.my_payment
add cents decimal(5,0);

update hopper_1546.my_payment
set cents = amount;

select *
from hopper_1546.my_payment;


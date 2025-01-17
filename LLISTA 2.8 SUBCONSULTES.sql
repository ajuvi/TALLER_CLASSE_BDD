
/*1*/

select last_name, hire_date
from employees
where department_id = (select department_id
						from employees
						where last_name='Zlotkey')
	  and last_name != 'Zlotkey';
	  
/*2*/

select employee_id, last_name
from employees
where salary>(select avg(salary) 
			  from employees)
order by salary asc
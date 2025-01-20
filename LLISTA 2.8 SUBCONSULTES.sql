
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

/*3*/

select employee_id, last_name
from employees
where department_id in (select department_id
						from employees
						where last_name like '%u%')


select employee_id, last_name
from employees
where department_id in (select department_id
						from employees
						where last_name like '%u%')						
						
/*4*/
			
select e.LAST_NAME, e.DEPARTMENT_ID, e.JOB_ID
from employees e
where department_id in (select department_id
						from departments
						where location_id = 1700)
		
select e.last_name, e.department_id, e.job_id
from employees e
join departments d on (e.department_id = d.department_id)
where d.location_id = 1700;						

/*5*/

select last_name, salary
from employees e
where manager_id =(select employee_id
				   from employees
				   where last_name = 'King');

select e.last_name, e.salary
from employees e
join employees man on (e.manager_id = man.employee_id)
where man.last_name = 'King';		


/*6*/

select department_id, last_name, job_id
from employees
where department_id = (select department_id
					   from departments
					   where department_name = 'Executive');

select e.department_id, e.last_name, e.job_id
from employees e
join departments d on (e.department_id = d.department_id)
where department_name = 'Executive';

/*7*/

select employee_id, last_name, salary
from employees 
where salary > (select avg(salary)
				from employees ) 
	  and department_id in (select department_id 													   from employees 
							where last_name like '%u%');


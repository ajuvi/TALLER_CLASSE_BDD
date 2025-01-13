/*1*/

select 	max(salary) as Maximum, 
		min(salary) as Minimum, 
		sum(salary) as Sum,  
		avg(SALARY) as Average 
from employees;


/*2*/

select 	job_id, 
		max(salary) as Maximum, 
		min(salary) as Minimum, 
		sum(salary) as Sum, 
		avg(SALARY) as Average 
from employees 
group by job_id;


/*3*/

select e.JOB_ID, j.JOB_TITLE , count(*) 
from employees e 
join jobs j on (j.JOB_ID = e.JOB_ID)
group by  e.JOB_ID, j.JOB_TITLE;

/*4*/

select count(distinct manager_id) as Number_of_Managers
from employees




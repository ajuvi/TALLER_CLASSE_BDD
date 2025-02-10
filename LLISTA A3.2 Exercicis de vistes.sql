#Ex1

create or replace view viewEmpleatsDept90 as
select *
from employees
where department_id = 90

select employee_id, last_name, salary
from viewEmpleatsDept90

#Ex2

create or replace view viewEmpleatsVocal as
select *
from employees
where 	last_name like 'a%' or
		last_name like 'e%' or
		last_name like 'i%' or 
		last_name like 'o%' or 
		last_name like 'u%'
		
create or replace view viewEmpleatsVocal as
select *
from employees
where 	substr(last_name,1,1) in ('a','e','i','o','u') 
		
select * from viewEmpleatsVocal

#Ex3

create or replace view viewEmpleats1990 as
select *
from employees
where year(hire_date) < 1990 

#where date_format(hire_date,'%Y') < 1990
#where hire_date < '1990-01-01'
#where hire_date <= '1989-12-31'

select * from viewEmpleats1990

#Ex4

create or replace view viewEmpleatsSalariTotal  as
select 	employee_id as codi, 
		first_name, 
		last_name, 
		salary*(1+nvl(commission_pct,0)) as salari_total
from employees 

select * from viewEmpleatsSalariTotal

#Ex5

create or replace view viewEmpletsCiutat as
select e.employee_id, e.last_name, e.department_id, d.department_name, l.city
from employees e
left join departments d on(d.department_id = e.department_id)
left join locations l on(l.location_id = d.location_id)

select * from viewempletsciutat;

#Ex6

create or replace view viewEmpleatsToronto as
select e.employee_id, e.last_name
from employees e
join departments d on(d.department_id = e.department_id)
join locations l on(l.location_id = d.location_id)
where l.city = 'Toronto'

#alternativa amb subconsultes
create or replace view viewEmpleatsToronto as
select employee_id, last_name 
from employees
where department_id in (select department_id
						from departments 
						where location_id in (select location_id 
											  from locations
										 	  where city = 'Toronto')
					 	)

select * from viewempleatstoronto;

#Ex7

create or replace view viewNombreEmpleatsDepartament as
select e.department_id, d.department_name, count(employee_id) as num_empleats
from employees e
join departments d on(d.department_id = e.department_id)
group by e.department_id, d.department_name;


-- Ex1
-------

select e.last_name, e.department_id, d.department_name
from employees e 
join departments d ON(d.department_id = e.department_id);

-- Ex2
-------

select distinct e.job_id, d.location_id
from employees e 
join departments d ON(d.department_id = e.department_id)
where e.department_id=80;

-- Ex3
-------

select e.last_name, d.department_name, d.location_id, l.city
from employees e 
join departments d on (d.department_id = e.department_id)
join locations l on (l.location_id = d.location_id)
where e.commission_pct is not null;

-- si volem que també es mostrin els empleats sense departament
select e.last_name, d.department_name, d.location_id, l.city
from employees e 
left join departments d on (d.department_id = e.department_id)
left join locations l
where e.commission_pct is not null;

-- Ex4
-------

select e.last_name, d.department_name
from employees e 
join departments d on(e.department_id=d.department_id)
where e.last_name like '%a%';

-- Ex5
-------

select e.last_name, e.job_id, e.department_id, d.department_name
from employees e
join departments d on(e.department_id=d.department_id)
join locations l on (d.location_id = l.location_id)
where l.city = 'Toronto';

-- Ex6
-------

select 	e.last_name as empl_cognom, e.employee_id as empl_codi,
		man.last_name as man_cognom, man.employee_id as man_codi
from employees e 
join employees man on(e.manager_id = man.employee_id)

-- Ex7
-------

select 	e.last_name as empl_cognom, e.employee_id as empl_codi,
		man.last_name as man_cognom, man.employee_id as man_codi
from employees e 
left join employees man on(e.manager_id = man.employee_id)

-- Ex8
-------

select 	e.last_name as empl_cognom, man.last_name as man_cognom,
		e.hire_date as empl_data, man.hire_date as man_data
from employees e 
left join employees man on(e.manager_id = man.employee_id)
where e.hire_date < man.hire_date
















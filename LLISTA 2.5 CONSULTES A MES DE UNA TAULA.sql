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




















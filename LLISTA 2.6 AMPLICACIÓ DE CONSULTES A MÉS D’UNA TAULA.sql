
-- Ex1
-------

select e.employee_id, e.last_name, d.department_name 
from employees e
join departments d on (d.department_id = e.department_id)

-- Ex2
-------

select e.employee_id, e.last_name, d.department_name 
from employees e
left join departments d on (d.department_id = e.department_id)

-- Ex3
-------

select e.employee_id, e.last_name, d.department_name 
from employees e
join departments d on (d.department_id = e.department_id)
where d.department_name in ('Marketing', 'Sales');

-- Ex4
-------

select e.employee_id, e.last_name, d.department_name, l.city 
from employees e
join departments d on (d.department_id = e.department_id)
join locations l on (l.location_id = d.location_id)
order by d.department_name asc, e.last_name desc

-- Ex5
-------

select e.employee_id, e.last_name, d.department_name, l.city 
from employees e
join departments d on (d.department_id = e.department_id)
join locations l on (l.location_id = d.location_id)
where l.city in ('Southlake','Seattle');

-- Ex6
-------

select count(*) as result 
from employees e
join departments d on (d.department_id = e.department_id)
join locations l on (l.location_id = d.location_id)
where l.city in ('Southlake','Seattle');

-- Ex7
-------

select e.employee_id, e.first_name, e.last_name, e.salary 
from employees e
join departments d on (d.department_id = e.department_id)
join locations l on (l.location_id = d.location_id)
where l.city in ('Toronto','Seattle','Oxford') and e.salary<10000
order by e.salary desc;

-- Ex8
-------

select e.employee_id, e.first_name, e.last_name 
from employees e
join departments d on (d.department_id = e.department_id)
join locations l on (l.location_id = d.location_id)
where l.city not in ('Toronto','Seattle','Oxford')
order by e.employee_id desc;

-- Ex9
-------

select e.employee_id, e.first_name, e.last_name 
from employees e
join departments d on (d.department_id = e.department_id)
join locations l on (l.location_id = d.location_id)
join countries c on (c.country_id = l.country_id)
where c.country_name = 'Canada';

-- Ex10
-------

#Ex1

create or replace view viewEmpleatsDept90 as
select *
from employees
where department_id = 90

select employee_id, last_name, salary
from viewEmpleatsDept90

#Ex2









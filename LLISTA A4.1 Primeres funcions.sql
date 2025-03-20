
delimiter //

create or replace function calcularAnys(p_data date)
returns decimal(5,2)
begin 
	declare v_anys decimal(5,2);

	select datediff(now(),p_data)/365.25 into v_anys
	from dual;

	#set v_anys = datediff(now(),p_data)/365.25;
	
	return v_anys;
end;

//

delimiter ;

select calcularAnys('2006-05-12') as edat
from dual;

select employee_id, last_name, 
	   calcularAnys(hire_date) anys_treballats
from employees
where calcularAnys(hire_date)>20

delimiter //

create or replace function maxEmployeeId()
returns int
begin 
	declare v_maxId int;

	select max(employee_id) into v_maxId
 	from employees;
	
 	return v_maxId; 
end;


//

select maxEmployeeId() as max_id
from dual;

delimiter ;

delimiter //

create or replace function regioIdEmpleat(p_idEmpleat int)
returns int
begin 
	declare v_idRegio int;

	select r.region_id into v_idRegio
	from employees e 
	join departments d on(e.department_id = d.department_id)
	join locations l on (l.location_id = d.location_id)
	join countries c on (c.country_id = l.country_id)
	join regions r on (r.region_id = c.region_id)
	where e.employee_id = p_idEmpleat;
	
 	return v_idRegio; 
end;

//

delimiter ;

select regioIdEmpleat(176) as region_id
from dual;


select pi()
from dual

delimiter //

create or replace function foo()
returns int
begin 
	const c_pi decimal(10,9) default 3.1416;

	return 1;
end;

//

delimiter ;

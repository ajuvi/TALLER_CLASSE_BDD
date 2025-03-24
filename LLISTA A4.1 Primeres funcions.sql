
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

delimiter //

create or replace function volumEsfera(p_radi decimal(11,2))
returns decimal(11,2)
begin 
	declare v_volum decimal(11,2);

	#set v_volum = (4/3)*pi()*power(p_radi,3);
	set v_volum = (4/3)*pi()*p_radi*p_radi*p_radi;
	return v_volum;
end;

delimiter ;

select volumEsfera(5)
from dual;

delimiter //

create or replace function existeixEmpleat(p_empId int)
returns bool
begin 
	declare v_result bool;	

	set v_result = exists(select * from employees
						  where employee_id=p_empId);
	return v_result;
end;

//


delimiter ;

select existeixEmpleat(100)
from dual;

select existeixEmpleat(10)
from dual;

delimiter //

create or replace function existeixEmpleat2(p_empId int)
returns bool
begin 
	declare v_count int;	

	select count(*) into v_count
	from employees
	where employee_id=p_empId;

	return v_count=1;
end;

//


select existeixEmpleat2(100)
from dual;

select existeixEmpleat2(10)
from dual;

create or replace function existeixEmpleat3(p_empId int)
returns bool
begin 
	declare v_id int;	

	select employee_id into v_id
	from employees
	where employee_id=p_empId;

	return v_id is not null;
end;

//

select existeixEmpleat3(100)
from dual;

select existeixEmpleat3(10)
from dual;

delimiter //

create or replace function salaryTotal(p_empId int)
returns decimal(11,2)
begin 
	declare v_total decimal(11,2) default -1;
	
	if existeixEmpleat(p_empId) then
		select salary*(1+coalesce(commission_pct,0))m into v_total
		from employees
		where employee_id = p_empId;	
	end if;

	return v_total;

end;

//

delimiter ;

select last_name, salaryTotal(employee_id) as salariTotal
from employees;


delimiter //

create or replace function avgSalariDept(p_deptId int)
returns decimal(11,2)
begin 
	declare v_mitjanaSalari decimal(11,2);

	select avg(salary) into v_mitjanaSalari
	from employees
	where department_id=p_deptId;

	return v_mitjanaSalari;
end;

delimiter ;

select department_name, avgSalariDept(department_id) as mitjana_salari
from departments;


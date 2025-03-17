delimiter //

create or replace function holaMon() returns varchar(20)
begin
   return 'Hola món';
end

//
delimiter ;

select holaMon() as result
from dual;

select last_name, holaMon() as result
from employees;

delimiter //

create or replace function saluda(p_nom varchar(20)) returns varchar(50)
begin
   return concat('Hola ',p_nom);
end;

//

delimiter ;

select saluda(last_name)
from employees;

delimiter //


create or replace function foo() returns boolean
begin


   declare c_pi decimal(11,2) default 3.1416;
   declare v_text varchar(20);
   declare v_dataNaix date;
   declare v_nom varchar(20) default 'Hola';
   declare v_trobat boolean default true;


   set v_text = 'abcd';
   set v_dataNaix = now();
 
  return v_text='abcd';
end; 


//

delimiter ;

delimiter //

create or replace function suma(p_n1 int, p_n2 int) returns int
begin
	declare v_suma int;

         set v_suma = p_n1 + p_n2;
         
         return v_suma;
end; 

//


delimiter ;

delimiter //


create or replace function totalSouEmpleats() returns decimal(11,2)
begin
	declare v_total decimal(11,2);


	select sum(salary) into v_total
	from employees;


	return v_total;
	
end; 

//

delimiter ;



delimiter //


create or replace function numEmpleatsDept(p_department_id int) returns int
begin
	declare v_total int;


	select count(*) into v_total
	from employees
	where department_id = p_department_id;


	return v_total;
	
end; 

//

delimiter ;

delimiter //


create or replace function nomDepartament(p_department_id int) returns varchar(50)
begin


	declare v_nom varchar(50);


	select department_name into v_nom
	from departments
	where department_id = p_department_id;

	return v_nom;
	
end; 

//

delimiter ;

select nomDepartament(50) as nom
from dual;

select coalesce(nomDepartament(-20),'undefined') as nom
from dual;

delimiter //


create or replace function nomDepartament(p_department_id int) returns varchar(50)
begin
	declare v_nom varchar(50);

	select department_name into v_nom
	from departments
	where department_id = p_department_id;

	if v_nom is null then
		set v_nom = 'undefined';
	end if;

	return v_nom;
	
end; 

//

delimiter ;

delimiter //


create or replace function asterisk(p_num int) returns varchar(100)
begin
	declare v_asterics varchar(100) default '';
	declare v_i int default 0;


	while v_i < p_num
	do
		set v_asterics = concat(v_asterics,'*');		
		set v_i = v_i + 1;
	end while;
	
	return v_asterics;
	
end; 

//



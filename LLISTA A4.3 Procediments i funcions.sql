create table MESSAGES(num int);

create or replace procedure generarMessages(p_n int)
begin 
	
	declare v_num int;
	
	#eliminar totes les dades de la taula Messages
	delete from messages;
	
	#inserir p_n valors aleatoris a la taula Messages
	for v_i in 1 .. p_n do
		set v_num = truncate(rand()*100,0); 
		insert into messages values(v_num);
	end for;
	
	#confirmar els canvis
	commit;	
end;


call generarMessages(10);
select * from messages;


create or replace function estadistiquesEmpleats()
returns varchar(255)
begin 
	declare v_result varchar(255);
	declare v_totalEmpleats int;
	declare v_totalEmpleatsCommissio int;
	declare v_empleats2000 int;
	declare v_anysTreballats int;
	declare v_totalEmpleats10anys int;

	select count(*), count(commission_pct)
	into   v_totalEmpleats, v_totalEmpleatsCommissio
	from employees;

	select count(*) into v_empleats2000
	from employees 
	where year(hire_date) = 2000;

	set v_result = concat_ws(';',v_totalEmpleats,v_totalEmpleatsCommissio,v_empleats2000);

	return v_result;
		
end;

select estadistiquesEmpleats()
from dual;

create or replace procedure actualitzarComissio()
begin
	
	declare v_affectedRows int;

	update employees e
	set e.commission_pct = datediff(curdate(),e.hire_date)/365.25/100*decode_oracle(e.job_id,
																			'AD_PRES',0.8,
																			'SA_MAN',0.5,
																			'IT_PROG',0.4,
																			'MK_MAN',0.2,
																			0.1);
	set v_affectedRows = ROW_COUNT();
	
	select concat('Rows updated ',v_affectedRows) as resultat;
	
	commit;	
end;

call actualitzarComissio();


select employee_id, commission_pct
from employees

begin not atomic
	declare v_txt varchar(255) default '';
	set v_txt = '<html border=\'1\'>\n';

	select v_txt;
end;





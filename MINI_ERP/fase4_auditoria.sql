drop table if exists audit_empl;

create or replace table audit_empl(
    id int primary key auto_increment,
    empl_id int,    
    empl_nom varchar(50),
    empl_email varchar(50),    
    empl_password varchar(20),    
    empl_ofici varchar(20),
    empl_manager int,
    empl_datalt date,
    empl_datanaix date not null,
    empl_salari decimal(11,2),
    empl_comissio decimal(11,2),
    empl_dept_id int,
    empl_actiu bool default true,
    empl_compte varchar(50),
	action varchar(20) not null,
	timestamp DATETIME default CURRENT_TIMESTAMP
);


create or replace trigger trig_audit_empl_insert
after insert on empl
for each row
begin
	
end;

create or replace trigger trig_audit_product_update
after update on empl
for each row
begin
	
end;

create or replace trigger trig_audit_product_delete
after delete on empl
for each row
begin
	
end;

#MAIN_1

#escriu una instrucció per tal que s'executi el trigger de insert
begin not atomic	
	#escriu aqui el teu codi

end;

#MAIN_2

#escriu una instrucció per tal que s'executi el trigger de update
begin not atomic	
	#escriu aqui el teu codi

end;

#MAIN_3

#escriu una instrucció per tal que s'executi el trigger de delete
begin not atomic	
	#escriu aqui el teu codi

end;

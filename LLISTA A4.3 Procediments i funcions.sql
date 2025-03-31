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

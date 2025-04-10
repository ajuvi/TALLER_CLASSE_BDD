
#eliminar la seqüència
drop sequence if exists seq_logs;

#crear seqüència pels logs
create sequence seq_logs
    increment by 1
    start with 1;

#eliminar la taula logs
drop table if exists logs;
   
#crear la taula logs
create table logs (
    id int primary key,
    tipus varchar(50) default '',
    missatge varchar(200),
    data DATETIME default now()
);

delimiter //

#package que conté els procediments de la gestió de logs
CREATE OR REPLACE PACKAGE pkg_logs
    #procediment per a afegir nous logs
    PROCEDURE log (p_missatge type of logs.missatge);
    PROCEDURE error (p_missatge type of logs.missatge); 
    PROCEDURE mostrar ();   
    PROCEDURE mostrar2 (p_num int);
END;

CREATE OR REPLACE PACKAGE BODY pkg_logs

    PROCEDURE log (p_missatge type of logs.missatge)
    BEGIN
        INSERT INTO logs (id, tipus, missatge, data)
        VALUES (NEXTVAL(seq_logs) ,'info', p_missatge, default);
    END;

    PROCEDURE error (p_missatge  type of logs.missatge)
    BEGIN
	INSERT INTO logs (id, tipus, missatge, data)
        VALUES (NEXTVAL(seq_logs) ,'error', p_missatge, default);
    END;

    PROCEDURE mostrar ()
    BEGIN
		SELECT * FROM logs;
    END;
   
    PROCEDURE mostrar2 (p_num int)
    BEGIN
		SELECT * FROM logs
		order by data desc, id desc
		limit p_num;
	END;

END;

//

delimiter //

delimiter ;


#MAIN_1
begin not atomic	
	call pkg_logs.log('afegir log 1');
	call pkg_logs.log('afegir log 2');
	call pkg_logs.log('afegir log 3');
	call pkg_logs.error('afegir error 1');
	call pkg_logs.mostrar();
end;

#MAIN_2
begin not atomic	
	#escriu aqui el teu codi


end;

#MAIN_3
begin not atomic	
	#escriu aqui el teu codi


end;

#MAIN_4
begin not atomic	
	#escriu aqui el teu codi


end;


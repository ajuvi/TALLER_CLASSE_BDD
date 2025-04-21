
#eliminar la taula nomina
drop table if exists nomina;

#crear la taula nomina
create table nomina (
	id int auto_increment,
    data_nomina date default now(),
    id_empleat int,
    mes int,
    año int,
    salari decimal(11,2),
    nom varchar(16),
    compte_corrent varchar(25),
    comissio decimal(11,2),
    salari_total decimal(11,2),
    CONSTRAINT Pk_nomina PRIMARY KEY (id),
    CONSTRAINT Fk_nomina_id FOREIGN KEY (id_empleat) REFERENCES empl(id)
);

delimiter //

#package que conté els procediments de la gestió de nomines

CREATE OR REPLACE PACKAGE pkg_nomines
    function existeixEmpleat(p_id type of empl.id) returns bool;

	function existeixNominaEmpleat(
		p_id type of empl.id,
		p_mes int,
		p_any int
	) returns bool;

	procedure crearNominaEmpleat(
		p_id type of empl.id,
		p_mes int,
		p_any int
	); 

	procedure crearNominesMes(
		p_mes int,
		p_any int
	);

	procedure eliminarNominesMes(
		p_mes int,
		p_any int
	);

END;

//


CREATE OR REPLACE PACKAGE BODY pkg_nomines

   	function existeixEmpleat(p_id type of empl.id) 
   	returns bool
   	begin
		return false;   
	end;

	function existeixNominaEmpleat(
		p_id type of empl.id,
		p_mes int,
		p_any int
	) returns bool
	begin
		return false;	
	end;

	procedure crearNominaEmpleat(
		p_id type of empl.id,
		p_mes int,
		p_any int
	)
	begin
		
	end;

	procedure crearNominesMes(
		p_mes int,
		p_any int
	)
	begin
		
	end;

	procedure eliminarNominesMes(
		p_mes int,
		p_any int
	)
	begin
	
	end;

END;

//

delimiter //

delimiter ;


#MAIN_1

#crear les nomines del mes actual
begin not atomic	
	#escriu aqui el teu codi

end;

#MAIN_2

#eliminar les nomines del mes actual
begin not atomic	
	#escriu aqui el teu codi

end;

#MAIN_3

#crear totes les nomines de tots els empleats de l'any 2025
begin not atomic	
	#escriu aqui el teu codi

end;

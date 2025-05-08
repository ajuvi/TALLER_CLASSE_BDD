#eliminar les taules

drop table if exists linia_comanda;
drop table if exists comanda;
drop table if exists producte;
drop table if exists client;

#crear les taules

create table producte(
	id int primary key auto_increment,
	nom varchar(200),
	preu_unitari decimal(11,2),
	estoc int,
	estoc_minim int default 0,
	datalt timestamp default now(),
	actiu bool default true,
	descripcio text
);

create table client(
	id int primary key auto_increment,
	dni varchar(10),
	nom varchar(100),
	cognoms varchar(200),
	dataNaix date,
	telefon varchar(20),
	compte_corrent varchar(50),
	empresa varchar(100),
	actiu bool default true
);

create table comanda(
	id int primary key auto_increment,
	data datetime default now(),
	pagada bool default false,
	enviada bool default false,
	rebuda bool default false,
	retornada bool default false,
	direccio text,
	client_id int,
	compte_corrent varchar(50),
	empl_id int,
	actiu bool default true,
	
	constraint fk_comanda_empl foreign key (empl_id) references empl(id),
	constraint fk_comanda_client foreign key (client_id) references client(id)	
);
	
create table linia_comanda(
	comanda_id int,
	num int,
	producte_id int,
	preu_unitari decimal(11,2),
	unitats int,
	
	constraint pk_linia_comanda primary key(comanda_id, num),
	constraint fk_linia_comanda_comanda foreign key (comanda_id) references comanda(id),
	constraint fk_liia_comanda_producte foreign key (producte_id) references producte(id)
);


#inserir productes

insert into producte (id, nom, preu_unitari, estoc, estoc_minim)
values
(1, 'Xiaomi Electric Scooter 4 Pro', 500, 10, 3),
(2, 'Segway Ninebot MAX G2 negre', 599, 8, 2),
(3, 'Decathlon Rockrider E-Expl 520 Blau', 1999.00, 4, 1),
(4, 'BH Atom 29 2024', 1499.00, 1, 3),
(5, 'Specialized Turbo Vado SL 4.0 Step-Through EQ', 3100.00, 2, 1);

#inserir clients

insert into client (id, dni, nom, cognoms, dataNaix, telefon, compte_corrent, empresa)
values
(1, '12345678A', 'Lamine', 'Yamal', '2007-07-13', '612345678', 'ESXXX', 'FC Barcelona'),
(2, '87654321B', 'Lionel', 'Messi', '1987-06-24', '698765432', 'ESYYY', 'Inter Miami CF'),
(3, '45678912C', 'Cristiano', 'Ronaldo', '1985-02-05', '667788990', 'ESZZZ', 'Al Nassr FC');

#inserir comandes

insert into comanda (id, direccio, client_id, compte_corrent, empl_id)
values (1, 'Avinguda de Montilivi, 125, 17003 Girona', 1, 'ESXXX', 7844);

insert into comanda (id, direccio, client_id, compte_corrent, empl_id, pagada, enviada)
values(2, 'Carrer Mare de Déu del Remei, 8, 17005 Girona', 2, 'ESYYY', 7844, true, true);

insert into comanda (id, direccio, client_id, compte_corrent, empl_id, pagada)
values (3, 'Carrer dels Calderers, Girona, 8', 3, 'ESZZZ', 7844, true);

#inserir linies de comanda

INSERT INTO linia_comanda (comanda_id, num, producte_id, preu_unitari, unitats)
VALUES
(1, 1, 1, 500.00, 1), 
(1, 2, 5, 3100.00, 2),
(1, 3, 2, 599.00, 1); 

INSERT INTO linia_comanda (comanda_id, num, producte_id, preu_unitari, unitats)
VALUES
(2, 1, 3, 1999.00, 1),
(2, 2, 5, 3100.00, 1);

INSERT INTO linia_comanda (comanda_id, num, producte_id, preu_unitari, unitats)
VALUES
(3, 1, 2, 599.00, 3); 


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

delimiter //

#package que conté els procediments de la gestió de vendes

create or replace package pkg_vendes 
	function calcularPreuTotalEstoc() returns decimal(11,2);
	function calcularPreuComanda( p_id type of comanda.id ) returns decimal(11,2);
	procedure llistarProductesFaltants();
	procedure llistarComandesPendents();
	procedure llistaComanda( p_id type of comanda.id );
end;

//

create or replace package body pkg_vendes 

	function calcularPreuTotalEstoc() returns decimal(11,2)
	begin
		return 1;
	end;

	function calcularPreuComanda( p_id type of comanda.id ) 
	returns decimal(11,2)
	begin
		return 1;
	end;
	
	procedure llistarProductesFaltants()
	begin

	end;
	
	procedure llistarComandesPendents()
	begin
	
	end;
	
	procedure llistaComanda( p_id type of comanda.id )
	begin
		
	end;

end;

//

delimiter ;

#MAIN_1

#mostra el preu total de l’estoc
begin not atomic	
	#escriu aqui el teu codi

end;

#MAIN_2

#calcula el preu total de la comanda número 1
begin not atomic	
	#escriu aqui el teu codi

end;

#MAIN_3

#mostra tots els productes faltants del magatzem
begin not atomic	
	#escriu aqui el teu codi

end;

#MAIN_4

#mostri totes les comandes pendents d’enviar
begin not atomic	
	#escriu aqui el teu codi

end;

#MAIN_5

#mostra la comanda número 2
begin not atomic	
	#escriu aqui el teu codi

end;


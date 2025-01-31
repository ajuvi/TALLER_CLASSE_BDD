CREATE DATABASE IF NOT EXISTS db_aiguamolls 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

use db_aiguamolls;

SET FOREIGN_KEY_CHECKS = 0;

#Eliminar taules
drop table Especie;
drop table Ornitoleg;
drop table Avistament;

#Creació de taules
create table Especie(
	codi int auto_increment primary key,
	nom_catala varchar(50) not null unique,
	nom_cientific varchar(200)
);

create table Ornitoleg(
	carnet int primary key,
	nom varchar(50),
	cognoms varchar(100),
	dataNaix date,
	responsable int,
	foreign key (responsable) references ornitoleg(carnet)	
);
   
create table Avistament(
	ornitoleg_carnet int,
	especie_codi int,
	data datetime,
	lloc varchar(150),
	circumstancies varchar(500),
	quantitat int,	
	foreign key (ornitoleg_carnet) references ornitoleg(carnet),
	foreign key (especie_codi) references especie(codi),
	primary key(ornitoleg_carnet,especie_codi,data)

);

#Inserció de dades


SET FOREIGN_KEY_CHECKS = 1;

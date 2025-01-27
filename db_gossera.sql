CREATE DATABASE IF NOT EXISTS db_gossera 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE db_gossera;

SET FOREIGN_KEY_CHECKS = 0;

#Eliminar taules
drop table Registre;
drop table Gos;
drop table Rasa;

#Creació de taules

create table Rasa(
	id int auto_increment primary key,
	nom varchar(50) not null unique
);

create table Gos(
	xip int primary key,
	nom varchar(50) not null unique,
	rasa_id int, 
	foreign key(rasa_id) references Rasa(id)
);

create table Registre(
	gos_xip int,
	dataEntrada datetime,
	dataSortida datetime,
	descripcio varchar(200),
	primary key(gos_xip,dataEntrada),
	foreign key(gos_xip) references gos(xip)
);

#Inserció de dades


SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS db_zoo 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE db_zoo;

SET FOREIGN_KEY_CHECKS = 0;

#Eliminar les taules
drop table Animal;
drop table Zoo;
drop table Especie;


#Creació de taules
create table Zoo(
	id int auto_increment primary key,
	nom varchar(200) not null,
	ciutat varchar(150),
	pais varchar(150),	
	grandaria decimal(6,2),
	pressupost decimal(11,2)
);	

create table Especie (
    id int auto_increment primary key,
    nom_vulgar VARCHAR(100) not null,
    nom_cientific VARCHAR(150),
    familia VARCHAR(100),
    perill boolean default false 
);

create table Animal (
    id int auto_increment primary key,
    nom varchar(100) not null,
    sexe char(1) not null,
    dataNaix date,
    pais varchar(100),
    continent varchar(100),
    zoo_id int,
    especie_id int,
    
    foreign key (zoo_id) references Zoo(id),    
    foreign key (especie_id) REFERENCES Especie(id),
    check (sexe in ('M', 'F')) 
);


#Inserció de dades


SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS db_aiguamolls 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 0;

#Eliminar taules
drop table Especie;


#Creació de taules
create table Especie(
	codi int auto_increment primary key,
	nom_catala varchar(50) not null unique,
	nom_cientific varchar(200)
);


#Inserció de dades


SET FOREIGN_KEY_CHECKS = 0;

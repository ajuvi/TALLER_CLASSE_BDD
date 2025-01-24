CREATE DATABASE IF NOT EXISTS db_zoo 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE db_zoo;

SET FOREIGN_KEY_CHECKS = 0;

#Eliminar les taules
drop table zoo;
drop table especie;

#Creació de taules
create table zoo(
	id INT auto_increment primary key,
	nom VARCHAR(200) not null,
	ciutat VARCHAR(150),
	grandaria DECIMAL(6,2),
	pressupost DECIMAL(6,2)
);
	
--Inserció de dades


SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS db_ingredients 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 0;

#Eliminar taules
drop table IngSubstitut;
drop table Ingredient;

#Creació de taules
create table Ingredient(
	id int auto_increment primary key,
	nom varchar(50) not null unique,
	descripcio varchar(200)
);

create table IngSubstitut(
	ing1 int,
	ing2 int,
	
	primary key(ing1, ing2),
	foreign key(ing1) references ingredient(id),
	foreign key(ing2) references ingredient(id),
	check(ing1!=ing2)
);

#Inserció de dades


SET FOREIGN_KEY_CHECKS = 0;

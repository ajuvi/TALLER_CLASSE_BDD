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
insert into zoo (id, nom, ciutat, pais, grandaria, pressupost) 
VALUES (1, 'Parc Zoològic de Barcelona', 'Barcelona', 'Espanya', 13, 9900000);

insert into zoo (id, nom, ciutat, pais, grandaria, pressupost) 
VALUES (2, 'Loro Parque', 'Puerto de la Cruz', 'Espanya', 13.5, 10000000);

insert into zoo (id, nom, ciutat, pais, grandaria, pressupost) 
VALUES (3, 'Zoo Aquarium de Madrid', 'Madrid', 'Espanya', 20, 15000000);

insert into especie VALUES (1, 'Mallerenga blava', 'Cyanistes caeruleus', 'Paridae', 0);
insert into especie VALUES (2, 'Orca', 'Orcinus orca', 'Delphinidae', 0);
insert into especie VALUES (3, 'Dofí mular', 'Tursiops truncatus', 'Delphinidae', 0);

insert into animal VALUES (1, 'Shira', 'F', '2015-07-02', 'Espanya','Europa', 1, 1);
insert into animal VALUES (2, 'Nelly', 'M', '2020-02-27', 'Espanya','Europa', 1, 1);
insert into animal VALUES (3, 'Lucky', 'F', '2017-04-25', 'Espanya','Europa', 1, 1);
insert into animal VALUES (4, 'Splash', 'M', '2017-04-11', 'Regne Unit','Europa', 2, 2);
insert into animal VALUES (5, 'Syrup', 'F', '2014-05-15', 'Islàndia','Europa', 2, 2);
insert into animal VALUES (6, 'Loki', 'M', '2014-06-20', 'Regne Unit','Europa', 2, 2);
insert into animal VALUES (7, 'Oreo', 'F', '2015-12-27', 'Espanya','Europa', 3, 3);
insert into animal VALUES (8, 'Ace', 'M', '2015-10-11', 'Espanya','Europa', 3, 3);

SET FOREIGN_KEY_CHECKS = 0;

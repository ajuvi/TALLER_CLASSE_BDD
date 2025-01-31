CREATE DATABASE IF NOT EXISTS db_restaurants 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE db_restaurants;

SET FOREIGN_KEY_CHECKS = 0;

#Eliminar les taules
drop table Local;
drop table Empleat;
drop table Reserva;
drop table Taula;
drop table TaulaReserva;

#Creació de taules

create table Empleat(
	dni varchar(10) primary key,
	nom varchar(50) not null,
	cognoms varchar(100),
	local_id int	
);

create table Local(
	id int auto_increment primary key,
	adreca varchar(100),
	horari varchar(100),
	aforament int,
	dniEncarregat varchar(10),
	foreign key(dniEncarregat) references Empleat(dni)
);

alter table Empleat add(
	foreign key(local_id) references Local(id)
);

create table Reserva(
	id int auto_increment primary key,
	data datetime not null,
	nom varchar(50),
	telefon varchar(20)	
);

create table Taula(
	local_id int,
	num int,
	capacitat int,
	foreign key (local_id) references local(id),
	primary key(local_id,num)
);

create table TaulaReserva(
	local_id int,
	num int,
	reserva_id int,
	primary key(local_id, num, reserva_id),
	foreign key(local_id,num) references taula(local_id,num),
	foreign key(reserva_id) references reserva(id)
);


#Inserció de dades







SET FOREIGN_KEY_CHECKS = 0;

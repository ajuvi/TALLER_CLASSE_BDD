CREATE DATABASE IF NOT EXISTS db_minitwitter 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE db_minitwitter;

SET FOREIGN_KEY_CHECKS = 0;

#Eliminar les taules
DROP TABLE Usuari;
DROP TABLE Missatge;
DROP TABLE Seguits;
DROP TABLE BLoquejats;
DROP TABLE Likes;

#Creació de taules
CREATE TABLE Usuari(
	id int auto_increment primary key,
	nom VARCHAR(50),
	cognom VARCHAR(100),   
	username VARCHAR(50) unique not null,    
	password VARCHAR(50) not null,    
	email VARCHAR(50) unique not null,
	telefon VARCHAR(20) unique,
	descripcio VARCHAR(200),
	dataNaix DATETIME,
	actiu BOOLEAN default true
);

CREATE TABLE Missatge(
	id int auto_increment primary key,
	titol VARCHAR(10),
	text VARCHAR(144),
	data DATETIME DEFAULT SYSDATE(),
	usuari_id int NOT NULL,
	CONSTRAINT fk_missatge_ref_usuari_id FOREIGN KEY(usuari_id) REFERENCES usuari(id)
);

CREATE TABLE Seguits(
	u1 int,
	u2 int,
	data DATETIME,
	CONSTRAINT pk_seguit PRIMARY KEY(u1, u2),
	CONSTRAINT fk_seguit_ref_u1 FOREIGN KEY(u1) REFERENCES usuari(id),
	CONSTRAINT fk_seguit_ref_u2 FOREIGN KEY(u2) REFERENCES usuari(id)  
);

CREATE TABLE Bloquejats(
	u1 int,
	u2 int,
	data DATETIME,
	CONSTRAINT pk_bloquejat PRIMARY KEY(u1, u2),
	CONSTRAINT fk_bloquejat_ref_u1 FOREIGN KEY(u1) REFERENCES usuari(id),
	CONSTRAINT fk_bloquejat_ref_u2 FOREIGN KEY(u2) REFERENCES usuari(id)  
);

CREATE TABLE likes (
	usuari_id int,
	missatge_id int,
	data DATETIME DEFAULT SYSDATE(),
	emoti VARCHAR(10),
	CONSTRAINT pk_like PRIMARY KEY(usuari_id, missatge_id),
	CONSTRAINT fk_like_ref_usuari_id FOREIGN KEY(usuari_id) REFERENCES usuari(id),
	CONSTRAINT fk_like_ref_missatge_id FOREIGN KEY(missatge_id) REFERENCES missatge(id)
);

#Inserció de dades
INSERT INTO usuari(id,nom,cognom,username,password,email,telefon,dataNaix,descripcio) VALUES (1,'Pere','Pi','perepi','12345','Pere.Pi@gmail.com','626889955','2006-02-18','Hola què tal?!?');  
INSERT INTO usuari(id,nom,cognom,username,password,email,telefon,dataNaix,descripcio) VALUES (2,'Mercè','Puig','merpuig','12345','merceditas@yahoo.com','626849955','1995-08-05','Estic al mini-twitter.');
INSERT INTO usuari(id,nom,cognom,username,password,email,telefon,dataNaix,descripcio) VALUES (3,'Joan','Montagut','jmontagut','12345','Joan.Montagut@gmail.com','626889555','1983-11-21','Estic al mini-twitter.');
INSERT INTO usuari(id,nom,cognom,username,password,email,telefon,dataNaix,descripcio) VALUES (4,'Esteve','Casadesús','ecasades','12345','esteveguay@gmail.com','626889035','1998-04-06','Estic al mini-twitter.');
INSERT INTO usuari(id,nom,cognom,username,password,email,telefon,dataNaix,descripcio) VALUES (5,'Lluís','Gutierrez','llguti','12345','lgutierrez@gmail.com','626877955','1996-06-25','Estic al mini-twitter.');
INSERT INTO usuari(id,nom,cognom,username,password,email,telefon,dataNaix,descripcio) VALUES (6,'Artur','Juvé','ajuve','54321','ajuve@gmail.com','636889958','2000-10-19','Estic al mini-twitter.');
INSERT INTO usuari(id,nom,cognom,username,password,email,telefon,dataNaix,descripcio) VALUES (7,'Roser','Ramírez','rrami','12345','roser62@telefonica.com','','1962-01-08','Quan fa sol tot és millor');
INSERT INTO usuari(id,nom,cognom,username,password,email,telefon,dataNaix,descripcio) VALUES (8,'Maria','Pérez','marper','12345','mariaperez@gmail.com','626123955','1953-12-29','Estic al mini-twitter.');
INSERT INTO usuari(id,nom,cognom,username,password,email,telefon,dataNaix,descripcio) VALUES (9,'Josep','Güell','jguai','12345','Josep.Guell@gmail.com','626898555','2003-11-13','Estic al mini-twitter.');
INSERT INTO usuari(id,nom,cognom,username,password,email,telefon,dataNaix,descripcio) VALUES (10,'Jordi','Garcia','jorgar','12345','Jordi.Garcia@hotmail.com','6296885589','1996-07-13',':)');
INSERT INTO usuari(id,nom,cognom,username,password,email,telefon,dataNaix,descripcio) VALUES (11,'Isabel','Nadal','isanadal','12345','Isabel.Nadal@gmail.com','626885552','2014-03-22','Estic al mini-twitter.');

INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (1,'missatge1','Lorem ipsum dolor sit amet 1','2022-01-01',5);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (2,'missatge2','Lorem ipsum dolor sit amet 2','2022-01-02',2);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (3,'missatge3','Lorem ipsum dolor sit amet 3','2022-01-03',9);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (4,'missatge4','Lorem ipsum dolor sit amet 4','2022-01-04',1);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (5,'missatge5','Lorem ipsum dolor sit amet 5','2022-01-05',7);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (6,'missatge6','Lorem ipsum dolor sit amet 6','2022-01-06',2);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (7,'missatge7','Lorem ipsum dolor sit amet 7','2022-01-12',4);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (8,'missatge8','Lorem ipsum dolor sit amet 8','2022-01-15',5);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (9,'missatge9','Lorem ipsum dolor sit amet 9','2022-01-16',11);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (10,'missatge10','Lorem ipsum dolor sit amet 10','2022-01-22',3);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (11,'missatge11','Lorem ipsum dolor sit amet 11','2022-01-25',2);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (12,'missatge12','Lorem ipsum dolor sit amet 12','2022-01-26',11);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (13,'missatge13','Lorem ipsum dolor sit amet 13','2022-02-02',2);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (14,'missatge14','Lorem ipsum dolor sit amet 14','2022-02-03',1);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (15,'missatge15','Lorem ipsum dolor sit amet 15','2022-02-04',10);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (16,'missatge16','Lorem ipsum dolor sit amet 16','2022-02-05',7);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (17,'missatge17','Lorem ipsum dolor sit amet 17','2022-02-06',8);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (18,'missatge18','Lorem ipsum dolor sit amet 18','2022-02-08',1);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (19,'missatge19','Lorem ipsum dolor sit amet 19','2022-02-08',8);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (20,'missatge20','Lorem ipsum dolor sit amet 20','2022-02-08',9);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (21,'missatge21','Lorem ipsum dolor sit amet 21','2022-02-10',3);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (22,'missatge22','Lorem ipsum dolor sit amet 22','2022-02-11',3);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (23,'missatge23','Lorem ipsum dolor sit amet 23','2022-02-12',3);
INSERT INTO missatge(id,titol,text,data,usuari_id) VALUES (24,'missatge24','Lorem ipsum dolor sit amet 24','2022-02-17',3);

INSERT INTO seguits(u1,u2) VALUES (1,3);
INSERT INTO seguits(u1,u2) VALUES (1,10);
INSERT INTO seguits(u1,u2) VALUES (2,3);
INSERT INTO seguits(u1,u2) VALUES (2,10);
INSERT INTO seguits(u1,u2) VALUES (4,10);
INSERT INTO seguits(u1,u2) VALUES (4,11);
INSERT INTO seguits(u1,u2) VALUES (4,9);
INSERT INTO seguits(u1,u2) VALUES (6,3);
INSERT INTO seguits(u1,u2) VALUES (6,7);
INSERT INTO seguits(u1,u2) VALUES (6,10);
INSERT INTO seguits(u1,u2) VALUES (9,4);
INSERT INTO seguits(u1,u2) VALUES (9,10);
INSERT INTO seguits(u1,u2) VALUES (10,2);
INSERT INTO seguits(u1,u2) VALUES (10,3);
INSERT INTO seguits(u1,u2) VALUES (10,4);
INSERT INTO seguits(u1,u2) VALUES (10,6);
INSERT INTO seguits(u1,u2) VALUES (10,7);
INSERT INTO seguits(u1,u2) VALUES (10,9);

INSERT INTO likes(usuari_id,missatge_id, data, emoti) VALUES (1,7,'2022-01-13','(Y)');
INSERT INTO likes(usuari_id,missatge_id, data, emoti) VALUES (1,18,'2022-02-10',':D');
INSERT INTO likes(usuari_id,missatge_id, data, emoti) VALUES (2,5,'2022-01-05',':(');
INSERT INTO likes(usuari_id,missatge_id, data, emoti) VALUES (2,11,'2022-01-25',':)');
INSERT INTO likes(usuari_id,missatge_id, data, emoti) VALUES (3,7,'2022-01-15',':D');
INSERT INTO likes(usuari_id,missatge_id, data, emoti) VALUES (3,20,'2022-02-10','(Y)');
INSERT INTO likes(usuari_id,missatge_id, data, emoti) VALUES (5,14,'2022-02-13',':)');
INSERT INTO likes(usuari_id,missatge_id, data, emoti) VALUES (6,16,'2022-02-25',':(');
INSERT INTO likes(usuari_id,missatge_id, data, emoti) VALUES (6,5,'2022-01-05','(Y)');
INSERT INTO likes(usuari_id,missatge_id, data, emoti) VALUES (6,9,'2022-01-17',':)');
INSERT INTO likes(usuari_id,missatge_id, data, emoti) VALUES (6,6,'2022-01-09',':D');
INSERT INTO likes(usuari_id,missatge_id, data, emoti) VALUES (8,1,'2022-01-05','(Y)');
INSERT INTO likes(usuari_id,missatge_id, data, emoti) VALUES (8,2,'2022-01-12',':D');
INSERT INTO likes(usuari_id,missatge_id, data, emoti) VALUES (9,15,'2022-02-07',':D');
INSERT INTO likes(usuari_id,missatge_id, data, emoti) VALUES (9,21,'2022-02-10',':(');
INSERT INTO likes(usuari_id,missatge_id, data, emoti) VALUES (10,8,'2022-01-17',':)');
INSERT INTO likes(usuari_id,missatge_id, data, emoti) VALUES (10,14,'2022-02-04',':)');
INSERT INTO likes(usuari_id,missatge_id, data, emoti) VALUES (10,19,'2022-02-09',':D');
INSERT INTO likes(usuari_id,missatge_id, data, emoti) VALUES (10,5,'2022-01-08','(Y)');
INSERT INTO likes(usuari_id,missatge_id, data, emoti) VALUES (10,7,'2022-02-03',':)');
INSERT INTO likes(usuari_id,missatge_id, data, emoti) VALUES (11,7,'2022-01-19',':)');
INSERT INTO likes(usuari_id,missatge_id, data, emoti) VALUES (11,5,'2022-01-20',':D');


COMMIT;
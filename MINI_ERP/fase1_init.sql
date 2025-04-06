#accedeix amb l''usuari root a MariaDB

#crea un usuari amb el teu nom
CREATE USER nom@localhost IDENTIFIED BY '12345';

#mostra els usuaris de la base de dades
SELECT CONCAT(user, '@', host) AS usuari FROM mysql.user;

#crea la base de dades del mini-erp
CREATE DATABASE IF NOT EXISTS db_minierp 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

#dona tots els privilegis a l''usuari nom a la base de dades db_minierp
GRANT ALL PRIVILEGES ON db_minierp.* TO 'nom'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

#crea una connexió des del DBeaver amb el nou usuari i la base de dades db_minierp

#accedeix amb el nou usuari a la base de dades db_minierp i carrega el fitxer de creació de la base de dades.
SOURCE database/db_minierp.sql

#MAIN_1

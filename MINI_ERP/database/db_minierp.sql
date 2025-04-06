SET FOREIGN_KEY_CHECKS = 0;

#eliminar les taules

drop table if exists empl;
drop table if exists dept;

#creació de taules

create table dept(
    id int primary key auto_increment,
    nom varchar(50) not null,
    loc varchar(50)
);

create table empl(
    id int primary key auto_increment,
    nom varchar(50) not null,
    email varchar(50) not null unique,    
    password varchar(20) default '12345',    
    ofici varchar(20),
    manager int,
    datalt date default now(),
    datanaix date not null,
    salari decimal(11,2),
    comissio decimal(11,2),
    dept_id int,
    actiu bool default true,
    compte varchar(50),
    
     constraint fk_empl_dept_id
        foreign key (dept_id)
        references dept(id),
    constraint fk_empl_manager
        foreign key (manager)
        references empl(id)
);

#inserció de dades

insert into dept values (10,'Comptabilitat','Sevilla');
insert into dept values (20,'Investigacio','Madrid');
insert into dept values (30,'Vendes','Barcelona');
insert into dept values (40,'Produccio','Bilbao');
insert into dept values (50,'Testing','Girona');

insert into empl (id, nom, email, password, ofici, manager, datalt, datanaix, salari, comissio, dept_id, actiu, compte) values
(7839, 'REY', 'rey@monti.local', default, 'PRESIDENT', null, '1981-11-17', '1960-12-01', 650000, null, 10, default, '2300 09 09987 12'),
(7566, 'JIMENEZ', 'jimenez@monti.local', default, 'DIRECTOR', 7839, '1981-04-02', '1965-11-11', 386750, null, 20, default, '2200 09 65445 21'),
(7902, 'FERNANDEZ', 'fernandez@monti.local', default, 'ANALISTA', 7566, '1998-12-03', '1977-11-17', 390000, null, 20, default, '2500 09 32435 44'),
(7369, 'SANCHEZ', 'sanchez@monti.local', default, 'EMPLEAT', 7902, '1980-12-17', '1950-01-20', 104000, null, 20, default, '2300 09 45643 05'),
(7698, 'NEGRO', 'negro@monti.local', default, 'DIRECTOR', 7839, '1981-05-01', '1955-11-23', 370500, null, 30, default, '2300 09 12345 32'),
(7782, 'CEREZO', 'cerezo@monti.local', default, 'DIRECTOR', 7839, '1981-06-09', '1967-02-02', 318500, null, 10, default, '2300 09 43566 11'),
(7499, 'ARROYO', 'arroyo@monti.local', default, 'VENEDOR', 7698, '1981-02-22', '1939-01-01', 208000, 3000, 30, default, '2100 09 12345 12'),
(7521, 'SALA', 'sala@monti.local', default, 'VENEDOR', 7698, '2020-02-22', '1977-03-20', 162500, 65000, 30, default, '1500 09 87678 22'),
(7654, 'MARTIN', 'martin@monti.local', default, 'VENEDOR', 7698, '2015-09-23', '1988-09-12', 182000, 10000, 30, default, '2500 09 54578 33'),
(7788, 'GIL', 'gil@monti.local', default, 'ANALISTA', 7566, '1999-03-30', '1975-10-17', 390000, null, 20, default, '2600 09 62164 65'),
(7844, 'TOVAR', 'tovar@monti.local', default, 'VENEDOR', 7698, '2009-09-08', '1978-11-18', 195000, 0, 30, default, '2800 09 12455 44'),
(7876, 'ALONSO', 'alonso@monti.local', default, 'EMPLEAT', 7788, '2005-05-03', '1981-09-09', 143000, null, 20, default, '2500 09 33345 54'),
(7900, 'JIMENO', 'jimeno@monti.local', default, 'EMPLEAT', 7698, '2004-12-03', '1979-07-20', 123500, null, 30, default, '2500 09 52545 67'),
(7934, 'MUNOZ', 'munoz@monti.local', default, 'EMPLEAT', 7782, '2016-01-23', '1988-12-11', 169000, null, 10, default, '2400 09 12345 54'),
(8100, 'ARNAU', 'arnau@monti.local', default, 'EMPLEAT', 7902, '2023-12-14', '1998-04-13', 24000, null, null, default, '2300 09 76768 32'),
(8200, 'ALBA', 'alba@monti.local', default, 'EMPLEAT', null, '2023-12-14', '1981-08-11', 1000000, null, null, default, '2800 09 78656 43');

SET FOREIGN_KEY_CHECKS = 1;

#confirmar els canvis
commit;

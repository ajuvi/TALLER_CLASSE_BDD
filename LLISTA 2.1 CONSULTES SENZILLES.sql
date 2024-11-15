-- Ex1
--------

-- Ex2
--------

SELECT last_name , job_id , salary es sal
FROM employees;	

-- canviar "es" per "as"
SELECT last_name , job_id , salary as sal
FROM employees;	

-- Ex3
--------

-- no hi ha cap error
SELECT *
FROM job_grades;

-- Ex4
--------

desc departments;
desc employees;

-- Ex5
--------

select last_name, job_id, hire_date as DATA_INICI, employee_id
from employees;

-- Ex6
--------

select distinct job_id
from employees;

-- Ex7
--------

SELECT CONCAT(last_name,', ',job_id) as Empleat_i_carrec
from employees;

SELECT CONCAT_WS(', ',last_name,job_id) as Empleat_i_carrec
from employees;

-- Ex8
--------

SELECT CONCAT_WS(',', employee_id, last_name, first_name, hire_date) as SORTIDA
FROM employees;

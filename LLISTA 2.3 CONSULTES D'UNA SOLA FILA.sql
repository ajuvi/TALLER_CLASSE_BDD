
-- Ex1
--------
SELECT CURDATE()
FROM DUAL;

--EX2
--------
SELECT last_name, first_name, salary, 
TRUNCATE(salary * 1.15, 0) AS ‘nou salari’ 
FROM employees;

--EX3
SELECT last_name, first_name, salary, 
TRUNCATE(salary * 1.15, 0) AS nou salari, 
TRUNCATE (salary * 1.15, 0)-salary AS increment
FROM employees;

--EX4
--------
SELECT employee_id, 
SUBSTR(last_name, 1, 1) AS inical
FROM employees;

--EX5
--------
SELECT employee_id, length(last_name) AS longitud
FROM employees;

--EX6
--------
SELECT last_name, 
CONCAT (LOWER(SUBSTR(last_name,1, 1)), UPPER(SUBSTR(last_name,2))) 
AS cognom 
FROM employees;

--EX7 
SELECT last_name, 
ROUND(DATEDIFF(CURDATE(), hire_date) / 365.25, 1) AS anys_treballats 
FROM employees;

--EX8
--------
SELECT last_name, 
ROUND(DATEDIFF(CURDATE(), hire_date) / 365.25, 1) AS anys_treballats 
FROM employees 
ORDER BY hire_date ASC;

--EX9
--------
SELECT CONCAT(last_name, 'guanya', ' ', salary, ' ', 'mensualmet però li agradaria guanyar', ' ', salary * 3) 
AS dream_salaries 
FROM employees;


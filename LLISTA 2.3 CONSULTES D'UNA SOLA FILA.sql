
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

--EX13
--------

SELECT employee_id, CONCAT(SUBSTR(last_name,1,1), REPEAT('*',LENGTH(last_name)-1)   )
FROM employees;

--EX14
--------

SELECT last_name, hire_date, WEEKDAY(hire_date) AS dia
FROM employees;

--EX15
--------

SELECT last_name, IFNULL(commission_pct,'No commission')
FROM employees;

SELECT last_name, NVL(commission_pct,'No commission')
FROM employees;

SELECT last_name, NVL2(commission_pct,commission_pct,'No commission')
FROM employees;

SELECT last_name, COALESCE(commission_pct, 'No commission')
FROM employees;


-- Exemple de COALESCE

SELECT COALESCE(NULL, 2*NULL, 1+NULL, 99, NULL, 80) AS result
FROM DUAL;

SELECT COALESCE('NULL', NULL, 99 ) AS result
FROM DUAL;

SELECT COALESCE(1,2,3,4,5 ) AS result
FROM DUAL;

--EX16
--------

SELECT employee_id, last_name, job_id, DECODE_ORACLE(job_id,'AD_PRES','A', 'ST_MAN', 'B', 'IT_PROG', 'C', 'SA_REP', 'D', 'ST_CLERK', 'I', 'O') AS ID
FROM employees;

SELECT  employee_id, 
        last_name, 
        job_id, 
        DECODE_ORACLE(job_id,
                      'AD_PRES','A', 
                      'ST_MAN', 'B', 
                      'IT_PROG', 'C', 
                      'SA_REP', 'D', 
                      'ST_CLERK', 'I', 
                      'O') AS qualificacio
FROM employees;

--EX17
--------

SELECT  employee_id, 
        last_name, 
        job_id, 
        CASE
            WHEN job_id='AD_PRES' THEN 'A'
            WHEN job_id='ST_MAN' THEN 'B'
            WHEN job_id='IT_PROG' THEN 'C'                        
            WHEN job_id='SA_REP' THEN 'D'
            WHEN job_id='ST_CLERK' THEN 'I'
            ELSE 'O'
        END AS qualificacio
FROM employees;         

-- Exemple de CASE WHEN similar al DECODE_ORACLE
SELECT  employee_id, 
        last_name, 
        job_id, 
        CASE job_id
            WHEN 'AD_PRES' THEN 'A'
            WHEN 'ST_MAN' THEN 'B'
            WHEN 'IT_PROG' THEN 'C'                        
            WHEN 'SA_REP' THEN 'D'
            WHEN 'ST_CLERK' THEN 'I'
            ELSE 'O'
        END AS qualificacio
FROM employees;  
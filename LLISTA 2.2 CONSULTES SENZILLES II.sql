-- Ex1
--------

SELECT last_name, salary
FROM employees
WHERE salary>12000;

-- Ex2
--------

SELECT last_name, department_id
FROM employees
WHERE employee_id=176;

-- Ex3
--------

SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;

-- Ex4
--------

SELECT last_name, job_id, hire_date
FROM employees
WHERE hire_date BETWEEN '1998-02-20' AND '1998-06-01'
ORDER BY hire_date ASC; 

SELECT last_name, job_id, hire_date
FROM employees
WHERE hire_date BETWEEN CAST('1998-02-20' AS DATE)  AND CAST('1998-06-01' AS DATE)
ORDER BY hire_date ASC;

-- Ex5
--------

SELECT last_name, department_id
FROM employees
WHERE department_id IN (20, 50)
ORDER BY last_name ASC;

-- Ex6
--------

SELECT last_name, salary
FROM employees
WHERE salary BETWEEN 5000 AND 12000 AND department_id IN(20,50);

-- Ex7
--------

SELECT last_name, salary
FROM employees
WHERE commission_pct=0.2;


-- Ex8
--------

SELECT last_name, hire_date, YEAR(hire_date)
FROM employees

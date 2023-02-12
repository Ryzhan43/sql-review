-- list employees firstname,lastname and their countries
SELECT first_name,last_name,country
FROM employees e JOIN regions r
ON e.region_id = r.region_id;

-- list firstname,email,division for employees who has email address
SELECT first_name, email, division
FROM employees e INNER JOIN departments d
ON e.department = d.department
WHERE email is not null;

-- list firstname,email,division,country for all employees
SELECT first_name,email,division,country
FROM employees e JOIN departments d
ON e.department = d.department
INNER JOIN regions r
ON e.region_id = r.region_id
WHERE email IS NOT NULL;

SELECT distinct  department
from employees;

SELECT DISTINCT e.department,d.department
FROM employees e LEFT JOIN departments d
on e.department = d.department
WHERE d.department IS NULL;

SELECT DISTINCT e.department,d.department
FROM employees e RIGHT JOIN departments d
on e.department = d.department;

SELECT DISTINCT e.department,d.department
FROM employees e FULL JOIN departments d
on e.department = d.department;

--Return all employees that work in electronic division
SELECT *
FROM employees e JOIN departments d
on e.department = d.department
WHERE division = 'Electronics';

-- can we get the same result with other way ?
SELECT *
FROM employees
WHERE department IN (Select department from departments where division = 'Electronics');

SELECT department
FROM employees
UNION
SELECT department
FROM departments;


SELECT department
FROM employees
UNION ALL
SELECT department
FROM departments;

SELECT department
FROM employees
EXCEPT
SELECT department
FROM departments;


SELECT department
FROM employees
INTERSECT
SELECT department
FROM departments;

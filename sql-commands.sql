select * from students;

SELECT employee_id FROM employees;

SELECT * FROM departments;

SELECT *
FROM employees
WHERE salary <=100000;

SELECT first_name,last_name,department,salary
FROM employees
WHERE salary > 90000 AND department = 'Clothing';

-- show me all employees who is making less than 40000 and working in either Clothing or Pharmacy department

SELECT *
FROM employees
WHERE salary < 40000 AND (department = 'Clothing' OR department = 'Pharmacy');

-- show me everything not belongs to Sports department
SELECT *
FROM employees
WHERE department != 'Sports';

SELECT *
FROM employees
WHERE NOT department <> 'Sports';

-- how to see only unique departments
SELECT DISTINCT department
from employees;


--create full name column and display
SELECT first_name || ' ' || employees.last_name AS full_name
FROM employees;

-- boolean values
SELECT salary, (salary>140000)
FROM employees;


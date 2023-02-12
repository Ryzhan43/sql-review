SELECT *
FROM employees;

SELECT *
FROM departments;

SELECT *
FROM regions;

SELECT employee_id,first_name,department
FROM employees;

SELECT *
FROM employees
WHERE department = 'Sports';

SELECT *
FROM employees
WHERE department LIKE '%nit%'

SELECT *
FROM employees
WHERE department LIKE 'G%';

-- show me departments which starts with G and has 4 char after that
SELECT *
FROM employees
WHERE department LIKE 'G____';

SELECT *
FROM employees
WHERE salary > 100000;

SELECT *
FROM employees
WHERE salary < 100000;

SELECT *
FROM employees
WHERE salary >= 100000;

SELECT *
FROM employees
WHERE salary <= 100000;

-- show me first_name,last_name,department,salary last the employees who is working in Clothing department and making more than 90000
SELECT first_name,last_name,department,salary
FROM employees
WHERE department = 'Clothing' AND salary >90000;

SELECT first_name,last_name,department,salary
FROM employees
WHERE department = 'Clothing' OR salary >90000;

-- show me all employees who is making less than 40000 and working in either Clothing or Pharmacy department
SELECT *
FROM employees
WHERE salary < 40000 AND (department = 'Clothing' OR department ='Pharmacy');

SELECT *
FROM employees
WHERE salary < 40000 AND department IN('Clothing','Pharmacy');

-- show me everything not belongs to Sports department
SELECT *
FROM employees
WHERE department != 'Sports';

SELECT *
FROM employees
WHERE department <> 'Sports';

SELECT *
FROM employees
WHERE NOT department <> 'Sports';

SELECT first_name,email
FROM employees
WHERE email IS NULL;

SELECT first_name,email
FROM employees
WHERE email IS NOT NULL;

SELECT *
FROM employees
WHERE salary BETWEEN 80000 AND 100000;

--Write a query that returns the first name and email of females that work in the Tools department
--having a salary greater than 110,000

SELECT first_name,email
FROM employees
WHERE gender = 'F' AND department ='Tools' AND salary >110000;

SELECT *
FROM employees
ORDER BY employee_id DESC;

-- ASC 0-9 and a-z
-- DESC 9-0 z-a

-- sort employees based on first_name starts from z
SELECT *
FROM employees
ORDER BY first_name DESC;

-- ASC is default, no need to type after column name

-- how to limit result display on the screen , LIMIT or FETCH
SELECT *
FROM employees
ORDER BY first_name
LIMIT 5;

SELECT *
FROM employees
ORDER BY first_name
FETCH FIRST 5 ROWS ONLY ;

-- how to see only unique departments
SELECT DISTINCT department
FROM employees;

SELECT salary AS annual_salary
FROM employees;

--Write a query that displays the name and ages of the top 4 oldest students.
SELECT student_name,age
FROM students
ORDER BY age DESC
LIMIT 4;

-- STRING Manipulation

SELECT UPPER(first_name),LOWER(last_name)
FROM employees;

SELECT LENGTH(first_name),first_name
FROM employees;

SELECT TRIM('    Hello There    ');
SELECT LENGTH('    Hello There    ');
SELECT LENGTH(TRIM('    Hello There    '));

-- create full name column and display
SELECT first_name||' '||employees.last_name as full_name
FROM employees;

-- boolean values
SELECT first_name,salary,(salary>140000) as GreaterThan140k
FROM employees
ORDER BY salary DESC;

-- SUBSTRING(string,start_position,length)
SELECT SUBSTRING('this is test data',1,4) as test_data;
SELECT SUBSTRING('this is test data'FROM 1 FOR 4) as test_data;

-- display one initials column which first_name.last_name (first letter)

SELECT first_name,last_name,SUBSTRING(first_name,1,1)||'.'||SUBSTRING(last_name FROM 1 FOR 1) as initials
FROM employees;


SELECT department,REPLACE(department,'Clothing','Clothes')
FROM departments;

-- String man. functions is not changing original table data, only displaying result

-- aggregate functions

SELECT MAX(salary)
FROM employees;

SELECT MIN(salary)
FROM employees;

SELECT AVG(salary)
FROM employees;

SELECT ROUND(AVG(salary),2)
FROM employees;

SELECT COUNT(*)
FROM employees;

SELECT COUNT(email)
FROM employees;

SELECT SUM(salary)
FROM employees;

SELECT SUM(salary)
FROM employees
WHERE department='Clothing';

-- who is making lowest salary ?
SELECT MIN(salary)
FROM employees;

-- 20542
SELECT *
FROM employees
WHERE salary = 20542;


SELECT *
FROM employees
WHERE salary = (SELECT MIN(salary)
                FROM employees);

SELECT *
FROM employees
WHERE salary = (SELECT MAX(salary)
                FROM employees);

SELECT email
from employees;

SELECT DISTINCT department
FROM employees;
--how many employees working in Pharmacy  department
SELECT COUNT(*)
FROM employees
WHERE department = 'Pharmacy';

--how many employees working in Clothing  department
SELECT MAX(salary)
FROM employees
WHERE department = 'Clothing';

--how many employees working for each department ?
SELECT COUNT(*),department,MAX(salary),MIN(salary),SUM(salary),ROUND(AVG(salary))
FROM employees
GROUP BY department;

-- list the departments where they have more than 40 employees
SELECT COUNT(*),department
FROM employees
WHERE department <> 'Garden'
GROUP BY department
HAVING COUNT(*) >40
ORDER BY department;
-- we use WHERE clause to implement filter BEFORE we implement GROUPS, so individual rows will be filtered
-- if we want to implement filter after we divided to groups, we need to use HAVING clause.

-- show me the duplicate email domains and how many times they repeat
select count(*),SUBSTRING(email,POSITION('@' IN email)+1) as email_domain
from employees
where email is not null
group by email_domain
having count(*) >1
order by count(*) desc;


-- how to find duplicate names ?(IQ)

SELECT first_name,salary,
       CASE
            WHEN salary < 80000 THEN 'UNDER PAID'
            WHEN salary >80000 THEN 'PAID WELL'
            ELSE 'UNPAID'
       END as category
FROM employees;

-- joins
-- subqueries
-- indexes
-- store procedures
-- functions
-- triggers

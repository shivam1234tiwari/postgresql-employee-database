-- BASIC SELECT QUERIES

-- 1. View all employee records
SELECT * FROM employees;

-- 2. View specific columns only
SELECT first_name, last_name, department, salary FROM employees;

-- 3. Count total number of employees
SELECT COUNT(*) AS total_employees FROM employees;


-- WHERE CONDITIONS

-- 4. Get employees from IT department
SELECT * FROM employees WHERE department = 'IT';

-- 5. Employees earning more than 70000
SELECT * FROM employees WHERE salary > 70000;

-- 6. Employees hired after 1 Jan 2021
SELECT * FROM employees WHERE hire_date > '2021-01-01';

-- 7. Employees from Pune city
SELECT * FROM employees WHERE city = 'Pune';

-- 8. Employees with salary between 50000 and 80000
SELECT * FROM employees 
WHERE salary BETWEEN 50000 AND 80000;

-- 9. Employees from IT or HR department
SELECT * FROM employees
WHERE department IN ('IT', 'HR');

-- 10. Employees whose first name starts with A
SELECT * FROM employees
WHERE first_name LIKE 'A%';

-- ORDER BY

-- 11. Sort employees by highest salary first
SELECT * FROM employees
ORDER BY salary DESC;

-- 12. Sort employees by oldest hire date first
SELECT * FROM employees
ORDER BY hire_date ASC;


-- AGGREGATE FUNCTIONS

-- 13. Find highest salary
SELECT MAX(salary) AS highest_salary FROM employees;

-- 14. Find lowest salary
SELECT MIN(salary) AS lowest_salary FROM employees;

-- 15. Find average salary
SELECT AVG(salary) AS average_salary FROM employees;

-- 16. Find total salary expense
SELECT SUM(salary) AS total_salary FROM employees;


-- GROUP BY

-- 17. Count employees in each department
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- 18. Average salary by department
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

-- 19. Departments having more than 5 employees
SELECT department, COUNT(*) AS total
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;

-- SUBQUERIES

-- 20. Employee with highest salary
SELECT * FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- 21. Employee with lowest salary
SELECT * FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

-- 22. Employees earning above average salary
SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- UPDATE QUERIES

-- 23. Increase salary by 10% for IT department
UPDATE employees
SET salary = salary * 1.10
WHERE department = 'IT';

-- 24. Change city from Pune to Mumbai
UPDATE employees
SET city = 'Mumbai'
WHERE city = 'Pune';

-- DELETE QUERY

-- 25. Delete employees with salary less than 30000
DELETE FROM employees
WHERE salary < 30000;

-- DATE FUNCTIONS

-- 26. Employees hired in 2022
SELECT * FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 2022;

-- 27. Calculate years of service
SELECT first_name, last_name,
       AGE(CURRENT_DATE, hire_date) AS years_of_service
FROM employees;

-- LIMIT & OFFSET

-- 28. Top 5 highest paid employees
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 5;

-- 29. Skip first 5 records and show next 5
SELECT * FROM employees
LIMIT 5 OFFSET 5;

-- CASE STATEMENT

-- 30. Categorize employees based on salary
SELECT first_name, salary,
CASE
    WHEN salary >= 90000 THEN 'High Salary'
    WHEN salary >= 60000 THEN 'Medium Salary'
    ELSE 'Low Salary'
END AS salary_category
FROM employees;

-- DISTINCT

-- 31. Show unique departments
SELECT DISTINCT department FROM employees;

-- 32. Show unique cities
SELECT DISTINCT city FROM employees;
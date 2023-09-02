-- ACTIVIDAD 3 SQL WORKSHOP
-- CREADO POR:  ALEJANDRO MIRANDA SANCHEZ
-- CODIGO:      230182001
-- FECHA:       01/09/2023

-- Find out how many departments exist in the company.                      (1)
SELECT COUNT(DEPARTMENT_ID) FROM DEPARTMENTS;

--Find out if there are any employees without a manager.                    (2)
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID
NOT IN (SELECT MANAGER_ID FROM DEPARTMENTS WHERE MANAGER_ID IS NOT NULL);

--Find out what are the departments that have at least one employee.        (3)
SELECT DEP.DEPARTMENT_NAME, COUNT(*) AS QUANTITY
FROM EMPLOYEES EMP_ID
INNER JOIN DEPARTMENTS DEP ON DEP.DEPARTMENT_ID=EMP_ID.DEPARTMENT_ID 
GROUP BY DEP.DEPARTMENT_NAME;

--Find out what is the annual salary for each employee.                     (4)
SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME AS "FULL NAME", 
SALARY*12 AS "ANNUAL SALARY" FROM EMPLOYEES;

--Find out for employees with a firt_name that contains an “r” character.   (5)
SELECT FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE '%r%';

--Find out what employees are in the department 10 and 100.                 (6)
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IN (10, 100);

--Make a projection of employee’s first_name and last_name and order it     (7)    
--ascending, taking into account the last_name as the first order key.      
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES ORDER BY LAST_NAME;

--Make a projection like the previous one, but adding the employee’s        (8)
--salary formatted using asterisks to complete the 10 character mask.       
SELECT FIRST_NAME, LAST_NAME, LPAD(SALARY,10,'*') AS SALARY 
FROM EMPLOYEES ORDER BY LAST_NAME;


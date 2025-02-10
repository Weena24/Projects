# JOIN

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

--- INNER JOIN - # return rows that are same in joint table

SELECT *
FROM employee_demographics
INNER JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id;
    
# Use of Aliasing
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
--- OUTER JOIN - # Left Join and Right Join

SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal      # takes everything from left which is employee demographics 
	ON dem.employee_id = sal.employee_id;
    
SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal      # takes everything from right which is employee salary. When there is no match, it appears as null 
	ON dem.employee_id = sal.employee_id;
    
--- SELF JOIN # Tie table to itself
SELECT *
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id = emp2.employee_id;

#Secret Santa - assign employee_id to the next employee_id
SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS id_emp,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id;
    
--- JOIN multiple tables together # Employee demo can tie to employee salary and employee salary can tie to parks_departments 
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd
ON sal.dept_id = pd.department_id;
    
SELECT *
FROM parks_departments;

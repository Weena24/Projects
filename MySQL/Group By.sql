-- Group By
SELECT *
FROM employee_demographics;

SELECT gender # know what to select as this select function has to match the group by function below
FROM employee_demographics
GROUP BY gender;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

SELECT occupation, salary # select statement has to match the group by statement
FROM employee_salary
GROUP BY occupation, salary;


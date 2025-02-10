-- Limit and Aliasing

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3;

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1; # start at position 2 and take the next 1 row

-- Aliasing # Change name of the column
SELECT gender, AVG(age) AS avg_age # AS is used to change the column name
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;
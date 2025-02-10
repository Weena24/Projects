-- Having vs Where

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender                # with GROUP BY, use HAVING
HAVING AVG(age);

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000;
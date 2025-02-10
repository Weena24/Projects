SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT first_name, 
last_name, 
birth_date,
age,
(age + 10) * 10 + 10
FROM parks_and_recreation.employee_demographics;
# PEMDAS - order of operations in MySQL (Parantheses, Exponents, Multiplication, Division, Addition and Substraction

SELECT DISTINCT first_name, gender
FROM parks_and_recreation.employee_demographics;

# WHERE Clause
SELECT * 
FROM employee_salary
WHERE salary <= 50000;

SELECT * 
FROM employee_demographics
WHERE gender != 'Female';

SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01';

# AND OR NOT - Logical Operators 
SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'Male';

SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'Male';

SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'Male';

SELECT * 
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55;

# Like Statement
-- % and _
SELECT * 
FROM employee_demographics
WHERE first_name LIKE '%er%'; # 'er%' starts with er, '%er' finshes with er, '%er%' has er in their first_name 

SELECT * 
FROM employee_demographics
WHERE first_name LIKE 'a__'; # 2 underscores means 2 characters after 'a'

SELECT * 
FROM employee_demographics
WHERE birth_date LIKE '1989%';




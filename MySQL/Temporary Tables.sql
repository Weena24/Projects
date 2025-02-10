-- Temporary Tables

# 1st Method

CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

SELECT *
FROM temp_table;

INSERT INTO temp_table
VALUES('Alex','Freberg','Lord of the Rings');

SELECT *
FROM temp_table;

# 2nd Method
SELECT *
FROM employee_salary;

CREATE TEMPORARY TABLE salary_over_50K
SELECT * 
FROM employee_salary
WHERE salary >= 50000;

SELECT * 
FROM salary_over_50K;


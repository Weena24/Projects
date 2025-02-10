-- Case Statements 

SELECT first_name, last_name, age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 and 50 THEN 'Old'
END AS Age_Bracket
FROM employee_demographics;

-- Pay Increase and Bonus
-- < 50000 = 5% raise
-- > 50000 = 7% raise
-- Finance = 10% bonus

SELECT first_name, last_name, salary,
CASE 
	WHEN salary < 50000 THEN salary + (salary * 0.05) #or *1.05 represents 5% increase
    WHEN salary > 50000 THEN salary * 1.07 #represents 7% increase
END AS New_Salary,
CASE
	WHEN dept_id = 6 THEN salary * 0.10
END AS Bonus
FROM employee_salary;

SELECT *
FROM employee_salary;
SELECT *
FROM parks_departments;
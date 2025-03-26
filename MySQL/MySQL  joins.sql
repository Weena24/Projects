show databases;
use world;
show tables;

select * from city;
use customer;
select * from customer_info;
select * from customer_info where salary is not null;
alter table customer_info add email varchar(25);
select * from customer_info;
alter table customer_info drop column email;

select * from student;
insert into student values(5,'Ramesh','Singh',27);
select * from department;

## Inner Join
select student.first_name,student.last_name,student.age,department.department_name from student inner join department 
on student.studentid = department.studentid;

## Left join
select student.first_name,student.last_name,student.age,department.department_name from student left join department 
on student.studentid = department.studentid;

## Right join
select student.first_name,student.last_name,student.age,department.department_name from student right join department 
on student.studentid = department.studentid;

## Full outer join
select student.first_name,student.last_name,student.age,department.department_name from student left join department 
on student.studentid = department.studentid

union

select student.first_name,student.last_name,student.age,department.department_name from student right join department 
on student.studentid = department.studentid;





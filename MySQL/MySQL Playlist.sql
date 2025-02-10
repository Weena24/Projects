
show databases;

create database customers;

use customers;

#create table in databases

create table customer_info(id integer, first_name varchar(10), last_name varchar(10));

show tables;

select * from customer_info;

insert into customer_info (id,first_name,last_name) values(1,'Weena','Ramen');
insert into customer_info (id,first_name,last_name) values(2,'Krish','Naik');

drop table customer_info;

show tables;

drop database customers;

show databases;

create database customer;

show databases;

use customer;

# create table
create table customer_info(
id integer auto_increment,
first_name varchar(25),
last_name varchar(25),
salary integer,
primary key(id)
);

select * from customer_info;

#insert records in table
insert into customer_info (first_name, last_name, salary)
values
('John', 'Daniel', 500000),
('Krish', 'Naik', 60000),
('Darius', 'Bengali', 70000),
('Chandan', 'Kumar', 40000),
('Ankit','Sharma', NULL);

select * from customer_info where salary is null;

#sql update statement to replace null values
update customer_info set salary=50000 where id=5;

select * from customer_info;

#sql delete statement
delete from customer_info where id=5;

#sql alter table
## add column in exsiting table
alter table customer_info add email varchar(25);

select * from customer_info;

alter table customer_info add dob date;

## alter table modify column
alter table customer_info modify dob year;

desc customer_info;

#alter table to drop column
alter table customer_info drop column email;

use customer;

#Constraints - Not null
create table student(
id int NOT NULL,
first_name varchar(25) NOT NULL,
last_name varchar(25) NOT NULL,
age int
);

desc student;

alter table student modify age int NOT NULL;

#constraint Unique

create table person(
id int NOT NULL,
first_name varchar(25) NOT NULL,
last_name varchar(25) NOT NULL,
age int NOT NULL,
unique(id)
);

insert into person values (1,'Krish2','Naik2',31);

select * from person;

alter table person
add unique (first_name);

alter table person
add constraint uc_person unique(age, first_name);

desc person;

alter table person
drop index uc_person;

#Primary Key 
create table person1(
id int NOT NULL,
first_name varchar(25) NOT NULL,
last_name varchar(25),
age int,
constraint pk_person primary key (id, last_name)
);

desc person1;

alter table person1
add primary key(id);

alter table person1
drop primary key;

use customer;

create table person(
id int Not Null,
first_name varchar(25) Not null, 
last_name varchar(25) Not Null,
age int
);

desc person;

drop table person;

alter table person
add primary key(id);

alter table person
add constraint pk_person primary key(id, age);

drop table person;

alter table person
drop primary key; 

#foreign key
create table person(
id int Not Null,
first_name varchar(25) Not null, 
last_name varchar(25) Not Null,
age int,
salary int,
primary key(id)
);

desc person;

drop table person1;

show tables;

create table department(
id int not null, 
department_id int not null,
department_name varchar(25) not null,
primary key(department_id)
#constraint fk_persondepartment foreign key(id) references person(id)
);

desc department;

alter table department
add foreign key(id) references person(id);

drop table department;
drop table person;

#check constraints
create table person(
id int Not Null,
first_name varchar(25) Not null, 
last_name varchar(25) Not Null,
age int,
salary int,
primary key(id),
check (salary<50000)
);

desc person;

insert into person values(1,'Krish','Naik',31,40000);

select * from person;

#default constraint
drop table person;

create table person(
id int Not Null,
first_name varchar(25) Not null, 
last_name varchar(25) Not Null,
city_name varchar(25) default 'Bangalore'
);

desc person;

alter table person
alter city_name drop default;

use customer;

show tables;

select * from person;

#create index
create index index_city_name
on person(city_name);

desc person;

show tables;

drop table student;

create table student(
id int not null,
first_name varchar(25),
last_name varchar(25),
age int
);

desc student;

create index index_age
on student(age);

create index index_age_first_name
on student(age, first_name);

alter table student
drop index index_age;

use customer;

drop table student;

create table student(
studentid int auto_increment,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int, 
primary key(studentid)
);

select * from student;
insert into student values(1,'Krish','Naik',31),
(2,'Ram','Sharma',31),
(3,'Sam','Joe',31);

create table department(
student_id int auto_increment,
department_name varchar(25) not null,
foreign key (student_id) references student(studentid)
);

drop table department;

create table department(
studentid int auto_increment,
department_name varchar(25) not null,
foreign key (studentid) references student(studentid)
);

desc department;

insert into department values (1, 'Computer science'), (2,'Electronics'), (3,'Mechanical');

select * from department;

select * from student;

create view student_info as
select first_name, last_name, age from student inner join department
using (student_id);

select * from student_info;

drop view student_info;

use customer;

select * from student;
insert into student values (5,'Ramesh','Singh',27);

select * from student;
insert into student values (4,'Ankit','Kumar',27);

select * from department;

#inner join
select student.first_name,student.last_name,student.age,department.department_name 
from student inner join department on student.studentid=department.studentid;

#left join
select student.first_name,student.last_name,student.age,department.department_name 
from student left join department on student.studentid=department.studentid;

#right join
select student.first_name,student.last_name,student.age,department.department_name 
from student right join department on student.studentid=department.studentid;

#full outer join
select student.first_name,student.last_name,student.age,department.department_name 
from student left join department on student.studentid=department.studentid

union
select student.first_name,student.last_name,student.age,department.department_name 
from student right join department on student.studentid=department.studentid;

#cross join
select student.first_name,student.last_name,student.age,department.department_name 
from student cross join department;

#natural join
select student.first_name,student.last_name,student.age,department.department_name 
from student natural join department;

use customer;

select * from student;

call get_student_info(27);

show databases;

create database company;

use company;

#create employee table
create table Employee(
empid int Not null primary key auto_increment,
first_name varchar(25),
last_name varchar(25),
salary int,
joining_date datetime,
department_name varchar(25)
);

desc Employee;

#create Bonus table
create table bonus(
emp_ref_id int,
bonus_amt int,
bonus_date datetime,
foreign key(emp_ref_id) references Employee(empid)
on Delete cascade
);

#create Employee Designation table
create table designation(
emp_ref_id int,
designation varchar(25),
designation_date Datetime,
foreign key(emp_ref_id) references Employee(empid)
on Delete Cascade
);

insert into Employee values
(0001,'Krish','Naik',50000,'14-12-11 09.00.00','Development'),
(0002,'Sudhanshu','Kumar',60000,'14-12-11 09.00.00','Development'),
(0003,'Sanket','Kumar',70000,'15-12-12 09.00.00','HR'),
(0004,'Darius','Bengali',70000,'15-12-13 09.00.00','HR'),
(0005,'Satish','Bhansal',30000,'17-10-21 09.00.00','Accounting'),
(0006,'Shaktiman','Hero',50000,'17-10-15 09.00.00','Accounting');

select * from employee;

insert into bonus values
(0001,5000,'16-03-14'),
(0002,5000,'16-03-13'),
(0003,5000,'17-03-15'),
(0001,5000,'18-03-17'),
(0004,3500,'16-03-19'),
(0005,7000,'16-03-20'),
(0001,8000,'16-03-21'),
(0002,8500,'20-03-21');

select * from bonus;

insert into designation values 
(0001,'Manager', '16-02-05 00:00:00'),
(0002,'Executive', '16-06-11 00:00:00'),
(0003,'Executive', '16-06-11 00:00:00');

select * from designation;
select * from bonus;
select * from employee;

#1. Write an sql query to retrieve all details where first name from employee tavle starts with 'k'

select * from employee where first_name like 'k%';

#2. Write sql query to print all details of the employees whose salary is between 10000 to 35000

select concat(first_name, ' ', last_name) as Employee_name, salary
from employee where empid in
(select empid from employee where salary between 10000 and 55000);

#3.Sql query to retrieve details of the employees who have joined on a specific date
select * from employee where year(joining_date)=2014 and month(joining_date)=12;

#4. Sql query to getch number of employees in every department
select count(*) from employee group by department_name;

select * from employee where department_name='Development';

#Intermediate
#5. Sql query to print details of the employee who are also Executives
select employee.first_name, designation.designation from employee
inner join designation
on employee.empid=designation.emp_ref_id
and designation.designation='Executive';

#6. Sql query to clone a new table from another table 
create table clone_employee like employee;
select * from clone_employee;
desc clone_employee;

#7.Sql query to show top and salary of employees
select * from employee order by salary desc limit 4;

#Increasing complexity
#8. Sql query to determine 4th highest salary 
select salary from employee order by salary desc limit 3,1;


#9. Assignment
#Sql query to determine the 6th highest salary without using limit 








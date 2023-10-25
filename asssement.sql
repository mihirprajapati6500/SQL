CREATE DATABASE ABC;

USE ABC;


CREATE TABLE WorkerS (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO WorkerS 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '21-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '21-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '21-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '21-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '21-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '21-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '21-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '21-04-11 09.00.00', 'Admin');
        
select * from workers;

-- write query all workers deatils form the workers table order by FIRST_NAME Ascending and department Descending--

select * from workers order by first_name asc, department desc;

-- write query print dtails for workers with the first_name "vipul and "satish" from the workers table.

select * from workers where first_name in('vipul','satish');

--  write query print deatils of the workers whose first_name ends with 'h' and contains six alphabets--

select * from workers where first_name like '______h';

--  write query to print deatils of the workers whose salary lies between 100000 to 500000--

select * from workers where salary between 100000 and 500000;

-- write query to fetch duplicate records having matching data in some fields of a table--

select salary,department from workers group by salary,department having count(worker_id)>1;
select  department from workers group by department having count(worker_id)>1;

-- write a query to show the top 6 records of a table--

select * from workers limit 6;

-- write query to fetch the departments that have less than five people in them--

select department,count(worker_id)from workers group by department having count(worker_id)<5;

-- write query fetch all department along with the number of perople in there--

select department,count(first_name) from workers group by department having count(first_name)>1;  

-- write query the name of worker having the highest salary in each department--

select first_name,department,salary from workers where(department,salary)in
(select department,max(salary)from workers group by department);

create database school;
use school;

create table student(
id int primary key,
name varchar(255),
sex varchar(250),
percentage int,
class int,
sec text,
stream text,
dob date);

select * from student;

insert into student (id,name,sex,percentage,class,sec,stream,dob)
values
(1001,'surekha joshi','female',82,12,'A','science','1998-08-03'),
(1002,'maahi agarwal','female',56,11,'C','Commerce','2008-11-23'),
(1003,'sanam verma','male',59,11,'C','commerce','2006-06-29'),
(1004,'ronit kumar','male',63,11,'C','commerce','1997-11-05'),
(1005,'dipesh pulkit','male',78,11,'B','science','2003-09-14'),
(1006,'jhanavi puri','female',60,11,'B','commerce','2008-11-07'),
(1007,'sanam kumar','female',23,12,'F','commerce','1998-03-08'),
(1008,'sahil saras','male',56,11,'C','commerce','2008-11-07'),
(1009,'Akshra agarwal','female',72,12,'B','commerce','1996-01-10'),
(1010,'stuti mishra','female',39,11,'F','science','2008-11-23'),
(1011,'harsh agrwal','male',42,11,'C','science','1998-08-03'),
(1012,'nikunj agarwal','male',49,12,'C','commerce','1998-06-28'),
(1013,'Akriti saxena','female',89,12,'A','science','2008-11-23'),
(1014,'Tani rastogi','female',82,12,'A','science','2008-11-23');

select * from student;

delete from student 
where id =1000;

select * from student;

-- write query all the records from student table--

select * from student;

-- write query disply any name and dat eof birth from the table student --

select name,dob from student;

-- write disply all student reocrd where percentage is grater of equal to 80 from student table-- 

SELECT * FROM STUDENT WHERE PERCENTAGE >=80;

-- Write disply student name,stream and pecentage where percentage of student is more than 80-- 

SELECT NAME,STREAM,PERCENTAGE FROM STUDENT WHERE PERCENTAGE >80;

-- Write display all records of science student whose percentage is more than  75 from student tabel--

select * from student where stream ='science' and percentage > 75; 








  






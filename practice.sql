CREATE DATABASE XYZ;

USE XYZ;



-- WRITE A QUERY TABLE RETURN COMPLETE INFROMATION ABOUT THE EMPLOYEES--

SELECT * FROM EMPLOYEE;

-- WRITE A QUERY TO FIND THE SALARIES OF ALL EMPLOYEES.RETURN SALARY--

SELECT EMP_NAME,SALARY FROM EMPLOYEE;

-- WRITE A QUERY TO FIND THE UNIQUE DESIGNATION OF THE EMPLOYEES. RETURN JOB NAME--

SELECT distinct(JOB_NAME) FROM EMPLOYEE;

-- WRITE A QUERY TO LIST THE EMPLOYEE NAME,INCRESED THEIR SALARY BY 15% AND EAXPRESEED AS NUMBER OF DOLLERS--

SELECT EMP_NAME,concat('$',ROUND(SALARY*1.15,2)) AS INCRESED_SALARY FROM EMPLOYEE;

-- WRITE A QUERY TO LIST THE EMPLOYEES NAME AND JOB NAME AS A FORMAT OF "EMPLOYEE & JOB"--

ALTER TABLE EMPLOYEE RENAME COLUMN EMP_NAME TO EMP;
ALTER TABLE EMPLOYEE RENAME COLUMN JOB_NAME TO JOB;

ALTER TABLE EMPLOYEE RENAME COLUMN EMP TO EMP_NAME;
ALTER TABLE EMPLOYEE RENAME COLUMN JOB TO JOB_NAME;
SELECT * FROM EMPLOYEE;

select EMP_NAME ||' '|| JOB_NAME AS EMPLOYEEJOB FROM EMPLOYEE;

-- WRITE A QUERY TO PRODUCE THE OUTPUT OF EMPLOYEES AS FOLLOW--EMPLOYEE JONAS(MANAGER)-- 

SELECT CONCAT(EMP_NAME,'  ',(JOB_NAME)) FROM EMPLOYEE;

-- WRITE A QUERY TO FIND THE THOSE EMPLOYEE WITH HIRE DATE IN THE FORMAT LIKE FEBRUARY 22,1991. RETURN EMPLOYEE ID ,EMPLOYEE NAME ,SALARY--

SELECT EMP_ID,EMP_NAME,SALARY,date_format(HIRE_DATE,'%M %Y %D')  FROM EMPLOYEE;

select emp_name,salary, date_format(HIRE_date,'%M %Y %D')as formatdate from employee;

SELECT * FROM EMPLOYEE;

-- WRITE A QUERY TO COUNT THE NUMBER OF CHARCHTER EXPCEPT THE SPACES FOR EACH EMPLOYEE NAME,RETURN EMPLOYEE NAME LENGHT--

SELECT LENGTH(TRIM(EMP_NAME)) FROM EMPLOYEE; 

-- WRITE A QUERY FIND THE EMPLOYEE ID ,SALARY AND COMMISSION OF ALL THE EMPLOYEES--

SELECT EMP_ID,SALARY,COMMISSION  FROM EMPLOYEE;

-- write a query find the unique department with jobs return department id,job name--


select distinct ep_id,job_name from employee;

-- write a query to find those employees who do not belong to the department 2001. return complte information about the employees--

select * from employee where ep_id not in(2001);

-- write a query to those employees who do not belong to the department 3001, return complte infomation about the employees--

select * from employee where ep_id not in(3001);

--  write a quey to find those employee who joine before 1991. return complte infromation about the employees--
select * from orders;

select *from salesman;
select *from customers;

--  write a query to find the salesperson and customers who reside in the same city.return salesman,customername and city--

select salesman.name,
customers.cust_name,customers.city
from salesman,customers
where salesman.city=customers.city;

--  write a query to find those ordrs where the order amount exits between 500 and 2000.return order no,purchase amt and customer name and city-- 
 
 
 select orders.order_no,purch_amt,
 customers.customer_id,cust_name,city
 from orders,customers
 where orders.customer_id=customers.customer_id
 and orders.purch_amt between 500 and 2000;
 
 --  write a query to find the salesperson and the customers he represts.return customer name,city,salesman,commsiion-- 
 
 select * from customers;
 
 select * from salesman;
 
 select * from customers
 inner join salesman
 on customers.salesman_id=salesman.salesman_id;
 
 select customers.cust_name,customers.city,
 salesman.commission,salesman.name
 from customers
 inner join salesman
 on customers.salesman_id=salesman.salesman_id;
 
 -- write a query find salepepole who recived commission of more than 12 pecent from the company.return customer name,city,salesman,commission--
 
 select customers.cust_name,customers.city,
 salesman.name,salesman.commission
 from customers
 inner join salesman
 on customers.salesman_id=salesman.salesman_id
 where commission > 0.12;

 -- write  a  query locate those salespeople who do not live in the same city where their customers live and have recived a commsion of more than 12 from the company.return customersname,customer city,salesman,salesman city,commission--
 
 select customers.cust_name,customers.city,
 salesman.name,salesman.city,salesman.commission
 from customers
 inner join salesman
 on customers.salesman_id=salesman.salesman_id
 where commission>0.12
 and customers.city<>salesman.city;
 
 -- write a query to find the detais of an order.return orderno,orderdate,purchase amt,customername,grade,salesman,commission--
 
 select orders.order_no,orders.order_date,orders.purch_amt,
 customers.cust_name,customers.grade,
 salesman.name,salesman.commission
 from orders
 inner join customers
 on orders.customer_id=customers.customer_id
 inner join salesman
 on customers.salesman_id=salesman.salesman_id;
 
 -- write a sql query to display the customer name,customer city,grade,salesman,salesman city.the result should bt sorted by ascening customersid--
 
 select customers.customer_id,customers.cust_name,customers.city,customers.grade,
 salesman.name,salesman.city
 from customers
 left join salesman
 on customers.salesman_id=salesman.salesman_id
 order by customers.customer_id;
 
 --  write a sql those customers with grade less than 300 return cust_name,customer city,grade,salesman,salesmancity.return shuold be order by  acending customer_id--
 
 select customers.cust_name,customers.city,customers.grade,
 salesman.name,salesman.city
 from customers
 left join salesman
 on customers.salesman_id=salesman.salesman_id
 where customers.grade<300
 order by customers.customer_id;	
 
 select customers.cust_name,customers.city,
 orders.order_no,orders.purch_amt,orders.order_date
 from customers
 left outer join orders
 on customers.customer_id=orders.customer_id
 order by orders;

-- write a query to calculate the average salary of employee who works in analysit.return average salary--

select avg(salary) from employee where job_name like "analyst";

-- write  a query to find the detils of the 'Blaze'--

select * from employee where emp_name like "BLAZE";

-- write query to identify employees whose commsion exceed their salries.return complete infotmation about the employes--

select * from employee where commission>salary;

-- write a query to identify those employee whose exceed s 3000 after receving a 25% salary increase. return complete information the employees--


select * from employee where  (1.25*salary)>3000;

-- write a query to find the names of the employees whose lenght is six.return employee name--

select emp_name from employee where emp_name like "______";

select emp_name from employee where length(emp_name)=6;

-- write query to find out of which employee joined in the month of january.return complete information about the employees--

select * from employee where extract(month from hire_date)=1;

-- write a query to seprate the names of employees and their managers gy string 'works for'--

--  write a query to find those employees whose designation is 'clerk' return the complete information about the employees--

select * from employee where job_name like 'clerk';
DESC EMPLOYEE;
--  write a query to identify employees with more than 27 years of experience return complete information about the employees--

select * from employee where extract(year from (current_date,hire_date))>27;  

SELECT *
FROM employee
WHERE DATEDIFF(CURDATE(), hire_date) > 27 * 365;

-- write a query to find those employee whose salaries are less than 3500--

select * from employee where salary < 3500;

-- write a query to find the employee whose designation is 'analysit'--

select emp_name,job_name,salary from employee where job_name = "analyst";

 --  write a query identify those employee who joined the company in 1991.return complete information about the employee--
 
 select * from employee where date_format(hire_date,'%y') =1991;
 select month(hire_date) from employee;
select year(hire_date) from employee;
 
 -- write a query find those employees who joined before 1st april 1991--
 
 select emp_id,emp_name,hire_date,salary from employee where hire_date like '1991-05-01';
 
 select emp_id,emp_name,hire_date,salary from employee where extract(year from hire_date)='1991';
 
 -- write a query identify the employees who do not report to a manager
 
 select emp_name,job_name from employee where manager_id is null;
 
 -- write q query to indentify the experience of the employees who work under the manager whose id number is 68319.return employee name ,salary,experience--
 

 
 SELECT emp_id,
       emp_name,
       salary,
       age(CURRENT_DATE, hire_date) "Experience"
FROM employee
WHERE manager_id=68319;

 -- write q query find out which employee earn more than 100 per day as salary.return id,name,salary and experience--
 
 
-- write a query to identify the employee whose salaries are odd--

select * from employee where mod(salary,2)=1;

-- write query find those employees who joined in the month of april--

select * from employee where extract(month from hire_date)=4;

-- write a query to find to which employee joined the company before the 19th of the month--]

select * from employee where extract(day from hire_date)=1990;

-- write a query to identify those employees who have been working as a salesman and month portion of the experince is more than 10
 
 select * from employee where job_name='salesman' and extract(month from hire_date)>10;
 
 -- write a query those employee department id 3001 or 1001 and joined before in the year 1991--
 
 select * from employee where date_format(hire_date,'%y')='1991'
 AND (EP_ID =3001 OR EP_ID =1001);
 DESC EMPLOYEE;
 
 ALTER TABLE EMPLOYEE
 MODIFY HIRE_DATE DATE;
 
-- WRITE a query to find out those employee who are working for the department id 1001 or 2001--
SELECT * FROM EMPLOYEE;
select * from employee where ep_id =1001 or ep_id =2001;

-- write a query those employee whose designation is 'clerk' and work in the department id 2001--

select * from employee where job_name ='clerk'
and ep_id =2001;

-- write a query the employee recieve some commisiion which should not be more than salary and annual salary inculding commisiion is below 34000.
-- designation is 'salesman' and working in the department '3001'.return emp name,id ,salary job name

select emp_id,emp_name,salary,job_name from employee
where 12*(salary+commission)<34000
and commission is not null
and commission <salary 
and job_name ='salesman' and ep_id =3001;

-- write q query to find those employee who are eiter clerk or manager --

SELECT *
FROM employee
WHERE job_name IN ('CLERK','MANAGER');

use xyz;

--  write a query those employees who joine in 90s return all employee detils--



SELECT * FROM EMPLOYEE;

-- write a query those managers who are in department 10001 or 2001--

select * from employee where job_name ='manager' and (ep_id =1001 or ep_id =2001);

  use xyz;
  
  -- write query to find the managers--
  
  select * from employee 
  where emp_id in(select manager_id from employee);
  
-- write a query compute the experice of all the managers.return emp id,name job name,joining date and expericen-- 

select emp_id,emp_name,job_name,hire_date,
date_format(curdate(),hire_date) 'experiecne'
from employee
where emp_id in
(select manager_id from employee);

select * from department;
select * from salary;
select * from employee;



SELECT *
FROM employee e,
     salary s
WHERE e.salary BETWEEN s.min_sal AND s.max_sal
  AND s.grade IN (2, 3);
  
  select * from 
  employee e 
  salary s
  where e.slary between s.min_sal and max_sal
  and s.grade in (4,5)
  and e.emp_id in 
  (select e.emp_id from employee e
  where e.job_name in('manager','analysit'));
  
  
use xyz;

-- write the followig table to find those employees who joine 90's .return complete informaation about the employees-- 

select * from employee;

select * from employee where extract(year from hire_date ) = 1990;

--  write a those emlployee who salary falls within the range of smallest salry and 2500--

select * from employee;

select * FROM EMPLOYEE
WHERE SALARY BETWEEN
(SELECT MIN(SALARY) FROM EMPLOYEE) AND 2500;

-- WRITE  A QUERY THOSE EMPLOYEES WHO WORK IN THE SAME DEPARTMENT AS 'CLARE' EXCLUDE ALL THOSE RECORDS AS FIRST NAME IS CLARE RETURN  FIRSTNAME,LAST NAME,SLALARY--

SELECT EMP_NAME from employee 
WHERE EMP_NAME = 'CLARE' NOT IN (SELECT EMP_NAME FROM EMPLOYEE);

use xyz;

  
  
  -- write a those employees who salary less than taht pof employee whos job title is mkman exclude employee job title mkman-- 
  
  select * from employees;
  
  select * from employees 
  where SALARY < ANY(SELECT SALARY FROM EMPLOYEES WHERE JOB_ID ='MK_MAN') AND JOB_ID <> 'MK_MAN';
  
  -- WRITE A WUERY TOTAL SALARY OF THE DEPARTMENT WHERE ATLEAST ONE EMPLOYEES WORK;
  
  SELECT * FROM EMPLOYEE;
  
  
use xyz;
  
  -- write a query to calculate total purchase amount of all orders.return total purchase amount--
  
  select * from orders;
  
  select sum(purch_amt) from orders;
  
  --  write a query to calaculate the average purchase amount of all orders.return avaerge purchase amt--
  
  select avg(purch_amt) from orders;
  
  --  write a query that counts the numbers of unqie salespeople.return number of salespeople--
  
  select count(distinct salesman_id) from orders;
  
  -- write a query to count the number of cutomeers.return number of customers--
  
  select * from customers;
  
  select count(*) from customers;
  
  -- write a query to find the maximum purchase amount-- 

select max(purch_amt) from orders;

-- write a query to find the minimum purchase amount--

select min(purch_amt) from orders;

-- write query to find the highest grade of the customers in each city.return city,maximum grade.

select * from customers;

select city,max(grade) as maximum_grade
from customers
group by city;

-- write a query to find the highest purchase amount orderd by each customers.return customers id,maximumm purchase amount--

select * from customers;

select * from orders;

select customer_id,max(purch_amt)
from orders
group by customer_id;

-- write a query find the highest purchase amount orders by each customers on a particular date.return,order date and highest purchase amount--

select customer_id,order_date,max(purch_amt)
from orders
group by customer_id,order_date;
   
-- write query to determine the highest purchase amount made by each salesperson on '2012-08-17'.return salesperson id,purchase amount--

select salesman_id,max(purch_amt)
from orders
where order_date ='17-08-2012'
group by salesman_id;

-- write a query to find the highest purchase amount by each customer on a particular order date.filter the result purchase amount above 2000. return customer id,order date,and maximum purchase amount--

select customer_id,order_date,max(purch_amt)
from orders
where purch_amt >2000
group by customer_id,order_date;

select customer_id ,order_date,max(purch_amt)
from orders
group by customer_id,order_date
having max(purch_amt)>2000;


-- write an query find the maximum purchase amount in the range 2000-6000(begin and end values are inculded) by combination of each customer and order date.return cusromer_id,order date,maximum purchase amount-

select customer_id,order_date,max(purch_amt)
from orders
where purch_amt between 2000 and 6000
group by customer_id,order_date;

select customer_id,order_date,max(purch_amt)
from orders 
group by customer_id,order_date
having max(purch_amt)between 2000 and 6000;    
   
 -- write a query to determine the maximum order each customers.the customer id should be in the range 3002 and 3007. return customer id and mximum purchase amount--
 
 select customer_id,max(purch_amt)
 from orders
 group by customer_id
 having customer_id between 3002 and 3007;
 
 -- write a query to maximum purchase amount genreated by each salesperson filter raw for the salesperson id is in the range 5003 and 5008.return salesperson id and maximum purchase amount--
 
 select salesman_id, max(purch_amt)
 from orders
 group by salesman_id
having salesman_id between 5003 and 5008;

-- write a query to count all the orders genrated on '2012-08-17' return number of orders--

select count(order_no)
from orders
where order_date ='17-08-2012';

-- wrrite query count of number of salespeople in city.retun number of salespeople--

select * from salesman;

select  count(name)
from salesman;

-- write a query count the number of orders based on the combination of each order date and salesperson.retun order date,salesperson id--

select *from orders;

select count(order_no),order_date,salesman_id
from orders
group by order_date,salesman_id;

 -- write a query to find the salesperson and customers who live in the same city.return customers name,salesperson and salesperson city.-- 
 
select customers.cust_name,
salesman.name,salesman.city
from salesman,customers 
where salesman.city=customers.city;



select customers.cust_name,
salesman.name
from customers,salesman
where customers.salesman_id=salesman.salesman_id;


-- write a query to find those salespeople who genret orders for their customers but not not located in the same city,return ordername ,customers name,customer id , salesman id9order_tabel)--

use xyz; 


-- write a query select all salespeople.return salesman_id,name,city, and comiisiion with the pecent sign-- 

select salesman_id,name,city,'%',commission*100
from salesman;

--  write a query find 	the number of orders booked for each day.return the result in a format like 'for 2001-10-10 ther are 15 orders--

select * from orders;

select 'for ',order_date,'there are', 
count(order_no),'orders.'
from orders
group by order_date;

--  write a query finf all the orders sort the result-set in acsending order by orrder numner return all fileds--

select * from orders
order by order_no;

-- write a query to find all the orders sort the result set in descenfing order by order_date .return all fields--

select * from orders
order by order_date desc;

   -- write a query  to locate the orders made by customers return order number and cusgtomer name--
   
   select * from orders;
   select * from customers;
   
   select orders.order_no,
   customers.cust_name
   from customers,orders
   where customers.customer_id=orders.customer_id;
   
   -- write a find the salesperson and customer who reside in the same city.return salesman,cust_name and city--
   
   use xyz;
   
-- write a finf the salesperson and the customers he represent return customer name,city and salesman,commission--

--  write a sql query to retrive the deatils of the customers whose names begin with the letter 'B' return customer id,customer name ,city,grade,salesmanid

select * from customers
where cust_name like 'b%';

-- write a sql to locate of deatils of cumtomers with grade values above 100.return customer id,name,city and salesman id

 select * from customers
 where grade>100;
 
 --  write a find to all the customers in 'new york' city who have a grade value above 100-- 
 
 select * from customers
 where grade>100 and city='new york';
 
 select * from customers
 where city='new york' or not grade>100;
 
 -- write a find those of all orders excluding those with ord_date eqaul to '2012-09-10' and salesman id higher than 5005 or purchase amount grater than 1000.
 
 select *
 from orders
 where not ((order_date='2012-09-10'
 and salesman_id >5005)
 or purch_amt>1000.00);
 
 --  write a sql query to find the deatils of those salespeople whose commission range from 0.10 to 0.12--
 
 select * from salesman;
 
 select * from salesman
 where commission between 0.10 and 0.12;
 
use mihir2;

select * from employee;
   
   
use college;

select * from employee;

--  write a query get the job id and realted employees id.patial output of the query--

select job_id, group_concat(employee_id,' ')'employee id'
from employee group by job_id;

-- write qery to update the portion of the phone number in the employee table within the phone number the substring '124' will be replaced by '999'--

update employee
set phone_number =replace(phone_number,'124','999')
where phone_number like '%124%';

select * from employee;

--  write a query to get the details for the employees where the length of the first name graeter than or eqal to 8--

select first_name from employee
where length(first_name)>=8;

--  write a query to get append @example.com to emial fiels--

select * from employee;

update employee
set email=concat(email,"@example.com");

select * from employee;

-- write a query to get the employee id,first name and hire month--

select first_name,employee_id from employee
where extract(month from hire_date);

select * from employee;
UPDATE employee
SET hire_date = STR_TO_DATE(hire_date, '%y-%m-%Y');
select * from employee;
select month(hire_date) from employee;
desc employee;
use xyz;
alter table employee
modify hire_date date;

select * from employee;

use xyz;
select * from employee;

select * from department; 


use xyz;

--  query to locate to deatils of customers with grade values above 100 return customer_id,cust_name,city and grade and salesman_id--

select * from customers 
where grade <100;

select * from customers; 

select * from customers
where city ='new york' and grade>100;

select * from customers
where city ='new york' or grade>100;

select * from customers
where not(city ='new york' or grade >100);

-- query to locate salespeople who live in the city of 'paris' return salespersons name city

select * from salesman
where city ='paris';

select * from customers
where grade > 200;

-- find deatils of all orders with a purchase amount less than 200 or exclude orders with an order date grater tahn or eqaul to '2012-0210' and customer id less than 3009.alter

select * from orders
where (purch_amt <200 or not(order_Date>='2012-02-10'
and customer_id<3009));

-- write a query to find to all orders that meet the following condition.exclude combination of order date eqal to '2012-08-17' or customer id grater than 3005 and purchase amount less than 1000--

select * from orders
where not (order_date='2012-08-07' or (customer_id >3005 and purch_amt <1000));

-- sql to find those salespeople who come from the paris city or rome city 

select * from salesman
where city ='paris' or city='rome';

-- to find the salespeople who come from either 'paris' or 'rome'

select * from salesman
where city in('paris' ,'rome');

select * from salesman
where city not in('paris','rome');

-- query to retrive the details of all customers whose id belongs to any of the values 3007,3008 or 3009-- 

select * from customers
where customer_id in(3007,3008 , 3009);

--  write a query to find salespeople who recived commission between 0.12 and 0.14.return salesman_id,name,city and commission--

select * from salesman
where commission between 0.12 and 0.14;

select * from orders
where (purch_amt between 500 and 4000)
and  not purch_amt  in(948.50,1983.43);

select * from salesman
where name between 'a' and 'l';

select * from customers
where cust_name like 'b%'; 
 
select * from customers
where cust_name like '%n';

select * from salesman
where name like 'n__i%';

-- write a query to select all the salespeople.return salesman id ,name ,city and commission with the percent sign

select salesman_id,name,city ,'%' ,commission *100 from salesman;

select 'for' ,order_date,'there are',
count(order_no),'orders'
from orders
group by order_date;

use xyz;

select order_no from orders
where order_date ='2012-08-17';

select * from employee;


use xyz;
	
create table order1 (
order_id int primary key,
customer_id int,
order_date datetime,
total_amount decimal(10,2));

insert into order1(order_id,customer_id,order_date,total_amount)
values
(1,101,'2023-01-15 08:30:00',150.00),
(2,102,'2023-02-20 14:45:00',220.50),
(3,103,'2023-03-05 10:15:00',75.25),
(4,101,'2023-03-10 16:00:00',100.75),
(5,104,'2023-04-12 09:30:00',300.75),
(6,102,'2023-05-20 11:20:00',180.60),
(7,105,'2023-11-04 13:45:00',90.40);
truncate table order1;
select * from order1;

-- 1 retrive all orders placed in the last week--


select * from order1
where order_date >= now()-  interval 1 week ;

--  calculate the total sales for each month the current year--

select month(order_date)as month,
sum(total_amount) from order1 where year(order_date)=year(now())
group by month( order_date);

select month(order_date)as month,year (order_date)
sum(total_amount) from order1 group by year(order_date),month(order_date);

--  list orders placed on weekends -- 

select * from order1
where dayofweek(order_date)in (1,7);

--  find the average time it takes for customers to place a repeat order-- 

select avg(timestampdiff(minute,o1.order_date,o2.order_date)) as avg_time_between from order1 o1
join order1 o2 on o1.customer_id=o2.customer_id
and o1.order_id <> o2.order_id
and o1.order_date < o2.order_date;

 






  
 
  
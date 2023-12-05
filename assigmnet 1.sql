CREATE DATABASE MIHIR2;

USE MIHIR2;



/* *************************************************************** 
***************************CREATING TABLES************************
**************************************************************** */
CREATE TABLE regions (
	region_id INT (11) UNSIGNED NOT NULL,
	region_name VARCHAR(25),
	PRIMARY KEY (region_id)
	);

CREATE TABLE countries (
	country_id CHAR(2) NOT NULL,
	country_name VARCHAR(40),
	region_id INT (11) UNSIGNED NOT NULL,
	PRIMARY KEY (country_id)
);


CREATE TABLE locations (
	location_id INT (11) UNSIGNED NOT NULL AUTO_INCREMENT,
	street_address VARCHAR(40),
	postal_code VARCHAR(12),
	city VARCHAR(30) NOT NULL,
	state_province VARCHAR(25),
	country_id CHAR(2) NOT NULL,
	PRIMARY KEY (location_id)
	);

CREATE TABLE departments (
	department_id INT (11) UNSIGNED NOT NULL,
	department_name VARCHAR(30) NOT NULL,
	manager_id INT (11) UNSIGNED,
	location_id INT (11) UNSIGNED,
	PRIMARY KEY (department_id)
	);

CREATE TABLE jobs (
	job_id VARCHAR(10) NOT NULL,
	job_title VARCHAR(35) NOT NULL,
	min_salary DECIMAL(8, 0) UNSIGNED,
	max_salary DECIMAL(8, 0) UNSIGNED,
	PRIMARY KEY (job_id)
	);

CREATE TABLE employees (
	employee_id INT (11) UNSIGNED NOT NULL,
	first_name VARCHAR(20),
	last_name VARCHAR(25) NOT NULL,
	email VARCHAR(25) NOT NULL,
	phone_number VARCHAR(20),
	hire_date DATE NOT NULL,
	job_id VARCHAR(10) NOT NULL,
	salary DECIMAL(8, 2) NOT NULL,
	commission_pct DECIMAL(2, 2),
	manager_id INT (11) UNSIGNED,
	department_id INT (11) UNSIGNED,
	PRIMARY KEY (employee_id)
	);

CREATE TABLE job_history (
	employee_id INT (11) UNSIGNED NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	job_id VARCHAR(10) NOT NULL,
	department_id INT (11) UNSIGNED NOT NULL
	);

ALTER TABLE job_history ADD UNIQUE INDEX (
	employee_id,
	start_date
	);


CREATE VIEW emp_details_view
AS
SELECT e.employee_id,
	e.job_id,
	e.manager_id,
	e.department_id,
	d.location_id,
	l.country_id,
	e.first_name,
	e.last_name,
	e.salary,
	e.commission_pct,
	d.department_name,
	j.job_title,
	l.city,
	l.state_province,
	c.country_name,
	r.region_name
FROM employees e,
	departments d,
	jobs j,
	locations l,
	countries c,
	regions r
WHERE e.department_id = d.department_id
	AND d.location_id = l.location_id
	AND l.country_id = c.country_id
	AND c.region_id = r.region_id
	AND j.job_id = e.job_id;

/* *************************************************************** 
***************************INSERTING DATA*************************
**************************************************************** */
INSERT INTO regions
VALUES (
	1,
	'Europe'
	);

INSERT INTO regions
VALUES (
	2,
	'Americas'
	);

INSERT INTO regions
VALUES (
	3,
	'Asia'
	);

INSERT INTO regions
VALUES (
	4,
	'Middle East and Africa'
	);

COMMIT;

INSERT INTO countries
VALUES (
	'IT',
	'Italy',
	1
	);

INSERT INTO countries
VALUES (
	'JP',
	'Japan',
	3
	);

INSERT INTO countries
VALUES (
	'US',
	'United States of America',
	2
	);

INSERT INTO countries
VALUES (
	'CA',
	'Canada',
	2
	);

INSERT INTO countries
VALUES (
	'CN',
	'China',
	3
	);

INSERT INTO countries
VALUES (
	'IN',
	'India',
	3
	);

INSERT INTO countries
VALUES (
	'AU',
	'Australia',
	3
	);

INSERT INTO countries
VALUES (
	'ZW',
	'Zimbabwe',
	4
	);

INSERT INTO countries
VALUES (
	'SG',
	'Singapore',
	3
	);

INSERT INTO countries
VALUES (
	'UK',
	'United Kingdom',
	1
	);

INSERT INTO countries
VALUES (
	'FR',
	'France',
	1
	);

INSERT INTO countries
VALUES (
	'DE',
	'Germany',
	1
	);

INSERT INTO countries
VALUES (
	'ZM',
	'Zambia',
	4
	);

INSERT INTO countries
VALUES (
	'EG',
	'Egypt',
	4
	);

INSERT INTO countries
VALUES (
	'BR',
	'Brazil',
	2
	);

INSERT INTO countries
VALUES (
	'CH',
	'Switzerland',
	1
	);

INSERT INTO countries
VALUES (
	'NL',
	'Netherlands',
	1
	);

INSERT INTO countries
VALUES (
	'MX',
	'Mexico',
	2
	);

INSERT INTO countries
VALUES (
	'KW',
	'Kuwait',
	4
	);

INSERT INTO countries
VALUES (
	'IL',
	'Israel',
	4
	);

INSERT INTO countries
VALUES (
	'DK',
	'Denmark',
	1
	);

INSERT INTO countries
VALUES (
	'HK',
	'HongKong',
	3
	);

INSERT INTO countries
VALUES (
	'NG',
	'Nigeria',
	4
	);

INSERT INTO countries
VALUES (
	'AR',
	'Argentina',
	2
	);

INSERT INTO countries
VALUES (
	'BE',
	'Belgium',
	1
	);

COMMIT;

INSERT INTO locations
VALUES (
	1000,
	'1297 Via Cola di Rie',
	'00989',
	'Roma',
	NULL,
	'IT'
	);

INSERT INTO locations
VALUES (
	1100,
	'93091 Calle della Testa',
	'10934',
	'Venice',
	NULL,
	'IT'
	);

INSERT INTO locations
VALUES (
	1200,
	'2017 Shinjuku-ku',
	'1689',
	'Tokyo',
	'Tokyo Prefecture',
	'JP'
	);

INSERT INTO locations
VALUES (
	1300,
	'9450 Kamiya-cho',
	'6823',
	'Hiroshima',
	NULL,
	'JP'
	);

INSERT INTO locations
VALUES (
	1400,
	'2014 Jabberwocky Rd',
	'26192',
	'Southlake',
	'Texas',
	'US'
	);

INSERT INTO locations
VALUES (
	1500,
	'2011 Interiors Blvd',
	'99236',
	'South San Francisco',
	'California',
	'US'
	);

INSERT INTO locations
VALUES (
	1600,
	'2007 Zagora St',
	'50090',
	'South Brunswick',
	'New Jersey',
	'US'
	);

INSERT INTO locations
VALUES (
	1700,
	'2004 Charade Rd',
	'98199',
	'Seattle',
	'Washington',
	'US'
	);

INSERT INTO locations
VALUES (
	1800,
	'147 Spadina Ave',
	'M5V 2L7',
	'Toronto',
	'Ontario',
	'CA'
	);

INSERT INTO locations
VALUES (
	1900,
	'6092 Boxwood St',
	'YSW 9T2',
	'Whitehorse',
	'Yukon',
	'CA'
	);

INSERT INTO locations
VALUES (
	2000,
	'40-5-12 Laogianggen',
	'190518',
	'Beijing',
	NULL,
	'CN'
	);

INSERT INTO locations
VALUES (
	2100,
	'1298 Vileparle (E)',
	'490231',
	'Bombay',
	'Maharashtra',
	'IN'
	);

INSERT INTO locations
VALUES (
	2200,
	'12-98 Victoria Street',
	'2901',
	'Sydney',
	'New South Wales',
	'AU'
	);

INSERT INTO locations
VALUES (
	2300,
	'198 Clementi North',
	'540198',
	'Singapore',
	NULL,
	'SG'
	);

INSERT INTO locations
VALUES (
	2400,
	'8204 Arthur St',
	NULL,
	'London',
	NULL,
	'UK'
	);

INSERT INTO locations
VALUES (
	2500,
	'Magdalen Centre, The Oxford Science Park',
	'OX9 9ZB',
	'Oxford',
	'Oxford',
	'UK'
	);

INSERT INTO locations
VALUES (
	2600,
	'9702 Chester Road',
	'09629850293',
	'Stretford',
	'Manchester',
	'UK'
	);

INSERT INTO locations
VALUES (
	2700,
	'Schwanthalerstr. 7031',
	'80925',
	'Munich',
	'Bavaria',
	'DE'
	);

INSERT INTO locations
VALUES (
	2800,
	'Rua Frei Caneca 1360 ',
	'01307-002',
	'Sao Paulo',
	'Sao Paulo',
	'BR'
	);

INSERT INTO locations
VALUES (
	2900,
	'20 Rue des Corps-Saints',
	'1730',
	'Geneva',
	'Geneve',
	'CH'
	);

INSERT INTO locations
VALUES (
	3000,
	'Murtenstrasse 921',
	'3095',
	'Bern',
	'BE',
	'CH'
	);

INSERT INTO locations
VALUES (
	3100,
	'Pieter Breughelstraat 837',
	'3029SK',
	'Utrecht',
	'Utrecht',
	'NL'
	);

INSERT INTO locations
VALUES (
	3200,
	'Mariano Escobedo 9991',
	'11932',
	'Mexico City',
	'Distrito Federal,',
	'MX'
	);

COMMIT;

SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO departments
VALUES (
	10,
	'Administration',
	200,
	1700
	);

INSERT INTO departments
VALUES (
	20,
	'Marketing',
	201,
	1800
	);

INSERT INTO departments
VALUES (
	30,
	'Purchasing',
	114,
	1700
	);

INSERT INTO departments
VALUES (
	40,
	'Human Resources',
	203,
	2400
	);

INSERT INTO departments
VALUES (
	50,
	'Shipping',
	121,
	1500
	);

INSERT INTO departments
VALUES (
	60,
	'IT',
	103,
	1400
	);

INSERT INTO departments
VALUES (
	70,
	'Public Relations',
	204,
	2700
	);

INSERT INTO departments
VALUES (
	80,
	'Sales',
	145,
	2500
	);

INSERT INTO departments
VALUES (
	90,
	'Executive',
	100,
	1700
	);

INSERT INTO departments
VALUES (
	100,
	'Finance',
	108,
	1700
	);

INSERT INTO departments
VALUES (
	110,
	'Accounting',
	205,
	1700
	);

INSERT INTO departments
VALUES (
	120,
	'Treasury',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	130,
	'Corporate Tax',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	140,
	'Control And Credit',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	150,
	'Shareholder Services',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	160,
	'Benefits',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	170,
	'Manufacturing',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	180,
	'Construction',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	190,
	'Contracting',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	200,
	'Operations',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	210,
	'IT Support',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	220,
	'NOC',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	230,
	'IT Helpdesk',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	240,
	'Government Sales',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	250,
	'Retail Sales',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	260,
	'Recruiting',
	NULL,
	1700
	);

INSERT INTO departments
VALUES (
	270,
	'Payroll',
	NULL,
	1700
	);

SET FOREIGN_KEY_CHECKS = 1;

COMMIT;

INSERT INTO jobs
VALUES (
	'AD_PRES',
	'President',
	20000,
	40000
	);

INSERT INTO jobs
VALUES (
	'AD_VP',
	'Administration Vice President',
	15000,
	30000
	);

INSERT INTO jobs
VALUES (
	'AD_ASST',
	'Administration Assistant',
	3000,
	6000
	);

INSERT INTO jobs
VALUES (
	'FI_MGR',
	'Finance Manager',
	8200,
	16000
	);

INSERT INTO jobs
VALUES (
	'FI_ACCOUNT',
	'Accountant',
	4200,
	9000
	);

INSERT INTO jobs
VALUES (
	'AC_MGR',
	'Accounting Manager',
	8200,
	16000
	);

INSERT INTO jobs
VALUES (
	'AC_ACCOUNT',
	'Public Accountant',
	4200,
	9000
	);

INSERT INTO jobs
VALUES (
	'SA_MAN',
	'Sales Manager',
	10000,
	20000
	);

INSERT INTO jobs
VALUES (
	'SA_REP',
	'Sales Representative',
	6000,
	12000
	);

INSERT INTO jobs
VALUES (
	'PU_MAN',
	'Purchasing Manager',
	8000,
	15000
	);

INSERT INTO jobs
VALUES (
	'PU_CLERK',
	'Purchasing Clerk',
	2500,
	5500
	);

INSERT INTO jobs
VALUES (
	'ST_MAN',
	'Stock Manager',
	5500,
	8500
	);

INSERT INTO jobs
VALUES (
	'ST_CLERK',
	'Stock Clerk',
	2000,
	5000
	);

INSERT INTO jobs
VALUES (
	'SH_CLERK',
	'Shipping Clerk',
	2500,
	5500
	);

INSERT INTO jobs
VALUES (
	'IT_PROG',
	'Programmer',
	4000,
	10000
	);

INSERT INTO jobs
VALUES (
	'MK_MAN',
	'Marketing Manager',
	9000,
	15000
	);

INSERT INTO jobs
VALUES (
	'MK_REP',
	'Marketing Representative',
	4000,
	9000
	);

INSERT INTO jobs
VALUES (
	'HR_REP',
	'Human Resources Representative',
	4000,
	9000
	);

INSERT INTO jobs
VALUES (
	'PR_REP',
	'Public Relations Representative',
	4500,
	10500
	);

COMMIT;

INSERT INTO employees
VALUES (
	100,
	'Steven',
	'King',
	'SKING',
	'515.123.4567',
	STR_TO_DATE('17-JUN-1987', '%d-%M-%Y'),
	'AD_PRES',
	24000,
	NULL,
	NULL,
	90
	);

INSERT INTO employees
VALUES (
	101,
	'Neena',
	'Kochhar',
	'NKOCHHAR',
	'515.123.4568',
	STR_TO_DATE('21-SEP-1989', '%d-%M-%Y'),
	'AD_VP',
	17000,
	NULL,
	100,
	90
	);

INSERT INTO employees
VALUES (
	102,
	'Lex',
	'De Haan',
	'LDEHAAN',
	'515.123.4569',
	STR_TO_DATE('13-JAN-1993', '%d-%M-%Y'),
	'AD_VP',
	17000,
	NULL,
	100,
	90
	);

INSERT INTO employees
VALUES (
	103,
	'Alexander',
	'Hunold',
	'AHUNOLD',
	'590.423.4567',
	STR_TO_DATE('03-JAN-1990', '%d-%M-%Y'),
	'IT_PROG',
	9000,
	NULL,
	102,
	60
	);

INSERT INTO employees
VALUES (
	104,
	'Bruce',
	'Ernst',
	'BERNST',
	'590.423.4568',
	STR_TO_DATE('21-MAY-1991', '%d-%M-%Y'),
	'IT_PROG',
	6000,
	NULL,
	103,
	60
	);

INSERT INTO employees
VALUES (
	105,
	'David',
	'Austin',
	'DAUSTIN',
	'590.423.4569',
	STR_TO_DATE('25-JUN-1997', '%d-%M-%Y'),
	'IT_PROG',
	4800,
	NULL,
	103,
	60
	);

INSERT INTO employees
VALUES (
	106,
	'Valli',
	'Pataballa',
	'VPATABAL',
	'590.423.4560',
	STR_TO_DATE('05-FEB-1998', '%d-%M-%Y'),
	'IT_PROG',
	4800,
	NULL,
	103,
	60
	);

INSERT INTO employees
VALUES (
	107,
	'Diana',
	'Lorentz',
	'DLORENTZ',
	'590.423.5567',
	STR_TO_DATE('07-FEB-1999', '%d-%M-%Y'),
	'IT_PROG',
	4200,
	NULL,
	103,
	60
	);

INSERT INTO employees
VALUES (
	108,
	'Nancy',
	'Greenberg',
	'NGREENBE',
	'515.124.4569',
	STR_TO_DATE('17-AUG-1994', '%d-%M-%Y'),
	'FI_MGR',
	12000,
	NULL,
	101,
	100
	);

INSERT INTO employees
VALUES (
	109,
	'Daniel',
	'Faviet',
	'DFAVIET',
	'515.124.4169',
	STR_TO_DATE('16-AUG-1994', '%d-%M-%Y'),
	'FI_ACCOUNT',
	9000,
	NULL,
	108,
	100
	);

INSERT INTO employees
VALUES (
	110,
	'John',
	'Chen',
	'JCHEN',
	'515.124.4269',
	STR_TO_DATE('28-SEP-1997', '%d-%M-%Y'),
	'FI_ACCOUNT',
	8200,
	NULL,
	108,
	100
	);

INSERT INTO employees
VALUES (
	111,
	'Ismael',
	'Sciarra',
	'ISCIARRA',
	'515.124.4369',
	STR_TO_DATE('30-SEP-1997', '%d-%M-%Y'),
	'FI_ACCOUNT',
	7700,
	NULL,
	108,
	100
	);

INSERT INTO employees
VALUES (
	112,
	'Jose Manuel',
	'Urman',
	'JMURMAN',
	'515.124.4469',
	STR_TO_DATE('07-MAR-1998', '%d-%M-%Y'),
	'FI_ACCOUNT',
	7800,
	NULL,
	108,
	100
	);

INSERT INTO employees
VALUES (
	113,
	'Luis',
	'Popp',
	'LPOPP',
	'515.124.4567',
	STR_TO_DATE('07-DEC-1999', '%d-%M-%Y'),
	'FI_ACCOUNT',
	6900,
	NULL,
	108,
	100
	);

INSERT INTO employees
VALUES (
	114,
	'Den',
	'Raphaely',
	'DRAPHEAL',
	'515.127.4561',
	STR_TO_DATE('07-DEC-1994', '%d-%M-%Y'),
	'PU_MAN',
	11000,
	NULL,
	100,
	30
	);

INSERT INTO employees
VALUES (
	115,
	'Alexander',
	'Khoo',
	'AKHOO',
	'515.127.4562',
	STR_TO_DATE('18-MAY-1995', '%d-%M-%Y'),
	'PU_CLERK',
	3100,
	NULL,
	114,
	30
	);

INSERT INTO employees
VALUES (
	116,
	'Shelli',
	'Baida',
	'SBAIDA',
	'515.127.4563',
	STR_TO_DATE('24-DEC-1997', '%d-%M-%Y'),
	'PU_CLERK',
	2900,
	NULL,
	114,
	30
	);

INSERT INTO employees
VALUES (
	117,
	'Sigal',
	'Tobias',
	'STOBIAS',
	'515.127.4564',
	STR_TO_DATE('24-JUL-1997', '%d-%M-%Y'),
	'PU_CLERK',
	2800,
	NULL,
	114,
	30
	);

INSERT INTO employees
VALUES (
	118,
	'Guy',
	'Himuro',
	'GHIMURO',
	'515.127.4565',
	STR_TO_DATE('15-NOV-1998', '%d-%M-%Y'),
	'PU_CLERK',
	2600,
	NULL,
	114,
	30
	);

INSERT INTO employees
VALUES (
	119,
	'Karen',
	'Colmenares',
	'KCOLMENA',
	'515.127.4566',
	STR_TO_DATE('10-AUG-1999', '%d-%M-%Y'),
	'PU_CLERK',
	2500,
	NULL,
	114,
	30
	);

INSERT INTO employees
VALUES (
	120,
	'Matthew',
	'Weiss',
	'MWEISS',
	'650.123.1234',
	STR_TO_DATE('18-JUL-1996', '%d-%M-%Y'),
	'ST_MAN',
	8000,
	NULL,
	100,
	50
	);

INSERT INTO employees
VALUES (
	121,
	'Adam',
	'Fripp',
	'AFRIPP',
	'650.123.2234',
	STR_TO_DATE('10-APR-1997', '%d-%M-%Y'),
	'ST_MAN',
	8200,
	NULL,
	100,
	50
	);

INSERT INTO employees
VALUES (
	122,
	'Payam',
	'Kaufling',
	'PKAUFLIN',
	'650.123.3234',
	STR_TO_DATE('01-MAY-1995', '%d-%M-%Y'),
	'ST_MAN',
	7900,
	NULL,
	100,
	50
	);

INSERT INTO employees
VALUES (
	123,
	'Shanta',
	'Vollman',
	'SVOLLMAN',
	'650.123.4234',
	STR_TO_DATE('10-OCT-1997', '%d-%M-%Y'),
	'ST_MAN',
	6500,
	NULL,
	100,
	50
	);

INSERT INTO employees
VALUES (
	124,
	'Kevin',
	'Mourgos',
	'KMOURGOS',
	'650.123.5234',
	STR_TO_DATE('16-NOV-1999', '%d-%M-%Y'),
	'ST_MAN',
	5800,
	NULL,
	100,
	50
	);

INSERT INTO employees
VALUES (
	125,
	'Julia',
	'Nayer',
	'JNAYER',
	'650.124.1214',
	STR_TO_DATE('16-JUL-1997', '%d-%M-%Y'),
	'ST_CLERK',
	3200,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	126,
	'Irene',
	'Mikkilineni',
	'IMIKKILI',
	'650.124.1224',
	STR_TO_DATE('28-SEP-1998', '%d-%M-%Y'),
	'ST_CLERK',
	2700,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	127,
	'James',
	'Landry',
	'JLANDRY',
	'650.124.1334',
	STR_TO_DATE('14-JAN-1999', '%d-%M-%Y'),
	'ST_CLERK',
	2400,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	128,
	'Steven',
	'Markle',
	'SMARKLE',
	'650.124.1434',
	STR_TO_DATE('08-MAR-2000', '%d-%M-%Y'),
	'ST_CLERK',
	2200,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	129,
	'Laura',
	'Bissot',
	'LBISSOT',
	'650.124.5234',
	STR_TO_DATE('20-AUG-1997', '%d-%M-%Y'),
	'ST_CLERK',
	3300,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	130,
	'Mozhe',
	'Atkinson',
	'MATKINSO',
	'650.124.6234',
	STR_TO_DATE('30-OCT-1997', '%d-%M-%Y'),
	'ST_CLERK',
	2800,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	131,
	'James',
	'Marlow',
	'JAMRLOW',
	'650.124.7234',
	STR_TO_DATE('16-FEB-1997', '%d-%M-%Y'),
	'ST_CLERK',
	2500,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	132,
	'TJ',
	'Olson',
	'TJOLSON',
	'650.124.8234',
	STR_TO_DATE('10-APR-1999', '%d-%M-%Y'),
	'ST_CLERK',
	2100,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	133,
	'Jason',
	'Mallin',
	'JMALLIN',
	'650.127.1934',
	STR_TO_DATE('14-JUN-1996', '%d-%M-%Y'),
	'ST_CLERK',
	3300,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	134,
	'Michael',
	'Rogers',
	'MROGERS',
	'650.127.1834',
	STR_TO_DATE('26-AUG-1998', '%d-%M-%Y'),
	'ST_CLERK',
	2900,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	135,
	'Ki',
	'Gee',
	'KGEE',
	'650.127.1734',
	STR_TO_DATE('12-DEC-1999', '%d-%M-%Y'),
	'ST_CLERK',
	2400,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	136,
	'Hazel',
	'Philtanker',
	'HPHILTAN',
	'650.127.1634',
	STR_TO_DATE('06-FEB-2000', '%d-%M-%Y'),
	'ST_CLERK',
	2200,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	137,
	'Renske',
	'Ladwig',
	'RLADWIG',
	'650.121.1234',
	STR_TO_DATE('14-JUL-1995', '%d-%M-%Y'),
	'ST_CLERK',
	3600,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	138,
	'Stephen',
	'Stiles',
	'SSTILES',
	'650.121.2034',
	STR_TO_DATE('26-OCT-1997', '%d-%M-%Y'),
	'ST_CLERK',
	3200,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	139,
	'John',
	'Seo',
	'JSEO',
	'650.121.2019',
	STR_TO_DATE('12-FEB-1998', '%d-%M-%Y'),
	'ST_CLERK',
	2700,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	140,
	'Joshua',
	'Patel',
	'JPATEL',
	'650.121.1834',
	STR_TO_DATE('06-APR-1998', '%d-%M-%Y'),
	'ST_CLERK',
	2500,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	141,
	'Trenna',
	'Rajs',
	'TRAJS',
	'650.121.8009',
	STR_TO_DATE('17-OCT-1995', '%d-%M-%Y'),
	'ST_CLERK',
	3500,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	142,
	'Curtis',
	'Davies',
	'CDAVIES',
	'650.121.2994',
	STR_TO_DATE('29-JAN-1997', '%d-%M-%Y'),
	'ST_CLERK',
	3100,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	143,
	'Randall',
	'Matos',
	'RMATOS',
	'650.121.2874',
	STR_TO_DATE('15-MAR-1998', '%d-%M-%Y'),
	'ST_CLERK',
	2600,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	144,
	'Peter',
	'Vargas',
	'PVARGAS',
	'650.121.2004',
	STR_TO_DATE('09-JUL-1998', '%d-%M-%Y'),
	'ST_CLERK',
	2500,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	145,
	'John',
	'Russell',
	'JRUSSEL',
	'011.44.1344.429268',
	STR_TO_DATE('01-OCT-1996', '%d-%M-%Y'),
	'SA_MAN',
	14000,
	.4,
	100,
	80
	);

INSERT INTO employees
VALUES (
	146,
	'Karen',
	'Partners',
	'KPARTNER',
	'011.44.1344.467268',
	STR_TO_DATE('05-JAN-1997', '%d-%M-%Y'),
	'SA_MAN',
	13500,
	.3,
	100,
	80
	);

INSERT INTO employees
VALUES (
	147,
	'Alberto',
	'Errazuriz',
	'AERRAZUR',
	'011.44.1344.429278',
	STR_TO_DATE('10-MAR-1997', '%d-%M-%Y'),
	'SA_MAN',
	12000,
	.3,
	100,
	80
	);

INSERT INTO employees
VALUES (
	148,
	'Gerald',
	'Cambrault',
	'GCAMBRAU',
	'011.44.1344.619268',
	STR_TO_DATE('15-OCT-1999', '%d-%M-%Y'),
	'SA_MAN',
	11000,
	.3,
	100,
	80
	);

INSERT INTO employees
VALUES (
	149,
	'Eleni',
	'Zlotkey',
	'EZLOTKEY',
	'011.44.1344.429018',
	STR_TO_DATE('29-JAN-2000', '%d-%M-%Y'),
	'SA_MAN',
	10500,
	.2,
	100,
	80
	);

INSERT INTO employees
VALUES (
	150,
	'Peter',
	'Tucker',
	'PTUCKER',
	'011.44.1344.129268',
	STR_TO_DATE('30-JAN-1997', '%d-%M-%Y'),
	'SA_REP',
	10000,
	.3,
	145,
	80
	);

INSERT INTO employees
VALUES (
	151,
	'David',
	'Bernstein',
	'DBERNSTE',
	'011.44.1344.345268',
	STR_TO_DATE('24-MAR-1997', '%d-%M-%Y'),
	'SA_REP',
	9500,
	.25,
	145,
	80
	);

INSERT INTO employees
VALUES (
	152,
	'Peter',
	'Hall',
	'PHALL',
	'011.44.1344.478968',
	STR_TO_DATE('20-AUG-1997', '%d-%M-%Y'),
	'SA_REP',
	9000,
	.25,
	145,
	80
	);

INSERT INTO employees
VALUES (
	153,
	'Christopher',
	'Olsen',
	'COLSEN',
	'011.44.1344.498718',
	STR_TO_DATE('30-MAR-1998', '%d-%M-%Y'),
	'SA_REP',
	8000,
	.2,
	145,
	80
	);

INSERT INTO employees
VALUES (
	154,
	'Nanette',
	'Cambrault',
	'NCAMBRAU',
	'011.44.1344.987668',
	STR_TO_DATE('09-DEC-1998', '%d-%M-%Y'),
	'SA_REP',
	7500,
	.2,
	145,
	80
	);

INSERT INTO employees
VALUES (
	155,
	'Oliver',
	'Tuvault',
	'OTUVAULT',
	'011.44.1344.486508',
	STR_TO_DATE('23-NOV-1999', '%d-%M-%Y'),
	'SA_REP',
	7000,
	.15,
	145,
	80
	);

INSERT INTO employees
VALUES (
	156,
	'Janette',
	'King',
	'JKING',
	'011.44.1345.429268',
	STR_TO_DATE('30-JAN-1996', '%d-%M-%Y'),
	'SA_REP',
	10000,
	.35,
	146,
	80
	);

INSERT INTO employees
VALUES (
	157,
	'Patrick',
	'Sully',
	'PSULLY',
	'011.44.1345.929268',
	STR_TO_DATE('04-MAR-1996', '%d-%M-%Y'),
	'SA_REP',
	9500,
	.35,
	146,
	80
	);

INSERT INTO employees
VALUES (
	158,
	'Allan',
	'McEwen',
	'AMCEWEN',
	'011.44.1345.829268',
	STR_TO_DATE('01-AUG-1996', '%d-%M-%Y'),
	'SA_REP',
	9000,
	.35,
	146,
	80
	);

INSERT INTO employees
VALUES (
	159,
	'Lindsey',
	'Smith',
	'LSMITH',
	'011.44.1345.729268',
	STR_TO_DATE('10-MAR-1997', '%d-%M-%Y'),
	'SA_REP',
	8000,
	.3,
	146,
	80
	);

INSERT INTO employees
VALUES (
	160,
	'Louise',
	'Doran',
	'LDORAN',
	'011.44.1345.629268',
	STR_TO_DATE('15-DEC-1997', '%d-%M-%Y'),
	'SA_REP',
	7500,
	.3,
	146,
	80
	);

INSERT INTO employees
VALUES (
	161,
	'Sarath',
	'Sewall',
	'SSEWALL',
	'011.44.1345.529268',
	STR_TO_DATE('03-NOV-1998', '%d-%M-%Y'),
	'SA_REP',
	7000,
	.25,
	146,
	80
	);

INSERT INTO employees
VALUES (
	162,
	'Clara',
	'Vishney',
	'CVISHNEY',
	'011.44.1346.129268',
	STR_TO_DATE('11-NOV-1997', '%d-%M-%Y'),
	'SA_REP',
	10500,
	.25,
	147,
	80
	);

INSERT INTO employees
VALUES (
	163,
	'Danielle',
	'Greene',
	'DGREENE',
	'011.44.1346.229268',
	STR_TO_DATE('19-MAR-1999', '%d-%M-%Y'),
	'SA_REP',
	9500,
	.15,
	147,
	80
	);

INSERT INTO employees
VALUES (
	164,
	'Mattea',
	'Marvins',
	'MMARVINS',
	'011.44.1346.329268',
	STR_TO_DATE('24-JAN-2000', '%d-%M-%Y'),
	'SA_REP',
	7200,
	.10,
	147,
	80
	);

INSERT INTO employees
VALUES (
	165,
	'David',
	'Lee',
	'DLEE',
	'011.44.1346.529268',
	STR_TO_DATE('23-FEB-2000', '%d-%M-%Y'),
	'SA_REP',
	6800,
	.1,
	147,
	80
	);

INSERT INTO employees
VALUES (
	166,
	'Sundar',
	'Ande',
	'SANDE',
	'011.44.1346.629268',
	STR_TO_DATE('24-MAR-2000', '%d-%M-%Y'),
	'SA_REP',
	6400,
	.10,
	147,
	80
	);

INSERT INTO employees
VALUES (
	167,
	'Amit',
	'Banda',
	'ABANDA',
	'011.44.1346.729268',
	STR_TO_DATE('21-APR-2000', '%d-%M-%Y'),
	'SA_REP',
	6200,
	.10,
	147,
	80
	);

INSERT INTO employees
VALUES (
	168,
	'Lisa',
	'Ozer',
	'LOZER',
	'011.44.1343.929268',
	STR_TO_DATE('11-MAR-1997', '%d-%M-%Y'),
	'SA_REP',
	11500,
	.25,
	148,
	80
	);

INSERT INTO employees
VALUES (
	169,
	'Harrison',
	'Bloom',
	'HBLOOM',
	'011.44.1343.829268',
	STR_TO_DATE('23-MAR-1998', '%d-%M-%Y'),
	'SA_REP',
	10000,
	.20,
	148,
	80
	);

INSERT INTO employees
VALUES (
	170,
	'Tayler',
	'Fox',
	'TFOX',
	'011.44.1343.729268',
	STR_TO_DATE('24-JAN-1998', '%d-%M-%Y'),
	'SA_REP',
	9600,
	.20,
	148,
	80
	);

INSERT INTO employees
VALUES (
	171,
	'William',
	'Smith',
	'WSMITH',
	'011.44.1343.629268',
	STR_TO_DATE('23-FEB-1999', '%d-%M-%Y'),
	'SA_REP',
	7400,
	.15,
	148,
	80
	);

INSERT INTO employees
VALUES (
	172,
	'Elizabeth',
	'Bates',
	'EBATES',
	'011.44.1343.529268',
	STR_TO_DATE('24-MAR-1999', '%d-%M-%Y'),
	'SA_REP',
	7300,
	.15,
	148,
	80
	);

INSERT INTO employees
VALUES (
	173,
	'Sundita',
	'Kumar',
	'SKUMAR',
	'011.44.1343.329268',
	STR_TO_DATE('21-APR-2000', '%d-%M-%Y'),
	'SA_REP',
	6100,
	.10,
	148,
	80
	);

INSERT INTO employees
VALUES (
	174,
	'Ellen',
	'Abel',
	'EABEL',
	'011.44.1644.429267',
	STR_TO_DATE('11-MAY-1996', '%d-%M-%Y'),
	'SA_REP',
	11000,
	.30,
	149,
	80
	);

INSERT INTO employees
VALUES (
	175,
	'Alyssa',
	'Hutton',
	'AHUTTON',
	'011.44.1644.429266',
	STR_TO_DATE('19-MAR-1997', '%d-%M-%Y'),
	'SA_REP',
	8800,
	.25,
	149,
	80
	);

INSERT INTO employees
VALUES (
	176,
	'Jonathon',
	'Taylor',
	'JTAYLOR',
	'011.44.1644.429265',
	STR_TO_DATE('24-MAR-1998', '%d-%M-%Y'),
	'SA_REP',
	8600,
	.20,
	149,
	80
	);

INSERT INTO employees
VALUES (
	177,
	'Jack',
	'Livingston',
	'JLIVINGS',
	'011.44.1644.429264',
	STR_TO_DATE('23-APR-1998', '%d-%M-%Y'),
	'SA_REP',
	8400,
	.20,
	149,
	80
	);

INSERT INTO employees
VALUES (
	178,
	'Kimberely',
	'Grant',
	'KGRANT',
	'011.44.1644.429263',
	STR_TO_DATE('24-MAY-1999', '%d-%M-%Y'),
	'SA_REP',
	7000,
	.15,
	149,
	NULL
	);

INSERT INTO employees
VALUES (
	179,
	'Charles',
	'Johnson',
	'CJOHNSON',
	'011.44.1644.429262',
	STR_TO_DATE('04-JAN-2000', '%d-%M-%Y'),
	'SA_REP',
	6200,
	.10,
	149,
	80
	);

INSERT INTO employees
VALUES (
	180,
	'Winston',
	'Taylor',
	'WTAYLOR',
	'650.507.9876',
	STR_TO_DATE('24-JAN-1998', '%d-%M-%Y'),
	'SH_CLERK',
	3200,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	181,
	'Jean',
	'Fleaur',
	'JFLEAUR',
	'650.507.9877',
	STR_TO_DATE('23-FEB-1998', '%d-%M-%Y'),
	'SH_CLERK',
	3100,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	182,
	'Martha',
	'Sullivan',
	'MSULLIVA',
	'650.507.9878',
	STR_TO_DATE('21-JUN-1999', '%d-%M-%Y'),
	'SH_CLERK',
	2500,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	183,
	'Girard',
	'Geoni',
	'GGEONI',
	'650.507.9879',
	STR_TO_DATE('03-FEB-2000', '%d-%M-%Y'),
	'SH_CLERK',
	2800,
	NULL,
	120,
	50
	);

INSERT INTO employees
VALUES (
	184,
	'Nandita',
	'Sarchand',
	'NSARCHAN',
	'650.509.1876',
	STR_TO_DATE('27-JAN-1996', '%d-%M-%Y'),
	'SH_CLERK',
	4200,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	185,
	'Alexis',
	'Bull',
	'ABULL',
	'650.509.2876',
	STR_TO_DATE('20-FEB-1997', '%d-%M-%Y'),
	'SH_CLERK',
	4100,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	186,
	'Julia',
	'Dellinger',
	'JDELLING',
	'650.509.3876',
	STR_TO_DATE('24-JUN-1998', '%d-%M-%Y'),
	'SH_CLERK',
	3400,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	187,
	'Anthony',
	'Cabrio',
	'ACABRIO',
	'650.509.4876',
	STR_TO_DATE('07-FEB-1999', '%d-%M-%Y'),
	'SH_CLERK',
	3000,
	NULL,
	121,
	50
	);

INSERT INTO employees
VALUES (
	188,
	'Kelly',
	'Chung',
	'KCHUNG',
	'650.505.1876',
	STR_TO_DATE('14-JUN-1997', '%d-%M-%Y'),
	'SH_CLERK',
	3800,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	189,
	'Jennifer',
	'Dilly',
	'JDILLY',
	'650.505.2876',
	STR_TO_DATE('13-AUG-1997', '%d-%M-%Y'),
	'SH_CLERK',
	3600,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	190,
	'Timothy',
	'Gates',
	'TGATES',
	'650.505.3876',
	STR_TO_DATE('11-JUL-1998', '%d-%M-%Y'),
	'SH_CLERK',
	2900,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	191,
	'Randall',
	'Perkins',
	'RPERKINS',
	'650.505.4876',
	STR_TO_DATE('19-DEC-1999', '%d-%M-%Y'),
	'SH_CLERK',
	2500,
	NULL,
	122,
	50
	);

INSERT INTO employees
VALUES (
	192,
	'Sarah',
	'Bell',
	'SBELL',
	'650.501.1876',
	STR_TO_DATE('04-FEB-1996', '%d-%M-%Y'),
	'SH_CLERK',
	4000,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	193,
	'Britney',
	'Everett',
	'BEVERETT',
	'650.501.2876',
	STR_TO_DATE('03-MAR-1997', '%d-%M-%Y'),
	'SH_CLERK',
	3900,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	194,
	'Samuel',
	'McCain',
	'SMCCAIN',
	'650.501.3876',
	STR_TO_DATE('01-JUL-1998', '%d-%M-%Y'),
	'SH_CLERK',
	3200,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	195,
	'Vance',
	'Jones',
	'VJONES',
	'650.501.4876',
	STR_TO_DATE('17-MAR-1999', '%d-%M-%Y'),
	'SH_CLERK',
	2800,
	NULL,
	123,
	50
	);

INSERT INTO employees
VALUES (
	196,
	'Alana',
	'Walsh',
	'AWALSH',
	'650.507.9811',
	STR_TO_DATE('24-APR-1998', '%d-%M-%Y'),
	'SH_CLERK',
	3100,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	197,
	'Kevin',
	'Feeney',
	'KFEENEY',
	'650.507.9822',
	STR_TO_DATE('23-MAY-1998', '%d-%M-%Y'),
	'SH_CLERK',
	3000,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	198,
	'Donald',
	'OConnell',
	'DOCONNEL',
	'650.507.9833',
	STR_TO_DATE('21-JUN-1999', '%d-%M-%Y'),
	'SH_CLERK',
	2600,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	199,
	'Douglas',
	'Grant',
	'DGRANT',
	'650.507.9844',
	STR_TO_DATE('13-JAN-2000', '%d-%M-%Y'),
	'SH_CLERK',
	2600,
	NULL,
	124,
	50
	);

INSERT INTO employees
VALUES (
	200,
	'Jennifer',
	'Whalen',
	'JWHALEN',
	'515.123.4444',
	STR_TO_DATE('17-SEP-1987', '%d-%M-%Y'),
	'AD_ASST',
	4400,
	NULL,
	101,
	10
	);

INSERT INTO employees
VALUES (
	201,
	'Michael',
	'Hartstein',
	'MHARTSTE',
	'515.123.5555',
	STR_TO_DATE('17-FEB-1996', '%d-%M-%Y'),
	'MK_MAN',
	13000,
	NULL,
	100,
	20
	);

INSERT INTO employees
VALUES (
	202,
	'Pat',
	'Fay',
	'PFAY',
	'603.123.6666',
	STR_TO_DATE('17-AUG-1997', '%d-%M-%Y'),
	'MK_REP',
	6000,
	NULL,
	201,
	20
	);

INSERT INTO employees
VALUES (
	203,
	'Susan',
	'Mavris',
	'SMAVRIS',
	'515.123.7777',
	STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),
	'HR_REP',
	6500,
	NULL,
	101,
	40
	);

INSERT INTO employees
VALUES (
	204,
	'Hermann',
	'Baer',
	'HBAER',
	'515.123.8888',
	STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),
	'PR_REP',
	10000,
	NULL,
	101,
	70
	);

INSERT INTO employees
VALUES (
	205,
	'Shelley',
	'Higgins',
	'SHIGGINS',
	'515.123.8080',
	STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),
	'AC_MGR',
	12000,
	NULL,
	101,
	110
	);

INSERT INTO employees
VALUES (
	206,
	'William',
	'Gietz',
	'WGIETZ',
	'51hr5.123.8181',
	STR_TO_DATE('07-JUN-1994', '%d-%M-%Y'),
	'AC_ACCOUNT',
	8300,
	NULL,
	205,
	110
	);

COMMIT;

INSERT INTO job_history
VALUES (
	102,
	STR_TO_DATE('13-Jan-1993', '%d-%M-%Y'),
	STR_TO_DATE('24-Jul-1998', '%d-%M-%Y'),
	'IT_PROG',
	60
	);

INSERT INTO job_history
VALUES (
	101,
	STR_TO_DATE('21-Sep-1989', '%d-%M-%Y'),
	STR_TO_DATE('27-Oct-1993', '%d-%M-%Y'),
	'AC_ACCOUNT',
	110
	);

INSERT INTO job_history
VALUES (
	101,
	STR_TO_DATE('28-Oct-1993','%d-%M-%Y'),
	STR_TO_DATE('15-Mar-1997','%d-%M-%Y'),
	'AC_MGR',
	110
	);

INSERT INTO job_history
VALUES (
	201,
	STR_TO_DATE('27-Feb-1996','%d-%M-%Y'),
	STR_TO_DATE('19-Dec-1999','%d-%M-%Y'),
	'MK_REP',
	20
	);

INSERT INTO job_history
VALUES (
	114,
	STR_TO_DATE('24-Mar-1998','%d-%M-%Y'),
	STR_TO_DATE('31-Dec-1999','%d-%M-%Y'),
	'ST_CLERK',
	50
	);

INSERT INTO job_history
VALUES (
	122,
	STR_TO_DATE('01-Jan-1999','%d-%M-%Y'),
	STR_TO_DATE('31-Dec-1999','%d-%M-%Y'),
	'ST_CLERK',
	50
	);

INSERT INTO job_history
VALUES (
	200,
	STR_TO_DATE('17-Sep-1987','%d-%M-%Y'),
	STR_TO_DATE('17-Jun-1993','%d-%M-%Y'),
	'AD_ASST',
	90
	);

INSERT INTO job_history
VALUES (
	176,
	STR_TO_DATE('24-Mar-1998','%d-%M-%Y'),
	STR_TO_DATE('31-Dec-1998','%d-%M-%Y'),
	'SA_REP',
	80
	);

INSERT INTO job_history
VALUES (
	176,
	STR_TO_DATE('01-Jan-1999','%d-%M-%Y'),
	STR_TO_DATE('31-Dec-1999','%d-%M-%Y'),
	'SA_MAN',
	80
	);

INSERT INTO job_history
VALUES (
	200,
	STR_TO_DATE('01-Jul-1994','%d-%M-%Y'),
	STR_TO_DATE('31-Dec-1998','%d-%M-%Y'),
	'AC_ACCOUNT',
	90
	);
    
COMMIT;

/* *************************************************************** 
***************************FOREIGN KEYS***************************
**************************************************************** */

ALTER TABLE countries ADD FOREIGN KEY (region_id) REFERENCES regions(region_id);    
ALTER TABLE locations ADD FOREIGN KEY (country_id) REFERENCES countries(country_id);
ALTER TABLE departments ADD FOREIGN KEY (location_id) REFERENCES locations(location_id);
ALTER TABLE employees ADD FOREIGN KEY (job_id) REFERENCES jobs(job_id);
ALTER TABLE employees ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);
ALTER TABLE employees ADD FOREIGN KEY (manager_id) REFERENCES employees(employee_id);
ALTER TABLE departments ADD FOREIGN KEY (manager_id) REFERENCES employees (employee_id);
ALTER TABLE job_history ADD FOREIGN KEY (employee_id) REFERENCES employees(employee_id);
ALTER TABLE job_history ADD FOREIGN KEY (job_id) REFERENCES jobs(job_id);
ALTER TABLE job_history ADD FOREIGN KEY (department_id) REFERENCES departments(department_id);

use mihir2;
-- WRITE A QUERY DISPLAY ALL INFORMATION IN THE TABLES EMP AND DEPT--

SELECT * FROM EMPLOYEES;

SELECT  * FROM DEPARTMENTS; 

-- WRITE A QUERY DISPLAY ONLY HIRE DATE AND EMPLOYEE NAME FOR EACH EMPLOYEE--

SELECT EMPLOYEE_NAME,START_DATE FROM EMPLOYEES;

-- WRITE A QUERY DDisplay the ename concatenated with the job ID, separated by a comma and space, and name the column employee and title-- 

select concat(job_id , EMPLOYEE_name)as title from employees;


--  write a query display the hiredate, name and department for all clerks--

select START_date,EMPLOYEE_name from employees where JOB_ID LIKE '%CLERK%';

SELECT * FROM EMPLOYEES;

-- write query to display all the data from the emp table.seprate each column by a comma and name the column THE OUTPUT--\

 SELECT * FROM departmentS AS THEOUTPUT;
 
 
 -- Write a dsiplay the names and salaries 	of all emploees with a salary greater than  2000-

select employee_name,salary from employees where salary >2000;

-- write a query display the names and dates of employee with the column headers "name"and "start date"--

alter table employees  Rename column first_name  To name;
alter table employees rename column hire_date to start_date;

select * from employees;

-- write a display the names and hire dates of all employees i  order thery were hired.--

select employee_name,start_date from employees order by  start_date asc;

-- write a display the names and salaries of all employees in reverse salary order--

select employee_name,salary from employees order by salary desc;

-- write qurey display 'ename' amd 'deptno' who are all earnerd commission and salary in revesr order--

select employee_name,department_id from employees where salary and commission_pct order by department_id desc;

-- write a query display the last name and job title of all employees who do not have a managaer--

select last_name,job_id from employees where manager_id is null;

--  write a query display the last name,job and salary for all employees whose jov is sales representive or stock clerk and whose salary in not eqal to $2500,$3500 or $5000--

select * from employees; 
SELECT 
    last_name, job_id, salary
FROM 
    employees
WHERE 
    (job_id = 'sa_rep' OR job_id = 'st_clerk')
    AND salary NOT IN (2500, 3500, 5000);


-- write a query dispaly the maximum,minimum and average salary and commission earned--  

SELECT 
  MAX(salary) AS max_salary,
  MIN(salary) AS min_salary,
  AVG(salary) AS avg_salary,
  MAX(commission_PCT) AS max_commission,
  MIN(commission_PCT) AS min_commission,
  AVG(commission_PCT) AS avg_commission
FROM employees;

-- write a query display the department number,total salary output 	and total commission payout for each department--
SELECT 
    department_id,
    SUM(salary) AS total_salary_payout,
    SUM(COALESCE(commission_pct, 0)) AS total_commission_payout
FROM 
    employees
GROUP BY 
    department_id;

select * from employees;

select * from departments;

-- write a query display the department number and number of employee in each department--
 
 SELECT
    department_name,
    COUNT(employee_id) AS number_of_employees
FROM
    departments
LEFT JOIN
    employees ON departments.department_id = employees.department_id
GROUP BY
    department_name;
    
    -- write a dsiplay the department number and total salary of employees in each department--
    
    select department_name,
   sum(salary) as Total_salary
    from departments
    left join employees
    on departments.department_id=employees.department_id
     group by 
     department_name;
     
     -- write a query display the employees name who doesn't earn a commission.order the result set without using the column name-- 
     
select concat(employee_name,' ',last_name)
from employees
where commission_pct is null or commission_pct=0
order by 1;

   -- write a query the employees name,departmentid and commission .if an employee doesn't earn the commission,they diaplay as 'no commision' name the columns appropraitely --
   
   select employee_name,department_id,coalesce(commission_pct,'no commission')as commission from employees;
   
-- write  a query the employees name,salary and commission multiplied by 2. if an employee doesn't earn the commission,then dsiplay as 'no commission'.name of the appropriately-

select  employee_name,salary*2 as double_salary,coalesce(commission_pct*2,'no commission')as double_commission from employees; 

-- write display the employyes name and department id who have the first name same as another employee in the same department--

SELECT e1.employee_name, e1.department_id
FROM employees e1
WHERE EXISTS (
    SELECT 1
    FROM employees e2
    WHERE e1.employee_id <> e2.employee_id
    AND e1.department_id = e2.department_id
    AND SUBSTRING_INDEX(e1.employee_name, ' ', 1) = SUBSTRING_INDEX(e2.employee_name, ' ', 1)
);


-- write a query display the sum of salaries of the employees working under each manager--

select manager_id,sum(salary)as total_salary
from employees 
group by manager_id; 

-- write a query select manager name,the count of employees working under the department id of the manager--
    
    SELECT 
    m.employee_name as manager_name,
    COUNT(E.employee_id) AS employee_count,
    M.department_id AS manager_department_id
FROM 
    Employees E
JOIN 
    Employees M ON E.manager_id = M.employee_id
GROUP BY 
    M.employee_name, M.department_id;
    
use mihir2;
   --  Write a query that displays the employee's last names only from the string's 2-5th
-- position with the first letter capitalized and all other letters lowercase, Give each column an
-- appropriate label. 

    SELECT 
    CONCAT(UPPER(SUBSTRING(last_name, 2, 1)), LOWER(SUBSTRING(last_name, 3, 4))) AS Modified_Last_Name
FROM 
    Employees;



write a query slect the employee name,department id,and salary group the result with the manager name and the employee last name should have secong leteer'a1'--

select employee_name,department_id,salary from employees where last_name like '_a!';

SELECT 
    CONCAT(e.employee_name, ' ', e.last_name) AS Employee_Name,
    e.department_id AS Department_ID,
    e.salary AS Salary,
    CONCAT(m.employee_name, ' ', m.last_name) AS Manager_Name
FROM 
    Employees e
JOIN 
    Employees m ON e.manager_id = m.employee_id
WHERE 
    SUBSTRING(e.last_name, 2, 1) = 'a'
GROUP BY 
    Manager_Name;

 
-- write a query dislay the average of sum of the salaries and group the result with the department id order the result with the department id--
SELECT 
    department_id,
    AVG(total_salary) AS average_salary
FROM (
    SELECT 
        department_id,
        SUM(salary) AS total_salary
    FROM 
        employees
    GROUP BY 
        department_id
) AS department_salary_totals
GROUP BY 
    department_id
ORDER BY 
    department_id;

-- write a query the maximum salary of each department along with the department id--

select department_id, max(salary) as maximum_salary from employees group by department_id;


-- write a query display the commisiiom if not null display 10% salary,if null dsisplay a default value 1-- 

SELECT IFNULL(commission_pct, salary * 0.10) AS commission
FROM employees;


use mihir2;

-- Write a query that displays the employee's last names only from the string's 2-5th
-- position with the first letter capitalized and all other letters lowercase, Give each column an
-- appropriate label. 

SELECT 
    INITCAP(SUBSTRING(last_name FROM 2 FOR 5)) AS modified_last_name
FROM 
    employees;
    
   -- Write a query that displays the employee's first name and last name along with a " in
-- between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the
-- month on which the employee has joined. 

select concat(e.employee_name,'-',e.last_name)as full_name ,
month(e.start_date) as join_month from employees e;

-- Write a query to display the employee's last name and if half of the salary is greater than
 -- ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of
-- 1500 each. Provide each column an appropriate label.

SELECT 
    last_name,
    CASE
        WHEN salary * 0.5 > 10000 THEN ROUND(salary * 1.10 + 1500, 2)
        ELSE ROUND(salary * 1.115 + 1500, 2)
    END AS adjusted_salary_with_bonus
FROM 
    employees;

-- write to query to display the first name and length og the first name for all employee whose name start with the letter and 'a,j,m--give each colmn approipate sort the result by employees first name--  
  
  select employee_name,length(employee_name) from employees
  where employee_name like 'A%' or employee_name like 'm%' or employee_name like 'j%'
  order by employee_name;
  select * from employees;
  
  update employees
  set email= concat(email,"@gmail.com");
  
-- write sql query to get employee id,email id discard the last three character--

select employee_id,reverse(email,3)from employees;-- 
 

select * from locations;

select street_address,right(street_address,4) from locations;

select substring_index(street_address, ' ',-1)from employees;



-- write a query to get minimum street lenght--
select min(length(street_address)) from locations;

-- write a query display the length of th  first name for employees where lasr name employee charcter c after second position-- 

select length(employee_name) from employees where instr(last_name,'c') >2;

use mihir2;

-- write a query to portion of the phone number in the employee table within th e phone number he substirng 124 to replace 999;

update employees
set phone_number =replace(phone_number,'124','999')
where phone_number like '%124%';

-- write a query to first 8 character of the employees first name and indicates the amount of they salaries $ sign each dollor sign significies a 1000 dollers sort the data and decending data of the salary--

select * from employees;

select left(employee_name,8),
repeat('$',floor(salary/1000))
'salary($)',salary
from employees
order by salary desc;

-- writea query to the display employees with thier code first name last name and hire date who hired either or 7th day of any month or 7th month in any year-- 

select employee_name,last_name,start_date
from employees
where extract(month from start_date) ='7' 
or extract(day from start_date)='7';


-- write a display the employees last name only  from stings 2-5th position with the first letter capitalized and all other letters lowercase,give each column an appropirate lable--

select substring(upper(substring(employee_name,2,4)),1,1) || lower(substring(employee_name,3,3)) as last_name from employees;
	 
-- write a wuery display the employees first name and last name along with in between.also month on which the employee has joined--

select concat(employee_name,'-',last_name) as full_name,
 extract(month from start_date) as join_month from employees;
 
 -- Write a query to display the employee's last name and if half of the salary is greater than ten thousand then increse the salary by	 10% else by 11.5% along with the bonus amount of 1500 each--
 
 select last_name,case
 when salary *0.5>10000 then salary*1.1+1500
 else salary *1.115+1500
 end as adjusted_salary,
 1500 as bonus_amount from employees;
 
 -- write a diaplay the employee id by appending two zeros after 2nd digit 'e' in the end.department id,salary and the manager name all in upper case if the manager name consists of z replace it with $-- 
 
 SELECT 
    CONCAT(SUBSTRING(employee_id, 1, 2), '00E') AS modified_employee_id,
    UPPER(department_id) AS uppercase_department_id,
    UPPER(salary) AS uppercase_salary,
    REPLACE(UPPER(employee_name), 'Z', '$!') AS modified_manager_name
FROM 
    employees;

 --  write a query to display the employees last name with the first letter capitalized and all other letter lowercase and the length of the names,for all employees name start with a,j,m and sort by the last mname-- 
 
 select concat(upper(substr(last_name,1,1)),lower(substr(last_name,2))) as 'formated_name',length (last_name) as "Name_length"
 from employees
 where last_name like 'J%' or last_name like 'A%' or last_name like 'M%'
 order by last_name;
 
 -- write a query to display the last name and salary for all employees format the salary to be 15 character long,left-paded with $ lable the column salary--
 
 select last_name,lpad(concat('$',salary),15,'$') as salary from employees;
 
 -- display the employees name if it is a palindrome--
 
 select reverse(employee_name) from employees;
 
 
-- FROM LOCATIONS TABLE,EXTRACR THE WORD BETWEEN FIRST AND SECOND SPACE FROM THE STREET ADDRESS COLUMN--  
SELECT
  SUBSTRING_INDEX(SUBSTRING_INDEX(street_address, ' ', 2), ' ', -1) AS extracted_word
FROM locations;

 
-- Extract first letter from First Name column and append it with the Last Name. Also add
-- "@systechusa.com" at the end. Name the column as e-mail address. All characters should
-- be in lower case. Display this along with their First Name--

SELECT 
    CONCAT(LOWER(SUBSTRING(employee_Name, 1, 1)), Last_Name, '@systechusa.com') AS email_address,
    employee_Name FROM employees;

    

use mihir2;
-- Display the names and job titles of all employees with the same job as Trenna -- 

SELECT EMPLOYEE_NAME,JOB_ID FROM EMPLOYEES
WHERE JOB_ID=(SELECT JOB_ID FROM EMPLOYEES WHERE EMPLOYEE_NAME ='TRENNA');


use mihir2;

--  . Display the names and department name of all employees working in the same city as trena-- 

SELECT e.employee_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
join locations l on d.location_id=l.location_id
WHERE city = (SELECT city FROM locations WHERE employee_name = 'Trenna');

select * from locations;	

-- Display the name of the employee whose salary is the lowest. 

select employee_name from employees where salary=(select min(salary)from employees);

-- Display the names of all employees except the lowest paid--

select employee_name from employees where salary >(select min(salary)from employees);

-- Write a query to display the last name, department number, department name for all employees--

select e.last_name,e.department_id,d.department_name from employees e join departments d on e.department_id=d.department_id;


select employees.last_name,employees.department_id,departments.department_name
from employees,departments
where employees.department_id=departments.department_id;

--  Create a unique list of all jobs that are in department 4. Include the location of the department in the output--

select distinct j.job_title,d.location_id
from jobs join departments d on e.department_id=d.department_id join jobs j on e.job_id =j.job_id where e.department_id=4;

SELECT DISTINCT
    e.job_id AS Job_Title,
    d.location_id AS Department_Location
FROM
    Employees e
JOIN
    Departments d ON e.department_id = d.department_id
WHERE
    e.department_id = 4;


select * from employees;

--  Write a query to display the employee last name,department name,location id and city of
-- all employees who earn commission. 

SELECT e.last_name, d.department_name, d.location_id, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.commission_pct IS NOT NULL;

-- Display the employee last name and department name of all employees who have an 'a'
-- in their last name  

select employees.last_name,departments.department_name from employees,departments
where employees.last_name like '%a%';

-- Write a query to display the last name,job,department number and department name for
-- all employees who work in ATLANTA.  

SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'ATLANTA';

-- Display the employee last name and employee number along with their manager's last
-- name and manager number. 
    
    SELECT 
    e1.last_name AS employee_last_name,
    e1.employee_id AS employee_number,
    e2.last_name AS manager_last_name,
    e2.employee_id AS manager_number
FROM 
    employees e1
JOIN 
    employees e2 ON e1.manager_id = e2.employee_id;

--  7. Display the employee last name and employee number along with their manager's last
  -- name and manager number (including the employees who have no manager).   

SELECT 
  e.last_name AS employee_last_name,
  e.employee_id AS employee_number,
  m.last_name AS manager_last_name,
  e.manager_id AS manager_number
FROM 
  employees e
LEFT JOIN 
  employees m ON e.manager_id = m.employee_id;

-- Create a query that displays employees last name,department number,and all the
 -- employees who work in the same department as a given employee.  
 SELECT 
    e.last_name AS Employee_Last_Name,
    e.department_id AS Department_Number
FROM 
    Employees e
WHERE 
    e.department_id  in(
        SELECT 
            department_id
        FROM 
            Employees
        WHERE 
            employee_id = 'specified_employee_id'
    );


-- Create a query that displays the name,job,department name,salary,grade for all
-- employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C)  

SELECT 
  e.employee_name AS employee_name1,
  e.job_id AS employee_job,
  d.department_name,
  e.salary,
  CASE
    WHEN e.salary >= 50000 THEN 'A'
    WHEN e.salary >= 30000 THEN 'B'
    ELSE 'C'
  END AS grade
FROM 
  employees e
JOIN 
  departments d ON e.department_id = d.department_id;

-- Display the names and hire date for all employees who were hired before their
-- managers along withe their manager names and hire date. Label the columns as Employee
-- name, emp_hire_date,manager name,man_hire_date 

SELECT 
  e.employee_name AS "Employee name",
  e.start_date AS "emp_hire_date",
  m.employee_name AS "Manager name",
  m.start_date AS "man_hire_date"
FROM 
  employees e
JOIN 
  employees m ON e.manager_id = m.employee_id
WHERE 
  e.start_date < m.start_date;
  

	use mihir2;
    
    --  write a  to display the last name and hire date of any employee in the same department as sales--
    
select last_name,start_date from employees
where department_id =(select department_id from departments where department_name ='sales')
order by start_date desc;

--  create a query to display the employees numbers and last name of all employees who earn more than averge salary.sort the results in ascending order of salary--

select employee_id,last_name from employees
where salary>(select avg(salary) from employees)
order by salary asc;

-- write a query that display the employees numbers and last name of all employees who work in a department with any employees whose last name contains a'u--

select employee_id,last_name
from employees
where department_id in(
select department_id
from employees
where last_name like '%u%')
order by employee_id;   

-- display the last name,department number,job id of all employees whose department locations is atlanta--
select last_name,department_id,job_id
from employees
join departments on employees.department_id=departments.department_id
where departments.department_name ='atlanta';


--  display the last name and salary of every employee who reports to followmore-- 
SELECT 
    e.last_name AS Employee_Last_Name,
    e.salary AS Employee_Salary
FROM 
    Employees e
WHERE 
    e.manager_id = (
        SELECT 
            employee_id
        FROM 
            Employees
        WHERE 
            last_name = 'FILLMORe'
    );

 
-- display the department number,last name,and job id for every employee in the operatinas departments--

select * from employees;
select * from departments;

select employees.last_name,employees.job_id,departments.department_id
from employees,departments
where departments.department_name ='operations';

-- the above query diplay the employees numbers,last name,and salaries of all employees who earn more than the averge salary and who work in a department with any employees with a 'u in their name--

select employee_id,last_name,salary
from employees
where salary>(select avg(salary) from employees)
and first_name like '%u%';

-- display the names of all employees whose job title id the same as anyone in the sales dept--

SELECT 
    e.employee_name AS Employee_Name
FROM 
    Employees e
WHERE 
    e.job_id IN (
        SELECT 
            job_id
        FROM Employees 
        WHERE department_id = (SELECT department_id FROM Departments WHERE department_name = 'Sales') );
            
    
-- write a compond query to produce of a list of employees showing raise percentges,employeesid and salaries.employees in a department  1 and 3 are given at 5% raise,
  -- employees in the department 2 are given a 10% riase,employees in departments 4 and 5 are given a 15% raise,and employees in department 6 are not given a raise--
  
  SELECT 
    employee_id,
    salary,
    CASE 
        WHEN department_id IN (1, 3) THEN salary * 1.05
        WHEN department_id = 2 THEN salary * 1.1
        WHEN department_id IN (4, 5) THEN salary * 1.15
        ELSE salary
    END AS new_salary
FROM 
    employees;

--  write a query to display the top three earners in the employees table.display their last names and salaries--

select last_name,salary
from employees
order by salary desc limit 3;

-- display the names of all employees with thier salary and commision earned.employees with a null commission should have o in the commission column-- 

select concat(employee_name,' ',last_name)as employees_name,salary,
coalesce(commission_pct,0)as commission_earned from employees; 

-- display the manager name with top three salaries along with their salaries and department infrormation--

SELECT 
    CONCAT(m.employee_name, ' ', m.last_name) AS manager_name,
    m.salary AS manager_salary,
    d.department_name
FROM 
    employees m
JOIN 
    departments d ON m.department_id = d.department_id
WHERE 
    m.job_id LIKE '%MAN%'
ORDER BY 
    m.salary DESC
LIMIT 3;


  --  nd the date difference between the hire date and resignation_date for all the
-- employees. Display in no. of days, months and year(1 year 3 months 5 days)

SELECT employee_id,
    CONCAT(
        FLOOR(DATEDIFF(end_date, start_date) / 365), ' year ',
        FLOOR(MOD(DATEDIFF(end_date, start_date), 365) / 30), ' months ',
        MOD(DATEDIFF(end_date,start_date), 30), ' days'
    ) AS formatted_duration
FROM 
    job_history;
    
    -- Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mon dd,
-- yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900)  
	
  SELECT 
    IFNULL(
        DATE_FORMAT(start_date, '%m/%d/%Y'),
        '(DEC, 01th 1900)'
    ) AS formatted_hire_date,
    IFNULL(
        DATE_FORMAT(end_date, '%b %D, %Y'),
        '(DEC, 01th 1900)'
    ) AS formatted_resignation_date
FROM 
    job_history;
    
    -- calculate experince of the employee till date in years and months--
    
    SELECT 
    TIMESTAMPDIFF(YEAR, start_date, CURDATE()) AS years_of_experience,
    TIMESTAMPDIFF(MONTH, start_date, CURDATE()) % 12 AS months_of_experience
FROM 
    employees;
    
    use mihir2;
    
   
   --  from the following tables write a sql query to find out which employees or do not department-- firstname,last name,departmentid,department name--
   
   select employees.employee_name,employees.last_name,employees.department_id,departments.department_name
   from employees
   left join  departments
   on employees.department_id=departments.department_id;
   
   -- wirte a sql query to find all departments including those without employees writeen firstname,lastname,department id,department name--
   
   select employees.employee_name,employees.last_name,employees.department_id,departments.department_name
   from employees 
   right join departments 
   on employees.department_id=departments.department_id;
   
   -- to find the employee same department who work  same department s as the employee with last name tyalor--
   
select e.employee_name,e.last_name,e.department_id
from employees e
join employees s on e.department_id=s.department_id
and s.last_name='taylor';

   --  display the count of days in the previous quarter-- 
   
 SELECT 
    DATEDIFF(
        LAST_DAY(DATE_SUB(NOW(), INTERVAL 1 QUARTER)), 
        DATE_SUB(DATE_SUB(NOW(), INTERVAL 1 QUARTER), INTERVAL DAYOFMONTH(DATE_SUB(NOW(), INTERVAL 1 QUARTER)) - 1 DAY)
    ) + 1 AS Days_In_Previous_Quarter;
    
    -- fetch the previous quarters second week first day date-- 
    
    SELECT DATE_SUB(
    DATE_SUB(
        MAKEDATE(YEAR(NOW()), 1) + INTERVAL QUARTER(NOW()) - 1 QUARTER,
        INTERVAL WEEKDAY(DATE_SUB(MAKEDATE(YEAR(NOW()), 1) + INTERVAL QUARTER(NOW()) - 1 QUARTER, INTERVAL 1 DAY)) DAY
    ),
    INTERVAL 5 DAY
) AS First_Day_Of_Second_Week;

-- fetch the finacial years 15th week's date(mon dd yyyy)-- 

SELECT DATE_FORMAT(DATE_ADD(
    DATE_ADD(
        MAKEDATE(YEAR(NOW()), 1) + INTERVAL QUARTER(NOW()) - 1 QUARTER,
        INTERVAL 14 * 7 DAY
    ),
    INTERVAL ((WEEKDAY(DATE_ADD(MAKEDATE(YEAR(NOW()), 1) + INTERVAL QUARTER(NOW()) - 1 QUARTER, INTERVAL 1 DAY)) + 1) % 7) - 1 DAY
), '%a %b %d %Y') AS Formatted_Date;
 
-- find out the date that corresponds to the last saturday of january,2015 using with clause--  

SELECT MAX(last_saturday) AS Last_Saturday_Of_Jan_2015
FROM (
    SELECT DATE_SUB('2015-02-01', INTERVAL (WEEKDAY('2015-01-01') + 1) DAY) AS last_saturday
) AS subquery
WHERE MONTH(last_saturday) = 1;

use mihir2;



